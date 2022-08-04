proc readData {filename} {
    set result {}
    set f [open $filename r]
    foreach line [split [read $f] \n] {
    	set thisline {}
    	lappend thisline [lindex $line 0] [lindex $line 1] [lindex $line 2]
        lappend result $thisline
    }
    return $result
}