module Demux1to4(
    input wire data_in,        // Single input
    input wire [1:0] select,   // 2-bit select input
    output reg [3:0] data_out  // 4-bit output
);

    always @ (data_in or select) begin
        // Default case: all outputs are 0
        data_out = 4'b0000;

        // Case analysis based on select lines
        case(select)
            2'b00: data_out[0] = data_in;
            2'b01: data_out[1] = data_in;
            2'b10: data_out[2] = data_in;
            2'b11: data_out[3] = data_in;
        endcase
    end

endmodule
