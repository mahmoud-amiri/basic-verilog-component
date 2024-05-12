module tb_not_gate;

// Parameters
parameter SIM_TIME = 100; // Simulation time

// Signals
logic a;
logic y_expected;
logic y;

// Instantiate the NOT gate
not_gate uut (
    .a(a),
    .y(y)
);

// Stimulus generation
initial begin
    $display("Simulation started");
    $monitor("Time = %0t, a = %b, y_expected = %b, y = %b", $time, a, y_expected, y);

    // Test case 1: Input is 0
    a = 0;
    y_expected = 1;
    #10;

    // Test case 2: Input is 1
    a = 1;
    y_expected = 0;
    #10;

    // End simulation
    $display("Simulation finished");
    $finish;
end

endmodule
