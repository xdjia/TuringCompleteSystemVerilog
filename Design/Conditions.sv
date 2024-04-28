// Set out based on the condition flag.

module Conditions (
    input byte in,
    input logic [2:0] cond,
    output logic out
);

  always_comb begin
    case (cond)
      3'b000: out = 0;
      3'b001: out = (in == 0);
      3'b010: out = (in < 0);
      3'b011: out = (in <= 0);
      3'b100: out = 1;
      3'b101: out = (in != 0);
      3'b110: out = (in >= 0);
      3'b111: out = (in > 0);
    endcase
  end

endmodule
