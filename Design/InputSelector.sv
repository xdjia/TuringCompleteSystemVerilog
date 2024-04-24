// If sel is 0, output byte x, otherwise byte y.
// Using BitSwitch.

module InputSelector (
    input logic sel,
    input byte x,
    y,
    output wire [7:0] z  // use wire to allow multiple drivers
);

  // Instantiating BitSwitch for x
  BitSwitch #(
      .DATA_WIDTH(8)
  ) bswc_x (
      .swc(sel),  // Enable x output when sel is high
      .x  (x),
      .y  (z)
  );

  // Instantiating BitSwitch for y
  BitSwitch #(
      .DATA_WIDTH(8)
  ) bswc_y (
      .swc(~sel),  // Enable y output when sel is low
      .x  (y),
      .y  (z)
  );

endmodule
