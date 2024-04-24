module testbench();
  byte x = {8{1'b0}}, y = {{4{1'b1}},{4{1'b0}}};
  byte z;

  ByteOR dut (.x(x), .y(y), .x_or_y(z));
  
  initial begin
    
    $display("%b", z);
    
  end
  
endmodule