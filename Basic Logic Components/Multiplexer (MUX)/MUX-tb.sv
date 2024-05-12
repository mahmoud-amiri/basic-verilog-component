`timescale 1ns / 1ps

module tb_mux4to1;

    // Testbench Signals
    reg [3:0] in;
    reg [1:0] sel;
    wire out;

    // Instantiate the Multiplexer
    mux4to1 uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    // Test Stimulus
    initial begin
        // Apply test vectors
        in = 4'b1010; sel = 2'b00; #10;
        in = 4'b1010; sel = 2'b01; #10;
        in = 4'b1010; sel = 2'b10; #10;
        in = 4'b1010; sel = 2'b11; #10;

        // Finish simulation
        $finish;
    end

    // Monitor changes
    initial begin
        $monitor("Time = %t, Input = %b, Select = %b, Output = %b", $time, in, sel, out);
    end

endmodule
