 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { nand_gate_in_agent }
wave add uvm_test_top.environment.nand_gate_in_agent.nand_gate_in_agent_monitor.txn_stream -radix string -tag F0
wave group nand_gate_in_agent_bus
wave add -group nand_gate_in_agent_bus hdl_top.nand_gate_in_agent_bus.* -radix hexadecimal -tag F0
wave group nand_gate_in_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { nand_gate_out_agent }
wave add uvm_test_top.environment.nand_gate_out_agent.nand_gate_out_agent_monitor.txn_stream -radix string -tag F0
wave group nand_gate_out_agent_bus
wave add -group nand_gate_out_agent_bus hdl_top.nand_gate_out_agent_bus.* -radix hexadecimal -tag F0
wave group nand_gate_out_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]



wave update on
WaveSetStreamView

