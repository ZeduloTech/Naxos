
package bus_reg_pkg;

        import prim_util_pkg::vbits;

        //parameters
        parameter int AW = 12;
        parameter int DW = 32;
        parameter int DBW = DW/8; // Byte Width

        //reg_top access (inputs)
        typedef struct packed {
                logic            bus_we;     // write enable
                logic            bus_re;     // read enable
                logic  [AW-1:0]  bus_addr;   // register addrtess
                logic  [DW-1:0]  bus_wdata;  // write data
                logic  [DBW-1:0] bus_be;     // byte enable
        } bus_reg_i_t;

        //reg_top access (outputs)
        typedef struct packed {
                logic [DW-1:0]  bus_rdata;  // read data
                logic           bus_error;  // register error
        } bus_reg_o_t;

endpackage
