// Introduce Immediate Numbers to Calculations.

module Calculations (
    input logic clk,
    input logic rst,
    input byte  inst
);

  byte regs_in = 8'b0;
  byte regs_out;
  byte arith_out;

  byte reg2_out;
  byte reg3_out;

  logic [3:0] onehot_op;

  logic enable_regs;

  InstructionDecoder decoder (
      .inst(inst),
      .onehot_op(onehot_op)
  );

  assign enable_regs = (onehot_op[2] | onehot_op[0]);

  byte regs_inst;

  always_comb begin
    case (onehot_op)
      4'b0000: begin
        // Immediate Number
        regs_inst = 8'b00_110_000; // Copy from input to reg 0
        regs_in[5:0] = inst[5:0]; // Set input to inst body
      end
      default: begin
        regs_inst = inst;
      end
    endcase
  end

  Registers regs (
      .clk(clk),
      .rst(rst),
      .enable(enable_regs),
      .inst(regs_inst),
      .in(regs_in),
      .out(regs_out),
      .reg2(reg2_out),
      .reg3(reg3_out)
  );

  ArithmeticEngine arith (
      .in1(reg2_out),
      .in2(reg3_out),
      .op (inst),
      .out(arith_out)
  );

  always_comb begin
    case (onehot_op)
      4'b0001: out = regs_out;
      4'b0010: out = arith_out;
      4'b0100: out = regs_out;
      4'b1000: out = 1'h0;
    endcase
  end

endmodule
