// NOT Gate implementation in Verilog
module not_gate #(
    parameter WIDTH = 1 // Default to 1-bit for backward compatibility
)(  
    input wire [WIDTH-1:0] a,      // Input A
    output wire [WIDTH-1:0] y      // Output Y
);

// NOT gate logic
assign y = ~a;

endmodule
