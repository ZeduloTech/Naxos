`timescale 1ns/1ps

// Complete USB Full-Speed Host with proper enumeration
module usb_host (
        input   logic clk,              // 48 MHz
        input   logic rst_ni,
        input   logic enable,
        input   logic is_set, //for address
        input   logic send_in,

        output logic usb_sense_p2d_o,   // VBUS indicator

        inout usb_p,
        inout usb_n
);

        logic test_success = 0;
        logic rx_pkt_done, is_handshake;
        logic data_recv;
        logic [7:0] rx_pid;
        logic [7:0] rx_data [0:63];
        logic [7:0] rx_count;
        
        logic sof_trigger;
        logic [2:0] enum_next;
        logic delay, set_address, tb_set_addr, sim_complete;
        logic [2:0] delay_count;
        logic confirm_enum;
    
        //==========================================================================
        // USB Protocol Constants
        //==========================================================================
        
        // PIDs
        typedef enum logic [3:0] {
                PID_OUT     = 4'b0001,
                PID_IN      = 4'b1001,
                PID_SOF     = 4'b0101,
                PID_SETUP   = 4'b1101,
                PID_DATA0   = 4'b0011,
                PID_DATA1   = 4'b1011,
                PID_ACK     = 4'b0010,
                PID_NAK     = 4'b1010,
                PID_STALL   = 4'b1110
        } usb_pid_e;

        // Standard USB Requests
        typedef enum logic [7:0] {
                GET_STATUS        = 8'h00,
                CLEAR_FEATURE     = 8'h01,
                SET_FEATURE       = 8'h03,
                SET_ADDRESS       = 8'h05,
                GET_DESCRIPTOR    = 8'h06,
                SET_DESCRIPTOR    = 8'h07,
                GET_CONFIGURATION = 8'h08,
                SET_CONFIGURATION = 8'h09
        } usb_request_e;

        // Descriptor Types
        typedef enum logic [7:0] {
                DESC_DEVICE        = 8'h01,
                DESC_CONFIGURATION = 8'h02,
                DESC_STRING        = 8'h03
        } descriptor_type_e;

        //==========================================================================
        // Timing Parameters
        //==========================================================================
        parameter int BIT_TIME = 4;           // 48MHz / 4 = 12MHz USB Full-Speed
        parameter int RESET_TIME = 240;    // 5ms for USB reset
        parameter int RESET_RECOVERY = 480;   // 10us post-reset recovery
        parameter int SOF_INTERVAL = 960;//480;   // 1ms = 48000 clocks at 48MHz
        parameter int INTER_PACKET_DELAY = 96; // 2 bit times minimum
        parameter int ACK_TIMEOUT = 48000;     // 50us timeout
        parameter int INTER_BYTE_DELAY = 100; // 100 clock cycles between bytes

        //==========================================================================
        // State Machine Types
        //==========================================================================
        typedef enum logic [4:0] {
                ST_IDLE,
                ST_RESET,
                ST_RESET_RECOVERY,
                ST_SOF_INIT,
                ST_SOF_RUNNING,
                ST_ENUM_GET_DESC_DEV,
                ST_ENUM_SET_ADDR,
                ST_ENUM_SET_ADDR_WAIT,
                ST_ENUM_COMPLETE,
                ST_OPERATIONAL
        } host_state_e;

        typedef enum logic [3:0] {
                TRANS_IDLE,
                TRANS_SETUP_TOKEN,
                TRANS_SETUP_DATA,
                TRANS_SETUP_WAIT_ACK,
                TRANS_IN_TOKEN,
                TRANS_IN_WAIT_DATA,
                TRANS_IN_SEND_ACK,
                TRANS_OUT_TOKEN,
                TRANS_OUT_DATA,
                TRANS_OUT_WAIT_ACK,
                TRANS_COMPLETE,
                TRANS_ERROR
        } trans_state_e;

        typedef enum logic [2:0] {
                TX_IDLE,
                TX_SYNC,
                TX_PID,
                TX_DATA,
                TX_CRC,
                TX_EOP
        } tx_state_e;

        //==========================================================================
        // Registers and Signals
        //==========================================================================
        host_state_e current_state, next_state;
        trans_state_e trans_state, trans_next;
        tx_state_e tx_state, tx_next;
        
        logic [31:0] counter;
        logic [15:0] delay_counter;
        logic [31:0] sof_counter;
        logic [10:0] frame_number;
        logic [6:0] device_address;      // Assigned address (starts at 0)
        logic [6:0] device_address_new;  // New address to assign
        logic device_connected;
        
        // Transmission control
        logic [4:0] bit_count;
        logic [5:0] bit_count_64;
        logic [2:0] bit_timer;
        logic [2:0] ones_count;          // For bit stuffing
        logic last_level;                // NRZI state
        logic [3:0] byte_index;
        
        // Packet assembly
        logic [7:0] sync_pattern;
        logic [7:0] pid_byte;
        logic [127:0] packet_data;       // Large enough for any packet
        logic [7:0] packet_bytes;        // How many data bytes to send
        logic [6:0] packet_bits;
        logic [15:0] crc16_val;
        logic [4:0] crc5_val;
        
        // USB I/O
        logic usb_p_out, usb_n_out;
        logic usb_drive;
        
        // Control transfer state
        logic [7:0] control_stage;       // Track control transfer stages
        logic [63:0] response_data;      // Data received from device
        logic response_received;
        logic [3:0] response_pid;
        logic [7:0] setup_data [0:7];    // SETUP packet data
        logic trans_start;
        logic trans_done;
        logic trans_success;
        logic sending_data;
        logic sending_done;
        logic [3:0] trans_pid;
        logic [6:0] trans_addr;
        logic [3:0] trans_endp;
        
        // Enumeration control
        logic [7:0] enum_step;
        logic [15:0] enum_timer;
        logic [3:0] retry_count;

        //==========================================================================
        // USB Line Assignment
        //==========================================================================
        assign usb_p = usb_drive ? usb_p_out : 1'bz;
        assign usb_n = usb_drive ? usb_n_out : 1'bz;
        assign device_connected = enable;
        assign usb_sense_p2d_o = enable;
        //assign is_driving = usb_drive;

        logic [1:0] line_state, prev_line_state;
        logic [1:0] line_state_raw;

        always_comb begin
                case ({usb_p, usb_n})
                        2'b10: line_state_raw = 2'd1; // J
                        2'b01: line_state_raw = 2'd2; // K
                        2'b00: line_state_raw = 2'd0; // SE0
                        default: line_state_raw = 2'd3; // SE1
                endcase
        end

        // Register it for timing
        always_ff @(posedge clk or negedge rst_ni) begin
                if (!rst_ni) begin
                        line_state <= 2'd1;
                        prev_line_state <= 2'd1;
                end else begin
                        prev_line_state <= line_state;
                        line_state <= line_state_raw;
                end
        end

        //==========================================================================
        // CRC5 Calculation (for SOF and token packets)
        //==========================================================================
        function automatic [4:0] calc_crc5(input [10:0] data);
                logic [4:0] crc, crc_reversed;
                logic feedback;
                
                crc = 5'b11111;   // CRC5 initial value

                // Process the 11-bit frame number LSB first
                for (int i = 0; i < 11; i++) begin
                        feedback = data[i] ^ crc[4];
                        crc = {crc[3:0], 1'b0};  // Shift left
                        if (feedback) begin
                                crc = crc ^ 5'b00101;  // Polynomial x^5 + x^2 + 1
                        end
                end

                // Invert the CRC
                crc = ~crc;
                
                // Bit-reverse the CRC for transmission (LSB becomes MSB)
                crc_reversed[0] = crc[4];
                crc_reversed[1] = crc[3];
                crc_reversed[2] = crc[2];
                crc_reversed[3] = crc[1];
                crc_reversed[4] = crc[0];
                
                return crc_reversed;
        endfunction

        //==========================================================================
        // CRC16 Calculation (for data packets)
        //==========================================================================
        function automatic logic [15:0] calc_crc16(input logic [63:0] data, input int bit_count);
                logic bit_in;
                logic xor_result;
                logic [15:0] crc_reversed;
                logic [15:0] crc = 16'hFFFF;
                
                for (int i = 0; i < bit_count; i++) begin
                        bit_in = data[i];
                        xor_result = crc[15] ^ bit_in;
                        crc = crc << 1;
                        if (xor_result) begin
                                crc = crc ^ 16'h8005;  // Reversed polynomial
                        end
                end
                
                // Invert and reverse the final CRC for USB transmission
                crc = ~crc;
                // Bit-reverse the CRC
                for (int i = 0; i < 16; i++) begin
                        crc_reversed[i] = crc[15-i];
                end
                
                return crc_reversed;
        endfunction

        //==========================================================================
        // Build SETUP Packet for Control Transfers
        //==========================================================================
        task automatic build_setup_get_descriptor(
                input logic [7:0] desc_type,
                input logic [7:0] desc_index,
                input logic [15:0] length
        );
                setup_data[0] = 8'h80;           // bmRequestType: Device-to-host
                setup_data[1] = GET_DESCRIPTOR;
                setup_data[2] = desc_index;      // wValue LSB
                setup_data[3] = desc_type;       // wValue MSB
                setup_data[4] = 8'h00;           // wIndex LSB
                setup_data[5] = 8'h00;           // wIndex MSB
                setup_data[6] = length[7:0];     // wLength LSB
                setup_data[7] = length[15:8];    // wLength MSB
        endtask

        task automatic build_setup_set_address(input logic [6:0] addr);
                setup_data[0] = 8'h00;           // bmRequestType: Host-to-device
                setup_data[1] = SET_ADDRESS;
                setup_data[2] = {1'b0, addr};    // wValue LSB
                setup_data[3] = 8'h00;           // wValue MSB
                setup_data[4] = 8'h00;           // wIndex LSB
                setup_data[5] = 8'h00;           // wIndex MSB
                setup_data[6] = 8'h00;           // wLength LSB
                setup_data[7] = 8'h00;           // wLength MSB
        endtask

        task automatic build_setup_set_configuration(input logic [7:0] config_n);
                setup_data[0] = 8'h00;           // bmRequestType: Host-to-device
                setup_data[1] = SET_CONFIGURATION;
                setup_data[2] = config_n;          // wValue LSB
                setup_data[3] = 8'h00;           // wValue MSB
                setup_data[4] = 8'h00;           // wIndex LSB
                setup_data[5] = 8'h00;           // wIndex MSB
                setup_data[6] = 8'h00;           // wLength LSB
                setup_data[7] = 8'h00;           // wLength MSB
        endtask

        //==========================================================================
        // NRZI Encoding with Bit Stuffing
        //==========================================================================
        typedef struct packed {
                logic level;
                logic [2:0] ones;
                logic stuff;
        } nrzi_result_t;

        function automatic nrzi_result_t nrzi_encode(
                input logic data_bit,
                input logic prev_level,
                input logic [2:0] prev_ones
        );
                nrzi_result_t result;
                
                result.stuff = (prev_ones == 3'd6);
                
                if (result.stuff) begin
                        // Insert stuff bit (transition)
                        result.level = ~prev_level;
                        result.ones = 3'd0;
                end else begin
                        if (data_bit) begin
                                // '1' = no transition
                                result.level = prev_level;
                                result.ones = prev_ones + 1;
                        end else begin
                                // '0' = transition
                                result.level = ~prev_level;
                                result.ones = 3'd0;
                        end
                end
                
                return result;
        endfunction

        //==========================================================================
        // Packet Transmission Engine
        //==========================================================================
        logic tx_start;
        logic tx_done;
        logic [7:0] tx_data_byte;
        logic tx_sending;
        logic send_setup_token;
        
        nrzi_result_t nrzi_res;
    
        always_ff @(posedge clk or negedge rst_ni) begin
                if (!rst_ni) begin
                        tx_state <= TX_IDLE;
                        bit_count <= 0;
                        bit_count_64 <= 0;
                        bit_timer <= 0;
                        ones_count <= 0;
                        last_level <= 0;
                        usb_p_out <= 1;
                        usb_n_out <= 0;
                        usb_drive <= 0;
                        sending_done <= 0;
                        tx_done <= 0;
                        byte_index <= 0;
                        sync_pattern <= 8'b10000000; // KJKJKJKK
                end else begin
                        
                        if (!tx_start) begin
                                bit_count <= 0;
                                bit_count_64 <= 0;
                                bit_timer <= 0;
                                byte_index <= 0;
                                ones_count <= 0;
                                last_level <= 0;
                                delay_counter <= 0;
                                tx_done <= 0;
                        end else if (tx_start) begin
                                /* $display("[HOST_TX_ENGINE %0t] tx_start=1, tx_state=%s, bit_timer=%0d", 
                                        $time, tx_state.name(), bit_timer); */
                                if (bit_timer >= BIT_TIME - 1) begin
                                        //$display("\n[HOST_DEBUG] Starting TX");
                                        //$display("[HOST_TX_BIT] Processing bit, state=%s", tx_state.name());
                                        bit_timer <= 0;
                                
                                        case (tx_state)
                                                TX_SYNC: begin
                                                        //$display("\n[HOST_DEBUG] TX_SYNC");
                                                        //$display("[HOST_TX_SYNC] bit_count=%0d", bit_count);
                                                        if (bit_count < 8) begin
                                                                nrzi_res = nrzi_encode(sync_pattern[bit_count], last_level, ones_count);
                                                                
                                                                if (!nrzi_res.stuff) bit_count <= bit_count + 1;
                                                                
                                                                last_level <= nrzi_res.level;
                                                                ones_count <= nrzi_res.ones;
                                                                
                                                                {usb_p_out, usb_n_out} <= nrzi_res.level ? 2'b01 : 2'b10;
                                                                
                                                                if (bit_count == 7 && !nrzi_res.stuff) begin
                                                                        tx_state <= TX_PID;
                                                                        bit_count <= 0;
                                                                end
                                                        end
                                                end
                                                TX_PID: begin
                                                        if (bit_count < 8) begin
                                                                nrzi_res = nrzi_encode(pid_byte[bit_count], last_level, ones_count);
                                                                
                                                                if (!nrzi_res.stuff) bit_count <= bit_count + 1;
                                                                
                                                                last_level <= nrzi_res.level;
                                                                ones_count <= nrzi_res.ones;
                                                                
                                                                {usb_p_out, usb_n_out} <= nrzi_res.level ? 2'b01 : 2'b10;
                                                                
                                                                if (bit_count == 7 && !nrzi_res.stuff) begin
                                                                        if (packet_bytes > 0) begin
                                                                                tx_state <= TX_DATA;
                                                                        end else begin
                                                                                if(is_handshake) begin
                                                                                        $display("\n[HOST_DEBUG] Handshake Packet (PID -> EOP)");
                                                                                        tx_state <= TX_EOP;
                                                                                end else begin
                                                                                        $display("\n[HOST_DEBUG] Zero Length Packet (PID -> EOP)");
                                                                                        tx_state <= TX_CRC;
                                                                                end
                                                                        end
                                                                        bit_count <= 0;
                                                                end
                                                        end
                                                end
                                                TX_DATA: begin
                                                        if (bit_timer >= BIT_TIME - 1) begin
                                                                logic bit_val;
                                                                bit_timer <= 0;
                                                                
                                                                if (sending_data) begin
                                                                        if (bit_count_64 < packet_bits) begin
                                                                                nrzi_res = nrzi_encode(packet_data[bit_count_64], last_level, ones_count);
                                                                                
                                                                                if (!nrzi_res.stuff) bit_count_64 <= bit_count_64 + 1;
                                                                                
                                                                                last_level <= nrzi_res.level;
                                                                                ones_count <= nrzi_res.ones;
                                                                                {usb_p_out, usb_n_out} <= nrzi_res.level ? 2'b01 : 2'b10;

                                                                                if (bit_count_64 == (packet_bits - 1) && !nrzi_res.stuff) begin
                                                                                        bit_count_64 <= 0;
                                                                                        bit_count <= 0;
                                                                                        tx_state <= TX_CRC;
                                                                                        $display("\n[HOST_DEBUG] Data Bytes Transmission Complete!");
                                                                                end
                                                                        end
                                                                end else begin
                                                                        sending_done <= 1'b0;

                                                                        if (bit_count < packet_bits) begin
                                                                                nrzi_res = nrzi_encode(packet_data[bit_count], last_level, ones_count);
                                                                                
                                                                                if (!nrzi_res.stuff) bit_count <= bit_count + 1;
                                                                                
                                                                                last_level <= nrzi_res.level;
                                                                                ones_count <= nrzi_res.ones;
                                                                                {usb_p_out, usb_n_out} <= nrzi_res.level ? 2'b01 : 2'b10;
                                                                                
                                                                                if (bit_count == packet_bits - 1 && !nrzi_res.stuff) begin
                                                                                        tx_state <= TX_EOP;
                                                                                        bit_count <= 0;
                                                                                end
                                                                        end
                                                                end
                                                        end else begin
                                                                bit_timer <= bit_timer + 1;
                                                        end
                                                end
                                                TX_CRC: begin
                                                        if (bit_count < 16) begin
                                                                //$display("\n[HOST_DEBUG] Sending CRC16");
                                                                nrzi_res = nrzi_encode(crc16_val[bit_count], last_level, ones_count);
                                                                
                                                                if (!nrzi_res.stuff) bit_count <= bit_count + 1;
                                                                
                                                                last_level <= nrzi_res.level;
                                                                ones_count <= nrzi_res.ones;
                                                                
                                                                {usb_p_out, usb_n_out} <= nrzi_res.level ? 2'b01 : 2'b10;
                                                                
                                                                if (bit_count == 15 && !nrzi_res.stuff) begin
                                                                        tx_state <= TX_EOP;
                                                                        sending_done <= 1'b1;
                                                                        bit_count <= 0;
                                                                end
                                                        end
                                                end
                                                TX_EOP: begin
                                                        if (bit_timer >= BIT_TIME - 1) begin
                                                                case (bit_count)
                                                                        0, 1: begin
                                                                                usb_p_out <= 0;  // SE0
                                                                                usb_n_out <= 0;
                                                                                bit_count <= bit_count + 1;
                                                                        end
                                                                        2: begin
                                                                                usb_p_out <= 1;  // J
                                                                                usb_n_out <= 0;
                                                                                last_level <= 0;
                                                                                bit_count <= bit_count + 1;
                                                                        end
                                                                        3: begin
                                                                                tx_state <= TX_IDLE;
                                                                                usb_drive <= 1'b0;
                                                                                tx_done <= 1'b1;
                                                                                tx_start <= 1'b0;
                                                                                send_setup_token = 1'b1;
                                                                                bit_count <= 0;
                                                                        end
                                                                endcase 
                                                        end
                                                end
                                        endcase
                                end else begin
                                        bit_timer <= bit_timer + 1;
                                end
                        end
                end
        end

        //==========================================================================
        // Control Transfer State Machine
        //==========================================================================
        logic wait_ack, status_complete;
        logic first_setup, second_setup, first_in, address_set;
        logic set_desc, set_status, enum_done;
        logic [10:0] addr_endp;

        always_ff @(posedge clk or negedge rst_ni) begin
                if (!rst_ni) begin
                        trans_state <= TRANS_IDLE;
                        trans_done <= 0;
                        trans_success <= 0;
                        sending_data <= 0;
                        wait_ack <= 0;
                        first_setup <= 0;
                        second_setup <= 0;
                        first_in <= 0;
                        is_handshake <= 0;
                        status_complete <= 0;
                        address_set <= 1'b0;
                        send_setup_token = 1'b0;
                        enum_done <= 0;
                        counter <= 0;
                end else begin
                        trans_done <= 0;
                        
                        case (trans_state)
                                TRANS_IDLE: begin
                                        send_setup_token = 1'b0;

                                        if (trans_start) begin
                                                counter <= 0;
                                                if (trans_pid == PID_SETUP)
                                                begin
                                                        trans_state <= TRANS_SETUP_TOKEN;
                                                        $display("\n[HOST_DEBUG] Sending SETUP: addr=%0d, endp=%0d", trans_addr, trans_endp);
                                                end
                                                else if (trans_pid == PID_IN) begin
                                                        $display("\n[HOST_DEBUG] Sending IN: addr=%0d, endp=%0d", trans_addr, trans_endp);
                                                        trans_state <= TRANS_IN_TOKEN;
                                                end
                                                else if (trans_pid == PID_OUT) begin
                                                        $display("\n[HOST_DEBUG] Sending OUT: addr=%0d, endp=%0d", trans_addr, trans_endp);
                                                        trans_state <= TRANS_OUT_TOKEN;
                                                end
                                        end else begin
                                                trans_success <= 0;
                                        end
                                end
                                TRANS_SETUP_TOKEN: begin
                                        if (!tx_sending) begin
                                                // Send SETUP token
                                                addr_endp = {trans_endp, trans_addr};

                                                $display("[HOST_DEBUG] addr_endp packed = 0x%h", addr_endp);

                                                pid_byte <= {~PID_SETUP, PID_SETUP};
                                                crc5_val = calc_crc5(addr_endp);
                                                packet_data[15:0] = {crc5_val, trans_endp, trans_addr};
                                                packet_bits <= 16;
                                                packet_bytes <= 2;
                                                crc16_val = 0;
                                                tx_start <= 1;
                                                trans_state <= TRANS_SETUP_DATA;
                                                tx_state <= TX_SYNC;
                                                send_setup_token = 1'b0;
                                                usb_drive <= 1;
                                                counter <= 0;
                                                
                                                $display("\n[HOST] SETUP token sent, preparing DATA packet");
                                        end
                                end
                                TRANS_SETUP_DATA: begin
                                        if (tx_done) begin
                                                counter <= 0;
                                        end else if (sending_done & !tx_start) begin
                                                // Data transmission complete, move to ACK wait
                                                trans_state <= TRANS_SETUP_WAIT_ACK;
                                                wait_ack <= 1'b1;
                                                sending_data <= 1'b0;
                                                counter <= 0;
                                                $display("\n[HOST_DEBUG] DATA0 transmission complete, waiting for ACK");
                                        end else if (!sending_data && (counter >= INTER_PACKET_DELAY) && !tx_sending && send_setup_token) begin
                                                // First time: load and start the DATA0 packet
                                                pid_byte <= {~PID_DATA0, PID_DATA0};

                                                for (int i = 7; i >= 0; i--) begin
                                                        packet_data[i*8 +: 8] = setup_data[i];
                                                end
                                                
                                                packet_bytes <= 8;
                                                packet_bits <= 64;
                                                crc16_val = calc_crc16(packet_data, 64);
                                                
                                                $display("[HOST_TX_DATA_SENT] Setup data in transmission order: ");
                                                for (int i = 7; i >= 0; i--) begin
                                                        $display("  Byte[%0d] = 0x%02h", i, packet_data[i*8 +: 8]);
                                                end
                                                $display("[HOST_CRC] Data CRC16=%04x", crc16_val);
                                                tx_state <= TX_SYNC;
                                                usb_drive <= 1;
                                                tx_start <= 1;
                                                sending_data <= 1'b1;
                                                counter <= 0;
                                                $display("[HOST_DEBUG] Starting DATA0 packet transmission");
                                        end else begin
                                                counter <= counter + 1;
                                        end
                                end
                                TRANS_SETUP_WAIT_ACK: begin

                                        if (rx_pkt_done) begin
                                                if ((rx_pid == 8'hD2) || (rx_pid == 8'h2D)) begin  // ACK
                                                        $display("\n[HOST_DEBUG] ACK ACCEPTED!");
                                                        test_success <= 1;     // !!! Finish here for now
                                                        trans_success <= 1;
                                                        trans_done <= 1;
                                                        wait_ack <= 1'b0;
                                                        trans_start <= 0;
                                                        trans_state <= TRANS_COMPLETE;
                                                        first_setup <= 1'b1;

                                                        if(!first_setup) begin
                                                                first_setup <= 1'b1;
                                                        end else begin
                                                                second_setup <= 1'b1;
                                                        end

                                                        if(set_address)
                                                        begin
                                                                address_set <= 1'b1;
                                                        end
                                                end else begin
                                                        $display("\n[HOST_DEBUG] NAK or other response!");
                                                        trans_success <= 0;
                                                        trans_done <= 1;
                                                        wait_ack <= 1'b0;
                                                        trans_start <= 0;
                                                        trans_state <= TRANS_ERROR;
                                                end
                                        end else if (counter >= ACK_TIMEOUT) begin //rx_timeout_counter
                                                $display("\n[HOST_DEBUG] ACK TIMEOUT!");
                                                trans_success <= 0;
                                                trans_done <= 1;
                                                wait_ack <= 1'b0;
                                                trans_start <= 0;
                                                trans_state <= TRANS_ERROR;
                                                counter <= 0;
                                        end else begin
                                                counter <= counter + 1;
                                        end
                                end
                                TRANS_IN_TOKEN: begin
                                        if (tx_done) begin
                                                // Transition IMMEDIATELY when done
                                                trans_state <= TRANS_IN_WAIT_DATA;
                                                wait_ack <= 1'b1;
                                                counter <= 0;
                                                $display("\n[HOST_DEBUG] IN token sent, waiting for DATA response");
                                        end else if (!tx_sending) begin
                                                // Send IN token
                                                addr_endp = {trans_endp, trans_addr};
                                                $display("\n[HOST_DEBUG] Sending IN Token Packet");
                                                pid_byte <= {~PID_IN, PID_IN};
                                                crc5_val = calc_crc5(addr_endp);
                                                packet_data[15:0] = {crc5_val, trans_endp, trans_addr};
                                                packet_bits <= 16;
                                                packet_bytes <= 2;
                                                crc16_val = 0;
                                                tx_state <= TX_SYNC;
                                                usb_drive <= 1;
                                                tx_start <= 1;
                                                counter <= 0;
                                        end
                                end
                                TRANS_IN_WAIT_DATA: begin
                                        if (tx_done) begin
                                                counter <= 0;
                                        end else if (rx_pkt_done) begin
                                                if (rx_pid == 8'hC3 || rx_pid == 8'h4B || data_recv) begin  // DATA0 or DATA1
                                                        trans_state <= TRANS_IN_SEND_ACK;
                                                        is_handshake <= 1'b1;
                                                        wait_ack <= 1'b0;
                                                        first_in <= 1'b1;
                                                        counter <= 0;
                                                        $display("\n[HOST_TX_IN] RX DATA Packet Received, sending ACK");
                                                end else if (rx_pid == 8'h5A) begin  // NAK
                                                        trans_success <= 0;
                                                        trans_done <= 1;
                                                        wait_ack <= 1'b0;
                                                        trans_start <= 0;
                                                        trans_state <= TRANS_ERROR;
                                                end else begin
                                                        trans_success <= 0;
                                                        trans_done <= 1;
                                                        wait_ack <= 1'b0;
                                                        trans_start <= 0;
                                                        trans_state <= TRANS_ERROR;
                                                end
                                        end else if (counter >= ACK_TIMEOUT) begin
                                                trans_success <= 0;
                                                trans_done <= 1;
                                                wait_ack <= 1'b0;
                                                trans_state <= TRANS_ERROR;
                                        end else begin
                                                counter <= counter + 1;
                                        end
                                end
                                TRANS_IN_SEND_ACK: begin
                                        if (counter >= INTER_PACKET_DELAY && !tx_sending && !tx_done) begin
                                                // Send ACK
                                                $display("\n[HOST_TX_DEBUG] Sending ACK Handshake");
                                                pid_byte <= {~PID_ACK, PID_ACK};
                                                packet_bytes <= 0;
                                                tx_state <= TX_SYNC;
                                                usb_drive <= 1;
                                                tx_start <= 1;
                                        end else if (tx_done ) begin
                                                $display("\n[HOST_TX_DEBUG] ACK Sent -> TX Complete");
                                                trans_success <= 1;
                                                trans_done <= 1;
                                                trans_start <= 0;
                                                trans_state <= TRANS_COMPLETE;
                                        end else begin
                                                counter <= counter + 1;
                                        end
                                end
                                TRANS_OUT_TOKEN: begin
                                        if (tx_done) begin
                                                // Transition IMMEDIATELY when done
                                                trans_state <= TRANS_OUT_DATA;
                                                counter <= 0;
                                                $display("\n[HOST_TX_DEBUG] OUT token sent, Sending Data1");
                                        end else if (!tx_sending) begin
                                                // Send OUT token
                                                addr_endp = {trans_endp, trans_addr};

                                                pid_byte <= {~PID_OUT, PID_OUT};
                                                crc5_val = calc_crc5(addr_endp);
                                                packet_data[15:0] = {crc5_val, trans_endp, trans_addr};
                                                packet_bytes <= 2;
                                                crc16_val = 0;
                                                tx_state <= TX_SYNC;
                                                usb_drive <= 1;
                                                tx_start <= 1;
                                                counter <= 0;
                                        end
                                end
                                TRANS_OUT_DATA: begin
                                        //tx_start <= 0;
                                        if (tx_done) begin
                                                counter <= 0;
                                                wait_ack <= 1'b1;
                                                trans_state <= TRANS_OUT_WAIT_ACK;
                                                $display("[HOST_TX_DEBUG] DATA1 Sent, Waiting  For Ack");
                                        end else if (counter >= INTER_PACKET_DELAY && !tx_sending && !tx_done) begin
                                                // Send DATA1 (zero-length for status stage)
                                                pid_byte <= {~PID_DATA1, PID_DATA1};
                                                packet_bits <= 0;
                                                packet_bytes <= 0;
                                                crc16_val = calc_crc16(0, 0);
                                                tx_state <= TX_SYNC;
                                                usb_drive <= 1;
                                                tx_start <= 1;
                                                counter <= 0;
                                                $display("\n[HOST_TX_DEBUG] Sending DATA1 Token Packet");
                                        end else begin
                                                counter <= counter + 1;
                                        end
                                end
                                TRANS_OUT_WAIT_ACK: begin
                                        //tx_start <= 0;
                                        if (tx_done) begin
                                               // rx_timeout_counter <= 0;
                                                counter <= 0;
                                        end else if (rx_pkt_done) begin
                                                if ((rx_pid == 8'hD2) || (rx_pid == 8'h2D)) begin  // ACK
                                                        trans_success <= 1;
                                                        trans_done <= 1;
                                                        trans_start <= 0;
                                                        status_complete <= 1;
                                                        wait_ack <= 1'b0;

                                                        if(confirm_enum) begin
                                                                $display("\n[HOST_TX_DEBUG] Device Replied To New Address, Enumeration Complete!");
                                                                enum_done <= 1;
                                                        end
                                                        trans_state <= TRANS_COMPLETE;
                                                end else begin
                                                        trans_success <= 0;
                                                        trans_done <= 1;
                                                        wait_ack <= 1'b0;
                                                        trans_start <= 0;
                                                        trans_state <= TRANS_ERROR;
                                                end
                                        end else if (counter >= ACK_TIMEOUT) begin
                                                trans_success <= 0;
                                                trans_done <= 1;
                                                wait_ack <= 1'b0;
                                                trans_start <= 0;
                                                trans_state <= TRANS_ERROR;
                                        end else begin
                                                counter <= counter + 1;
                                        end
                                end
                                TRANS_COMPLETE: begin
                                        if (!trans_start) begin
                                                trans_state <= TRANS_IDLE;
                                                trans_done <= 0;
                                                is_handshake <= 1'b0;
                                                status_complete <= 1'b0;
                                        end
                                end
                                TRANS_ERROR: begin
                                        if(!first_setup)
                                        begin
                                               enum_next <= 3'd0; 
                                        end else if(!first_in)
                                        begin
                                               enum_next <= 3'd1; 
                                        end

                                        if (!trans_start) begin
                                                trans_state <= TRANS_IDLE;
                                                trans_done <= 0;
                                                is_handshake <= 1'b0;
                                                status_complete <= 1'b0;
                                        end
                                end
                        endcase
                end
        end

        //==========================================================================
        // Main Host State Machine
        //==========================================================================
        
        always_ff @(posedge clk or negedge rst_ni) begin
                if (!rst_ni) begin
                        current_state <= ST_IDLE;
                        counter <= 0;
                        frame_number <= 0;
                        device_address <= 7'h0;
                        device_address_new <= 7'd5;  // Assign address 5
                        enum_step <= 0;
                        enum_timer <= 0;
                        usb_drive <= 0;
                        retry_count <= 0;
                        usb_p_out <= 1;
                        usb_n_out <= 0;
                        set_address <= 1'b0;
                        sof_trigger <= 0;
                        enum_next <= 0;
                        delay <= 0;
                        tb_set_addr <= 1'b0;
                        confirm_enum <= 1'b0;
                        delay_count <= 0;
                        trans_start <= 0;
                        sim_complete <= 1'b0;
                end else if (enable) begin
                        counter <= counter + 1;
                        sof_trigger <= 0;
                        
                        case (current_state)
                                ST_IDLE: begin
                                        //$display("\n[HOST_DEBUG] ST_IDLE");
                                        usb_drive <= 0;
                                        usb_p_out <= 1;
                                        usb_n_out <= 0;
                                        //trans_start <= 0;

                                        //$display("[HOST_DEBUG] device_connected: %0b", device_connected);
                                        if (device_connected) begin
                                               // $display("[HOST_DEBUG] device is connected");
                                                current_state <= ST_RESET;
                                                counter <= 0;
                                                $display("[HOST] Device detected at %0t", $time);
                                        end
                                end
                                ST_RESET: begin
                                        //$display("\n[HOST_DEBUG] ST_IDLE");

                                        usb_drive <= 1;
                                        usb_p_out <= 0;  // SE0
                                        usb_n_out <= 0;
                                        
                                        if (counter >= RESET_TIME) begin
                                                current_state <= ST_RESET_RECOVERY;
                                                counter <= 0;
                                                $display("[HOST] SE0 Reset complete at %0t", $time);
                                        end
                                end
                                ST_RESET_RECOVERY: begin
                                        usb_drive <= 0;
                                        
                                        if (counter >= RESET_RECOVERY) begin
                                                current_state <= ST_SOF_INIT;
                                                counter <= 0;
                                                frame_number <= 0;
                                                //device_address <= 7'd0;  // ADD THIS - ensure we start at address 0
                                                $display("[HOST] Starting SOF transmission at %0t", $time);
                                        end
                                end
                                ST_SOF_INIT: begin
                                       // $display("[HOST_DEBUG] ST_SOF_INIT");
                                        if (counter >= SOF_INTERVAL) begin
                                                counter <= 0;
                                                if (!tx_sending) begin
                                                        sof_trigger <= 1;
                                                        current_state <= ST_SOF_RUNNING;
                                                        tx_start <= 1;
                                                        $display("[HOST] First SOF frame %0d at %0t", frame_number, $time);
                                                end
                                        end
                                end
                                ST_SOF_RUNNING: begin
                                        if (counter >= SOF_INTERVAL) begin
                                                counter <= 0;
                                                frame_number <= frame_number + 1;
                                                if (!tx_sending) begin
                                                        sof_trigger <= 1;
                                                        if (frame_number > 8) begin
                                                                current_state <= ST_ENUM_GET_DESC_DEV;
                                                                enum_next <= 3'd0;
                                                                $display("\n[HOST] Starting Enumeration at %0t", $time);
                                                        end
                                                end
                                        end
                                end
                                ST_ENUM_GET_DESC_DEV: begin
                                        case (enum_next)
                                                3'd0: begin
                                                        // Send SETUP
                                                        build_setup_get_descriptor(DESC_DEVICE, 8'd0, 16'd8);
                                                        trans_pid <= PID_SETUP;
                                                        trans_addr = device_address;
                                                        trans_endp = 4'd0;
                                                        trans_start <= 1;
                                                        enum_next <= 3'd1;
                                                end
                                                3'd1: begin
                                                        if(first_setup) begin
                                                                if(counter > 1000)
                                                                begin
                                                                        trans_pid <= PID_IN;
                                                                        trans_addr = device_address;
                                                                        trans_endp = 4'd0;
                                                                        trans_start <= 1;
                                                                        enum_next <= 3'd2;
                                                                        counter <= 0;
                                                                        $display("\n[%0t] [HOST] Sending IN to read device descriptor", $time);
                                                                end
                                                        end
                                                end
                                                3'd2: begin
                                                        if(first_in & !is_handshake)
                                                        begin
                                                                // Send Out Token for Status
                                                                trans_pid <= PID_OUT;
                                                                trans_addr = device_address;
                                                                trans_endp = 4'd0;
                                                                trans_start <= 1;
                                                                enum_next <= 3'd3;
                                                                counter <= 0;
                                                                $display("\n[%0t] [HOST] Sending OUT Token For Status Packet", $time);
                                                        end
                                                end
                                                3'd3: begin
                                                        if(status_complete && trans_success)
                                                        begin
                                                                // IN transaction done, move to next state
                                                                current_state <= ST_ENUM_SET_ADDR;
                                                                delay <= 1'b0;
                                                                //sof_trigger <= 1;
                                                                tx_state <= TX_IDLE;
                                                                enum_next <= 3'd0;
                                                                $display("\n[%0t] [HOST] Device descriptor received, moving to SET_ADDRESS", $time);
                                                        end
                                                end
                                        endcase
                                end
                                ST_ENUM_SET_ADDR: begin
                                        // Continue sending SOFs
                                        /* if (delay & (counter >= SOF_INTERVAL)) begin
                                                counter <= 0;
                                                if (!tx_sending) begin
                                                        sof_trigger <= 1;
                                                        frame_number <= frame_number + 1;
                                                end
                                                if(delay_count < 2) begin
                                                        delay_count <= delay_count + 1;
                                                end else begin
                                                        sof_trigger <= 0;
                                                        delay <= 1'b0;
                                                end
                                        end else */ if (!delay) begin
                                                delay_count <= 0;
                                                case (enum_next)
                                                        3'd0: begin
                                                                // Send SETUP to address 0
                                                                build_setup_set_address(device_address_new);
                                                                trans_pid <= PID_SETUP;
                                                                trans_addr = device_address;
                                                                trans_endp = 4'd0;
                                                                trans_start <= 1;
                                                                set_address <= 1'b1;
                                                                enum_next <= 3'd1;
                                                                current_state <= ST_ENUM_SET_ADDR_WAIT;
                                                                //delay <= 1'b1;
                                                                $display("\n[%0t] [HOST] Setting address to %0d (using addr 0)", 
                                                                        $time, device_address_new);
                                                        end
                                                        3'd1: begin
                                                                //$display("\n[HOST_DEBUG] tb_set_address: %0b", tb_set_address);
                                                                if(set_address & address_set) begin
                                                                        // SETUP succeeded, now do Status stage IN at address 0
                                                                        trans_pid <= PID_IN;
                                                                        trans_addr = device_address;
                                                                        trans_endp = 4'd0;
                                                                        enum_next <= 3'd2;
                                                                        trans_start <= 1;
                                                                        set_address <= 1'b0;
                                                                        enum_next <= 3'd2;
                                                                        $display("\n[%0t] [HOST] Sending Status IN at address 0", $time);
                                                                end
                                                        end
                                                        3'd2: begin //send set config to new address
                                                                if(counter >= 1000 && !is_handshake && !tb_set_addr)
                                                                begin
                                                                        tb_set_addr <= 1'b1;
                                                                        $display("\n[HOST_DEBUG] Status Complete, Set New Address");
                                                                end else if(is_set) begin
                                                                        // Status stage complete - NOW switch address
                                                                        trans_pid <= PID_OUT;
                                                                        trans_addr = device_address_new;
                                                                        trans_endp = 4'd0;
                                                                        enum_next <= 3'd2;
                                                                        trans_start <= 1;
                                                                        set_address <= 1'b0;
                                                                        enum_next <= 3'd3;
                                                                        confirm_enum <= 1'b1;
                                                                        $display("\n[%0t] [HOST] Sending Status OUT at address ", $time);
                                                                end
                                                        end
                                                        3'd3: begin
                                                                if(enum_done) begin
                                                                        // Status stage complete - NOW switch address
                                                                        device_address <= device_address_new;
                                                                        current_state <= ST_ENUM_COMPLETE;
                                                                        enum_next <= 3'd0;
                                                                        $display("\n[%0t] [HOST] Status complete, device now at address %0d", 
                                                                                $time, device_address_new);
                                                                end
                                                        end
                                                endcase
                                        end
                                end
                                ST_ENUM_SET_ADDR_WAIT: begin

                                        if(set_address & address_set)
                                        begin
                                                counter <= 0;
                                                current_state <= ST_ENUM_SET_ADDR;
                                                $display("\n[HOST_DEBUG] Sending IN Packet Now");
                                        end
                                end
                                ST_ENUM_COMPLETE: begin
                                        // Brief pause before going operational
                                        if(trans_state == TRANS_IDLE)
                                        begin
                                                if (counter >= SOF_INTERVAL) begin
                                                        counter <= 0;
                                                        if (!tx_sending) begin
                                                                sof_trigger <= 1;
                                                                frame_number <= frame_number + 1;
                                                        end
                                                end
                                                
                                                enum_timer <= enum_timer + 1;
                                                if (enum_timer >= 1000) begin
                                                        current_state <= ST_OPERATIONAL;
                                                        sim_complete <= 1'b1;
                                                        $display("[%0t] [HOST] *** ENUMERATION COMPLETE *** Device is now operational", $time);
                                                end
                                        end
                                end
                                ST_OPERATIONAL: begin
                                        // Continue sending SOFs
                                        if (counter >= SOF_INTERVAL) begin
                                                counter <= 0;
                                                if (!tx_sending) begin
                                                        sof_trigger <= 1;
                                                        frame_number <= frame_number + 1;
                                                        
                                                        if (frame_number % 1000 == 0)
                                                                $display("[%0t] [HOST] Operational - Frame %0d", $time, frame_number);
                                                end
                                        end
                                        
                                        // Device is now ready for bulk/interrupt transfers
                                end
                                default: begin
                                        current_state <= ST_IDLE;
                                end
                        endcase
                end
        end

        // SOF transmission logic
        always_ff @(posedge clk or negedge rst_ni) begin
                if (!rst_ni) begin
                        tx_start <= 0;
                        pid_byte <= 0;
                        packet_data = 0;
                        packet_bits <= 0;
                end else begin
                        //tx_start <= 0;
                        
                        if (sof_trigger && !tx_sending && tx_state == TX_IDLE) begin
                                // Prepare SOF packet
                                tx_state <= TX_SYNC;
                                pid_byte <= {~PID_SOF, PID_SOF};
                                crc5_val = calc_crc5(frame_number);
                                packet_data[15:0] = {crc5_val, frame_number};
                                packet_bits <= 16;
                                packet_bytes <= 2;
                                usb_drive <= 1;
                                tx_start <= 1;
                        end
                end
        end

        assign tx_sending = (tx_state != TX_IDLE);

        //==========================================================================
        // Separate Packet Reception Engine
        //==========================================================================
        
        logic rx_enable;

        assign rx_enable = !usb_drive;

        host_rx_pe u_indep_rx (
                .clk             (clk),
                .rst_ni          (rst_ni),
                .line_state      (line_state),
                .prev_line_state (prev_line_state),
                .rx_enable       (rx_enable),
                .rx_pkt_done     (rx_pkt_done),
                .data_recv       (data_recv),
                .rx_pid          (rx_pid),
                .rx_data         (rx_data),
                .rx_count        (rx_count)
        );

        //==========================================================================
        // Debugs
        //==========================================================================
        // Monitor TX states for IN transaction
        /* always @(posedge clk) begin
                if (trans_state == TRANS_IN_TOKEN) begin
                        $display("[HOST_TX_DEBUG %0t] IN token state:", $time);
                        $display("  tx_sending=%b, tx_start=%b", tx_sending, tx_start);
                        $display("  usb_drive=%b, tx_state=%s", usb_drive, tx_state.name());
                end
                
                if (trans_state == TRANS_IN_TOKEN && tx_start) begin
                        $display("[HOST_TX_START %0t] Starting IN token transmission", $time);
                end
                
                if (tx_done && (trans_state == TRANS_IN_TOKEN || trans_state == TRANS_IN_WAIT_DATA)) begin
                        $display("[HOST_TX_DONE %0t] IN token transmission complete", $time);
                end
        end */
endmodule
