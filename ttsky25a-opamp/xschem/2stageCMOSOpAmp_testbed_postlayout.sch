v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -690 -100 -660 -100 {lab=#net1}
N -690 -110 -690 -100 {lab=#net1}
N -500 -100 -440 -100 {lab=#net2}
N -500 -110 -500 -100 {lab=#net2}
N -440 -110 -440 -100 {lab=#net2}
N -305 -15 -290 -15 {lab=V+}
N -305 15 -290 15 {lab=Vout}
N -170 0 -145 0 {lab=Vout}
N -170 0 -170 110 {lab=Vout}
N -305 110 -270 110 {lab=Vout}
N -305 15 -305 110 {lab=Vout}
N -210 110 -170 110 {lab=Vout}
N -185 0 -170 0 {lab=Vout}
N -630 -110 -630 -100 {lab=GND}
N -270 110 -210 110 {lab=Vout}
C {vsource.sym} -700 100 0 0 {name=V1 value="\{VDD\}" savecurrent=false}
C {ipin.sym} -630 70 3 1 {name=p9 lab=VSS}
C {ipin.sym} -700 70 1 0 {name=p10 lab=VDD}
C {gnd.sym} -700 130 0 0 {name=l1 lab=GND}
C {code.sym} -275 -260 0 0 {name=s1 only_toplevel=false 
value= "

.lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.param CM=0.8 VDD=1.8 amp=1m f=10k
*.tran 1u 10m
.ac dec 20 1 1e12
*.save all

.control
run
*plot vout
plot db(vout/v(v+)) 
*plot 180*cph(vout)/pi
*set wr_singlescale
*set wr_vecnames
*wrdata /foss/designs/2stageCMOSOpAmp/sim_data_postlayout/GainvsFreq/gain(max).txt db(vout/v(v+))
*wrdata /foss/designs/2stageCMOSOpAmp/sim_data_postlayout/sample_waves/a1.3m_f10k_gain700.txt vout
*wrdata /foss/designs/2stageCMOSOpAmp/sim_data_postlayout/SR/SR.txt vout

.endc
"}
C {vsource.sym} -630 100 0 0 {name=V4 value="\{-VDD\}" savecurrent=false}
C {gnd.sym} -630 130 0 0 {name=l4 lab=GND}
C {vsource.sym} -630 -140 0 0 {name=V6 value="0 AC \{amp\}" savecurrent=false}
C {gnd.sym} -660 -40 0 0 {name=l6 lab=GND
value="0 AC 1"}
C {vsource.sym} -690 -140 2 0 {name=V7 value="0 AC \{amp\}" savecurrent=false}
C {vsource.sym} -660 -70 0 0 {name=V8 value="\{CM\}" savecurrent=false}
C {vsource.sym} -440 -140 0 0 {name=V2 value="SIN(0 \{amp\} \{f\})" savecurrent=false}
C {gnd.sym} -470 -40 0 0 {name=l7 lab=GND
value=c}
C {vsource.sym} -500 -140 2 0 {name=V3 value="0" savecurrent=false
}
C {vsource.sym} -470 -70 0 0 {name=V11 value="\{CM\}" savecurrent=false}
C {/foss/designs/2stageCMOSOpAmp/ttsky25a-opamp/xschem/2stageCMOSOpAmp.sym} -260 0 0 0 {name=X1
schematic=2stageCMOSOpAmp_parax.sim
spice_sym_def="tcleval(.include [file normalize /foss/designs/2stageCMOSOpAmp/ttsky25a-opamp/mag/2stageCMOSOpAmp.sim.spice])"
tclcommand="textwindow [file normalize /foss/designs/2stageCMOSOpAmp/ttsky25a-opamp/mag/2stageCMOSOpAmp.sim.spice]"}
C {ipin.sym} -235 40 1 1 {name=p1 lab=VSS}
C {ipin.sym} -235 -40 1 0 {name=p2 lab=VDD}
C {ipin.sym} -305 -15 2 1 {name=p4 lab=V+
}
C {opin.sym} -150 0 0 0 {name=p5 lab=Vout}
C {ipin.sym} -225 -25 2 0 {name=p7 lab=Ibias}
C {isource.sym} -510 100 0 0 {name=I0 value=8u}
C {ipin.sym} -510 70 1 0 {name=p8 lab=VDD}
C {ipin.sym} -510 130 3 0 {name=p11 lab=Ibias}
C {gnd.sym} -630 -100 0 0 {name=l2 lab=GND
value="0 AC 1"}
C {gnd.sym} -305 185 0 0 {name=l3 lab=GND
value=c}
C {res.sym} -305 155 2 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {vsource.sym} -820 -120 0 1 {name=V5 value="PULSE(0 1 0 1n 1n 1m 2m)" savecurrent=false}
C {gnd.sym} -820 -90 0 0 {name=l5 lab=GND
value="0 AC 1"}
C {capa.sym} -170 140 0 0 {name=C1
m=1
value=2p
footprint=1206
device="ceramic capacitor"}
C {ipin.sym} -170 170 1 1 {name=p3 lab=VSS}
C {ipin.sym} -690 -170 1 0 {name=p12 lab=V-}
C {ipin.sym} -630 -170 3 1 {name=p13 lab=V+
}
