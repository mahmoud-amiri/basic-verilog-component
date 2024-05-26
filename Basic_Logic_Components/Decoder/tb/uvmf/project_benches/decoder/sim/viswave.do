 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { decoder_in_agent }
wave add uvm_test_top.environment.decoder_in_agent.decoder_in_agent_monitor.txn_stream -radix string -tag F0
wave group decoder_in_agent_bus
wave add -group decoder_in_agent_bus hdl_top.decoder_in_agent_bus.* -radix hexadecimal -tag F0
wave group decoder_in_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { decoder_out_agent }
wave add uvm_test_top.environment.decoder_out_agent.decoder_out_agent_monitor.txn_stream -radix string -tag F0
wave group decoder_out_agent_bus
wave add -group decoder_out_agent_bus hdl_top.decoder_out_agent_bus.* -radix hexadecimal -tag F0
wave group decoder_out_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]



wave update on
WaveSetStreamView

