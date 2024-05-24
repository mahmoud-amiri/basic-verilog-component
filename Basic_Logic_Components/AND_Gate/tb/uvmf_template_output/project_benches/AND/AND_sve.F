
// UVM
+incdir+${UVM_HOME}/src
${UVM_HOME}/src/uvm_pkg.sv

// Common UVMF files
-f ${UVMF_HOME}/common/common_sve.f

// BFM Files
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/AND_inputs_pkg/AND_inputs_pkg_sve.F
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/AND_output_pkg/AND_output_pkg_sve.F

// Environment Files
-F ${UVMF_VIP_LIBRARY_HOME}/environment_packages/AND_env_pkg/AND_env_pkg_sve.F

// Bench Files
+incdir+./tb/tests
./tb/tests/AND_tests_pkg.sv

+incdir+./tb/sequences
./tb/sequences/AND_sequences_pkg.sv

+incdir+./tb/parameters
./tb/parameters/AND_parameters_pkg.sv

./tb/testbench/hdl_top.sv
./tb/testbench/hvl_top.sv

