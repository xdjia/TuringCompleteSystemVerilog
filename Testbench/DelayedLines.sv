// Delay the input for n clocks.
// Implemented by using a register that shifts one bit to the left at each clock

module testbench();
  logic clk = 0;  
  logic rst_n = 1;

  logic x = 1;
  logic y;

  DelayedLines dut (.clk(clk), .rst_n(rst_n), .x(x), .y(y));
  
  initial begin
    #10;
    rst_n = 0;
    #10;
    rst_n = 1;

    for (int i = 0; i < 8; i++) begin
      clk = ~clk;
      #10;
      if (clk)
        $display("%b", y);
    end
  end
  
endmodule