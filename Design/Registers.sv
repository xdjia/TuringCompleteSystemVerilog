// Given six registers, copy from SRC to DST.
// Inputs:
//     inst: 00     000 000
//           UNUSED DST SRC
//       in: an additional input (SRC 110).
//      out: an additional output (DST 110).

module Registers (
    input  logic clk,
    input  logic rst,
    input  logic enable,
    input  byte  inst,
    input  byte  in,
    output byte  out,
    output byte  reg0,
    output byte  reg1,
    output byte  reg2,
    output byte  reg3
);
  byte src;
  byte regs[5:0];

  always_comb begin
    case (inst)
      8'b??_000_???: src = regs[0];
      8'b??_001_???: src = regs[1];
      8'b??_010_???: src = regs[2];
      8'b??_011_???: src = regs[3];
      8'b??_100_???: src = regs[4];
      8'b??_101_???: src = regs[5];
      8'b??_110_???: src = in;
      default: begin
        $error("Invalid Op");
        src = 1'hx;
      end
    endcase
  end

  always_ff @(posedge clk) begin
    if (rst) begin
      regs <= {6{1'h0}};
    end else begin
      if (enable) begin
        case (inst)
          8'b??_???_000: regs[0] <= src;
          8'b??_???_001: regs[1] <= src;
          8'b??_???_010: regs[2] <= src;
          8'b??_???_011: regs[3] <= src;
          8'b??_???_100: regs[4] <= src;
          8'b??_???_101: regs[5] <= src;
          default: begin
            if (inst[5:3] != 3'b110) begin
              $error("Invalid OP");
            end
          end
        endcase
      end
    end
  end

  assign out  = (inst[5:3] == 3'b110) ? src : 1'h0;

  assign reg0 = regs[0];
  assign reg1 = regs[1];
  assign reg2 = regs[2];
  assign reg3 = regs[3];

endmodule
