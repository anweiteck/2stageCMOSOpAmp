v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 310 90 310 150 {lab=#net1}
N 310 90 370 90 {lab=#net1}
N 390 30 390 90 {lab=#net1}
N 370 90 390 90 {lab=#net1}
N 220 90 310 90 {lab=#net1}
N 220 30 220 90 {lab=#net1}
N 390 -140 390 -30 {lab=#net2}
N 220 -140 220 -30 {lab=#net3}
N 260 -170 350 -170 {lab=#net3}
N 220 -140 300 -140 {lab=#net3}
N 300 -170 300 -140 {lab=#net3}
N 220 -220 220 -200 {lab=VDD}
N 220 -220 240 -220 {lab=VDD}
N 240 -220 390 -220 {lab=VDD}
N 390 -220 390 -200 {lab=VDD}
N 700 -140 700 140 {lab=Vout}
N 390 -100 520 -100 {lab=#net2}
N 580 -100 700 -100 {lab=Vout}
N 490 -170 660 -170 {lab=#net2}
N 490 -170 490 -100 {lab=#net2}
N 700 -210 700 -200 {lab=VDD}
N 390 -220 700 -220 {lab=VDD}
N 700 -220 700 -210 {lab=VDD}
N 40 180 270 180 {lab=Ibias}
N -0 210 -0 230 {lab=VSS}
N -0 230 10 230 {lab=VSS}
N 10 230 310 230 {lab=VSS}
N 310 210 310 230 {lab=VSS}
N 310 230 700 230 {lab=VSS}
N 700 200 700 230 {lab=VSS}
N 260 170 260 180 {lab=Ibias}
N 310 230 310 250 {lab=VSS}
N 390 -230 390 -220 {lab=VDD}
N -0 140 60 140 {lab=Ibias}
N 60 140 60 180 {lab=Ibias}
N 700 -100 720 -100 {lab=Vout}
N 430 0 450 -0 {lab=V+}
N 160 -0 180 -0 {lab=V-}
N 390 -170 420 -170 {lab=VDD}
N 420 -190 420 -170 {lab=VDD}
N 390 -210 420 -210 {lab=VDD}
N 420 -210 420 -190 {lab=VDD}
N 200 -170 220 -170 {lab=VDD}
N 200 -180 200 -170 {lab=VDD}
N 200 -210 200 -180 {lab=VDD}
N 200 -210 220 -210 {lab=VDD}
N 320 180 320 210 {lab=VSS}
N 320 210 320 220 {lab=VSS}
N 310 220 320 220 {lab=VSS}
N 720 170 720 210 {lab=VSS}
N 700 210 720 210 {lab=VSS}
N -20 180 -20 220 {lab=VSS}
N -20 220 -0 220 {lab=VSS}
N 700 -170 720 -170 {lab=VDD}
N 720 -180 720 -170 {lab=VDD}
N 720 -200 720 -180 {lab=VDD}
N 700 -210 720 -210 {lab=VDD}
N 720 -210 720 -200 {lab=VDD}
N -0 90 0 140 {lab=Ibias}
N -0 140 0 150 {lab=Ibias}
N 720 -100 800 -100 {lab=Vout}
N 800 -100 840 -100 {lab=Vout}
N 370 -10 400 -10 {lab=VSS}
N 210 -10 240 -10 {lab=VSS}
N 300 170 320 170 {lab=VSS}
N 320 170 320 180 {lab=VSS}
N 260 160 260 170 {lab=Ibias}
N 260 160 660 160 {lab=Ibias}
N 660 160 660 170 {lab=Ibias}
N -20 170 -20 180 {lab=VSS}
N -20 170 10 170 {lab=VSS}
N 720 160 720 170 {lab=VSS}
N 690 160 720 160 {lab=VSS}
N 800 -100 800 -80 {lab=Vout}
N 800 -20 800 230 {lab=VSS}
N 700 230 800 230 {lab=VSS}
C {capa.sym} 550 -100 3 0 {name=C1
m=1
value=0.8p
footprint=1206
device="ceramic capacitor"}
C {ipin.sym} 390 -230 1 0 {name=p1 lab=VDD}
C {ipin.sym} 310 250 3 0 {name=p2 lab=VSS}
C {opin.sym} 840 -100 0 0 {name=p4 lab=Vout}
C {ipin.sym} 450 0 0 1 {name=p5 lab=V+
}
C {ipin.sym} 160 0 0 0 {name=p6 lab=V-}
C {lab_pin.sym} 240 -10 0 1 {name=p7 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 370 -10 0 0 {name=p8 sig_type=std_logic lab=VSS}
C {capa.sym} 800 -50 2 0 {name=C2
m=1
value=2p
footprint=1206
device="ceramic capacitor"}
C {sky130_fd_pr/nfet3_01v8.sym} 200 0 0 0 {name=M1
W=1
L=2.5
body=VSS
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet3_01v8.sym} 410 0 0 1 {name=M2
W=1
L=2.5
body=VSS
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 240 -170 0 1 {name=M3
W=1
L=2.5
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 370 -170 0 0 {name=M4
W=1
L=2.5
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 680 -170 0 0 {name=M6
W=20
L=2.5
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet3_01v8.sym} 290 180 0 0 {name=M5
W=0.5
L=2.5
body=VSS
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet3_01v8.sym} 20 180 0 1 {name=M8
W=0.5
L=2.5
body=VSS
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet3_01v8.sym} 680 170 0 0 {name=M7
W=5
L=2.5
body=VSS
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {ipin.sym} 0 90 3 1 {name=p3 lab=Ibias
}
