// InstructionDecoder
// Decode inst[7:6].


module InstructionDecoder (
    input byte inst,
    output logic [3:0] onehot_op
);

  always_comb begin
    case (inst[7:6])
      2'b00: onehot_op = 4'b0001;
      2'b01: onehot_op = 4'b0010;
      2'b10: onehot_op = 4'b0100;
      2'b11: onehot_op = 4'b1000;
    endcase
  end
endmodule
