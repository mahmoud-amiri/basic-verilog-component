 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { comparator_in_agent }
wave add uvm_test_top.environment.comparator_in_agent.comparator_in_agent_monitor.txn_stream -radix string -tag F0
wave group comparator_in_agent_bus
wave add -group comparator_in_agent_bus hdl_top.comparator_in_agent_bus.* -radix hexadecimal -tag F0
wave group comparator_in_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { comparator_out_agent }
wave add uvm_test_top.environment.comparator_out_agent.comparator_out_agent_monitor.txn_stream -radix string -tag F0
wave group comparator_out_agent_bus
wave add -group comparator_out_agent_bus hdl_top.comparator_out_agent_bus.* -radix hexadecimal -tag F0
wave group comparator_out_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]



wave update on
WaveSetStreamView

