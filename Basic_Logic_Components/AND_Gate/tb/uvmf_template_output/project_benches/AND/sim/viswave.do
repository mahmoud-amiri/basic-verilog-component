 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { AND_inputs_agent }
wave add uvm_test_top.environment.AND_inputs_agent.AND_inputs_agent_monitor.txn_stream -radix string -tag F0
wave group AND_inputs_agent_bus
wave add -group AND_inputs_agent_bus hdl_top.AND_inputs_agent_bus.* -radix hexadecimal -tag F0
wave group AND_inputs_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { AND_output_agent }
wave add uvm_test_top.environment.AND_output_agent.AND_output_agent_monitor.txn_stream -radix string -tag F0
wave group AND_output_agent_bus
wave add -group AND_output_agent_bus hdl_top.AND_output_agent_bus.* -radix hexadecimal -tag F0
wave group AND_output_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]



wave update on
WaveSetStreamView

