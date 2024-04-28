// A counter.

module Counter (
    input  logic clk,
    input  logic rst,
    input byte in,
    output byte  out
);

  always_ff @(posedge clk) begin
    if (rst) begin
      out <= in;
    end else begin
      out <= out + 1;
    end
  end

endmodule

module Counter_AsyncReset (
    input  logic clk,
    input  logic arstn,
    output byte  out
);

  always_ff @(posedge clk or negedge arstn) begin
    if (!arstn) begin
      out <= 0;
    end else begin
      out <= out + 1;
    end
  end

endmodule
