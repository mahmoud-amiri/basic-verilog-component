//`include "ovl_assert.vh"  // Include the OVL header file

module firewall #(
    parameter WIDTH = 1  // Set default WIDTH to 1 for backward compatibility
)(
    input wire [WIDTH-1:0] a,
    input wire [WIDTH-1:0] b
);


   wire [2:0] fire;


// OVL Assertions to ensure no unknown states for the entire bus width
ovl_never_unknown_async #(
    .width(WIDTH),             // Apply assertion to the entire vector width
    .severity_level(ovl_error),
    .property_type(ovl_assert),
    .coverage_level(ovl_cover_default),
    .clock_edge(ovl_posedge),
    .reset_polarity(ovl_active_low),
    .gating_type(ovl_gate_clock),
    .msg("a signal is unknown")
) ovl_never_unknown_async_a (
    .reset(1'b1),            // Tie reset to constant 1 as no reset is considered    
    .enable(1'b1),     
    .test_expr(a),      
    .fire(fire(0))
);


ovl_never_unknown_async #(
    .width(WIDTH),             // Apply assertion to the entire vector width
    .severity_level(ovl_error),
    .property_type(ovl_assert),
    .coverage_level(ovl_cover_default),
    .clock_edge(ovl_posedge),
    .reset_polarity(ovl_active_low),
    .gating_type(ovl_gate_clock),
    .msg("b signal is unknown")
) ovl_never_unknown_async_b (
    .reset(1'b1),            // Tie reset to constant 1 as no reset is considered    
    .enable(1'b1),     
    .test_expr(b),      
    .fire(fire(1))
);

// Compile-time check using generate
generate
    if (WIDTH <= 0) begin
        // This will cause a compile error if WIDTH <= 0
        $error("WIDTH must be greater than 0");
    end
endgenerate

endmodule
