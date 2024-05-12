// SystemVerilog Testbench for the NAND Gate
module tb_nand_gate();

// Variables for inputs and output
logic a, b;
logic y;

// Instantiate the NAND gate module
nand_gate UUT (
    .a(a),
    .b(b),
    .y(y)
);

// Initial block for test stimulus
initial begin
    // Initialize inputs
    a = 0; b = 0;
    #10;  // Wait for 10 time units
    assert(y == 1) else $error("Test failed for A=0, B=0");

    a = 0; b = 1;
    #10;
    assert(y == 1) else $error("Test failed for A=0, B=1");

    a = 1; b = 0;
    #10;
    assert(y == 1) else $error("Test failed for A=1, B=0");

    a = 1; b = 1;
    #10;
    assert(y == 0) else $error("Test failed for A=1, B=1");

    // Finish simulation
    $display("All tests passed.");
    $finish;
end

endmodule
