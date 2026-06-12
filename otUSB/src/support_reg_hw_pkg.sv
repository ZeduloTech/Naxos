//this package is to help replace reg2hw and hw2reg registers because of iverilog

package support_reg_hw_pkg;

    //hw2reg rxenable
    typedef struct packed {
        logic _0_de;
        logic _1_de;
        logic _2_de;
        logic _3_de;
        logic _4_de;
        logic _5_de;
        logic _0_d;
        logic _1_d;
        logic _2_d;
        logic _3_d;
        logic _4_d;
        logic _5_d;
    } hw2reg_rxenable_out;

    //hw2reg in_sent
    typedef struct packed {
        logic _0_de;
        logic _1_de;
        logic _2_de;
        logic _3_de;
        logic _4_de;
        logic _5_de;
        logic _0_d;
        logic _1_d;
        logic _2_d;
        logic _3_d;
        logic _4_d;
        logic _5_d;
    } hw2reg_in_sent;

    //hw2reg out_stall
    typedef struct packed {
        logic _0_de;
        logic _1_de;
        logic _2_de;
        logic _3_de;
        logic _4_de;
        logic _5_de;
        logic _0_d;
        logic _1_d;
        logic _2_d;
        logic _3_d;
        logic _4_d;
        logic _5_d;
    } hw2reg_out_stall;

    //hw2reg in_stall
    typedef struct packed {
        logic _0_de;
        logic _1_de;
        logic _2_de;
        logic _3_de;
        logic _4_de;
        logic _5_de;
        logic _0_d;
        logic _1_d;
        logic _2_d;
        logic _3_d;
        logic _4_d;
        logic _5_d;
    } hw2reg_in_stall;

    //hw2reg configin
    typedef struct packed {
        logic _0_rdy_de;
        logic _1_rdy_de;
        logic _2_rdy_de;
        logic _3_rdy_de;
        logic _4_rdy_de;
        logic _5_rdy_de;
        logic _0_rdy_d;
        logic _1_rdy_d;
        logic _2_rdy_d;
        logic _3_rdy_d;
        logic _4_rdy_d;
        logic _5_rdy_d;
        logic _0_pend_de;
        logic _1_pend_de;
        logic _2_pend_de;
        logic _3_pend_de;
        logic _4_pend_de;
        logic _5_pend_de;
        logic _0_pend_d;
        logic _1_pend_d;
        logic _2_pend_d;
        logic _3_pend_d;
        logic _4_pend_d;
        logic _5_pend_d;
        logic _0_sending_de;
        logic _1_sending_de;
        logic _2_sending_de;
        logic _3_sending_de;
        logic _4_sending_de;
        logic _5_sending_de;
        logic _0_sending_d;
        logic _1_sending_d;
        logic _2_sending_d;
        logic _3_sending_d;
        logic _4_sending_d;
        logic _5_sending_d;
    } hw2reg_configin;

endpackage
