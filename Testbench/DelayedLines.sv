module testbench;
  // Testbench signals
  logic [7:0] data_in;
  logic [7:0] data_out;

  // Instantiate the register
  DelayedLine #(
      .DATA_WIDTH(8)
  ) uut (
      .data_in (data_in),
      .data_out(data_out)
  );

  always begin
    data_in = 8'h01;
    #5;
    data_in = 8'h00;
    #5;
  end

  // Test sequence
  initial begin
    $monitor("Time: %0t, data_in: %b, data_out: %b", $time, data_in, data_out);

    #20;

    if (data_out == 8'h01) begin
      $display("TEST PASSED: Data out is %h", data_out);
    end else begin
      $display("TEST FAILED: Data out is %h", data_out);
    end

    // Finish simulation
    #40;
    $finish;
  end

endmodule
