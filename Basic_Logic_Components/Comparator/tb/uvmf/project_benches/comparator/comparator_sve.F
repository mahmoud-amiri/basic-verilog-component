
// UVM
+incdir+${UVM_HOME}/src
${UVM_HOME}/src/uvm_pkg.sv

// Common UVMF files
-f ${UVMF_HOME}/common/common_sve.f

// BFM Files
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/comparator_in_pkg/comparator_in_pkg_sve.F
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/comparator_out_pkg/comparator_out_pkg_sve.F

// Environment Files
-F ${UVMF_VIP_LIBRARY_HOME}/environment_packages/comparator_env_pkg/comparator_env_pkg_sve.F

// Bench Files
+incdir+./tb/tests
./tb/tests/comparator_tests_pkg.sv

+incdir+./tb/sequences
./tb/sequences/comparator_sequences_pkg.sv

+incdir+./tb/parameters
./tb/parameters/comparator_parameters_pkg.sv

./tb/testbench/hdl_top.sv
./tb/testbench/hvl_top.sv

