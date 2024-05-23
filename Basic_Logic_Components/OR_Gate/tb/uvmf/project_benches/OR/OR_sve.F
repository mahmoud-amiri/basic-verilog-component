
// UVM
+incdir+${UVM_HOME}/src
${UVM_HOME}/src/uvm_pkg.sv

// Common UVMF files
-f ${UVMF_HOME}/common/common_sve.f

// BFM Files
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/OR_in_pkg/OR_in_pkg_sve.F
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/OR_out_pkg/OR_out_pkg_sve.F

// Environment Files
-F ${UVMF_VIP_LIBRARY_HOME}/environment_packages/OR_env_pkg/OR_env_pkg_sve.F

// Bench Files
+incdir+./tb/tests
./tb/tests/OR_tests_pkg.sv

+incdir+./tb/sequences
./tb/sequences/OR_sequences_pkg.sv

+incdir+./tb/parameters
./tb/parameters/OR_parameters_pkg.sv

./tb/testbench/hdl_top.sv
./tb/testbench/hvl_top.sv

