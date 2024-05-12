module Decoder2to4(
    input [1:0] in,  // 2-bit input
    output reg [3:0] out  // 4-bit output, each bit corresponds to one decoded output line
);

    always @ (in) begin
        out = 4'b0000;  // Default state: all outputs are low
        case (in)
            2'b00: out[0] = 1'b1;
            2'b01: out[1] = 1'b1;
            2'b10: out[2] = 1'b1;
            2'b11: out[3] = 1'b1;
        endcase
    end

endmodule
