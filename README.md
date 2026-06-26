## Caution this repository is a work-in-progress and is based on collected bits and pieces from other projects

A copy of the FreePDK 45nm library, adapted to the structure used for the sky130, gf180, and ihp-sg13g2 PDKs

This material has been collected from several sources:

 - The OpenROAD-flow-scripts repository: https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts
 - LaurentC's updates to the klayout scripts: https://github.com/laurentc2/FreePDK45_for_KLayout
 - Teddy-van-Jerry's ngspice models from: https://github.com/Teddy-van-Jerry/ngspice-cmos/tree/master
 - Netgen configuration based on qflow: https://github.com/RTimothyEdwards/qflow/tree/master/tech/gscl45nm

## Known issues

 - The DRC rule for POLY.3 was reduced from 55nm to 50nm in this PDK to match with the standard cell implementations in the Nangate45 library.
 - The default value for the `PL_RESIZE_HOLD_SLACK_MARGIN` of LibreLane does not work well with this PDK and needs to be overridden.  A improved value has been added to the LibreLane configuration file but is not being picked up there.
 - LibreLane will report XOR errors for via1 and metal2 layers, klayout streamout has the via placement misaligned compared to streamout via magic.
 - The memory macros from the fakeram library are missing a proper GDS view.  The provided GDS views have been generated based on the exising LEF files.  Using these files is likely to result in antenna violations during the DRC check.

## Example config

The LibreLane example `spm` can be synthesized by adding the following PDK specific options:

```
pdk::freepdk45:
  CLOCK_PERIOD: 1
  FP_CORE_UTIL: 50
  PL_TARGET_DENSITY: 0.6
  PL_RESIZER_HOLD_MAX_BUFFER_PCT: 100
  PL_RESIZER_HOLD_SLACK_MARGIN: 0.05
```
