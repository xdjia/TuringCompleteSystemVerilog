// A bit switch implemented using a tristate buffer.

module BitSwitch #(
    DATA_WIDTH = 8
) (
  input logic swc, [DATA_WIDTH-1:0] x,
  output wire [DATA_WIDTH-1:0] y  // use wire to allow multiple drivers
);

  assign y = swc ? x : {DATA_WIDTH{1'bz}};

endmodule