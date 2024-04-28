// Add enable and load signal to a D Flip-Flop.

module SavingBytes #(
    DATA_WIDTH = 8
) (
    input logic clk,
    input logic load,
    input logic save,
    input logic [DATA_WIDTH-1:0] data_in,
    output logic [DATA_WIDTH-1:0] data_out
);

  logic [DATA_WIDTH-1:0] internal;

  always_ff @(posedge clk) begin
    if (save) internal <= data_in;
  end

  assign data_out = load ? internal : {DATA_WIDTH{1'b0}};

endmodule
