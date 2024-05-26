
// UVM
+incdir+${UVM_HOME}/src
${UVM_HOME}/src/uvm_pkg.sv

// Common UVMF files
-f ${UVMF_HOME}/common/common_sve.f

// BFM Files
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/nand_gate_in_pkg/nand_gate_in_pkg_sve.F
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/nand_gate_out_pkg/nand_gate_out_pkg_sve.F

// Environment Files
-F ${UVMF_VIP_LIBRARY_HOME}/environment_packages/nand_gate_env_pkg/nand_gate_env_pkg_sve.F

// Bench Files
+incdir+./tb/tests
./tb/tests/nand_gate_tests_pkg.sv

+incdir+./tb/sequences
./tb/sequences/nand_gate_sequences_pkg.sv

+incdir+./tb/parameters
./tb/parameters/nand_gate_parameters_pkg.sv

./tb/testbench/hdl_top.sv
./tb/testbench/hvl_top.sv

