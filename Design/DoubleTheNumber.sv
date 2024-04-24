module DoubleTheNumber #(
    DATA_WIDTH = 8
) (
    input  logic [DATA_WIDTH-1:0] inputs,
    output logic [DATA_WIDTH-1:0] outputs
);

  assign outputs = {inputs[DATA_WIDTH-2:0], 1'b0};
endmodule