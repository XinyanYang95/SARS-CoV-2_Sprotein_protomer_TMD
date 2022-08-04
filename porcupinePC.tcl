package provide color_scale_bar 1.0

#procedure to draw an arrow from $start to $end
proc vmd_draw_arrow {{mol} {start} {end} {res} {radius}} { 
	return [graphics $mol cone $start $end radius [expr $radius * 1.7] resolution $res ]
}


proc readData {{filename} {scale}} {
    set result {}
    set f [open $filename r]
    foreach line [split [read $f] \n] {
    	set thisline {}
    	lappend thisline [expr $scale*[lindex $line 0]] [expr $scale*[lindex $line 1]] [expr $scale*[lindex $line 2]]
        lappend result $thisline
    }
    return $result
}


proc porcupinePC {{mol top} {PCvecfile "PSA_pkl/PC.txt"} {selatom "protein and name CA"} {scalevec 100} {res 10} {radius 0.5}} {
	set sel [atomselect $mol $selatom]
	set coords [$sel get {x y z}]
	# PCvecfile ends without blank row ('\n')
	set PCvec [readData $PCvecfile $scalevec]

	# select PCvec due to selatom
	set residset [$sel get resid]
	set PCvecsub {}
	foreach rr $residset {
		lappend PCvecsub [lindex $PCvec [expr $rr-1]]
	}

	# calc all vec distances
	set vecone [lindex $PCvecsub 0]
	set mindist [veclength $vecone]
	set maxdist [veclength $vecone]
	foreach vecs $PCvecsub {
		set dist [veclength $vecs]
		if {$dist > $maxdist} {
			set maxdist $dist
		}
		if {$dist < $mindist} {
			set mindist $dist
		}
	}
	set distRange [expr $maxdist- $mindist]

	# color setting
	set minColor 32
	set maxColor 1056
	set NrColors [expr $maxColor- $minColor]
	set colorScheme BGR
	color scale method $colorScheme
	color scale min 0
	color scale max 1
	color scale midpoint 0.5
	set minColor [expr [colorinfo num]]
	set maxColor [expr [colorinfo max] - 1]
	set NrColors [expr $maxColor- $minColor- 1]

	set rid 0
	foreach atom1 $coords {
		set vec1 [lindex $PCvecsub $rid]
		set dist [veclength $vec1]
		set distcolor [expr int(double($NrColors) * double($dist - $mindist) / double($distRange))]
			if {$distcolor < 0} {
				set distcolor 0
			} elseif {$distcolor >= $NrColors} {
				set distcolor [expr $NrColors - 1]
			}
		draw color [expr $minColor + $distcolor]
		vmd_draw_arrow $mol $atom1 [vecsub $atom1 $vec1] $res $radius
		incr rid
	}
	ColorScaleBar::color_scale_bar 0.8 0.05 0 1 0 1 4
	echo $rid
	return "Done!"
}

return "porcupinePC {{mol top} {PCvecfile} {selatom} {scalevec 100} {res 10} {radius 0.5}}."


# delete arrows
# draw delete all

# delete color bar
#::ColorScaleBar::delete_color_scale_bar