# Check and delete the existing work library if it exists
if {[file exists "work"]} {
    vdel -all
}
vlib work

#VHDL DUT
#vcom -f compile_vhdl.f

# Verilog DUT
vlog -f compile_verilog.f

# System Verilog DUT
vlog -f compile_sv.f

# Optimize the top module
vopt test -o top_optimized +acc +cover=sbfec

# Load test configurations from an external file
set tests [source test_config.tcl]

# Procedure to run a test with coverage, logging, and result saving, handling multiple coverage exclusions
proc run_test {test_name} {
    puts "Running test: $test_name"
    vsim top_optimized -coverage +UVM_TESTNAME=$test_name
    set NoQuitOnFinish 1
    onbreak {resume}
    log /* -r
    run -all
    coverage attribute -name TESTNAME -value $test_name
    coverage save $test_name.ucdb
}

# Iterate over the dictionary and run each test
foreach {test_name} $tests {
        run_test $test_name
}

# Merge coverage data and generate a report
set merged_tests_name "all_tests_merged"
vcover merge $merged_tests_name.ucdb {*}[dict keys [dict map {key val} $tests {set val $key.ucdb}]]
vcover report $merged_tests_name.ucdb -cvg -details

# Exit QuestaSim
quit
