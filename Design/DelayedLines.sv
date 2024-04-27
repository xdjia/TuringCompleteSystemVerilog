// Delay the input for 1 tick.
// 
// Our understanding is that this is a D Flip-Flop.
// An example input rises at 1 time unit after the last clock rising edge,
// and falls at 1 time unit after this clock rising edge. The output, 
// assume it is initially low, rises at this clock rising edge, and falls 
// at the next clock rising edge.
// In this way, the input is dealyed by one tick.
// 
// Input :  ┌────┐
// Output:      ┌────┐

module DelayedLine #(
    DATA_WIDTH = 1
) (
    input logic clk;
    input  logic [DATA_WIDTH-1:0] data_in,
    output logic [DATA_WIDTH-1:0] data_out
);
  
  always_ff @(posedge clk) begin
    data_out <= data_in;
  end

endmodule