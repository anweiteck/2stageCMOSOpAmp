proc parax_xtract {} {
	set project [cellname list self]
	flatten tt_um_flat
	load tt_um_flat
	select top cell
	cellname delete $project
	cellname rename tt_um_flat ${project}_parax
	puts "flattened to ${project}_parax...doing extractions"
	extract all
	ext2sim labels on
	ext2sim
	extresist tolerance 10
	extresist
	ext2spice lvs
	ext2spice cthresh 0
	ext2spice extresist on
	ext2spice
	ext2spice -d -o $project.sim.spice
	cellname delete ${project}_parax
	load $project.mag
	puts "Parax now in $project.sim.spice"
}

puts "parax_xtract function loaded"
