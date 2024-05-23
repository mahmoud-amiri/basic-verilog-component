 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { OR_in_agent }
wave add uvm_test_top.environment.OR_in_agent.OR_in_agent_monitor.txn_stream -radix string -tag F0
wave group OR_in_agent_bus
wave add -group OR_in_agent_bus hdl_top.OR_in_agent_bus.* -radix hexadecimal -tag F0
wave group OR_in_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { OR_out_agent }
wave add uvm_test_top.environment.OR_out_agent.OR_out_agent_monitor.txn_stream -radix string -tag F0
wave group OR_out_agent_bus
wave add -group OR_out_agent_bus hdl_top.OR_out_agent_bus.* -radix hexadecimal -tag F0
wave group OR_out_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]



wave update on
WaveSetStreamView

