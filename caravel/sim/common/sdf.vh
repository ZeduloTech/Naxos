`ifdef ENABLE_SDF
initial begin
    $sdf_annotate({`FINAL_PREFIX, "/sdf/nom_tt_025C_5v00/chip_top__nom_tt_025C_5v00.sdf"}, `CHIP_TOP_HIER );
    $sdf_annotate({`CARAVEL_FINAL_PREFIX, "/sdf/nom_tt_025C_5v00/caravel_core__nom_tt_025C_5v00.sdf"}, `CHIP_TOP_HIER.\i_chip_core.caravel );
    $sdf_annotate({`OSC_FINAL_PREFIX, "/sdf/nom_tt_025C_5v00/ring_osc2x13__nom_tt_025C_5v00.sdf"}, `CHIP_TOP_HIER.\i_chip_core.caravel .\pll.ringosc );
end
`endif
