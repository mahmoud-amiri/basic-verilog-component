`timescale 1ns / 1ps

module tb_Demux1to4;

    // Inputs
    reg data_in;
    reg [1:0] select;

    // Outputs
    wire [3:0] data_out;

    // Instantiate the Demux1to4 Module
    Demux1to4 uut (
        .data_in(data_in),
        .select(select),
        .data_out(data_out)
    );

    // Test stimulus
    initial begin
        // Initialize Inputs
        data_in = 0;
        select = 0;
        #10; // Wait for 10 ns

        // Apply test cases
        data_in = 1; select = 2'b00; #10;
        data_in = 1; select = 2'b01; #10;
        data_in = 1; select = 2'b10; #10;
        data_in = 1; select = 2'b11; #10;

        // Test with data_in low
        data_in = 0; select = 2'b00; #10;
        data_in = 0; select = 2'b01; #10;
        data_in = 0; select = 2'b10; #10;
        data_in = 0; select = 2'b11; #10;

        // Complete the simulation
        $finish;
    end

    // Monitor and Display Output
    initial begin
        $monitor("At time %t, data_in = %b, select = %b, data_out = %b", $time, data_in, select, data_out);
    end

endmodule
