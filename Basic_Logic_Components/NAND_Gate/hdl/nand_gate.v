module nand_gate #(parameter WIDTH = 8)(
    input [WIDTH-1:0] a,   // 8-bit input a
    input [WIDTH-1:0] b,   // 8-bit input b
    output [WIDTH-1:0] y   // 8-bit output y
);

assign y = ~(a & b); // Bitwise NAND operation

endmodule
