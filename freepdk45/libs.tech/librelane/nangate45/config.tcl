set current_folder [file dirname [file normalize [info script]]]

# Technology lib
set ::env(LIB) [dict create]
dict set ::env(LIB) nom_typ_1p10V_25C "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env(STD_CELL_LIBRARY)/lib/NangateOpenCellLibrary_typical.lib"

# Corners
set ::env(STA_CORNERS) "\
nom_typ_1p10V_25C \
"

set ::env(DEFAULT_CORNER) "nom_typ_1p10V_25C"

set ::env(TIMING_VIOLATION_CORNERS) "*typ*"

# Synthesis mapping
 # Latch mapping
set ::env(SYNTH_LATCH_MAP) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/librelane/$::env(STD_CELL_LIBRARY)/cells_latch.v"

 # Adder mapping
set ::env(SYNTH_FA_MAP) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/librelane/$::env(STD_CELL_LIBRARY)/cells_adders.v"

 # Clock gate mapping
set ::env(SYNTH_CLKGATE_MAP) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/librelane/$::env(STD_CELL_LIBRARY)/cells_clkgate.v"

 # MUX4 mapping
#set ::env(SYNTH_MUX4_MAP) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/librelane/$::env(STD_CELL_LIBRARY)/cells_mux.v"

 # MUX2 mapping
#set ::env(SYNTH_MUX_MAP) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/librelane/$::env(STD_CELL_LIBRARY)/mux2_map.v"

# Tri-state buffer mapping
#set ::env(SYNTH_TRISTATE_MAP) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/librelane/$::env(STD_CELL_LIBRARY)/tribuff_map.v"

# Placement site for core cells
# This can be found in the technology lef
set ::env(PLACE_SITE) "FreePDK45_38x28_10R_NP_162NW_34O"
set ::env(PLACE_SITE_WIDTH) 0.19
set ::env(PLACE_SITE_HEIGHT) 1.4

# Welltap and endcap cells
# There are no endcap cells in nangate45
set ::env(WELLTAP_CELL) "TAPCELL_X1"
#set ::env(ENDCAP_CELL) ""

# defaults (can be overridden by designs):
set ::env(SYNTH_DRIVING_CELL) "BUF_X4"
set ::env(SYNTH_DRIVING_CELL_PIN) "Z"
set ::env(OUTPUT_CAP_LOAD) "4.0"
set ::env(SYNTH_MIN_BUF_PORT) "BUF_X1 A Z"
set ::env(SYNTH_TIEHI_PORT) "LOGIC1_X1 Z"
set ::env(SYNTH_TIELO_PORT) "LOGIC0_X1 Z"

# Fillcell insertion
set ::env(FILL_CELLS) "FILLCELL_*"
# No decap cells provided in nangate45...
#set ::env(DECAP_CELLS) "DECAP_*"
set ::env(DECAP_CELLS) ""

# Diode insertion
set ::env(DIODE_CELL) "ANTENNA_X1"

set ::env(GPL_CELL_PADDING) {0}
set ::env(DPL_CELL_PADDING) {0}

#set ::env(CELL_PAD_EXCLUDE) "FILLCELL_* DECAP_*"
set ::env(CELL_PAD_EXCLUDE) "FILLCELL_*"


# CTS
# Buffer selection still needs some work
# There were situations where only the largest buffer was used
# Ultimately, OpenROAD should select the buffers automatically
set ::env(CTS_ROOT_BUFFER) CLKBUF_X3
set ::env(CTS_CLK_BUFFERS) "BUF_X* CLKBUF_*"
set ::env(CTS_CLK_BUFFERS) "CLKBUF_*"


# FIXME: A bit random ...
set ::env(MAX_FANOUT_CONSTRAINT) 10
set ::env(CLOCK_UNCERTAINTY_CONSTRAINT) 0.05
set ::env(CLOCK_TRANSITION_CONSTRAINT) 0.02
set ::env(TIME_DERATING_CONSTRAINT) 5
set ::env(IO_DELAY_CONSTRAINT) 20

# Tristate cells
set ::env(TRISTATE_CELLS) "TBUF_* TINV_X1 TLAT_X1"

# TODO adjust threshold
set ::env(HEURISTIC_ANTENNA_THRESHOLD) 90
