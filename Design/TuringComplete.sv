// Add conditions to change PC during execution.

module TuringComplete (
    input logic clk,
    input byte  inst
);

  byte regs_in = 8'b0;
  byte regs_out;
  byte arith_out;

  byte reg0_out;
  byte reg1_out;
  byte reg2_out;
  byte reg3_out;

  logic [3:0] onehot_op;

  logic enable_regs;

  InstructionDecoder decoder (
      .inst(inst),
      .onehot_op(onehot_op)
  );

  byte pc;
  byte set_pc;

  assign set_pc = onehot_op[3];

  Counter PC (
      .clk(clk),
      .rst(set_pc),
      .in (reg0_out),
      .out(pc)
  );

  byte inst = insts[pc];


  assign enable_regs = (onehot_op[2] | onehot_op[0]);

  byte regs_inst;

  always_comb begin
    case (onehot_op)
      4'b0000: begin
        // Immediate Number
        regs_inst = 8'b00_110_000;  // Copy from input to reg 0
        regs_in[5:0] = inst[5:0];  // Set input to inst body
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

  Conditions conditions (
      .in  (reg3_out),
      .cond(inst[2:0]),
      .out (pc_in)
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
