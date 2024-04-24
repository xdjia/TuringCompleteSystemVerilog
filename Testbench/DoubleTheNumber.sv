module testbench();
  logic [7:0] x = 1;
  logic [7:0] y;

  DoubleTheNumber dut (.inputs(x), .outputs(y));
  
  initial begin
    #10;

    $display("%o", y);
  end
  
endmodule