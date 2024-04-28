// OR NAND NOR AND, Add Sub
// Extension of LogicBox

module ArithmeticEngine (
    input  byte in1,
    input  byte in2,
    input  byte op,
    output byte out
);

  always_comb begin
    case (op[2:0])
      3'b000: out = in1 |  in2;
      3'b001: out = in1 ~& in2;
      3'b010: out = in1 ~| in2;
      3'b011: out = in1 &  in2;
      3'b100: out = in1 +  in2;
      3'b101: out = in1 -  in2;
      default: begin
        $error("Invalid Op");
        out = 1'hx;
      end
    endcase
  end

endmodule
