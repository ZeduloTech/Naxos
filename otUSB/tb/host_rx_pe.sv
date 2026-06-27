module host_rx_pe (
        input  logic clk,
        input  logic rst_ni,
        input  logic [1:0] line_state,
        input  logic [1:0] prev_line_state,
        input logic rx_enable,
        
        // RX outputs
        output logic rx_pkt_done,
        output logic data_recv,
        output logic [7:0] rx_pid,
        output logic [7:0] rx_data [0:63],
        output logic [7:0] rx_count
);

        typedef enum logic [2:0] {
                RX_IDLE,
                RX_SYNC,
                RX_PID,
                RX_DATA,
                RX_EOP
        } rx_state_e;

        rx_state_e rx_state, rx_next_state;
        logic [7:0] rx_byte, rv_byte;
        logic [2:0] bit_count;
        logic [3:0] bit_timer;
        logic [2:0] rx_ones_count;
        logic rx_skip_stuff;
        logic [15:0] rx_timeout_counter;
        logic se0_detected;
        logic sync_detected;

        parameter int BIT_TIME = 4;
        parameter int RX_TIMEOUT = 9600;  // Longer timeout for independent RX

        // Detect special USB line conditions
        assign se0_detected = (line_state == 2'd0);  // SE0 anytime
        assign sync_detected = (prev_line_state == 2'd1 && line_state == 2'd2);  // J to K

        function automatic [7:0] bit_reverse(input [7:0] b);
                bit_reverse = 0;
                for (int i = 0; i < 8; i++)
                        bit_reverse[i] = b[7 - i];
        endfunction

        always_ff @(posedge clk or negedge rst_ni) begin
                if (!rst_ni) begin
                        rx_state <= RX_IDLE;
                        rx_count <= 0;
                        rx_pid <= 0;
                        rx_timeout_counter <= 0;
                        rx_pkt_done <= 0;
                        data_recv <= 0;
                        bit_count <= 0;
                        bit_timer <= 0;
                        rx_ones_count <= 0;
                        rx_skip_stuff <= 0;
                end else begin
                        rx_pkt_done <= 0;
                        
                        case (rx_state)
                                RX_IDLE: begin
                                        if (sync_detected && rx_enable) begin
                                                rx_state <= RX_SYNC;
                                                //rx_pkt_done <= 0;
                                                data_recv <= 0;
                                                bit_count <= 0;
                                                bit_timer <= 0;
                                                rx_ones_count <= 0;
                                                rx_skip_stuff <= 0;
                                                rx_timeout_counter <= 0;
                                                $display("[INDEP_RX %0t] SYNC detected - starting packet reception", $time);
                                        end
                                end
                                RX_SYNC: begin
                                        if (bit_timer >= BIT_TIME - 1) begin
                                                //rx_pkt_done <= 0;
                                                bit_timer <= 0;
                                                bit_count <= bit_count + 1;
                                                if (bit_count >= 7) begin
                                                        rx_state <= RX_PID;
                                                        bit_count <= 0;
                                                        rx_byte <= 0;
                                                        $display("[INDEP_RX %0t] SYNC complete, receiving PID", $time);
                                                end
                                        end else begin
                                                bit_timer <= bit_timer + 1;
                                        end
                                end
                                RX_PID: begin
                                        if (bit_timer >= BIT_TIME - 1) begin
                                                logic bit_val;
                                                bit_timer <= 0;
                                                
                                                // NRZI decode
                                                bit_val = (line_state == prev_line_state) ? 1'b1 : 1'b0;
                                                
                                                // Bit unstuffing
                                                if (bit_val)
                                                        rx_ones_count <= rx_ones_count + 1;
                                                else
                                                        rx_ones_count <= 0;
                                                
                                                if (!rx_skip_stuff) begin
                                                        rx_byte <= {rx_byte[6:0], bit_val};  
                                                        bit_count <= bit_count + 1;
                                                end

                                                rx_skip_stuff <= 0;
                                                
                                                if (bit_count >= 7 && !rx_skip_stuff) begin
                                                        rx_pid <= rx_byte;  // REMOVED: No reverse needed
                                                        $display("[INDEP_RX %0t] PID received: 0x%02h", $time, rx_byte);
                                                        
                                                        // Check if handshake
                                                        if (rx_byte == 8'hD2 || rx_byte == 8'h5A || rx_byte == 8'h1E || rx_byte == 8'h2D) begin
                                                                rx_state <= RX_EOP;
                                                                //rx_pkt_done <= 1;
                                                                $display("[INDEP_RX %0t] Handshake packet detected", $time);
                                                        end else begin
                                                                rx_state <= RX_DATA;
                                                        end
                                                        bit_count <= 0;
                                                        rx_count <= 0;
                                                        rx_byte <= 0;
                                                end
                                        end else begin
                                                bit_timer <= bit_timer + 1;
                                        end
                                end
                                RX_DATA: begin
                                        if (se0_detected) begin
                                                rx_state <= RX_EOP;
                                                //rx_pkt_done <= 1;
                                                $display("[INDEP_RX %0t] EOP detected after %0d data bytes", $time, rx_count);
                                        end else if (bit_timer >= BIT_TIME - 1) begin
                                                logic bit_val;
                                                bit_timer <= 0;
                                                
                                                // NRZI decode
                                                bit_val = (line_state == prev_line_state) ? 1'b1 : 1'b0;
                                                
                                                // Bit unstuffing
                                                if (bit_val)
                                                        rx_ones_count <= rx_ones_count + 1;
                                                else
                                                        rx_ones_count <= 0;
                                                
                                                if (rx_ones_count == 6)
                                                        rx_skip_stuff <= 1;
                                                else if (!rx_skip_stuff) begin
                                                        rx_byte <= {rx_byte[6:0], bit_val};
                                                        bit_count <= bit_count + 1;
                                                end else
                                                rx_skip_stuff <= 0;
                                                
                                                if (bit_count >= 7 && !rx_skip_stuff) begin
                                                        rx_data[rx_count] <= rx_byte;  // REMOVED: No reverse needed
                                                        rx_count <= rx_count + 1;
                                                        bit_count <= 0;
                                                        rx_byte <= 0;
                                                end
                                                data_recv <= 1;
                                        end else begin
                                                bit_timer <= bit_timer + 1;
                                        end
                                end
                                RX_EOP: begin
                                        // After SE0, wait for J state (idle)
                                        if (line_state == 2'd1) begin  // J
                                                rx_state <= RX_IDLE;
                                                rx_pkt_done <= 1;
                                                $display("[INDEP_RX %0t] Packet complete - PID=0x%02h \n", $time, rx_pid);
                                        end else if (bit_timer >= BIT_TIME) begin
                                                bit_timer <= 0;
                                        end else begin
                                                bit_timer <= bit_timer + 1;
                                        end
                                end
                        endcase
                end
        end

endmodule
