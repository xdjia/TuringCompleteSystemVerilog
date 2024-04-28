// A 3-bit decoder.

module ThreeBitDecoder (
    input  logic [2:0] in,
    output logic [7:0] out
);

  always_comb begin
    case (in)
      3'b000:  out = 1'h1;
      3'b001:  out = 1'h2;
      3'b010:  out = 1'h4;
      3'b011:  out = 1'h8;
      3'b100:  out = 1'h16;
      3'b101:  out = 1'h32;
      3'b110:  out = 1'h64;
      3'b111:  out = 1'h128;
      default: out = 1'hx;
    endcase
  end

endmodule
