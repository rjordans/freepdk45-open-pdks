v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 320 -260 320 -230 {lab=VDD}
N 320 -230 320 -200 {lab=VDD}
N 320 -170 320 -140 {lab=out}
N 320 -110 320 -40 {lab=GND}
N 260 -110 280 -110 {lab=in}
N 260 -200 260 -110 {lab=in}
N 260 -200 280 -200 {lab=in}
N 80 -150 80 -130 {lab=in}
N 80 -150 260 -150 {lab=in}
N 320 -150 370 -150 {lab=out}
C {pmos4.sym} 300 -200 0 0 {name=M1 model=pmos_vtg w=150n l=50n del=0 m=1}
C {nmos4.sym} 300 -110 0 0 {name=M2 model=nmos_vtg w=90n l=50n del=0 m=1}
C {simulator_commands_shown.sym} 470 -280 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value=".lib freepdk45.lib tt
.save all
.tran 5p 10n
"}
C {vdd.sym} 320 -260 0 0 {name=l1 lab=VDD}
C {vsource.sym} 80 -100 0 0 {name=Vin value="pulse(0 1.1 1n 0.1n 0.1n 2n 4n)"  savecurrent=false}
C {gnd.sym} 320 -40 0 0 {name=l2 lab=GND}
C {gnd.sym} 80 -70 0 0 {name=l3 lab=GND}
C {lab_pin.sym} 80 -150 0 0 {name=p1 sig_type=std_logic lab=in}
C {lab_pin.sym} 370 -150 0 1 {name=p2 sig_type=std_logic lab=out}
C {vsource.sym} 80 -260 0 0 {name=Vdd value=1.1  savecurrent=false}
C {gnd.sym} 80 -230 0 0 {name=l4 lab=GND}
C {vdd.sym} 80 -290 0 0 {name=l5 lab=VDD}
