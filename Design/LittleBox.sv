// Save or load from one of the four registers.

module LittleBox (
    input logic clk,
    input logic save,
    input logic load,
    input logic [1:0] addr,
    input byte in,
    output byte out
);

  byte mem[3:0];

  always_ff @(posedge clk) begin
    if (save) begin
      case (addr)
        2'b00: mem[0] <= in;
        2'b01: mem[1] <= in;
        2'b10: mem[2] <= in;
        2'b11: mem[3] <= in;
      endcase
    end
  end

  // While Turing Complete use tristate buffer, we avoid using it because 
  // it is not common in modern design.

  always_comb begin
    if (load) begin
      case (addr)
        2'b00: out = mem[0];
        2'b01: out = mem[1];
        2'b10: out = mem[2];
        2'b11: out = mem[3];
      endcase
    end else begin
      out = 1'h0;
    end
  end


endmodule
