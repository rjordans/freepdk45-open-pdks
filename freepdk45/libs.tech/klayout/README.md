# FreePDK45_for_KLayout

## KLayout (version 0.27 or higher) technology files for FreePDK45

Based on the code by laurentc2 at https://github.com/laurentc2/FreePDK45_for_KLayout

Adapted for OpenPDK style by r.jordans

## Setup

```
export PDK=freepdk45

export KLAYOUT_HOME=$HOME/.klayout
export KLAYOUT_PATH=$KLAYOUT_HOME:$PDK_ROOT/$PDK/libs.tech/klayout
```

## INV test case

Copy the examples directory in your usual working area. You can run DRC and LVS on any of the cells : **INV**, **DBLE_INV_SPLIT**, **DBLE_INV_MERGE**.
