module and_gate #(
    parameter WIDTH = 1  // Default to 1-bit for backward compatibility
)(
    input wire [WIDTH-1:0] a,
    input wire [WIDTH-1:0] b,
    output wire [WIDTH-1:0] y
);

assign y = a & b;

// synthesis translate_off
assert firewall_assert (
    .a(a),
    .b(b),
);
// synthesis translate_on

endmodule