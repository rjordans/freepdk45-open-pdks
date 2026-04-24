## Caution this repository is a work-in-progress and is based on collected bits and pieces from other projects

A copy of the FreePDK 45nm library, adapted to the structure used for the sky130, gf180, and ihp-sg13g2 PDKs

This material has been collected from several sources:

 - The OpenROAD-flow-scripts repository: https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts
 - LaurentC's updates to the klayout scripts: https://github.com/laurentc2/FreePDK45_for_KLayout
 - Teddy-van-Jerry's ngspice models from: https://github.com/Teddy-van-Jerry/ngspice-cmos/tree/master
 - Netgen configuration based on qflow: https://github.com/RTimothyEdwards/qflow/tree/master/tech/gscl45nm

## Known issues

 - The DRC rule for POLY.3 was reduced from 55nm to 50nm in this PDK to match with the standard cell implementations in the Nangate45 library.
