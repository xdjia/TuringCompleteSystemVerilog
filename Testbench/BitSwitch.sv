module testbench();
  logic x = 1;
  logic swc = 1;

  BitSwitch dut (.swc(swc), .x(x), .y(y));
  
  initial begin
    
    $display("%o", y);
    
    assert (y == x);

    #10;
    
    swc = 0;
    
    #10;
    
    $display("%o", y);
    
    assert (y == 1'bz);

  end
  
endmodule