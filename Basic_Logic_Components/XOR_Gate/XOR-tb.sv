module tb_xor_gate;

  // Inputs
  logic a, b;
  // Output
  logic y;

  // Instantiate the XOR gate module
  xor_gate uut (
    .a(a),
    .b(b),
    .y(y)
  );

  // Stimulus
  initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    // End simulation
    $finish;
  end

endmodule
