module OddTicks #(
) (
    input  logic clk,
    input  logic rst_n,  // Active low reset
    output logic y
);
    logic x = 0;

    DelayedLines  #(.DELAY(1)) delay (.clk(clk), .rst_n(rst_n), .x(x), .y(y));
  
    always_ff @( posedge clk ) begin
        x = ~x;
    end
endmodule