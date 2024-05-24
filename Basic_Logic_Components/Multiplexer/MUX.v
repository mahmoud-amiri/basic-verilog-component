module mux4to1 (
    input wire [3:0] in,     // 4-bit input
    input wire [1:0] sel,    // 2-bit select input
    output wire out          // output
);

    assign out = in[sel];    // Connect the selected input to the output

endmodule
