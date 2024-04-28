// A 1-bit decoder.

module OneBitDecoder (
    input logic in,
    output logic [1:0] out
);

  assign out[0] = ~in;
  assign out[1] = in;

endmodule
