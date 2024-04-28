// Add a program counter to Calculations.

module myProgram (
    input logic clk,
    input logic rst,
    input byte  insts[255:0]  // 8 byte addressed instructions
);
  byte pc;

  Counter PC (
      .clk(clk),
      .rst(rst),
      .out(pc)
  );

  byte inst = insts[pc];

  Calculations(
      .clk(clk), .rst(rst), .inst(inst)
  );

endmodule
