module testbench();
  byte x = {8{1'b0}};
  byte z;

  ByteNOT dut (.x(x), .not_x(z));
  
  initial begin
    $display("%b", z);
  end
  
endmodule