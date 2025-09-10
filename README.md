# 2 Stage CMOS Op Amp
This project is to create a simple 2 stage CMOS Op Amp with Miller compensation with the SKY130 PDK. This will be the first time I have ever designed an IC, and will also serve as a more or less introductory project into analog electronics.

### Calculations
The calculations I have done to obtain the values of the components is shown in "calculations.xlsx"

### mag
ttsky25a-opamp is the folder that will go into the github. The mag folder under ttsky25a-opamp contains all the magic files for this project, as well as the manufacturing files.

### xschem
this contains all the xschem files used for this project, including the testbenches pre and post-layout.

### test
this contains all the different tests I ran for this project. Within it, it has its own README so please read that for more details as well. This folder contains all the testbench details, and data collected for each test, as well as the results and the processing scripts.

# Workflow
This will serve as a recording, as well as a rough guide to design an IC with the SKY130 PDK. I will not go through in detail how to use xschem, ngspice, magic, as their commands and workflows are well documented online. I will instead be going through some of the small important things and issues to take note of, as well as links to the tutorials/resources I used.

This will not however, cover how to install the SKY130 PDK. There are many, many online guides on how to do so.

## schematic
Once you've installed the SKY130 PDK, there should be a folder called iic-osic-tools. Open a terminal within this folder and run the startup bash script. This is done by the following command:
```Bash
./start_x.sh
```
This will then open a terminal within the directory /foss/designs/. To open xschem or magic from here, simply type 'xschem' or 'magic' into this terminal.

Once in xschem, all projects are saved by default under the directory /eda/designs/. This is the same as /foss/designs/ and is outside the iic-osic-tools folder.

Using xschem itself it pretty straightforward. However there are a few things to take note of:
- To use devices which we have full autonomy over, and can freely change its parameters, use the sky130 [device models](https://skywater-pdk.readthedocs.io/en/main/rules/device-details.html).

## pre-layout simulation
For simulations. ngspice is built into xschem so you do not need to open a separate app for this. Instead, go to simulation->simulation configuration and select ngspice interactive. Go to options -> netlist format and select spice netlist.

Then we can run simulations. For the simulation script:
1. insert the symbol code.sym.
2. under its value, add the line ".lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt". This will add all the sky130 models into our schematic

To run the simulation, click on 'netlist' then click on 'simulate'

Then, familiarise yourself with the ngspice syntax to make your life easier.

<b>References:</b>
- [xschem ngspice AC analysis tutorial](https://www.youtube.com/watch?v=dhGIm_x1_pI&t=446s&pp=ygUXeHNjaGVtIG5nc3BpY2UgdHV0b3JpYWw%3D) (I basically used his whole channel as a tutorial)
- [xschem ngspice nested dc sweep tutorial](https://www.youtube.com/watch?v=TMdQshczLFs&list=WL&index=3&t=1075s&pp=gAQBiAQB)
- [ngspice user manual](https://ngspice.sourceforge.io/docs/ngspice-manual.pdf)

## layout
For layout, we can actually import all the transistor details into magic without having to construct them from scratch myself.

First, we need to export our xschem as a spice file. Go to simulation->set netlist dir to set the directory you want to export the spice file into. Then go to simulation->LVS and select "Top level is a .subckt". Then click on netlist to export the schematic as a spice file.

Then we import it into magic. Go to magic, select file->import SPICE and select the spice file. Save the file by clicking on file->save then selecting the autowrite function. This will save the top level (which will be the whole circuit) as a .mag file, but also saves each transistor as its own .mag file. When you open the file again, simply open the top level mag file, then select the instances of transistors and pressing on ctrl+x to view the device innards.



<b>References:</b>
- [efabless layout](https://www.youtube.com/watch?v=XvBpqKwzrFY&pp=ygUXeHNjaGVtIG5nc3BpY2UgdHV0b3JpYWw%3D) (I used this for the whole layout, but not for the post layout sim)
- [psychogenic tech layout](https://www.youtube.com/watch?v=caXwuuXSB-A&t=5429s&pp=ygUXeHNjaGVtIG5nc3BpY2UgdHV0b3JpYWw%3D) (I used this for the post layout sim, although the whole video is worth a look as well)

## post layout simulation
Under the mag folder there is a file called parax.tcl

This contains a function which when run, will add the parasitic components of the layout to the spice file, and output a new spice file, this time with parasitics factored in. I copied this file wholesale from the video in the references of this section.

To run this function, go to magic, and in its command line, go to the directory housing this .tcl file. Then simply run the following command
```Bash
source parax.tcl
```
This adds the function parax_xtract to magic. Then we call this function by typing it into the terminal. This should add a bunch of new files into the directory we are under, one of which is the new .sim.spice file. If we then look at this new .sim.spice file, we'll see a bunch of new capacitances and resistances added.

Now to simulate this, create another duplicate testbench. Then under the properties of the op amp symbol add the following line
```Bash
schematic=2stageCMOSOpAmp_parax.sim
spice_sym_def="tcleval(.include [file normalize ...])"
tclcommand="textwindow [file normalize ...]"}
```
Where ```...``` is meant to symbolise the file path for the new .sim.spice file.

If this works, when you ctr+click on the symbol it should show the contents of the .sim.spice file.

For whatever reason when I first tried it, the .sim.spice file that showed up when I ctr+click had an extra "s" in front of the filename. Instead of ```.subckt 2stageCMOSOpAmp_parax ....```, it was ```.subckt s2stageCMOSOpAmp_parax ....``` and I had to manually edit this for it to work.

<b>References:</b>
- [psychogenic tech layout](https://www.youtube.com/watch?v=caXwuuXSB-A&t=5429s&pp=ygUXeHNjaGVtIG5nc3BpY2UgdHV0b3JpYWw%3D) (I used this for the post layout sim, although the whole video is worth a look as well)

## manufacturing file
To get the manufacturing file, simply use the following command
```Bash
gds write filename.gds
```
The manufacturing file will then be created by magic. One can then utilise Klayout to view the .gds file and verify its make.

## Sky130 submission
Uploaded the GDS file --> needs to be named correctly --> tt_um_..
GDS file triggered a pin error because one of my pins had been unknowingly been moved 10nm to the left (discovered that with the help of the TT discord and by measuring the distance between pins)

Documentation action error because info.md and project.v needs to be updated. The module name in project.v needs to match the name of your project