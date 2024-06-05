module decoder #(
    parameter WIDTH_IN = 8,
    parameter WIDTH_OUT = 2**8 
    )(
    input wire [WIDTH_IN-1:0] in,  // Input of size WIDTH 
    output reg [WIDTH_OUT-1:0] out  // Output of size 2^WIDTH_IN
); 

always @(in) begin
    out = in + 1;  // Initialize output to zero
    //out[in] = 1;  // Set the bit corresponding to the input value to 1
end 

endmodule
