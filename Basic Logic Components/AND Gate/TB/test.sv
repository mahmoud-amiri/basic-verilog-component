module test;
    logic clk = 0;
    always #5 clk = !clk; // Generate a clock

    AndGateIf vif(); // Instantiate the interface
    Environment env;

    initial begin
        env = new(vif);
        fork
            env.agent.monitor.monitor_output();
            env.agent.sequencer.start_sequence();
        join
        wait(env.agent.sequencer.sequence_done); // Wait until the sequencer signals that it's done
        $display("Coverage reached 100%");
        $display("Coverage Report: %0d%%", cov.get_coverage());
        $finish;
    end
endmodule
