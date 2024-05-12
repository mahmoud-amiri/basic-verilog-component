`timescale 1ns / 1ps

module tb_Comparator;

    // Inputs
    reg [1:0] A;
    reg [1:0] B;

    // Outputs
    wire GT;
    wire LT;
    wire EQ;

    // Instantiate the Comparator module
    Comparator uut (
        .A(A), 
        .B(B), 
        .GT(GT), 
        .LT(LT), 
        .EQ(EQ)
    );

    // Test stimulus
    initial begin
        // Initialize inputs
        A = 0;
        B = 0;
        #10;

        // Test Case 1: A > B
        A = 2; B = 1;
        #10;

        // Test Case 2: A < B
        A = 1; B = 2;
        #10;

        // Test Case 3: A == B
        A = 2; B = 2;
        #10;

        // Complete the simulation
        $finish;
    end

    // Monitor changes
    initial begin
        $monitor("At time %t, A = %d, B = %d, GT = %d, LT = %d, EQ = %d", $time, A, B, GT, LT, EQ);
    end

endmodule
