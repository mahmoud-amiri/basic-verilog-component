# Check and delete the existing work library if it exists
if {[file exists "work"]} {
    vdel -all
}
vlib work

# Compile the Design Under Test (DUT) files from the DUT folder
# Assuming the DUT files are either Verilog (.v) or VHDL (.vhdl)
foreach file [glob -nocomplain ./DUT/*.v ./DUT/*.vhdl] {
    if {[string match "*.vhdl" $file]} {
        vcom $file
    } else {
        vlog $file
    }
}

# Setting the include directory for testbench compilation
set include_dir "./TB"  # Update this path as necessary

# Compile the Testbench (TB) files from the TB folder, including directory and suppressing specific warnings
vlog -work work +incdir+$include_dir -suppress 2286
foreach file [glob -nocomplain ./TB/*.sv] {
    vlog $file
}

# Optimize the top module
vopt top -o top_optimized +acc +cover=sbfec+dut_top

# Load test configurations from an external file
set tests [source test_config.tcl]

# Procedure to run a test with coverage, logging, and result saving, handling multiple coverage exclusions
proc run_test {test_name file_addr file_name line_numbers description} {
    puts "Running test: $test_name - $description"
    vsim top_optimized -coverage +UVM_TESTNAME=$test_name
    set NoQuitOnFinish 1
    onbreak {resume}
    log /* -r
    run -all
    # Exclude each specified line from coverage
    foreach line $line_numbers {
        coverage exclude -src $file_addr/$file_name.vhd -line $line -code s
    }
    coverage attribute -name TESTNAME -value $test_name
    coverage save $test_name.ucdb
}

# Iterate over the dictionary and run each test
foreach {test_name test_config} $tests {
    dict with $test_config {
        run_test $test_name $file_addr $file_name $line_numbers $description
    }
}

# Merge coverage data and generate a report
set merged_tests_name "all_tests_merged"
vcover merge $merged_tests_name.ucdb {*}[dict keys [dict map {key val} $tests {set val $key.ucdb}]]
vcover report $merged_tests_name.ucdb -cvg -details

# Exit QuestaSim
quit
