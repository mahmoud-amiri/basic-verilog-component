-suppress 2167


-sv 

+libext+.vlib
+libext+.v
+incdir+../../std_ovl
+define+OVL_ASSERT_ON
+define+OVL_COVER_ON
+define+OVL_SVA
+define+OVL_MAX_REPORT_COVER_POINT=0
-y ../../std_ovl



./TB/driver.sv
./TB/interface.sv
./TB/coverage.sv
#./TB/firewall.sv
./TB/monitor.sv
./TB/scoreboard.sv
./TB/sequenceitem.sv
./TB/sequencer.sv
./TB/agent.sv
./TB/environment.sv
./test.sv

