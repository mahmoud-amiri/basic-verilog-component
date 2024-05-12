`timescale 1ns / 1ps

module tb_Decoder2to4;

    // Inputs
    reg [1:0] in;

    // Outputs
    wire [3:0] out;

    // Instantiate the Decoder module
    Decoder2to4 uut (
        .in(in), 
        .out(out)
    );

    // Test stimulus
    initial begin
        // Apply all possible inputs
        in = 2'b00;
        #10;
        in = 2'b01;
        #10;
        in = 2'b10;
        #10;
        in = 2'b11;
        #10;

        // End simulation
        $finish;
    end

    // Monitor changes
    initial begin
        $monitor("At time %t, input = %b, output = %b", $time, in, out);
    end

endmodule
