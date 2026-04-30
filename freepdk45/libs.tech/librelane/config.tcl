# Process node
set ::env(PROCESS) 45
set ::env(DEF_UNITS_PER_MICRON) 1000

if { ![info exist ::env(STD_CELL_LIBRARY)] } {
	set ::env(STD_CELL_LIBRARY) nangate45
}

# Tools
set ::env(PRIMARY_GDSII_STREAMOUT_TOOL) "magic"

# Placement site for core cells
# This can be found in the technology lef
set ::env(VDD_PIN) "VDD"
set ::env(GND_PIN) "VSS"

set ::env(VDD_PIN_VOLTAGE) "1.10"
set ::env(GND_PIN_VOLTAGE) "0.00"

set ::env(SCL_POWER_PINS) "VDD"
set ::env(SCL_GROUND_PINS) "VSS"

# Technology LEF
set ::env(TECH_LEF) "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env(STD_CELL_LIBRARY)/lef/NangateOpenCellLibrary.tech.lef"
set ::env(TECH_LEF_MIN) "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env(STD_CELL_LIBRARY)/lef/NangateOpenCellLibrary.tech.lef"
set ::env(TECH_LEF_MAX) "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env(STD_CELL_LIBRARY)/lef/NangateOpenCellLibrary.tech.lef"

# Standard cells
set ::env(CELL_LEFS) "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env(STD_CELL_LIBRARY)/lef/NangateOpenCellLibrary.macro.lef"
set ::env(CELL_GDS) "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env(STD_CELL_LIBRARY)/gds/NangateOpenCellLibrary.gds"
#set ::env(CELL_VERILOG_MODELS) "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env(STD_CELL_LIBRARY)/verilog/NangateOpenCellLibrary.v"
#set ::env(CELL_SPICE_MODELS) "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env(STD_CELL_LIBRARY)/spice/NangateOpenCellLibrary.spice"
set ::env(CELL_SPICE_MODELS) "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env(STD_CELL_LIBRARY)/cdl/NangateOpenCellLibrary.cdl"
set ::env(CELL_CDLS) "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env(STD_CELL_LIBRARY)/cdl/NangateOpenCellLibrary.cdl"

# GPIO Pads
#set ::env(GPIO_PADS_LEF) "\
#	$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env{IO_LIBRARY}/lef/$::env{IO_LIBRARY}.lef\
#"

#set ::env(GPIO_PADS_VERILOG) "\
#	$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env{IO_LIBRARY}/verilog/$::env{IO_LIBRARY}.v
#"

## magic setup
set ::env(MAGICRC) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/magic/freepdk45.magicrc"
set ::env(MAGIC_TECH) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/magic/freepdk45.tech"

# Klayout setup
set ::env(KLAYOUT_TECH) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/klayout/tech/freepdk45/freepdk45.lyt"
set ::env(KLAYOUT_PROPERTIES) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/klayout/tech/freepdk45/freepdk45.lyp"
set ::env(KLAYOUT_DEF_LAYER_MAP) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/klayout/tech/freepdk45/freepdk45.map"
set ::env(KLAYOUT_DRC_RUNSET) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/klayout/tech/freepdk45/drc/drc_freepdk45.lydrc"
set ::env(KLAYOUT_LVS_SCRIPT) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/klayout/tech/freepdk45/lvs/lvs_freepdk45.lvs"

# netgen setup
set ::env(NETGEN_SETUP) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/netgen/freepdk45_setup.tcl"

# Tap cells
set ::env(FP_TAPCELL_DIST) 120

# Tracks info
set ::env(FP_TRACKS_INFO) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/librelane/$::env(STD_CELL_LIBRARY)/tracks.info"

# Default Synth Exclude List
set ::env(SYNTH_EXCLUDED_CELL_FILE) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/librelane/$::env(STD_CELL_LIBRARY)/synth_exclude.cells"

# Default PNR Exclude List
set ::env(PNR_EXCLUDED_CELL_FILE) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/librelane/$::env(STD_CELL_LIBRARY)/pnr_exclude.cells"

## DRC Exclude List for Optimization library
#set ::env(DRC_EXCLUDE_CELL_LIST_OPT) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/librelane/$::env(STD_CELL_LIBRARY_OPT)/drc_exclude.cells"

# Open-RCX Rules File
set ::env(RCX_RULES) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/librelane/rcx_patterns.rules"
#set ::env(RCX_RULES_MIN) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/librelane/rules.openrcx.$::env(PDK).min.spef_extractor"
#set ::env(RCX_RULES_MAX) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/librelane/rules.openrcx.$::env(PDK).max.spef_extractor"

# PDN
# Extra PDN configs
set ::env(PDN_RAIL_WIDTH) 0.17
set ::env(PDN_RAIL_LAYER) metal1
set ::env(PDN_RAIL_OFFSET) 0

set ::env(PDN_VERTICAL_LAYER) metal4
set ::env(PDN_HORIZONTAL_LAYER) metal7

set ::env(PDN_VWIDTH) 0.48
set ::env(PDN_VSPACING) 2.0
set ::env(PDN_VPITCH) 56.0
set ::env(PDN_VOFFSET) 2.0

set ::env(PDN_HWIDTH) 1.40
set ::env(PDN_HSPACING) 2.0
set ::env(PDN_HPITCH) 30.0
set ::env(PDN_HOFFSET) 2.0


# Core Ring PDN defaults
set ::env(PDN_CORE_RING_VWIDTH) 0.93
set ::env(PDN_CORE_RING_HWIDTH) 0.93
set ::env(PDN_CORE_RING_VSPACING) 1.0
set ::env(PDN_CORE_RING_HSPACING) 1.0
set ::env(PDN_CORE_RING_VOFFSET) 2.0
set ::env(PDN_CORE_RING_HOFFSET) 2.0

# PDN Macro blockages list
set ::env(MACRO_BLOCKAGES_LAYER) "metal1 metal2 metal3 metal4 metal5 "

# I/O Layer info
set ::env(IO_PIN_H_LAYER) "metal5"
set ::env(IO_PIN_V_LAYER) "metal6"

# Routing Layer Info
set ::env(GRT_LAYER_ADJUSTMENTS) "0.00,0.00,0.00,0.00,0.00,0.00,0.00"

set ::env(RT_MIN_LAYER) "metal2"
set ::env(RT_MAX_LAYER) "metal10"

set ::env(RT_CLOCK_MIN_LAYER) "metal4"

## CVC
#set ::env(CVC_SCRIPTS_DIR) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/librelane/cvc"
