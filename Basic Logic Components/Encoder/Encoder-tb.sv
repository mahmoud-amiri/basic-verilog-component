`timescale 1ns / 1ps  // Simulation time unit and time precision

module tb_Encoder4to2;

    // Testbench variables
    reg [3:0] in;
    wire [1:0] out;

    // Instantiate the Encoder
    Encoder4to2 encoder (
        .in(in),
        .out(out)
    );

    // Test stimulus
    initial begin
        // Monitor changes in variables
        $monitor("Time = %t, Input = %b, Output = %b", $time, in, out);

        // Initialize inputs
        in = 4'b0000;
        #10 in = 4'b0001;
        #10 in = 4'b0010;
        #10 in = 4'b0100;
        #10 in = 4'b1000;
        #10 in = 4'b0000;

        #10 $finish;  // End the simulation
    end

endmodule
