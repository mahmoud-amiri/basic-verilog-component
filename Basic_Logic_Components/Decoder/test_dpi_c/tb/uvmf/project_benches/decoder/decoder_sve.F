
// UVM
+incdir+${UVM_HOME}/src
${UVM_HOME}/src/uvm_pkg.sv

// Common UVMF files
-f ${UVMF_HOME}/common/common_sve.f

// BFM Files
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/decoder_in_pkg/decoder_in_pkg_sve.F
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/decoder_out_pkg/decoder_out_pkg_sve.F

// Environment Files
-F ${UVMF_VIP_LIBRARY_HOME}/environment_packages/decoder_env_pkg/decoder_env_pkg_sve.F

// Bench Files
+incdir+./tb/tests
./tb/tests/decoder_tests_pkg.sv

+incdir+./tb/sequences
./tb/sequences/decoder_sequences_pkg.sv

+incdir+./tb/parameters
./tb/parameters/decoder_parameters_pkg.sv

./tb/testbench/hdl_top.sv
./tb/testbench/hvl_top.sv

