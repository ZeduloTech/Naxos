module rosc_spi_bridge (cio_csb_i,
    cio_sck_i,
    cio_sd_i,
    cio_sd_o,
    clk_i,
    rosc_enable_i,
    rst_ni,
    start_i,
    stop_i,
    VDD,
    VSS);
 input cio_csb_i;
 input cio_sck_i;
 input cio_sd_i;
 output cio_sd_o;
 input clk_i;
 input rosc_enable_i;
 input rst_ni;
 input start_i;
 input stop_i;
 inout VDD;
 inout VSS;

 wire _0000_;
 wire _0001_;
 wire _0002_;
 wire _0003_;
 wire _0004_;
 wire _0005_;
 wire _0006_;
 wire _0007_;
 wire _0008_;
 wire _0009_;
 wire _0010_;
 wire _0011_;
 wire _0012_;
 wire _0013_;
 wire _0014_;
 wire _0015_;
 wire _0016_;
 wire _0017_;
 wire _0018_;
 wire _0019_;
 wire _0020_;
 wire _0021_;
 wire _0022_;
 wire _0023_;
 wire _0024_;
 wire _0025_;
 wire _0026_;
 wire _0027_;
 wire _0028_;
 wire _0029_;
 wire _0030_;
 wire _0031_;
 wire _0032_;
 wire _0033_;
 wire _0034_;
 wire _0035_;
 wire _0036_;
 wire _0037_;
 wire _0038_;
 wire _0039_;
 wire _0040_;
 wire _0041_;
 wire _0042_;
 wire _0043_;
 wire _0044_;
 wire _0045_;
 wire _0046_;
 wire _0047_;
 wire _0048_;
 wire _0049_;
 wire _0050_;
 wire _0051_;
 wire _0052_;
 wire _0053_;
 wire _0054_;
 wire _0055_;
 wire _0056_;
 wire _0057_;
 wire _0058_;
 wire _0059_;
 wire _0060_;
 wire _0061_;
 wire _0062_;
 wire _0063_;
 wire _0064_;
 wire _0065_;
 wire _0066_;
 wire _0067_;
 wire _0068_;
 wire _0069_;
 wire _0070_;
 wire _0071_;
 wire _0072_;
 wire _0073_;
 wire _0074_;
 wire _0075_;
 wire _0076_;
 wire _0077_;
 wire _0078_;
 wire _0079_;
 wire _0080_;
 wire _0081_;
 wire _0082_;
 wire _0083_;
 wire _0084_;
 wire _0085_;
 wire _0086_;
 wire _0087_;
 wire _0088_;
 wire _0089_;
 wire _0090_;
 wire _0091_;
 wire _0092_;
 wire _0093_;
 wire _0094_;
 wire _0095_;
 wire _0096_;
 wire _0097_;
 wire _0098_;
 wire _0099_;
 wire _0100_;
 wire _0101_;
 wire _0102_;
 wire _0103_;
 wire _0104_;
 wire _0105_;
 wire _0106_;
 wire _0107_;
 wire _0108_;
 wire _0109_;
 wire _0110_;
 wire _0111_;
 wire _0112_;
 wire _0113_;
 wire _0114_;
 wire _0115_;
 wire _0116_;
 wire _0117_;
 wire _0118_;
 wire _0119_;
 wire _0120_;
 wire _0121_;
 wire _0122_;
 wire _0123_;
 wire _0124_;
 wire _0125_;
 wire _0126_;
 wire _0127_;
 wire _0128_;
 wire _0129_;
 wire _0130_;
 wire _0131_;
 wire _0132_;
 wire _0133_;
 wire _0134_;
 wire _0135_;
 wire _0136_;
 wire _0137_;
 wire _0138_;
 wire _0139_;
 wire _0140_;
 wire _0141_;
 wire _0142_;
 wire _0143_;
 wire _0144_;
 wire _0145_;
 wire _0146_;
 wire _0147_;
 wire _0148_;
 wire _0149_;
 wire _0150_;
 wire _0151_;
 wire _0152_;
 wire _0153_;
 wire _0154_;
 wire _0155_;
 wire _0156_;
 wire _0157_;
 wire _0158_;
 wire _0159_;
 wire _0160_;
 wire _0161_;
 wire _0162_;
 wire _0163_;
 wire _0164_;
 wire _0165_;
 wire _0166_;
 wire _0167_;
 wire _0168_;
 wire _0169_;
 wire _0170_;
 wire _0171_;
 wire _0172_;
 wire _0173_;
 wire _0174_;
 wire _0175_;
 wire _0176_;
 wire _0177_;
 wire _0178_;
 wire _0179_;
 wire _0180_;
 wire _0181_;
 wire _0182_;
 wire _0183_;
 wire _0184_;
 wire _0185_;
 wire _0186_;
 wire _0187_;
 wire _0188_;
 wire _0189_;
 wire _0190_;
 wire _0191_;
 wire _0192_;
 wire _0193_;
 wire _0194_;
 wire _0195_;
 wire _0196_;
 wire _0197_;
 wire _0198_;
 wire _0199_;
 wire _0200_;
 wire _0201_;
 wire _0202_;
 wire _0203_;
 wire _0204_;
 wire _0205_;
 wire _0206_;
 wire _0207_;
 wire _0208_;
 wire _0209_;
 wire _0210_;
 wire _0211_;
 wire _0212_;
 wire _0213_;
 wire _0214_;
 wire _0215_;
 wire _0216_;
 wire _0217_;
 wire _0218_;
 wire _0219_;
 wire _0220_;
 wire _0221_;
 wire _0222_;
 wire _0223_;
 wire _0224_;
 wire _0225_;
 wire _0226_;
 wire _0227_;
 wire _0228_;
 wire _0229_;
 wire _0230_;
 wire _0231_;
 wire _0232_;
 wire _0233_;
 wire _0234_;
 wire _0235_;
 wire _0236_;
 wire _0237_;
 wire _0238_;
 wire _0239_;
 wire _0240_;
 wire _0241_;
 wire _0242_;
 wire _0243_;
 wire _0244_;
 wire _0245_;
 wire _0246_;
 wire _0247_;
 wire _0248_;
 wire _0249_;
 wire _0250_;
 wire _0251_;
 wire _0252_;
 wire _0253_;
 wire _0254_;
 wire _0255_;
 wire _0256_;
 wire _0257_;
 wire _0258_;
 wire _0259_;
 wire _0260_;
 wire _0261_;
 wire _0262_;
 wire _0263_;
 wire _0264_;
 wire _0265_;
 wire _0266_;
 wire _0267_;
 wire _0268_;
 wire _0269_;
 wire _0270_;
 wire _0271_;
 wire _0272_;
 wire _0273_;
 wire _0274_;
 wire _0275_;
 wire _0276_;
 wire _0277_;
 wire _0278_;
 wire _0279_;
 wire _0280_;
 wire _0281_;
 wire _0282_;
 wire _0283_;
 wire _0284_;
 wire _0285_;
 wire _0286_;
 wire _0287_;
 wire _0288_;
 wire _0289_;
 wire _0290_;
 wire _0291_;
 wire _0292_;
 wire _0293_;
 wire _0294_;
 wire _0295_;
 wire _0296_;
 wire _0297_;
 wire _0298_;
 wire _0299_;
 wire _0300_;
 wire _0301_;
 wire _0302_;
 wire _0303_;
 wire _0304_;
 wire _0305_;
 wire _0306_;
 wire _0307_;
 wire _0308_;
 wire _0309_;
 wire _0310_;
 wire _0311_;
 wire _0312_;
 wire _0313_;
 wire _0314_;
 wire _0315_;
 wire _0316_;
 wire _0317_;
 wire _0318_;
 wire _0319_;
 wire _0320_;
 wire _0321_;
 wire net74;
 wire net75;
 wire net76;
 wire net77;
 wire net78;
 wire net79;
 wire net80;
 wire net81;
 wire net82;
 wire net83;
 wire net84;
 wire net85;
 wire net86;
 wire net87;
 wire net88;
 wire net89;
 wire net90;
 wire net91;
 wire net92;
 wire net93;
 wire net94;
 wire net95;
 wire net96;
 wire net97;
 wire net98;
 wire net99;
 wire net100;
 wire net101;
 wire net102;
 wire net103;
 wire net104;
 wire net105;
 wire net106;
 wire net107;
 wire net108;
 wire net109;
 wire net110;
 wire net111;
 wire net112;
 wire net113;
 wire net114;
 wire net115;
 wire net116;
 wire net117;
 wire net118;
 wire net119;
 wire net120;
 wire net121;
 wire net122;
 wire net123;
 wire net124;
 wire net125;
 wire net126;
 wire net127;
 wire net128;
 wire net129;
 wire net130;
 wire net131;
 wire net132;
 wire net133;
 wire net134;
 wire net135;
 wire net136;
 wire net137;
 wire net138;
 wire net139;
 wire net140;
 wire net141;
 wire net142;
 wire net143;
 wire net144;
 wire net145;
 wire net146;
 wire net147;
 wire net148;
 wire net149;
 wire net150;
 wire net151;
 wire net152;
 wire net153;
 wire net154;
 wire net155;
 wire net156;
 wire net157;
 wire net158;
 wire net159;
 wire net160;
 wire net161;
 wire net162;
 wire net163;
 wire net164;
 wire net165;
 wire net166;
 wire net167;
 wire net168;
 wire net169;
 wire net170;
 wire net171;
 wire net172;
 wire net173;
 wire net174;
 wire net175;
 wire net176;
 wire net177;
 wire net178;
 wire net179;
 wire net180;
 wire net181;
 wire net182;
 wire net183;
 wire net184;
 wire net185;
 wire net186;
 wire net187;
 wire net188;
 wire net189;
 wire net190;
 wire net191;
 wire net192;
 wire net193;
 wire net194;
 wire net195;
 wire net196;
 wire net197;
 wire net198;
 wire net199;
 wire net200;
 wire net201;
 wire net202;
 wire net203;
 wire net204;
 wire net205;
 wire net206;
 wire net207;
 wire net208;
 wire net209;
 wire net210;
 wire net211;
 wire net212;
 wire net213;
 wire net214;
 wire clknet_0_clk_i;
 wire \cnt_idx[0] ;
 wire \cnt_idx[1] ;
 wire \cnt_idx[2] ;
 wire \cnt_idx[3] ;
 wire cnt_rst_en;
 wire \s_device.cio_csb_syned ;
 wire \s_device.cnt_rd_en ;
 wire \s_device.counters_i[0] ;
 wire \s_device.counters_i[10] ;
 wire \s_device.counters_i[11] ;
 wire \s_device.counters_i[12] ;
 wire \s_device.counters_i[13] ;
 wire \s_device.counters_i[14] ;
 wire \s_device.counters_i[15] ;
 wire \s_device.counters_i[16] ;
 wire \s_device.counters_i[17] ;
 wire \s_device.counters_i[18] ;
 wire \s_device.counters_i[19] ;
 wire \s_device.counters_i[1] ;
 wire \s_device.counters_i[20] ;
 wire \s_device.counters_i[21] ;
 wire \s_device.counters_i[22] ;
 wire \s_device.counters_i[23] ;
 wire \s_device.counters_i[24] ;
 wire \s_device.counters_i[25] ;
 wire \s_device.counters_i[26] ;
 wire \s_device.counters_i[27] ;
 wire \s_device.counters_i[28] ;
 wire \s_device.counters_i[29] ;
 wire \s_device.counters_i[2] ;
 wire \s_device.counters_i[30] ;
 wire \s_device.counters_i[31] ;
 wire \s_device.counters_i[3] ;
 wire \s_device.counters_i[4] ;
 wire \s_device.counters_i[5] ;
 wire \s_device.counters_i[6] ;
 wire \s_device.counters_i[7] ;
 wire \s_device.counters_i[8] ;
 wire \s_device.counters_i[9] ;
 wire \s_device.rx_data[0] ;
 wire \s_device.rx_data[1] ;
 wire \s_device.rx_data[2] ;
 wire \s_device.rx_data[3] ;
 wire \s_device.rx_data[7] ;
 wire \s_device.rx_valid ;
 wire \s_device.s_bit_banging.bit_cnt[0] ;
 wire \s_device.s_bit_banging.bit_cnt[1] ;
 wire \s_device.s_bit_banging.bit_cnt[2] ;
 wire \s_device.s_bit_banging.cs_sync[0] ;
 wire \s_device.s_bit_banging.cs_sync[1] ;
 wire \s_device.s_bit_banging.miso_reg ;
 wire \s_device.s_bit_banging.mosi_sync[0] ;
 wire \s_device.s_bit_banging.mosi_sync[1] ;
 wire \s_device.s_bit_banging.mosi_sync[2] ;
 wire \s_device.s_bit_banging.sck_sync[0] ;
 wire \s_device.s_bit_banging.sck_sync[1] ;
 wire \s_device.s_bit_banging.sck_sync[2] ;
 wire \s_device.s_bit_banging.shift_reg_in[0] ;
 wire \s_device.s_bit_banging.shift_reg_in[1] ;
 wire \s_device.s_bit_banging.shift_reg_in[2] ;
 wire \s_device.s_bit_banging.shift_reg_in[3] ;
 wire \s_device.s_bit_banging.shift_reg_in[4] ;
 wire \s_device.s_bit_banging.shift_reg_in[5] ;
 wire \s_device.s_bit_banging.shift_reg_in[6] ;
 wire \s_device.s_bit_banging.shift_reg_out[0] ;
 wire \s_device.s_bit_banging.shift_reg_out[1] ;
 wire \s_device.s_bit_banging.shift_reg_out[2] ;
 wire \s_device.s_bit_banging.shift_reg_out[3] ;
 wire \s_device.s_bit_banging.shift_reg_out[4] ;
 wire \s_device.s_bit_banging.shift_reg_out[5] ;
 wire \s_device.s_bit_banging.shift_reg_out[6] ;
 wire \s_device.s_bit_banging.tx_data[0] ;
 wire \s_device.s_bit_banging.tx_data[1] ;
 wire \s_device.s_bit_banging.tx_data[2] ;
 wire \s_device.s_bit_banging.tx_data[3] ;
 wire \s_device.s_bit_banging.tx_data[4] ;
 wire \s_device.s_bit_banging.tx_data[5] ;
 wire \s_device.s_bit_banging.tx_data[6] ;
 wire \s_device.s_bit_banging.tx_data[7] ;
 wire \s_device.s_core.byte_cnt[0] ;
 wire \s_device.s_core.byte_cnt[1] ;
 wire \s_device.s_core.data_latch[0] ;
 wire \s_device.s_core.data_latch[10] ;
 wire \s_device.s_core.data_latch[11] ;
 wire \s_device.s_core.data_latch[12] ;
 wire \s_device.s_core.data_latch[13] ;
 wire \s_device.s_core.data_latch[14] ;
 wire \s_device.s_core.data_latch[15] ;
 wire \s_device.s_core.data_latch[16] ;
 wire \s_device.s_core.data_latch[17] ;
 wire \s_device.s_core.data_latch[18] ;
 wire \s_device.s_core.data_latch[19] ;
 wire \s_device.s_core.data_latch[1] ;
 wire \s_device.s_core.data_latch[20] ;
 wire \s_device.s_core.data_latch[21] ;
 wire \s_device.s_core.data_latch[22] ;
 wire \s_device.s_core.data_latch[23] ;
 wire \s_device.s_core.data_latch[2] ;
 wire \s_device.s_core.data_latch[3] ;
 wire \s_device.s_core.data_latch[4] ;
 wire \s_device.s_core.data_latch[5] ;
 wire \s_device.s_core.data_latch[6] ;
 wire \s_device.s_core.data_latch[7] ;
 wire \s_device.s_core.data_latch[8] ;
 wire \s_device.s_core.data_latch[9] ;
 wire \s_device.s_core.state[0] ;
 wire \s_device.s_core.state[1] ;
 wire \s_device.s_core.state[2] ;
 wire \u_timer0.captured_high[0] ;
 wire \u_timer0.captured_high[10] ;
 wire \u_timer0.captured_high[11] ;
 wire \u_timer0.captured_high[12] ;
 wire \u_timer0.captured_high[13] ;
 wire \u_timer0.captured_high[14] ;
 wire \u_timer0.captured_high[15] ;
 wire \u_timer0.captured_high[16] ;
 wire \u_timer0.captured_high[17] ;
 wire \u_timer0.captured_high[18] ;
 wire \u_timer0.captured_high[19] ;
 wire \u_timer0.captured_high[1] ;
 wire \u_timer0.captured_high[20] ;
 wire \u_timer0.captured_high[21] ;
 wire \u_timer0.captured_high[22] ;
 wire \u_timer0.captured_high[23] ;
 wire \u_timer0.captured_high[24] ;
 wire \u_timer0.captured_high[25] ;
 wire \u_timer0.captured_high[26] ;
 wire \u_timer0.captured_high[27] ;
 wire \u_timer0.captured_high[2] ;
 wire \u_timer0.captured_high[3] ;
 wire \u_timer0.captured_high[4] ;
 wire \u_timer0.captured_high[5] ;
 wire \u_timer0.captured_high[6] ;
 wire \u_timer0.captured_high[7] ;
 wire \u_timer0.captured_high[8] ;
 wire \u_timer0.captured_high[9] ;
 wire \u_timer0.captured_low[0] ;
 wire \u_timer0.captured_low[1] ;
 wire \u_timer0.captured_low[2] ;
 wire \u_timer0.captured_low[3] ;
 wire \u_timer0.dut.inv[0].in ;
 wire \u_timer0.highcount[0] ;
 wire \u_timer0.highcount[10] ;
 wire \u_timer0.highcount[11] ;
 wire \u_timer0.highcount[12] ;
 wire \u_timer0.highcount[13] ;
 wire \u_timer0.highcount[14] ;
 wire \u_timer0.highcount[15] ;
 wire \u_timer0.highcount[16] ;
 wire \u_timer0.highcount[17] ;
 wire \u_timer0.highcount[18] ;
 wire \u_timer0.highcount[19] ;
 wire \u_timer0.highcount[1] ;
 wire \u_timer0.highcount[20] ;
 wire \u_timer0.highcount[21] ;
 wire \u_timer0.highcount[22] ;
 wire \u_timer0.highcount[23] ;
 wire \u_timer0.highcount[24] ;
 wire \u_timer0.highcount[25] ;
 wire \u_timer0.highcount[26] ;
 wire \u_timer0.highcount[27] ;
 wire \u_timer0.highcount[2] ;
 wire \u_timer0.highcount[3] ;
 wire \u_timer0.highcount[4] ;
 wire \u_timer0.highcount[5] ;
 wire \u_timer0.highcount[6] ;
 wire \u_timer0.highcount[7] ;
 wire \u_timer0.highcount[8] ;
 wire \u_timer0.highcount[9] ;
 wire \u_timer0.lowcount[0] ;
 wire \u_timer0.lowcount[1] ;
 wire \u_timer0.lowcount[2] ;
 wire \u_timer0.lowcount[3] ;
 wire \u_timer0.measuring ;
 wire \u_timer0.stop_prev ;
 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire net10;
 wire net11;
 wire net12;
 wire net13;
 wire net14;
 wire net15;
 wire net16;
 wire net17;
 wire net18;
 wire net19;
 wire net20;
 wire net21;
 wire net22;
 wire net23;
 wire net24;
 wire net25;
 wire net26;
 wire net27;
 wire net28;
 wire net29;
 wire net30;
 wire net31;
 wire net32;
 wire net33;
 wire net34;
 wire net35;
 wire net36;
 wire net37;
 wire net38;
 wire net39;
 wire net40;
 wire net41;
 wire net42;
 wire net43;
 wire net44;
 wire net45;
 wire net46;
 wire net47;
 wire net48;
 wire net49;
 wire net50;
 wire net51;
 wire net52;
 wire net53;
 wire net54;
 wire net55;
 wire net56;
 wire net57;
 wire net58;
 wire net59;
 wire net60;
 wire net61;
 wire net62;
 wire net63;
 wire net64;
 wire net65;
 wire net66;
 wire net67;
 wire net68;
 wire net69;
 wire net70;
 wire net71;
 wire net72;
 wire net73;
 wire net;
 wire clknet_4_0_0_clk_i;
 wire clknet_4_1_0_clk_i;
 wire clknet_4_2_0_clk_i;
 wire clknet_4_3_0_clk_i;
 wire clknet_4_4_0_clk_i;
 wire clknet_4_5_0_clk_i;
 wire clknet_4_6_0_clk_i;
 wire clknet_4_7_0_clk_i;
 wire clknet_4_8_0_clk_i;
 wire clknet_4_9_0_clk_i;
 wire clknet_4_10_0_clk_i;
 wire clknet_4_11_0_clk_i;
 wire clknet_4_12_0_clk_i;
 wire clknet_4_13_0_clk_i;
 wire clknet_4_14_0_clk_i;
 wire clknet_4_15_0_clk_i;

 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_0_131 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_0_138 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_0_172 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_4 FILLER_0_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_0_210 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_0_240 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_0_43 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_0_6 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_0_70 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_0_72 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_10_100 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_10_144 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_10_158 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_10_160 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_10_172 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_10_174 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_10_177 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_10_179 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_4 FILLER_10_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_10_253 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_10_50 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_11_153 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_11_197 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_11_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_11_209 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_11_212 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_11_263 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_11_277 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_11_279 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_11_282 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_11_290 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_11_30 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_11_32 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_11_91 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_12_160 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_12_162 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_12_183 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_12_185 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_12_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_12_290 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_16 FILLER_12_37 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_12_53 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_4 FILLER_12_58 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_12_62 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_13_137 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_13_139 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_13_172 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_13_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_13_218 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_13_220 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_13_289 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_13_291 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_13_69 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_14_107 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_14_109 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_14_172 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_14_174 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_14_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_14_230 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_14_232 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_14_253 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_15_164 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_15_176 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_15_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_15_259 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_15_261 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_15_289 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_15_291 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_15_31 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_8 FILLER_15_72 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_4 FILLER_15_80 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_15_84 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_16_183 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_16_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_16_221 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_16_247 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_16_33 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_8 FILLER_16_43 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_16_51 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_17_139 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_17_153 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_17_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_17_212 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_17_27 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_17_289 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_17_291 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_4 FILLER_17_65 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_17_69 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_17_72 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_18_102 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_18_104 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_18_151 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_18_183 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_18_185 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_18_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_18_223 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_18_243 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_18_290 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_19_146 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_19_202 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_19_212 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_19_279 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_19_289 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_19_291 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_19_68 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_4 FILLER_19_72 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_19_76 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_1_142 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_8 FILLER_1_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_1_205 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_1_212 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_1_289 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_1_291 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_1_31 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_20_107 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_20_157 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_20_170 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_20_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_20_218 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_20_254 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_20_32 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_20_34 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_8 FILLER_20_37 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_20_4 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_20_45 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_20_47 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_4 FILLER_20_56 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_20_60 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_20_98 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_21_142 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_21_191 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_21_193 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_21_260 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_21_289 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_21_291 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_21_35 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_8 FILLER_21_48 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_4 FILLER_21_56 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_21_60 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_21_62 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_21_67 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_21_69 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_21_72 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_21_79 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_22_177 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_22_179 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_22_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_4 FILLER_22_23 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_22_242 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_22_244 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_22_254 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_22_27 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_22_4 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_22_44 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_23_127 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_23_129 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_23_142 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_23_144 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_4 FILLER_23_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_23_208 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_23_212 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_23_31 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_24_144 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_4 FILLER_24_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_24_221 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_24_223 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_24_254 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_4 FILLER_24_37 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_24_41 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_24_55 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_24_6 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_25_138 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_25_142 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_25_18 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_25_197 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_25_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_4 FILLER_25_57 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_25_61 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_25_83 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_26_291 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_26_44 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_4 FILLER_26_87 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_26_91 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_27_113 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_27_172 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_4 FILLER_27_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_27_31 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_27_6 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_28_107 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_28_109 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_28_173 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_28_177 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_28_179 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_28_221 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_28_254 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_4 FILLER_28_37 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_29_142 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_4 FILLER_29_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_29_208 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_29_241 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_29_83 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_2_107 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_2_173 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_2_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_2_254 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_30_173 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_30_177 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_30_291 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_30_63 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_31_135 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_31_189 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_31_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_31_208 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_31_278 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_31_28 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_32_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_32_218 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_32_254 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_32_44 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_32_46 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_32_84 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_32_86 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_33_142 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_33_144 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_4 FILLER_33_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_33_207 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_33_209 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_33_260 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_33_289 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_33_291 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_33_72 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_34_165 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_34_254 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_34_27 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_34_37 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_34_51 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_34_56 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_35_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_35_207 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_35_209 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_35_235 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_35_282 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_35_291 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_36_119 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_36_121 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_36_159 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_36_166 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_36_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_36_291 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_36_34 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_36_37 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_36_39 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_37_152 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_37_158 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_37_160 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_37_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_37_289 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_37_291 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_37_32 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_37_4 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_38_117 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_38_119 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_4 FILLER_38_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_38_218 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_38_220 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_38_291 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_38_6 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_39_142 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_39_147 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_39_149 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_39_187 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_4 FILLER_39_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_39_208 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_39_249 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_4 FILLER_39_27 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_39_278 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_39_289 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_39_291 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_39_31 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_4 FILLER_3_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_3_6 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_3_72 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_40_101 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_40_135 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_40_154 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_40_156 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_40_165 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_40_176 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_40_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_40_210 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_40_244 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_40_246 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_40_267 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_40_274 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_40_290 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_40_32 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_40_36 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_40_60 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_40_70 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_40_72 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_40_87 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_4_161 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_4_226 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_4_228 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_4_254 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_4_29 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_4_44 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_4_46 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_5_113 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_5_137 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_5_139 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_5_142 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_5_168 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_5_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_5_207 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_5_209 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_5_212 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_5_289 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_5_291 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_5_4 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_5_83 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_6_119 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_6_244 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_6_247 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_6_44 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_6_46 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_7_138 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_7_146 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_7_184 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_7_186 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_4 FILLER_7_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_7_289 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_7_291 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_7_72 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_8_232 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_8_291 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_8_30 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_8_49 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_8_99 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_9_138 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_9_166 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fillcap_4 FILLER_9_2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_9_209 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_9_212 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_1 FILLER_9_214 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__fill_2 FILLER_9_83 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_0_Left_41 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_0_Right_0 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_10_Left_51 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_10_Right_10 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_11_Left_52 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_11_Right_11 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_12_Left_53 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_12_Right_12 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_13_Left_54 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_13_Right_13 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_14_Left_55 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_14_Right_14 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_15_Left_56 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_15_Right_15 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_16_Left_57 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_16_Right_16 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_17_Left_58 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_17_Right_17 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_18_Left_59 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_18_Right_18 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_19_Left_60 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_19_Right_19 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_1_Left_42 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_1_Right_1 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_20_Left_61 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_20_Right_20 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_21_Left_62 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_21_Right_21 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_22_Left_63 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_22_Right_22 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_23_Left_64 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_23_Right_23 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_24_Left_65 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_24_Right_24 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_25_Left_66 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_25_Right_25 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_26_Left_67 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_26_Right_26 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_27_Left_68 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_27_Right_27 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_28_Left_69 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_28_Right_28 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_29_Left_70 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_29_Right_29 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_2_Left_43 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_2_Right_2 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_30_Left_71 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_30_Right_30 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_31_Left_72 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_31_Right_31 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_32_Left_73 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_32_Right_32 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_33_Left_74 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_33_Right_33 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_34_Left_75 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_34_Right_34 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_35_Left_76 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_35_Right_35 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_36_Left_77 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_36_Right_36 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_37_Left_78 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_37_Right_37 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_38_Left_79 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_38_Right_38 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_39_Left_80 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_39_Right_39 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_3_Left_44 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_3_Right_3 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_40_Left_81 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_40_Right_40 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_4_Left_45 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_4_Right_4 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_5_Left_46 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_5_Right_5 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_6_Left_47 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_6_Right_6 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_7_Left_48 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_7_Right_7 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_8_Left_49 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_8_Right_8 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_9_Left_50 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 PHY_EDGE_ROW_9_Right_9 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_0_82 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_0_83 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_0_84 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_0_85 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_0_86 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_0_87 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_0_88 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_0_89 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_10_126 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_10_127 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_10_128 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_10_129 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_11_130 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_11_131 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_11_132 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_11_133 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_12_134 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_12_135 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_12_136 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_12_137 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_13_138 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_13_139 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_13_140 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_13_141 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_14_142 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_14_143 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_14_144 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_14_145 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_15_146 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_15_147 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_15_148 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_15_149 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_16_150 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_16_151 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_16_152 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_16_153 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_17_154 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_17_155 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_17_156 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_17_157 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_18_158 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_18_159 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_18_160 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_18_161 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_19_162 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_19_163 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_19_164 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_19_165 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_1_90 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_1_91 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_1_92 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_1_93 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_20_166 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_20_167 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_20_168 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_20_169 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_21_170 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_21_171 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_21_172 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_21_173 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_22_174 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_22_175 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_22_176 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_22_177 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_23_178 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_23_179 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_23_180 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_23_181 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_24_182 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_24_183 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_24_184 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_24_185 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_25_186 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_25_187 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_25_188 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_25_189 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_26_190 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_26_191 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_26_192 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_26_193 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_27_194 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_27_195 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_27_196 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_27_197 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_28_198 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_28_199 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_28_200 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_28_201 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_29_202 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_29_203 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_29_204 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_29_205 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_2_94 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_2_95 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_2_96 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_2_97 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_30_206 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_30_207 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_30_208 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_30_209 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_31_210 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_31_211 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_31_212 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_31_213 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_32_214 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_32_215 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_32_216 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_32_217 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_33_218 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_33_219 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_33_220 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_33_221 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_34_222 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_34_223 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_34_224 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_34_225 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_35_226 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_35_227 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_35_228 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_35_229 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_36_230 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_36_231 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_36_232 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_36_233 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_37_234 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_37_235 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_37_236 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_37_237 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_38_238 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_38_239 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_38_240 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_38_241 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_39_242 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_39_243 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_39_244 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_39_245 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_3_100 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_3_101 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_3_98 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_3_99 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_40_246 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_40_247 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_40_248 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_40_249 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_40_250 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_40_251 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_40_252 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_40_253 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_4_102 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_4_103 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_4_104 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_4_105 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_5_106 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_5_107 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_5_108 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_5_109 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_6_110 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_6_111 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_6_112 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_6_113 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_7_114 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_7_115 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_7_116 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_7_117 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_8_118 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_8_119 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_8_120 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_8_121 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_9_122 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_9_123 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_9_124 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__tap_2 TAP_TAPCELL_ROW_9_125 (.VDD(VDD),
    .VSS(VSS));
 gf180mcu_as_sc_mcu7t3v3__inv_2 _0464_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0163_),
    .A(\u_timer0.lowcount[3] ));
 gf180mcu_as_sc_mcu7t3v3__inv_2 _0465_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0164_),
    .A(\u_timer0.highcount[22] ));
 gf180mcu_as_sc_mcu7t3v3__inv_2 _0466_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0165_),
    .A(\u_timer0.highcount[21] ));
 gf180mcu_as_sc_mcu7t3v3__inv_2 _0467_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0166_),
    .A(\u_timer0.highcount[16] ));
 gf180mcu_as_sc_mcu7t3v3__inv_2 _0468_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0167_),
    .A(\u_timer0.highcount[13] ));
 gf180mcu_as_sc_mcu7t3v3__inv_2 _0469_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0168_),
    .A(\u_timer0.highcount[12] ));
 gf180mcu_as_sc_mcu7t3v3__inv_2 _0470_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0169_),
    .A(\u_timer0.highcount[7] ));
 gf180mcu_as_sc_mcu7t3v3__inv_2 _0471_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0170_),
    .A(\u_timer0.highcount[6] ));
 gf180mcu_as_sc_mcu7t3v3__inv_2 _0472_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0171_),
    .A(\s_device.rx_valid ));
 gf180mcu_as_sc_mcu7t3v3__inv_2 _0473_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0172_),
    .A(\s_device.s_bit_banging.sck_sync[1] ));
 gf180mcu_as_sc_mcu7t3v3__inv_2 _0474_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0173_),
    .A(\s_device.s_bit_banging.bit_cnt[2] ));
 gf180mcu_as_sc_mcu7t3v3__inv_2 _0475_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0174_),
    .A(\s_device.s_core.state[0] ));
 gf180mcu_as_sc_mcu7t3v3__inv_2 _0476_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0175_),
    .A(\s_device.cnt_rd_en ));
 gf180mcu_as_sc_mcu7t3v3__nand2_2 _0477_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0176_),
    .B(\s_device.s_core.state[2] ),
    .A(\s_device.rx_valid ));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0478_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0177_),
    .B(_0176_),
    .A(net25));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0479_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0177_),
    .A(\s_device.rx_data[7] ),
    .Y(_0004_));
 gf180mcu_as_sc_mcu7t3v3__nor2b_2 _0480_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0178_),
    .B(net25),
    .A(\s_device.s_core.state[1] ));
 gf180mcu_as_sc_mcu7t3v3__nand3_2 _0481_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.rx_valid ),
    .B(\s_device.s_core.byte_cnt[1] ),
    .C(\s_device.s_core.byte_cnt[0] ),
    .Y(_0179_));
 gf180mcu_as_sc_mcu7t3v3__ao21_2 _0482_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0000_),
    .A(_0178_),
    .B(_0179_),
    .C(_0004_));
 gf180mcu_as_sc_mcu7t3v3__nand2_2 _0483_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0180_),
    .B(\s_device.s_core.state[2] ),
    .A(_0171_));
 gf180mcu_as_sc_mcu7t3v3__aoi21_2 _0484_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0001_),
    .C(net25),
    .B(_0180_),
    .A(_0174_));
 gf180mcu_as_sc_mcu7t3v3__nand2_2 _0485_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(\u_timer0.dut.inv[0].in ),
    .B(net28),
    .A(rosc_enable_i));
 gf180mcu_as_sc_mcu7t3v3__nor2b_2 _0486_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(cio_sd_o),
    .B(net25),
    .A(\s_device.s_bit_banging.miso_reg ));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0487_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(\s_device.s_bit_banging.bit_cnt[1] ),
    .A(\s_device.s_bit_banging.bit_cnt[0] ),
    .Y(_0181_));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0488_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0181_),
    .A(\s_device.s_bit_banging.bit_cnt[2] ),
    .Y(_0182_));
 gf180mcu_as_sc_mcu7t3v3__nor3_2 _0489_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net25),
    .B(_0172_),
    .C(\s_device.s_bit_banging.sck_sync[2] ),
    .Y(_0183_));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0490_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0183_),
    .A(_0182_),
    .Y(_0002_));
 gf180mcu_as_sc_mcu7t3v3__nor2b_2 _0491_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0003_),
    .B(\s_device.rx_data[7] ),
    .A(_0177_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0492_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0184_),
    .B(\cnt_idx[0] ),
    .A(\cnt_idx[1] ));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0493_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0185_),
    .B(\cnt_idx[2] ),
    .A(\cnt_idx[3] ));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0494_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0185_),
    .A(cnt_rst_en),
    .Y(_0186_));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0495_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0186_),
    .A(_0184_),
    .Y(_0187_));
 gf180mcu_as_sc_mcu7t3v3__nand2_2 _0496_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0188_),
    .B(_0186_),
    .A(_0184_));
 gf180mcu_as_sc_mcu7t3v3__nand2_2 _0497_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0189_),
    .B(stop_i),
    .A(\u_timer0.measuring ));
 gf180mcu_as_sc_mcu7t3v3__or2_2 _0498_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0189_),
    .A(\u_timer0.stop_prev ),
    .Y(_0190_));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0499_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0190_),
    .A(_0188_),
    .Y(_0191_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0500_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0192_),
    .B(_0190_),
    .A(_0187_));
 gf180mcu_as_sc_mcu7t3v3__or2_2 _0501_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0190_),
    .A(_0187_),
    .Y(_0193_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0502_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[30] ),
    .B(net18),
    .C(net12),
    .D(\u_timer0.captured_high[26] ),
    .Y(_0005_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0503_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[31] ),
    .B(net18),
    .C(net12),
    .D(\u_timer0.captured_high[27] ),
    .Y(_0006_));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0504_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(\u_timer0.lowcount[0] ),
    .A(\u_timer0.measuring ),
    .Y(_0194_));
 gf180mcu_as_sc_mcu7t3v3__nand4_2 _0505_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\u_timer0.measuring ),
    .B(\u_timer0.lowcount[2] ),
    .C(\u_timer0.lowcount[1] ),
    .D(\u_timer0.lowcount[0] ),
    .Y(_0195_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0506_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0196_),
    .B(_0195_),
    .A(_0163_));
 gf180mcu_as_sc_mcu7t3v3__nand2_2 _0507_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0197_),
    .B(_0188_),
    .A(net69));
 gf180mcu_as_sc_mcu7t3v3__xnor2_2 _0508_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0196_),
    .A(\u_timer0.highcount[0] ),
    .Y(_0198_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0509_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0007_),
    .B(_0198_),
    .A(net4));
 gf180mcu_as_sc_mcu7t3v3__aoi21_2 _0510_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0199_),
    .C(\u_timer0.highcount[1] ),
    .B(_0196_),
    .A(\u_timer0.highcount[0] ));
 gf180mcu_as_sc_mcu7t3v3__nand2_2 _0511_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0200_),
    .B(\u_timer0.highcount[0] ),
    .A(\u_timer0.highcount[1] ));
 gf180mcu_as_sc_mcu7t3v3__nor3_2 _0512_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(_0163_),
    .B(_0195_),
    .C(_0200_),
    .Y(_0201_));
 gf180mcu_as_sc_mcu7t3v3__nor3_2 _0513_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net4),
    .B(_0199_),
    .C(_0201_),
    .Y(_0008_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0514_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0202_),
    .B(_0201_),
    .A(\u_timer0.highcount[2] ));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0515_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0201_),
    .A(\u_timer0.highcount[2] ),
    .Y(_0203_));
 gf180mcu_as_sc_mcu7t3v3__nor3_2 _0516_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net1),
    .B(_0202_),
    .C(_0203_),
    .Y(_0009_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0517_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0204_),
    .B(_0203_),
    .A(\u_timer0.highcount[3] ));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0518_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0203_),
    .A(\u_timer0.highcount[3] ),
    .Y(_0205_));
 gf180mcu_as_sc_mcu7t3v3__nor3_2 _0519_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net4),
    .B(_0204_),
    .C(_0205_),
    .Y(_0010_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0520_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0206_),
    .B(_0205_),
    .A(\u_timer0.highcount[4] ));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0521_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0205_),
    .A(\u_timer0.highcount[4] ),
    .Y(_0207_));
 gf180mcu_as_sc_mcu7t3v3__nor3_2 _0522_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net4),
    .B(_0206_),
    .C(_0207_),
    .Y(_0011_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0523_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0208_),
    .B(_0207_),
    .A(\u_timer0.highcount[5] ));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0524_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(\u_timer0.highcount[4] ),
    .A(\u_timer0.highcount[5] ),
    .Y(_0209_));
 gf180mcu_as_sc_mcu7t3v3__nand4_2 _0525_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\u_timer0.highcount[3] ),
    .B(\u_timer0.highcount[2] ),
    .C(_0201_),
    .D(_0209_),
    .Y(_0210_));
 gf180mcu_as_sc_mcu7t3v3__aoi211_2 _0526_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(_0205_),
    .B(_0209_),
    .C(_0208_),
    .Y(_0012_),
    .D(net4));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0527_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0211_),
    .B(_0210_),
    .A(_0170_));
 gf180mcu_as_sc_mcu7t3v3__or2_2 _0528_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0211_),
    .A(net1),
    .Y(_0212_));
 gf180mcu_as_sc_mcu7t3v3__aoi21_2 _0529_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0013_),
    .C(_0212_),
    .B(_0210_),
    .A(_0170_));
 gf180mcu_as_sc_mcu7t3v3__nor3_2 _0530_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(_0169_),
    .B(_0170_),
    .C(_0210_),
    .Y(_0213_));
 gf180mcu_as_sc_mcu7t3v3__xnor2_2 _0531_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0211_),
    .A(\u_timer0.highcount[7] ),
    .Y(_0214_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0532_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0014_),
    .B(_0214_),
    .A(net1));
 gf180mcu_as_sc_mcu7t3v3__xnor2_2 _0533_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0213_),
    .A(\u_timer0.highcount[8] ),
    .Y(_0215_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0534_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0015_),
    .B(_0215_),
    .A(net1));
 gf180mcu_as_sc_mcu7t3v3__aoi21_2 _0535_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0216_),
    .C(\u_timer0.highcount[9] ),
    .B(_0213_),
    .A(\u_timer0.highcount[8] ));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0536_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(\u_timer0.highcount[8] ),
    .A(\u_timer0.highcount[9] ),
    .Y(_0217_));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0537_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0217_),
    .A(_0213_),
    .Y(_0218_));
 gf180mcu_as_sc_mcu7t3v3__nor3_2 _0538_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net1),
    .B(_0216_),
    .C(_0218_),
    .Y(_0016_));
 gf180mcu_as_sc_mcu7t3v3__xnor2_2 _0539_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0218_),
    .A(\u_timer0.highcount[10] ),
    .Y(_0219_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0540_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0017_),
    .B(_0219_),
    .A(net1));
 gf180mcu_as_sc_mcu7t3v3__ao31_2 _0541_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .D(\u_timer0.highcount[11] ),
    .A(\u_timer0.highcount[10] ),
    .B(_0213_),
    .C(_0217_),
    .Y(_0220_));
 gf180mcu_as_sc_mcu7t3v3__nand4_2 _0542_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\u_timer0.highcount[11] ),
    .B(\u_timer0.highcount[10] ),
    .C(_0213_),
    .D(_0217_),
    .Y(_0221_));
 gf180mcu_as_sc_mcu7t3v3__nand2_2 _0543_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0222_),
    .B(_0221_),
    .A(_0220_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0544_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0018_),
    .B(_0222_),
    .A(net1));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0545_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0223_),
    .B(_0221_),
    .A(_0168_));
 gf180mcu_as_sc_mcu7t3v3__or2_2 _0546_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0223_),
    .A(net1),
    .Y(_0224_));
 gf180mcu_as_sc_mcu7t3v3__aoi21_2 _0547_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0019_),
    .C(_0224_),
    .B(_0221_),
    .A(_0168_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0548_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0225_),
    .B(_0223_),
    .A(\u_timer0.highcount[13] ));
 gf180mcu_as_sc_mcu7t3v3__nor3_2 _0549_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(_0167_),
    .B(_0168_),
    .C(_0221_),
    .Y(_0226_));
 gf180mcu_as_sc_mcu7t3v3__nor3_2 _0550_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net1),
    .B(_0225_),
    .C(_0226_),
    .Y(_0020_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0551_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0227_),
    .B(_0226_),
    .A(\u_timer0.highcount[14] ));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0552_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0226_),
    .A(\u_timer0.highcount[14] ),
    .Y(_0228_));
 gf180mcu_as_sc_mcu7t3v3__nor3_2 _0553_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net2),
    .B(_0227_),
    .C(_0228_),
    .Y(_0021_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0554_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0229_),
    .B(_0228_),
    .A(\u_timer0.highcount[15] ));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0555_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0228_),
    .A(\u_timer0.highcount[15] ),
    .Y(_0230_));
 gf180mcu_as_sc_mcu7t3v3__nand3_2 _0556_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\u_timer0.highcount[15] ),
    .B(\u_timer0.highcount[14] ),
    .C(_0226_),
    .Y(_0231_));
 gf180mcu_as_sc_mcu7t3v3__nor3_2 _0557_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net2),
    .B(_0229_),
    .C(_0230_),
    .Y(_0022_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0558_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0232_),
    .B(_0231_),
    .A(_0166_));
 gf180mcu_as_sc_mcu7t3v3__or2_2 _0559_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0232_),
    .A(net2),
    .Y(_0233_));
 gf180mcu_as_sc_mcu7t3v3__aoi21_2 _0560_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0023_),
    .C(_0233_),
    .B(_0231_),
    .A(_0166_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0561_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0234_),
    .B(_0232_),
    .A(\u_timer0.highcount[17] ));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0562_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0232_),
    .A(\u_timer0.highcount[17] ),
    .Y(_0235_));
 gf180mcu_as_sc_mcu7t3v3__nor3_2 _0563_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net2),
    .B(_0234_),
    .C(_0235_),
    .Y(_0024_));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0564_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(\u_timer0.highcount[17] ),
    .A(\u_timer0.highcount[18] ),
    .Y(_0236_));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0565_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0236_),
    .A(\u_timer0.highcount[16] ),
    .Y(_0237_));
 gf180mcu_as_sc_mcu7t3v3__xnor2_2 _0566_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0235_),
    .A(\u_timer0.highcount[18] ),
    .Y(_0238_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0567_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0025_),
    .B(_0238_),
    .A(net2));
 gf180mcu_as_sc_mcu7t3v3__aoi21_2 _0568_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0239_),
    .C(\u_timer0.highcount[19] ),
    .B(_0237_),
    .A(_0230_));
 gf180mcu_as_sc_mcu7t3v3__ao31_2 _0569_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .D(net2),
    .A(\u_timer0.highcount[19] ),
    .B(\u_timer0.highcount[18] ),
    .C(_0235_),
    .Y(_0240_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0570_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0026_),
    .B(_0240_),
    .A(_0239_));
 gf180mcu_as_sc_mcu7t3v3__ao31_2 _0571_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .D(\u_timer0.highcount[20] ),
    .A(\u_timer0.highcount[19] ),
    .B(_0230_),
    .C(_0237_),
    .Y(_0241_));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0572_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(\u_timer0.highcount[19] ),
    .A(\u_timer0.highcount[20] ),
    .Y(_0242_));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0573_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0242_),
    .A(_0237_),
    .Y(_0243_));
 gf180mcu_as_sc_mcu7t3v3__nand4_2 _0574_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\u_timer0.highcount[15] ),
    .B(\u_timer0.highcount[14] ),
    .C(_0226_),
    .D(_0243_),
    .Y(_0244_));
 gf180mcu_as_sc_mcu7t3v3__nor2b_2 _0575_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0245_),
    .B(net2),
    .A(_0241_));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0576_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0245_),
    .A(_0244_),
    .Y(_0027_));
 gf180mcu_as_sc_mcu7t3v3__or2_2 _0577_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0244_),
    .A(_0165_),
    .Y(_0246_));
 gf180mcu_as_sc_mcu7t3v3__xnor2_2 _0578_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0244_),
    .A(_0165_),
    .Y(_0247_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0579_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0028_),
    .B(_0247_),
    .A(net2));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0580_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0246_),
    .A(_0164_),
    .Y(_0248_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0581_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0249_),
    .B(_0246_),
    .A(_0164_));
 gf180mcu_as_sc_mcu7t3v3__nor3_2 _0582_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net2),
    .B(_0248_),
    .C(_0249_),
    .Y(_0029_));
 gf180mcu_as_sc_mcu7t3v3__xnor2_2 _0583_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0249_),
    .A(\u_timer0.highcount[23] ),
    .Y(_0250_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0584_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0030_),
    .B(_0250_),
    .A(net3));
 gf180mcu_as_sc_mcu7t3v3__ao21_2 _0585_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0251_),
    .A(\u_timer0.highcount[23] ),
    .B(_0249_),
    .C(\u_timer0.highcount[24] ));
 gf180mcu_as_sc_mcu7t3v3__nand3_2 _0586_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\u_timer0.highcount[24] ),
    .B(\u_timer0.highcount[23] ),
    .C(\u_timer0.highcount[22] ),
    .Y(_0252_));
 gf180mcu_as_sc_mcu7t3v3__nor3_2 _0587_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(_0165_),
    .B(_0244_),
    .C(_0252_),
    .Y(_0253_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0588_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0254_),
    .B(_0253_),
    .A(net3));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0589_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0254_),
    .A(_0251_),
    .Y(_0031_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0590_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0255_),
    .B(_0253_),
    .A(\u_timer0.highcount[25] ));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0591_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0253_),
    .A(\u_timer0.highcount[25] ),
    .Y(_0256_));
 gf180mcu_as_sc_mcu7t3v3__nor3_2 _0592_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net3),
    .B(_0255_),
    .C(_0256_),
    .Y(_0032_));
 gf180mcu_as_sc_mcu7t3v3__xnor2_2 _0593_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0256_),
    .A(\u_timer0.highcount[26] ),
    .Y(_0257_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0594_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0033_),
    .B(_0257_),
    .A(net3));
 gf180mcu_as_sc_mcu7t3v3__aoi21_2 _0595_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0258_),
    .C(\u_timer0.highcount[27] ),
    .B(_0256_),
    .A(\u_timer0.highcount[26] ));
 gf180mcu_as_sc_mcu7t3v3__ao31_2 _0596_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .D(net3),
    .A(\u_timer0.highcount[27] ),
    .B(\u_timer0.highcount[26] ),
    .C(_0256_),
    .Y(_0259_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0597_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0034_),
    .B(_0259_),
    .A(_0258_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0598_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0260_),
    .B(\u_timer0.lowcount[0] ),
    .A(\u_timer0.measuring ));
 gf180mcu_as_sc_mcu7t3v3__nor3_2 _0599_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(_0194_),
    .B(net4),
    .C(_0260_),
    .Y(_0035_));
 gf180mcu_as_sc_mcu7t3v3__xnor2_2 _0600_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0194_),
    .A(\u_timer0.lowcount[1] ),
    .Y(_0261_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0601_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0036_),
    .B(_0261_),
    .A(net4));
 gf180mcu_as_sc_mcu7t3v3__ao31_2 _0602_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .D(\u_timer0.lowcount[2] ),
    .A(\u_timer0.measuring ),
    .B(\u_timer0.lowcount[1] ),
    .C(\u_timer0.lowcount[0] ),
    .Y(_0262_));
 gf180mcu_as_sc_mcu7t3v3__nand2_2 _0603_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0263_),
    .B(_0262_),
    .A(_0195_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0604_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0037_),
    .B(_0263_),
    .A(_0197_));
 gf180mcu_as_sc_mcu7t3v3__or2_2 _0605_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0197_),
    .A(_0196_),
    .Y(_0264_));
 gf180mcu_as_sc_mcu7t3v3__aoi21_2 _0606_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0038_),
    .C(_0264_),
    .B(_0195_),
    .A(_0163_));
 gf180mcu_as_sc_mcu7t3v3__or2_2 _0607_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(start_i),
    .A(\u_timer0.measuring ),
    .Y(_0265_));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0608_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0265_),
    .A(net16),
    .Y(_0039_));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0609_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(\s_device.s_bit_banging.sck_sync[2] ),
    .A(_0172_),
    .Y(_0266_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0610_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0267_),
    .B(_0266_),
    .A(net25));
 gf180mcu_as_sc_mcu7t3v3__nor2b_2 _0611_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0268_),
    .B(net25),
    .A(_0266_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0612_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(\s_device.s_bit_banging.bit_cnt[0] ),
    .B(_0267_),
    .A(_0268_),
    .Y(_0040_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0613_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0269_),
    .B(\s_device.s_bit_banging.bit_cnt[1] ),
    .A(\s_device.s_bit_banging.bit_cnt[0] ));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0614_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0270_),
    .B(_0269_),
    .A(_0181_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0615_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.s_bit_banging.bit_cnt[1] ),
    .B(_0267_),
    .C(_0268_),
    .D(_0270_),
    .Y(_0041_));
 gf180mcu_as_sc_mcu7t3v3__aoi21_2 _0616_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0271_),
    .C(\s_device.cio_csb_syned ),
    .B(_0266_),
    .A(_0182_));
 gf180mcu_as_sc_mcu7t3v3__inv_2 _0617_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0272_),
    .A(_0271_));
 gf180mcu_as_sc_mcu7t3v3__ao31_2 _0618_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .D(\s_device.s_bit_banging.bit_cnt[2] ),
    .A(_0172_),
    .B(\s_device.s_bit_banging.sck_sync[2] ),
    .C(_0181_),
    .Y(_0273_));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0619_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0273_),
    .A(_0271_),
    .Y(_0042_));
 gf180mcu_as_sc_mcu7t3v3__nand2b_2 _0620_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0274_),
    .B(_0181_),
    .A(\s_device.s_bit_banging.shift_reg_out[3] ));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0621_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(\s_device.s_bit_banging.shift_reg_out[0] ),
    .A(\s_device.s_bit_banging.bit_cnt[1] ),
    .Y(_0275_));
 gf180mcu_as_sc_mcu7t3v3__ao211_2 _0622_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.s_bit_banging.bit_cnt[0] ),
    .B(\s_device.s_bit_banging.shift_reg_out[1] ),
    .C(_0275_),
    .D(_0173_),
    .Y(_0276_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0623_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.s_bit_banging.shift_reg_out[2] ),
    .B(_0269_),
    .C(_0274_),
    .D(_0276_),
    .Y(_0277_));
 gf180mcu_as_sc_mcu7t3v3__nor2b_2 _0624_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0278_),
    .B(_0182_),
    .A(_0268_));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0625_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(\s_device.s_bit_banging.shift_reg_out[4] ),
    .A(\s_device.s_bit_banging.bit_cnt[1] ),
    .Y(_0279_));
 gf180mcu_as_sc_mcu7t3v3__ao211_2 _0626_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.s_bit_banging.shift_reg_out[6] ),
    .B(_0269_),
    .C(_0279_),
    .D(_0181_),
    .Y(_0280_));
 gf180mcu_as_sc_mcu7t3v3__ao211_2 _0627_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.s_bit_banging.bit_cnt[0] ),
    .B(\s_device.s_bit_banging.shift_reg_out[5] ),
    .C(_0280_),
    .D(\s_device.s_bit_banging.bit_cnt[2] ),
    .Y(_0281_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0628_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.s_bit_banging.miso_reg ),
    .B(_0267_),
    .C(_0272_),
    .D(\s_device.s_bit_banging.tx_data[7] ),
    .Y(_0282_));
 gf180mcu_as_sc_mcu7t3v3__ao31_2 _0629_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .D(_0282_),
    .A(_0277_),
    .B(_0278_),
    .C(_0281_),
    .Y(_0043_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0630_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(_0002_),
    .B(\s_device.s_bit_banging.mosi_sync[2] ),
    .A(\s_device.rx_data[0] ),
    .Y(_0044_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0631_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(_0002_),
    .B(\s_device.s_bit_banging.shift_reg_in[0] ),
    .A(\s_device.rx_data[1] ),
    .Y(_0045_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0632_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(_0002_),
    .B(\s_device.s_bit_banging.shift_reg_in[1] ),
    .A(\s_device.rx_data[2] ),
    .Y(_0046_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0633_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(_0002_),
    .B(\s_device.s_bit_banging.shift_reg_in[2] ),
    .A(\s_device.rx_data[3] ),
    .Y(_0047_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0634_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(_0002_),
    .B(\s_device.s_bit_banging.shift_reg_in[6] ),
    .A(\s_device.rx_data[7] ),
    .Y(_0048_));
 gf180mcu_as_sc_mcu7t3v3__aoi21b_2 _0635_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0283_),
    .C(\s_device.cio_csb_syned ),
    .B(\s_device.s_bit_banging.sck_sync[1] ),
    .A(\s_device.s_bit_banging.sck_sync[2] ));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0636_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.s_bit_banging.mosi_sync[2] ),
    .B(_0183_),
    .C(_0283_),
    .D(\s_device.s_bit_banging.shift_reg_in[0] ),
    .Y(_0049_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0637_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.s_bit_banging.shift_reg_in[0] ),
    .B(_0183_),
    .C(_0283_),
    .D(\s_device.s_bit_banging.shift_reg_in[1] ),
    .Y(_0050_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0638_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.s_bit_banging.shift_reg_in[1] ),
    .B(_0183_),
    .C(_0283_),
    .D(\s_device.s_bit_banging.shift_reg_in[2] ),
    .Y(_0051_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0639_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.s_bit_banging.shift_reg_in[2] ),
    .B(_0183_),
    .C(_0283_),
    .D(\s_device.s_bit_banging.shift_reg_in[3] ),
    .Y(_0052_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0640_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.s_bit_banging.shift_reg_in[3] ),
    .B(_0183_),
    .C(_0283_),
    .D(\s_device.s_bit_banging.shift_reg_in[4] ),
    .Y(_0053_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0641_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.s_bit_banging.shift_reg_in[4] ),
    .B(_0183_),
    .C(_0283_),
    .D(\s_device.s_bit_banging.shift_reg_in[5] ),
    .Y(_0054_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0642_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.s_bit_banging.shift_reg_in[5] ),
    .B(_0183_),
    .C(_0283_),
    .D(\s_device.s_bit_banging.shift_reg_in[6] ),
    .Y(_0055_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0643_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(_0271_),
    .B(\s_device.s_bit_banging.shift_reg_out[0] ),
    .A(\s_device.s_bit_banging.tx_data[0] ),
    .Y(_0056_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0644_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(_0271_),
    .B(\s_device.s_bit_banging.shift_reg_out[1] ),
    .A(\s_device.s_bit_banging.tx_data[1] ),
    .Y(_0057_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0645_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(_0271_),
    .B(\s_device.s_bit_banging.shift_reg_out[2] ),
    .A(\s_device.s_bit_banging.tx_data[2] ),
    .Y(_0058_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0646_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(_0271_),
    .B(\s_device.s_bit_banging.shift_reg_out[3] ),
    .A(\s_device.s_bit_banging.tx_data[3] ),
    .Y(_0059_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0647_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(_0271_),
    .B(\s_device.s_bit_banging.shift_reg_out[4] ),
    .A(\s_device.s_bit_banging.tx_data[4] ),
    .Y(_0060_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0648_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(_0271_),
    .B(\s_device.s_bit_banging.shift_reg_out[5] ),
    .A(\s_device.s_bit_banging.tx_data[5] ),
    .Y(_0061_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0649_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(_0271_),
    .B(\s_device.s_bit_banging.shift_reg_out[6] ),
    .A(\s_device.s_bit_banging.tx_data[6] ),
    .Y(_0062_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0650_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0284_),
    .B(\s_device.s_core.state[1] ),
    .A(net25));
 gf180mcu_as_sc_mcu7t3v3__ao21_2 _0651_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0285_),
    .A(\s_device.s_core.byte_cnt[1] ),
    .B(\s_device.s_core.byte_cnt[0] ),
    .C(_0171_));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0652_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0285_),
    .A(_0178_),
    .Y(_0286_));
 gf180mcu_as_sc_mcu7t3v3__ao21_2 _0653_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0287_),
    .A(_0174_),
    .B(_0284_),
    .C(_0286_));
 gf180mcu_as_sc_mcu7t3v3__nor2b_2 _0654_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0288_),
    .B(_0285_),
    .A(_0178_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0655_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(\s_device.s_core.byte_cnt[0] ),
    .B(_0287_),
    .A(net20),
    .Y(_0063_));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0656_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0289_),
    .B(\s_device.s_core.byte_cnt[0] ),
    .A(\s_device.s_core.byte_cnt[1] ));
 gf180mcu_as_sc_mcu7t3v3__aoi21_2 _0657_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0290_),
    .C(net20),
    .B(_0287_),
    .A(\s_device.s_core.byte_cnt[1] ));
 gf180mcu_as_sc_mcu7t3v3__nor2_2 _0658_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0064_),
    .B(_0290_),
    .A(_0289_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0659_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(_0177_),
    .B(\s_device.rx_data[0] ),
    .A(\cnt_idx[0] ),
    .Y(_0065_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0660_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(_0177_),
    .B(\s_device.rx_data[1] ),
    .A(\cnt_idx[1] ),
    .Y(_0066_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0661_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(_0177_),
    .B(\s_device.rx_data[2] ),
    .A(\cnt_idx[2] ),
    .Y(_0067_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0662_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(_0177_),
    .B(\s_device.rx_data[3] ),
    .A(\cnt_idx[3] ),
    .Y(_0068_));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0663_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(_0178_),
    .A(\s_device.cnt_rd_en ),
    .Y(_0291_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0664_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net24),
    .B(\s_device.counters_i[0] ),
    .A(\s_device.s_core.data_latch[0] ),
    .Y(_0069_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0665_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net24),
    .B(\s_device.counters_i[1] ),
    .A(\s_device.s_core.data_latch[1] ),
    .Y(_0070_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0666_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net24),
    .B(\s_device.counters_i[2] ),
    .A(\s_device.s_core.data_latch[2] ),
    .Y(_0071_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0667_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net24),
    .B(\s_device.counters_i[3] ),
    .A(\s_device.s_core.data_latch[3] ),
    .Y(_0072_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0668_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net24),
    .B(\s_device.counters_i[4] ),
    .A(\s_device.s_core.data_latch[4] ),
    .Y(_0073_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0669_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net24),
    .B(\s_device.counters_i[5] ),
    .A(\s_device.s_core.data_latch[5] ),
    .Y(_0074_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0670_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net21),
    .B(\s_device.counters_i[6] ),
    .A(\s_device.s_core.data_latch[6] ),
    .Y(_0075_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0671_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net22),
    .B(\s_device.counters_i[7] ),
    .A(\s_device.s_core.data_latch[7] ),
    .Y(_0076_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0672_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net22),
    .B(\s_device.counters_i[8] ),
    .A(\s_device.s_core.data_latch[8] ),
    .Y(_0077_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0673_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net24),
    .B(\s_device.counters_i[9] ),
    .A(\s_device.s_core.data_latch[9] ),
    .Y(_0078_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0674_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net21),
    .B(\s_device.counters_i[10] ),
    .A(\s_device.s_core.data_latch[10] ),
    .Y(_0079_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0675_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net21),
    .B(\s_device.counters_i[11] ),
    .A(\s_device.s_core.data_latch[11] ),
    .Y(_0080_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0676_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net21),
    .B(\s_device.counters_i[12] ),
    .A(\s_device.s_core.data_latch[12] ),
    .Y(_0081_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0677_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net21),
    .B(\s_device.counters_i[13] ),
    .A(\s_device.s_core.data_latch[13] ),
    .Y(_0082_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0678_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net21),
    .B(\s_device.counters_i[14] ),
    .A(\s_device.s_core.data_latch[14] ),
    .Y(_0083_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0679_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net23),
    .B(\s_device.counters_i[15] ),
    .A(\s_device.s_core.data_latch[15] ),
    .Y(_0084_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0680_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net21),
    .B(\s_device.counters_i[16] ),
    .A(\s_device.s_core.data_latch[16] ),
    .Y(_0085_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0681_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net21),
    .B(\s_device.counters_i[17] ),
    .A(\s_device.s_core.data_latch[17] ),
    .Y(_0086_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0682_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net23),
    .B(\s_device.counters_i[18] ),
    .A(\s_device.s_core.data_latch[18] ),
    .Y(_0087_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0683_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net21),
    .B(\s_device.counters_i[19] ),
    .A(\s_device.s_core.data_latch[19] ),
    .Y(_0088_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0684_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net22),
    .B(\s_device.counters_i[20] ),
    .A(\s_device.s_core.data_latch[20] ),
    .Y(_0089_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0685_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net23),
    .B(\s_device.counters_i[21] ),
    .A(\s_device.s_core.data_latch[21] ),
    .Y(_0090_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0686_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net23),
    .B(\s_device.counters_i[22] ),
    .A(\s_device.s_core.data_latch[22] ),
    .Y(_0091_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0687_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net23),
    .B(\s_device.counters_i[23] ),
    .A(\s_device.s_core.data_latch[23] ),
    .Y(_0092_));
 gf180mcu_as_sc_mcu7t3v3__ao31_2 _0688_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .D(_0284_),
    .A(_0175_),
    .B(_0178_),
    .C(_0285_),
    .Y(_0292_));
 gf180mcu_as_sc_mcu7t3v3__nor2b_2 _0689_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0293_),
    .B(\s_device.s_core.byte_cnt[0] ),
    .A(\s_device.s_core.byte_cnt[1] ));
 gf180mcu_as_sc_mcu7t3v3__nor2b_2 _0690_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0294_),
    .B(\s_device.s_core.byte_cnt[1] ),
    .A(\s_device.s_core.byte_cnt[0] ));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0691_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.s_core.data_latch[16] ),
    .B(_0289_),
    .C(_0294_),
    .D(\s_device.s_core.data_latch[8] ),
    .Y(_0295_));
 gf180mcu_as_sc_mcu7t3v3__ao21_2 _0692_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0296_),
    .A(\s_device.s_core.data_latch[0] ),
    .B(_0293_),
    .C(_0295_));
 gf180mcu_as_sc_mcu7t3v3__and2_2 _0693_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .B(net23),
    .A(_0285_),
    .Y(_0297_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0694_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net20),
    .B(_0296_),
    .C(_0297_),
    .D(\s_device.counters_i[24] ),
    .Y(_0298_));
 gf180mcu_as_sc_mcu7t3v3__ao21_2 _0695_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0093_),
    .A(\s_device.s_bit_banging.tx_data[0] ),
    .B(_0292_),
    .C(_0298_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0696_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.s_core.data_latch[1] ),
    .B(_0293_),
    .C(_0294_),
    .D(\s_device.s_core.data_latch[9] ),
    .Y(_0299_));
 gf180mcu_as_sc_mcu7t3v3__ao21_2 _0697_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0300_),
    .A(\s_device.s_core.data_latch[17] ),
    .B(_0289_),
    .C(_0299_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0698_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[25] ),
    .B(_0297_),
    .C(_0300_),
    .D(net20),
    .Y(_0301_));
 gf180mcu_as_sc_mcu7t3v3__ao21_2 _0699_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0094_),
    .A(\s_device.s_bit_banging.tx_data[1] ),
    .B(_0292_),
    .C(_0301_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0700_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.s_core.data_latch[2] ),
    .B(_0293_),
    .C(_0294_),
    .D(\s_device.s_core.data_latch[10] ),
    .Y(_0302_));
 gf180mcu_as_sc_mcu7t3v3__ao21_2 _0701_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0303_),
    .A(\s_device.s_core.data_latch[18] ),
    .B(_0289_),
    .C(_0302_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0702_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(\s_device.cnt_rd_en ),
    .B(\s_device.counters_i[26] ),
    .A(\s_device.s_bit_banging.tx_data[2] ),
    .Y(_0304_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0703_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.s_bit_banging.tx_data[2] ),
    .B(_0284_),
    .C(net20),
    .D(_0303_),
    .Y(_0305_));
 gf180mcu_as_sc_mcu7t3v3__ao21_2 _0704_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0095_),
    .A(_0286_),
    .B(_0304_),
    .C(_0305_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0705_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.s_core.data_latch[19] ),
    .B(_0289_),
    .C(_0294_),
    .D(\s_device.s_core.data_latch[11] ),
    .Y(_0306_));
 gf180mcu_as_sc_mcu7t3v3__ao21_2 _0706_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0307_),
    .A(\s_device.s_core.data_latch[3] ),
    .B(_0293_),
    .C(_0306_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0707_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(\s_device.cnt_rd_en ),
    .B(\s_device.counters_i[27] ),
    .A(\s_device.s_bit_banging.tx_data[3] ),
    .Y(_0308_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0708_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.s_bit_banging.tx_data[3] ),
    .B(_0284_),
    .C(net20),
    .D(_0307_),
    .Y(_0309_));
 gf180mcu_as_sc_mcu7t3v3__ao21_2 _0709_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0096_),
    .A(_0286_),
    .B(_0308_),
    .C(_0309_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0710_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.s_core.data_latch[20] ),
    .B(_0289_),
    .C(_0294_),
    .D(\s_device.s_core.data_latch[12] ),
    .Y(_0310_));
 gf180mcu_as_sc_mcu7t3v3__ao21_2 _0711_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0311_),
    .A(\s_device.s_core.data_latch[4] ),
    .B(_0293_),
    .C(_0310_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0712_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[28] ),
    .B(_0297_),
    .C(_0311_),
    .D(net20),
    .Y(_0312_));
 gf180mcu_as_sc_mcu7t3v3__ao21_2 _0713_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0097_),
    .A(\s_device.s_bit_banging.tx_data[4] ),
    .B(_0292_),
    .C(_0312_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0714_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.s_core.data_latch[21] ),
    .B(_0289_),
    .C(_0294_),
    .D(\s_device.s_core.data_latch[13] ),
    .Y(_0313_));
 gf180mcu_as_sc_mcu7t3v3__ao21_2 _0715_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0314_),
    .A(\s_device.s_core.data_latch[5] ),
    .B(_0293_),
    .C(_0313_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0716_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[29] ),
    .B(_0297_),
    .C(_0314_),
    .D(net20),
    .Y(_0315_));
 gf180mcu_as_sc_mcu7t3v3__ao21_2 _0717_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0098_),
    .A(\s_device.s_bit_banging.tx_data[5] ),
    .B(_0292_),
    .C(_0315_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0718_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.s_core.data_latch[6] ),
    .B(_0293_),
    .C(_0294_),
    .D(\s_device.s_core.data_latch[14] ),
    .Y(_0316_));
 gf180mcu_as_sc_mcu7t3v3__ao21_2 _0719_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0317_),
    .A(\s_device.s_core.data_latch[22] ),
    .B(_0289_),
    .C(_0316_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0720_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[30] ),
    .B(_0297_),
    .C(_0317_),
    .D(net20),
    .Y(_0318_));
 gf180mcu_as_sc_mcu7t3v3__ao21_2 _0721_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0099_),
    .A(\s_device.s_bit_banging.tx_data[6] ),
    .B(_0292_),
    .C(_0318_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0722_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.s_core.data_latch[23] ),
    .B(_0289_),
    .C(_0293_),
    .D(\s_device.s_core.data_latch[7] ),
    .Y(_0319_));
 gf180mcu_as_sc_mcu7t3v3__ao21_2 _0723_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0320_),
    .A(\s_device.s_core.data_latch[15] ),
    .B(_0294_),
    .C(_0319_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0724_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[31] ),
    .B(_0297_),
    .C(_0320_),
    .D(_0288_),
    .Y(_0321_));
 gf180mcu_as_sc_mcu7t3v3__ao21_2 _0725_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .Y(_0100_),
    .A(\s_device.s_bit_banging.tx_data[7] ),
    .B(_0292_),
    .C(_0321_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0726_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net6),
    .B(\u_timer0.captured_high[0] ),
    .A(\u_timer0.highcount[0] ),
    .Y(_0101_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0727_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net6),
    .B(\u_timer0.captured_high[1] ),
    .A(\u_timer0.highcount[1] ),
    .Y(_0102_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0728_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net5),
    .B(\u_timer0.captured_high[2] ),
    .A(\u_timer0.highcount[2] ),
    .Y(_0103_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0729_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net5),
    .B(\u_timer0.captured_high[3] ),
    .A(\u_timer0.highcount[3] ),
    .Y(_0104_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0730_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net6),
    .B(\u_timer0.captured_high[4] ),
    .A(\u_timer0.highcount[4] ),
    .Y(_0105_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0731_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net6),
    .B(\u_timer0.captured_high[5] ),
    .A(\u_timer0.highcount[5] ),
    .Y(_0106_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0732_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net5),
    .B(\u_timer0.captured_high[6] ),
    .A(\u_timer0.highcount[6] ),
    .Y(_0107_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0733_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net5),
    .B(\u_timer0.captured_high[7] ),
    .A(\u_timer0.highcount[7] ),
    .Y(_0108_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0734_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net5),
    .B(\u_timer0.captured_high[8] ),
    .A(\u_timer0.highcount[8] ),
    .Y(_0109_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0735_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net5),
    .B(\u_timer0.captured_high[9] ),
    .A(\u_timer0.highcount[9] ),
    .Y(_0110_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0736_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net5),
    .B(\u_timer0.captured_high[10] ),
    .A(\u_timer0.highcount[10] ),
    .Y(_0111_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0737_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net5),
    .B(\u_timer0.captured_high[11] ),
    .A(\u_timer0.highcount[11] ),
    .Y(_0112_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0738_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net5),
    .B(\u_timer0.captured_high[12] ),
    .A(\u_timer0.highcount[12] ),
    .Y(_0113_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0739_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net6),
    .B(\u_timer0.captured_high[13] ),
    .A(\u_timer0.highcount[13] ),
    .Y(_0114_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0740_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net7),
    .B(\u_timer0.captured_high[14] ),
    .A(\u_timer0.highcount[14] ),
    .Y(_0115_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0741_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net6),
    .B(\u_timer0.captured_high[15] ),
    .A(\u_timer0.highcount[15] ),
    .Y(_0116_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0742_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net6),
    .B(\u_timer0.captured_high[16] ),
    .A(\u_timer0.highcount[16] ),
    .Y(_0117_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0743_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net7),
    .B(\u_timer0.captured_high[17] ),
    .A(\u_timer0.highcount[17] ),
    .Y(_0118_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0744_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net7),
    .B(\u_timer0.captured_high[18] ),
    .A(\u_timer0.highcount[18] ),
    .Y(_0119_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0745_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net7),
    .B(\u_timer0.captured_high[19] ),
    .A(\u_timer0.highcount[19] ),
    .Y(_0120_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0746_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net7),
    .B(\u_timer0.captured_high[20] ),
    .A(\u_timer0.highcount[20] ),
    .Y(_0121_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0747_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net7),
    .B(\u_timer0.captured_high[21] ),
    .A(\u_timer0.highcount[21] ),
    .Y(_0122_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0748_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net7),
    .B(\u_timer0.captured_high[22] ),
    .A(\u_timer0.highcount[22] ),
    .Y(_0123_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0749_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net7),
    .B(\u_timer0.captured_high[23] ),
    .A(\u_timer0.highcount[23] ),
    .Y(_0124_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0750_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net7),
    .B(\u_timer0.captured_high[24] ),
    .A(\u_timer0.highcount[24] ),
    .Y(_0125_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0751_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net8),
    .B(\u_timer0.captured_high[25] ),
    .A(\u_timer0.highcount[25] ),
    .Y(_0126_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0752_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net8),
    .B(\u_timer0.captured_high[26] ),
    .A(\u_timer0.highcount[26] ),
    .Y(_0127_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0753_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net8),
    .B(\u_timer0.captured_high[27] ),
    .A(\u_timer0.highcount[27] ),
    .Y(_0128_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0754_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net6),
    .B(\u_timer0.captured_low[0] ),
    .A(\u_timer0.lowcount[0] ),
    .Y(_0129_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0755_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net9),
    .B(\u_timer0.captured_low[1] ),
    .A(\u_timer0.lowcount[1] ),
    .Y(_0130_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0756_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net9),
    .B(\u_timer0.captured_low[2] ),
    .A(\u_timer0.lowcount[2] ),
    .Y(_0131_));
 gf180mcu_as_sc_mcu7t3v3__mux2_2 _0757_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .S(net9),
    .B(\u_timer0.captured_low[3] ),
    .A(\u_timer0.lowcount[3] ),
    .Y(_0132_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0758_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[0] ),
    .B(net16),
    .C(net11),
    .D(\u_timer0.captured_low[0] ),
    .Y(_0133_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0759_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[1] ),
    .B(net16),
    .C(net11),
    .D(\u_timer0.captured_low[1] ),
    .Y(_0134_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0760_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[2] ),
    .B(net16),
    .C(net11),
    .D(\u_timer0.captured_low[2] ),
    .Y(_0135_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0761_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[3] ),
    .B(net16),
    .C(net11),
    .D(\u_timer0.captured_low[3] ),
    .Y(_0136_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0762_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[4] ),
    .B(net17),
    .C(net11),
    .D(\u_timer0.captured_high[0] ),
    .Y(_0137_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0763_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[5] ),
    .B(net17),
    .C(net14),
    .D(\u_timer0.captured_high[1] ),
    .Y(_0138_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0764_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[6] ),
    .B(net15),
    .C(net10),
    .D(\u_timer0.captured_high[2] ),
    .Y(_0139_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0765_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[7] ),
    .B(net15),
    .C(net10),
    .D(\u_timer0.captured_high[3] ),
    .Y(_0140_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0766_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[8] ),
    .B(net17),
    .C(net14),
    .D(\u_timer0.captured_high[4] ),
    .Y(_0141_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0767_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[9] ),
    .B(net17),
    .C(net14),
    .D(\u_timer0.captured_high[5] ),
    .Y(_0142_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0768_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[10] ),
    .B(net15),
    .C(net10),
    .D(\u_timer0.captured_high[6] ),
    .Y(_0143_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0769_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[11] ),
    .B(net15),
    .C(net10),
    .D(\u_timer0.captured_high[7] ),
    .Y(_0144_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0770_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[12] ),
    .B(net15),
    .C(net10),
    .D(\u_timer0.captured_high[8] ),
    .Y(_0145_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0771_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[13] ),
    .B(net15),
    .C(net10),
    .D(\u_timer0.captured_high[9] ),
    .Y(_0146_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0772_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[14] ),
    .B(net15),
    .C(net10),
    .D(\u_timer0.captured_high[10] ),
    .Y(_0147_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0773_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[15] ),
    .B(net15),
    .C(net10),
    .D(\u_timer0.captured_high[11] ),
    .Y(_0148_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0774_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[16] ),
    .B(net15),
    .C(net10),
    .D(\u_timer0.captured_high[12] ),
    .Y(_0149_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0775_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[17] ),
    .B(net16),
    .C(net11),
    .D(\u_timer0.captured_high[13] ),
    .Y(_0150_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0776_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[18] ),
    .B(net18),
    .C(net12),
    .D(\u_timer0.captured_high[14] ),
    .Y(_0151_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0777_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[19] ),
    .B(net16),
    .C(net11),
    .D(\u_timer0.captured_high[15] ),
    .Y(_0152_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0778_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[20] ),
    .B(net16),
    .C(net11),
    .D(\u_timer0.captured_high[16] ),
    .Y(_0153_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0779_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[21] ),
    .B(net18),
    .C(net12),
    .D(\u_timer0.captured_high[17] ),
    .Y(_0154_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0780_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[22] ),
    .B(net18),
    .C(net12),
    .D(\u_timer0.captured_high[18] ),
    .Y(_0155_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0781_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[23] ),
    .B(net18),
    .C(net12),
    .D(\u_timer0.captured_high[19] ),
    .Y(_0156_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0782_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[24] ),
    .B(net18),
    .C(net12),
    .D(\u_timer0.captured_high[20] ),
    .Y(_0157_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0783_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[25] ),
    .B(net18),
    .C(net12),
    .D(\u_timer0.captured_high[21] ),
    .Y(_0158_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0784_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[26] ),
    .B(net18),
    .C(net12),
    .D(\u_timer0.captured_high[22] ),
    .Y(_0159_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0785_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[27] ),
    .B(net19),
    .C(net13),
    .D(\u_timer0.captured_high[23] ),
    .Y(_0160_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0786_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[28] ),
    .B(net19),
    .C(net13),
    .D(\u_timer0.captured_high[24] ),
    .Y(_0161_));
 gf180mcu_as_sc_mcu7t3v3__ao22_2 _0787_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.counters_i[29] ),
    .B(net19),
    .C(net13),
    .D(\u_timer0.captured_high[25] ),
    .Y(_0162_));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0788_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_8_0_clk_i),
    .Q(\s_device.s_core.state[0] ),
    .RN(net99),
    .SN(net60),
    .D(net25));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0788__100 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net99));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0789_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_9_0_clk_i),
    .Q(\s_device.s_core.state[1] ),
    .RN(net59),
    .SN(net100),
    .D(_0000_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0789__101 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net100));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0790_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_10_0_clk_i),
    .Q(\s_device.s_core.state[2] ),
    .RN(net71),
    .SN(net101),
    .D(_0001_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0790__102 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net101));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0791_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net38),
    .Q(\u_timer0.stop_prev ),
    .RN(net52),
    .SN(net102),
    .D(stop_i));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0791__103 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net102));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0792_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_10_0_clk_i),
    .Q(\s_device.s_bit_banging.sck_sync[0] ),
    .RN(net72),
    .SN(net103),
    .D(cio_sck_i));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0792__104 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net103));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0793_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_11_0_clk_i),
    .Q(\s_device.s_bit_banging.sck_sync[1] ),
    .RN(net72),
    .SN(net104),
    .D(\s_device.s_bit_banging.sck_sync[0] ));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0793__105 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net104));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0794_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_11_0_clk_i),
    .Q(\s_device.s_bit_banging.sck_sync[2] ),
    .RN(net69),
    .SN(net105),
    .D(\s_device.s_bit_banging.sck_sync[1] ));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0794__106 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net105));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0795_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_8_0_clk_i),
    .Q(\s_device.s_bit_banging.cs_sync[0] ),
    .RN(net106),
    .SN(net61),
    .D(cio_csb_i));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0795__107 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net106));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0796_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_8_0_clk_i),
    .Q(\s_device.s_bit_banging.cs_sync[1] ),
    .RN(net107),
    .SN(net61),
    .D(\s_device.s_bit_banging.cs_sync[0] ));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0796__108 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net107));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0797_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_10_0_clk_i),
    .Q(\s_device.cio_csb_syned ),
    .RN(net108),
    .SN(net72),
    .D(\s_device.s_bit_banging.cs_sync[1] ));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0797__109 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net108));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0798_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_8_0_clk_i),
    .Q(\s_device.s_bit_banging.mosi_sync[0] ),
    .RN(net61),
    .SN(net109),
    .D(cio_sd_i));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0798__110 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net109));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0799_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_8_0_clk_i),
    .Q(\s_device.s_bit_banging.mosi_sync[1] ),
    .RN(net64),
    .SN(net110),
    .D(\s_device.s_bit_banging.mosi_sync[0] ));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0799__111 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net110));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0800_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_10_0_clk_i),
    .Q(\s_device.s_bit_banging.mosi_sync[2] ),
    .RN(net72),
    .SN(net111),
    .D(\s_device.s_bit_banging.mosi_sync[1] ));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0800__112 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net111));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0801_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_12_0_clk_i),
    .Q(\s_device.rx_valid ),
    .RN(net66),
    .SN(net112),
    .D(_0002_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0801__113 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net112));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0802_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_9_0_clk_i),
    .Q(\s_device.cnt_rd_en ),
    .RN(net59),
    .SN(net194),
    .D(_0004_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0802__195 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net194));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0803_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_13_0_clk_i),
    .Q(cnt_rst_en),
    .RN(net69),
    .SN(net193),
    .D(_0003_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0803__194 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net193));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0804_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_7_0_clk_i),
    .Q(\s_device.s_bit_banging.bit_cnt[0] ),
    .RN(net65),
    .SN(net192),
    .D(_0040_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0804__193 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net192));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0805_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_7_0_clk_i),
    .Q(\s_device.s_bit_banging.bit_cnt[1] ),
    .RN(net65),
    .SN(net191),
    .D(_0041_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0805__192 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net191));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0806_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_13_0_clk_i),
    .Q(\s_device.s_bit_banging.bit_cnt[2] ),
    .RN(net67),
    .SN(net190),
    .D(_0042_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0806__191 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net190));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0807_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_13_0_clk_i),
    .Q(\s_device.s_bit_banging.miso_reg ),
    .RN(net67),
    .SN(net189),
    .D(_0043_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0807__190 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net189));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0808_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_12_0_clk_i),
    .Q(\s_device.rx_data[0] ),
    .RN(net69),
    .SN(net188),
    .D(_0044_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0808__189 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net188));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0809_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_15_0_clk_i),
    .Q(\s_device.rx_data[1] ),
    .RN(net69),
    .SN(net187),
    .D(_0045_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0809__188 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net187));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0810_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_14_0_clk_i),
    .Q(\s_device.rx_data[2] ),
    .RN(net69),
    .SN(net186),
    .D(_0046_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0810__187 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net186));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0811_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_15_0_clk_i),
    .Q(\s_device.rx_data[3] ),
    .RN(net70),
    .SN(net185),
    .D(_0047_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0811__186 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net185));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0812_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_12_0_clk_i),
    .Q(\s_device.rx_data[7] ),
    .RN(net69),
    .SN(net184),
    .D(_0048_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0812__185 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net184));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0813_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_14_0_clk_i),
    .Q(\s_device.s_bit_banging.shift_reg_in[0] ),
    .RN(net70),
    .SN(net183),
    .D(_0049_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0813__184 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net183));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0814_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_14_0_clk_i),
    .Q(\s_device.s_bit_banging.shift_reg_in[1] ),
    .RN(net70),
    .SN(net182),
    .D(_0050_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0814__183 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net182));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0815_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_14_0_clk_i),
    .Q(\s_device.s_bit_banging.shift_reg_in[2] ),
    .RN(net70),
    .SN(net181),
    .D(_0051_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0815__182 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net181));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0816_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_10_0_clk_i),
    .Q(\s_device.s_bit_banging.shift_reg_in[3] ),
    .RN(net72),
    .SN(net180),
    .D(_0052_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0816__181 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net180));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0817_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_14_0_clk_i),
    .Q(\s_device.s_bit_banging.shift_reg_in[4] ),
    .RN(net72),
    .SN(net179),
    .D(_0053_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0817__180 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net179));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0818_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_11_0_clk_i),
    .Q(\s_device.s_bit_banging.shift_reg_in[5] ),
    .RN(net72),
    .SN(net178),
    .D(_0054_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0818__179 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net178));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0819_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_11_0_clk_i),
    .Q(\s_device.s_bit_banging.shift_reg_in[6] ),
    .RN(net71),
    .SN(net177),
    .D(_0055_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0819__178 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net177));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0820_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_5_0_clk_i),
    .Q(\s_device.s_bit_banging.shift_reg_out[0] ),
    .RN(net52),
    .SN(net176),
    .D(_0056_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0820__177 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net176));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0821_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_7_0_clk_i),
    .Q(\s_device.s_bit_banging.shift_reg_out[1] ),
    .RN(net67),
    .SN(net175),
    .D(_0057_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0821__176 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net175));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0822_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_12_0_clk_i),
    .Q(\s_device.s_bit_banging.shift_reg_out[2] ),
    .RN(net67),
    .SN(net174),
    .D(_0058_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0822__175 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net174));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0823_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_12_0_clk_i),
    .Q(\s_device.s_bit_banging.shift_reg_out[3] ),
    .RN(net67),
    .SN(net173),
    .D(_0059_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0823__174 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net173));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0824_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_5_0_clk_i),
    .Q(\s_device.s_bit_banging.shift_reg_out[4] ),
    .RN(net52),
    .SN(net172),
    .D(_0060_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0824__173 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net172));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0825_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_7_0_clk_i),
    .Q(\s_device.s_bit_banging.shift_reg_out[5] ),
    .RN(net52),
    .SN(net171),
    .D(_0061_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0825__172 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net171));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0826_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_6_0_clk_i),
    .Q(\s_device.s_bit_banging.shift_reg_out[6] ),
    .RN(net67),
    .SN(net170),
    .D(_0062_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0826__171 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net170));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0827_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_6_0_clk_i),
    .Q(\s_device.s_core.byte_cnt[0] ),
    .RN(net66),
    .SN(net169),
    .D(_0063_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0827__170 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net169));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0828_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_2_0_clk_i),
    .Q(\s_device.s_core.byte_cnt[1] ),
    .RN(net58),
    .SN(net168),
    .D(_0064_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0828__169 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net168));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0829_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_15_0_clk_i),
    .Q(\cnt_idx[0] ),
    .RN(net68),
    .SN(net167),
    .D(_0065_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0829__168 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net167));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0830_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_15_0_clk_i),
    .Q(\cnt_idx[1] ),
    .RN(net68),
    .SN(net166),
    .D(_0066_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0830__167 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net166));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0831_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_13_0_clk_i),
    .Q(\cnt_idx[2] ),
    .RN(net70),
    .SN(net165),
    .D(_0067_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0831__166 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net165));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0832_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_13_0_clk_i),
    .Q(\cnt_idx[3] ),
    .RN(net70),
    .SN(net164),
    .D(_0068_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0832__165 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net164));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0833_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_5_0_clk_i),
    .Q(\s_device.s_core.data_latch[0] ),
    .RN(net52),
    .SN(net163),
    .D(_0069_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0833__164 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net163));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0834_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_5_0_clk_i),
    .Q(\s_device.s_core.data_latch[1] ),
    .RN(net48),
    .SN(net162),
    .D(_0070_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0834__163 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net162));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0835_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_4_0_clk_i),
    .Q(\s_device.s_core.data_latch[2] ),
    .RN(net50),
    .SN(net161),
    .D(_0071_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0835__162 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net161));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0836_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_5_0_clk_i),
    .Q(\s_device.s_core.data_latch[3] ),
    .RN(net52),
    .SN(net160),
    .D(_0072_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0836__161 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net160));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0837_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_4_0_clk_i),
    .Q(\s_device.s_core.data_latch[4] ),
    .RN(net54),
    .SN(net159),
    .D(_0073_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0837__160 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net159));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0838_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_4_0_clk_i),
    .Q(\s_device.s_core.data_latch[5] ),
    .RN(net54),
    .SN(net158),
    .D(_0074_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0838__159 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net158));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0839_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_1_0_clk_i),
    .Q(\s_device.s_core.data_latch[6] ),
    .RN(net43),
    .SN(net157),
    .D(_0075_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0839__158 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net157));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0840_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_1_0_clk_i),
    .Q(\s_device.s_core.data_latch[7] ),
    .RN(net49),
    .SN(net156),
    .D(_0076_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0840__157 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net156));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0841_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_4_0_clk_i),
    .Q(\s_device.s_core.data_latch[8] ),
    .RN(net54),
    .SN(net155),
    .D(_0077_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0841__156 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net155));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0842_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_4_0_clk_i),
    .Q(\s_device.s_core.data_latch[9] ),
    .RN(net49),
    .SN(net154),
    .D(_0078_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0842__155 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net154));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0843_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_1_0_clk_i),
    .Q(\s_device.s_core.data_latch[10] ),
    .RN(net42),
    .SN(net153),
    .D(_0079_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0843__154 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net153));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0844_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_1_0_clk_i),
    .Q(\s_device.s_core.data_latch[11] ),
    .RN(net43),
    .SN(net152),
    .D(_0080_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0844__153 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net152));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0845_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_1_0_clk_i),
    .Q(\s_device.s_core.data_latch[12] ),
    .RN(net43),
    .SN(net151),
    .D(_0081_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0845__152 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net151));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0846_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_0_0_clk_i),
    .Q(\s_device.s_core.data_latch[13] ),
    .RN(net46),
    .SN(net150),
    .D(_0082_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0846__151 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net150));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0847_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_0_0_clk_i),
    .Q(\s_device.s_core.data_latch[14] ),
    .RN(net43),
    .SN(net149),
    .D(_0083_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0847__150 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net149));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0848_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_2_0_clk_i),
    .Q(\s_device.s_core.data_latch[15] ),
    .RN(net46),
    .SN(net148),
    .D(_0084_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0848__149 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net148));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0849_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_0_0_clk_i),
    .Q(\s_device.s_core.data_latch[16] ),
    .RN(net46),
    .SN(net147),
    .D(_0085_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0849__148 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net147));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0850_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_0_0_clk_i),
    .Q(\s_device.s_core.data_latch[17] ),
    .RN(net46),
    .SN(net146),
    .D(_0086_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0850__147 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net146));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0851_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_9_0_clk_i),
    .Q(\s_device.s_core.data_latch[18] ),
    .RN(net59),
    .SN(net145),
    .D(_0087_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0851__146 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net145));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0852_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_2_0_clk_i),
    .Q(\s_device.s_core.data_latch[19] ),
    .RN(net46),
    .SN(net144),
    .D(_0088_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0852__145 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net144));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0853_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_0_0_clk_i),
    .Q(\s_device.s_core.data_latch[20] ),
    .RN(net46),
    .SN(net143),
    .D(_0089_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0853__144 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net143));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0854_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_9_0_clk_i),
    .Q(\s_device.s_core.data_latch[21] ),
    .RN(net59),
    .SN(net142),
    .D(_0090_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0854__143 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net142));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0855_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_9_0_clk_i),
    .Q(\s_device.s_core.data_latch[22] ),
    .RN(net59),
    .SN(net141),
    .D(_0091_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0855__142 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net141));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0856_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_2_0_clk_i),
    .Q(\s_device.s_core.data_latch[23] ),
    .RN(net59),
    .SN(net140),
    .D(_0092_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0856__141 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net140));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0857_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_3_0_clk_i),
    .Q(\s_device.s_bit_banging.tx_data[0] ),
    .RN(net54),
    .SN(net139),
    .D(_0093_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0857__140 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net139));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0858_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_2_0_clk_i),
    .Q(\s_device.s_bit_banging.tx_data[1] ),
    .RN(net66),
    .SN(net138),
    .D(_0094_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0858__139 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net138));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0859_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_6_0_clk_i),
    .Q(\s_device.s_bit_banging.tx_data[2] ),
    .RN(net66),
    .SN(net137),
    .D(_0095_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0859__138 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net137));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0860_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_6_0_clk_i),
    .Q(\s_device.s_bit_banging.tx_data[3] ),
    .RN(net66),
    .SN(net136),
    .D(_0096_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0860__137 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net136));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0861_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_3_0_clk_i),
    .Q(\s_device.s_bit_banging.tx_data[4] ),
    .RN(net54),
    .SN(net135),
    .D(_0097_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0861__136 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net135));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0862_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_3_0_clk_i),
    .Q(\s_device.s_bit_banging.tx_data[5] ),
    .RN(net54),
    .SN(net134),
    .D(_0098_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0862__135 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net134));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0863_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_3_0_clk_i),
    .Q(\s_device.s_bit_banging.tx_data[6] ),
    .RN(net66),
    .SN(net133),
    .D(_0099_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0863__134 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net133));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0864_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(clknet_4_6_0_clk_i),
    .Q(\s_device.s_bit_banging.tx_data[7] ),
    .RN(net66),
    .SN(net132),
    .D(_0100_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0864__133 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net132));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0865_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net37),
    .Q(\u_timer0.captured_high[0] ),
    .RN(net50),
    .SN(net131),
    .D(_0101_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0865__132 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net131));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0866_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net37),
    .Q(\u_timer0.captured_high[1] ),
    .RN(net48),
    .SN(net130),
    .D(_0102_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0866__131 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net130));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0867_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net30),
    .Q(\u_timer0.captured_high[2] ),
    .RN(net41),
    .SN(net129),
    .D(_0103_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0867__130 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net129));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0868_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net30),
    .Q(\u_timer0.captured_high[3] ),
    .RN(net47),
    .SN(net128),
    .D(_0104_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0868__129 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net128));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0869_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net36),
    .Q(\u_timer0.captured_high[4] ),
    .RN(net49),
    .SN(net127),
    .D(_0105_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0869__128 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net127));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0870_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net36),
    .Q(\u_timer0.captured_high[5] ),
    .RN(net49),
    .SN(net126),
    .D(_0106_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0870__127 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net126));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0871_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net26),
    .Q(\u_timer0.captured_high[6] ),
    .RN(net41),
    .SN(net125),
    .D(_0107_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0871__126 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net125));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0872_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net26),
    .Q(\u_timer0.captured_high[7] ),
    .RN(net41),
    .SN(net124),
    .D(_0108_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0872__125 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net124));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0873_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net26),
    .Q(\u_timer0.captured_high[8] ),
    .RN(net41),
    .SN(net123),
    .D(_0109_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0873__124 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net123));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0874_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net27),
    .Q(\u_timer0.captured_high[9] ),
    .RN(net41),
    .SN(net122),
    .D(_0110_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0874__123 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net122));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0875_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net27),
    .Q(\u_timer0.captured_high[10] ),
    .RN(net41),
    .SN(net121),
    .D(_0111_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0875__122 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net121));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0876_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net28),
    .Q(\u_timer0.captured_high[11] ),
    .RN(net45),
    .SN(net120),
    .D(_0112_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0876__121 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net120));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0877_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net28),
    .Q(\u_timer0.captured_high[12] ),
    .RN(net45),
    .SN(net119),
    .D(_0113_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0877__120 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net119));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0878_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net28),
    .Q(\u_timer0.captured_high[13] ),
    .RN(net45),
    .SN(net118),
    .D(_0114_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0878__119 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net118));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0879_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net31),
    .Q(\u_timer0.captured_high[14] ),
    .RN(net56),
    .SN(net117),
    .D(_0115_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0879__118 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net117));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0880_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net28),
    .Q(\u_timer0.captured_high[15] ),
    .RN(net45),
    .SN(net116),
    .D(_0116_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0880__117 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net116));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0881_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net28),
    .Q(\u_timer0.captured_high[16] ),
    .RN(net45),
    .SN(net115),
    .D(_0117_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0881__116 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net115));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0882_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net31),
    .Q(\u_timer0.captured_high[17] ),
    .RN(net57),
    .SN(net114),
    .D(_0118_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0882__115 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net114));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0883_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net31),
    .Q(\u_timer0.captured_high[18] ),
    .RN(net57),
    .SN(net113),
    .D(_0119_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0883__114 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net113));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0884_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net31),
    .Q(\u_timer0.captured_high[19] ),
    .RN(net56),
    .SN(net96),
    .D(_0120_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0884__97 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net96));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0885_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net33),
    .Q(\u_timer0.captured_high[20] ),
    .RN(net56),
    .SN(net95),
    .D(_0121_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0885__96 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net95));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0886_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net32),
    .Q(\u_timer0.captured_high[21] ),
    .RN(net63),
    .SN(net94),
    .D(_0122_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0886__95 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net94));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0887_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net32),
    .Q(\u_timer0.captured_high[22] ),
    .RN(net63),
    .SN(net93),
    .D(_0123_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0887__94 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net93));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0888_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net32),
    .Q(\u_timer0.captured_high[23] ),
    .RN(net63),
    .SN(net92),
    .D(_0124_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0888__93 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net92));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0889_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net33),
    .Q(\u_timer0.captured_high[24] ),
    .RN(net63),
    .SN(net91),
    .D(_0125_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0889__92 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net91));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0890_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net34),
    .Q(\u_timer0.captured_high[25] ),
    .RN(net63),
    .SN(net90),
    .D(_0126_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0890__91 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net90));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0891_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net34),
    .Q(\u_timer0.captured_high[26] ),
    .RN(net64),
    .SN(net89),
    .D(_0127_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0891__90 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net89));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0892_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net34),
    .Q(\u_timer0.captured_high[27] ),
    .RN(net62),
    .SN(net88),
    .D(_0128_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0892__89 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net88));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0893_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net38),
    .Q(\u_timer0.captured_low[0] ),
    .RN(net51),
    .SN(net87),
    .D(_0129_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0893__88 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net87));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0894_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net37),
    .Q(\u_timer0.captured_low[1] ),
    .RN(net50),
    .SN(net86),
    .D(_0130_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0894__87 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net86));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0895_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net37),
    .Q(\u_timer0.captured_low[2] ),
    .RN(net50),
    .SN(net85),
    .D(_0131_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0895__86 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net85));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0896_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net37),
    .Q(\u_timer0.captured_low[3] ),
    .RN(net50),
    .SN(net83),
    .D(_0132_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0896__84 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net83));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0897_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net38),
    .Q(\s_device.counters_i[0] ),
    .RN(net51),
    .SN(net82),
    .D(_0133_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0897__83 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net82));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0898_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net37),
    .Q(\s_device.counters_i[1] ),
    .RN(net50),
    .SN(net81),
    .D(_0134_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0898__82 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net81));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0899_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net37),
    .Q(\s_device.counters_i[2] ),
    .RN(net50),
    .SN(net80),
    .D(_0135_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0899__81 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net80));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0900_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net38),
    .Q(\s_device.counters_i[3] ),
    .RN(net52),
    .SN(net79),
    .D(_0136_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0900__80 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net79));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0901_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net36),
    .Q(\s_device.counters_i[4] ),
    .RN(net49),
    .SN(net78),
    .D(_0137_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0901__79 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net78));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0902_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net39),
    .Q(\s_device.counters_i[5] ),
    .RN(net54),
    .SN(net77),
    .D(_0138_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0902__78 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net77));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0903_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net30),
    .Q(\s_device.counters_i[6] ),
    .RN(net40),
    .SN(net76),
    .D(_0139_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0903__77 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net76));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0904_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net36),
    .Q(\s_device.counters_i[7] ),
    .RN(net47),
    .SN(net75),
    .D(_0140_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0904__76 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net75));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0905_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net36),
    .Q(\s_device.counters_i[8] ),
    .RN(net49),
    .SN(net74),
    .D(_0141_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0905__75 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net74));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0906_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net36),
    .Q(\s_device.counters_i[9] ),
    .RN(net49),
    .SN(net),
    .D(_0142_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0906__74 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0907_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net30),
    .Q(\s_device.counters_i[10] ),
    .RN(net40),
    .SN(net214),
    .D(_0143_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0907__215 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net214));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0908_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net27),
    .Q(\s_device.counters_i[11] ),
    .RN(net40),
    .SN(net213),
    .D(_0144_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0908__214 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net213));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0909_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net27),
    .Q(\s_device.counters_i[12] ),
    .RN(net43),
    .SN(net212),
    .D(_0145_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0909__213 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net212));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0910_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net27),
    .Q(\s_device.counters_i[13] ),
    .RN(net43),
    .SN(net211),
    .D(_0146_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0910__212 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net211));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0911_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net27),
    .Q(\s_device.counters_i[14] ),
    .RN(net43),
    .SN(net210),
    .D(_0147_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0911__211 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net210));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0912_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net28),
    .Q(\s_device.counters_i[15] ),
    .RN(net45),
    .SN(net209),
    .D(_0148_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0912__210 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net209));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0913_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net30),
    .Q(\s_device.counters_i[16] ),
    .RN(net44),
    .SN(net208),
    .D(_0149_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0913__209 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net208));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0914_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net30),
    .Q(\s_device.counters_i[17] ),
    .RN(net44),
    .SN(net207),
    .D(_0150_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0914__208 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net207));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0915_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net35),
    .Q(\s_device.counters_i[18] ),
    .RN(net57),
    .SN(net206),
    .D(_0151_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0915__207 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net206));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0916_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net29),
    .Q(\s_device.counters_i[19] ),
    .RN(net45),
    .SN(net205),
    .D(_0152_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0916__206 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net205));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0917_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net29),
    .Q(\s_device.counters_i[20] ),
    .RN(net46),
    .SN(net204),
    .D(_0153_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0917__205 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net204));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0918_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net35),
    .Q(\s_device.counters_i[21] ),
    .RN(net57),
    .SN(net203),
    .D(_0154_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0918__204 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net203));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0919_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net33),
    .Q(\s_device.counters_i[22] ),
    .RN(net57),
    .SN(net202),
    .D(_0155_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0919__203 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net202));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0920_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net35),
    .Q(\s_device.counters_i[23] ),
    .RN(net56),
    .SN(net201),
    .D(_0156_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0920__202 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net201));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0921_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net35),
    .Q(\s_device.counters_i[24] ),
    .RN(net59),
    .SN(net200),
    .D(_0157_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0921__201 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net200));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0922_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net34),
    .Q(\s_device.counters_i[25] ),
    .RN(net63),
    .SN(net199),
    .D(_0158_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0922__200 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net199));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0923_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net34),
    .Q(\s_device.counters_i[26] ),
    .RN(net61),
    .SN(net198),
    .D(_0159_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0923__199 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net198));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0924_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net34),
    .Q(\s_device.counters_i[27] ),
    .RN(net61),
    .SN(net197),
    .D(_0160_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0924__198 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net197));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0925_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net34),
    .Q(\s_device.counters_i[28] ),
    .RN(net63),
    .SN(net196),
    .D(_0161_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0925__197 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net196));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0926_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net35),
    .Q(\s_device.counters_i[29] ),
    .RN(net61),
    .SN(net195),
    .D(_0162_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0926__196 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net195));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0927_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net35),
    .Q(\s_device.counters_i[30] ),
    .RN(net61),
    .SN(net97),
    .D(_0005_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0927__98 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net97));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0928_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net35),
    .Q(\s_device.counters_i[31] ),
    .RN(net60),
    .SN(net84),
    .D(_0006_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0928__85 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net84));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0929_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net37),
    .D(_0007_),
    .Q(\u_timer0.highcount[0] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0930_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net36),
    .D(_0008_),
    .Q(\u_timer0.highcount[1] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0931_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net30),
    .D(_0009_),
    .Q(\u_timer0.highcount[2] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0932_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net30),
    .D(_0010_),
    .Q(\u_timer0.highcount[3] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0933_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net36),
    .D(_0011_),
    .Q(\u_timer0.highcount[4] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0934_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net36),
    .D(_0012_),
    .Q(\u_timer0.highcount[5] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0935_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net26),
    .D(_0013_),
    .Q(\u_timer0.highcount[6] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0936_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net26),
    .D(_0014_),
    .Q(\u_timer0.highcount[7] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0937_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net26),
    .D(_0015_),
    .Q(\u_timer0.highcount[8] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0938_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net26),
    .D(_0016_),
    .Q(\u_timer0.highcount[9] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0939_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net26),
    .D(_0017_),
    .Q(\u_timer0.highcount[10] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0940_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net26),
    .D(_0018_),
    .Q(\u_timer0.highcount[11] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0941_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net28),
    .D(_0019_),
    .Q(\u_timer0.highcount[12] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0942_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net28),
    .D(_0020_),
    .Q(\u_timer0.highcount[13] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0943_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net31),
    .D(_0021_),
    .Q(\u_timer0.highcount[14] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0944_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net31),
    .D(_0022_),
    .Q(\u_timer0.highcount[15] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0945_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net31),
    .D(_0023_),
    .Q(\u_timer0.highcount[16] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0946_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net32),
    .D(_0024_),
    .Q(\u_timer0.highcount[17] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0947_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net32),
    .D(_0025_),
    .Q(\u_timer0.highcount[18] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0948_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net31),
    .D(_0026_),
    .Q(\u_timer0.highcount[19] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0949_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net31),
    .D(_0027_),
    .Q(\u_timer0.highcount[20] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0950_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net32),
    .D(_0028_),
    .Q(\u_timer0.highcount[21] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0951_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net32),
    .D(_0029_),
    .Q(\u_timer0.highcount[22] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0952_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net32),
    .D(_0030_),
    .Q(\u_timer0.highcount[23] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0953_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net32),
    .D(_0031_),
    .Q(\u_timer0.highcount[24] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0954_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net33),
    .D(_0032_),
    .Q(\u_timer0.highcount[25] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0955_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net34),
    .D(_0033_),
    .Q(\u_timer0.highcount[26] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0956_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net34),
    .D(_0034_),
    .Q(\u_timer0.highcount[27] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0957_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net38),
    .D(_0035_),
    .Q(\u_timer0.lowcount[0] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0958_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net38),
    .D(_0036_),
    .Q(\u_timer0.lowcount[1] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0959_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net38),
    .D(_0037_),
    .Q(\u_timer0.lowcount[2] ));
 gf180mcu_as_sc_mcu7t3v3__dfxtp_2 _0960_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net37),
    .D(_0038_),
    .Q(\u_timer0.lowcount[3] ));
 gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 _0961_ (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .CLK(net38),
    .Q(\u_timer0.measuring ),
    .RN(net53),
    .SN(net98),
    .D(_0039_));
 gf180mcu_as_sc_mcu7t3v3__tieh_4 _0961__99 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .ONE(net98));
 gf180mcu_as_sc_mcu7t3v3__clkbuff_12 clkbuf_0_clk_i (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(clk_i),
    .Y(clknet_0_clk_i));
 gf180mcu_as_sc_mcu7t3v3__clkbuff_12 clkbuf_4_0_0_clk_i (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(clknet_0_clk_i),
    .Y(clknet_4_0_0_clk_i));
 gf180mcu_as_sc_mcu7t3v3__clkbuff_12 clkbuf_4_10_0_clk_i (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(clknet_0_clk_i),
    .Y(clknet_4_10_0_clk_i));
 gf180mcu_as_sc_mcu7t3v3__clkbuff_12 clkbuf_4_11_0_clk_i (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(clknet_0_clk_i),
    .Y(clknet_4_11_0_clk_i));
 gf180mcu_as_sc_mcu7t3v3__clkbuff_12 clkbuf_4_12_0_clk_i (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(clknet_0_clk_i),
    .Y(clknet_4_12_0_clk_i));
 gf180mcu_as_sc_mcu7t3v3__clkbuff_12 clkbuf_4_13_0_clk_i (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(clknet_0_clk_i),
    .Y(clknet_4_13_0_clk_i));
 gf180mcu_as_sc_mcu7t3v3__clkbuff_12 clkbuf_4_14_0_clk_i (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(clknet_0_clk_i),
    .Y(clknet_4_14_0_clk_i));
 gf180mcu_as_sc_mcu7t3v3__clkbuff_12 clkbuf_4_15_0_clk_i (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(clknet_0_clk_i),
    .Y(clknet_4_15_0_clk_i));
 gf180mcu_as_sc_mcu7t3v3__clkbuff_12 clkbuf_4_1_0_clk_i (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(clknet_0_clk_i),
    .Y(clknet_4_1_0_clk_i));
 gf180mcu_as_sc_mcu7t3v3__clkbuff_12 clkbuf_4_2_0_clk_i (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(clknet_0_clk_i),
    .Y(clknet_4_2_0_clk_i));
 gf180mcu_as_sc_mcu7t3v3__clkbuff_12 clkbuf_4_3_0_clk_i (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(clknet_0_clk_i),
    .Y(clknet_4_3_0_clk_i));
 gf180mcu_as_sc_mcu7t3v3__clkbuff_12 clkbuf_4_4_0_clk_i (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(clknet_0_clk_i),
    .Y(clknet_4_4_0_clk_i));
 gf180mcu_as_sc_mcu7t3v3__clkbuff_12 clkbuf_4_5_0_clk_i (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(clknet_0_clk_i),
    .Y(clknet_4_5_0_clk_i));
 gf180mcu_as_sc_mcu7t3v3__clkbuff_12 clkbuf_4_6_0_clk_i (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(clknet_0_clk_i),
    .Y(clknet_4_6_0_clk_i));
 gf180mcu_as_sc_mcu7t3v3__clkbuff_12 clkbuf_4_7_0_clk_i (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(clknet_0_clk_i),
    .Y(clknet_4_7_0_clk_i));
 gf180mcu_as_sc_mcu7t3v3__clkbuff_12 clkbuf_4_8_0_clk_i (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(clknet_0_clk_i),
    .Y(clknet_4_8_0_clk_i));
 gf180mcu_as_sc_mcu7t3v3__clkbuff_12 clkbuf_4_9_0_clk_i (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(clknet_0_clk_i),
    .Y(clknet_4_9_0_clk_i));
 gf180mcu_as_sc_mcu7t3v3__clkbuff_4 clkload0 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(clknet_4_3_0_clk_i));
 gf180mcu_as_sc_mcu7t3v3__clkbuff_4 clkload1 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(clknet_4_7_0_clk_i));
 gf180mcu_as_sc_mcu7t3v3__clkbuff_4 clkload2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(clknet_4_11_0_clk_i));
 gf180mcu_as_sc_mcu7t3v3__clkbuff_4 clkload3 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(clknet_4_15_0_clk_i));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout1 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net4),
    .Y(net1));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout10 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net11),
    .Y(net10));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout11 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net14),
    .Y(net11));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout12 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net13),
    .Y(net12));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout13 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net14),
    .Y(net13));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout14 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(_0192_),
    .Y(net14));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout15 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net16),
    .Y(net15));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout16 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(_0191_),
    .Y(net16));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout17 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(_0191_),
    .Y(net17));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout18 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net19),
    .Y(net18));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout19 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(_0191_),
    .Y(net19));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout2 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net3),
    .Y(net2));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout20 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(_0288_),
    .Y(net20));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout21 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net22),
    .Y(net21));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout22 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net23),
    .Y(net22));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout23 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net24),
    .Y(net23));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout24 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(_0291_),
    .Y(net24));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout25 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\s_device.cio_csb_syned ),
    .Y(net25));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout26 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net29),
    .Y(net26));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout27 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net29),
    .Y(net27));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout28 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net29),
    .Y(net28));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout29 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net30),
    .Y(net29));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout3 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net4),
    .Y(net3));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout30 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net39),
    .Y(net30));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout31 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net33),
    .Y(net31));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout32 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net33),
    .Y(net32));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout33 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net39),
    .Y(net33));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout34 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net35),
    .Y(net34));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout35 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net39),
    .Y(net35));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout36 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net39),
    .Y(net36));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout37 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net38),
    .Y(net37));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout38 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net39),
    .Y(net38));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout39 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(\u_timer0.dut.inv[0].in ),
    .Y(net39));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout4 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(_0197_),
    .Y(net4));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout40 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net43),
    .Y(net40));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout42 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net47),
    .Y(net42));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout44 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net46),
    .Y(net44));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout46 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net47),
    .Y(net46));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout47 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net55),
    .Y(net47));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout48 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net55),
    .Y(net48));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout5 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net6),
    .Y(net5));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout50 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net55),
    .Y(net50));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout51 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net54),
    .Y(net51));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout53 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net55),
    .Y(net53));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout55 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(rst_ni),
    .Y(net55));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout56 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net64),
    .Y(net56));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout58 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net64),
    .Y(net58));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout6 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net9),
    .Y(net6));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout60 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net62),
    .Y(net60));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout62 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net64),
    .Y(net62));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout64 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(rst_ni),
    .Y(net64));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout65 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net73),
    .Y(net65));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout67 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net73),
    .Y(net67));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout68 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net73),
    .Y(net68));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout7 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net8),
    .Y(net7));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout70 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net73),
    .Y(net70));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout71 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net73),
    .Y(net71));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout73 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(rst_ni),
    .Y(net73));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout8 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net9),
    .Y(net8));
 gf180mcu_as_sc_mcu7t3v3__buff_2 fanout9 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(_0193_),
    .Y(net9));
 gf180mcu_as_sc_mcu7t3v3__clkbuff_8 load_slew41 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net40),
    .Y(net41));
 gf180mcu_as_sc_mcu7t3v3__buff_8 load_slew43 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net42),
    .Y(net43));
 gf180mcu_as_sc_mcu7t3v3__buff_8 load_slew45 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net44),
    .Y(net45));
 gf180mcu_as_sc_mcu7t3v3__buff_8 load_slew49 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net48),
    .Y(net49));
 gf180mcu_as_sc_mcu7t3v3__buff_8 load_slew52 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net51),
    .Y(net52));
 gf180mcu_as_sc_mcu7t3v3__buff_8 load_slew54 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net53),
    .Y(net54));
 gf180mcu_as_sc_mcu7t3v3__clkbuff_8 load_slew57 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net56),
    .Y(net57));
 gf180mcu_as_sc_mcu7t3v3__buff_8 load_slew59 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net58),
    .Y(net59));
 gf180mcu_as_sc_mcu7t3v3__buff_8 load_slew61 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net60),
    .Y(net61));
 gf180mcu_as_sc_mcu7t3v3__buff_8 load_slew63 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net62),
    .Y(net63));
 gf180mcu_as_sc_mcu7t3v3__buff_8 load_slew66 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net65),
    .Y(net66));
 gf180mcu_as_sc_mcu7t3v3__buff_8 load_slew69 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net68),
    .Y(net69));
 gf180mcu_as_sc_mcu7t3v3__buff_8 load_slew72 (.VDD(VDD),
    .VNW(VDD),
    .VPW(VSS),
    .VSS(VSS),
    .A(net71),
    .Y(net72));
endmodule
