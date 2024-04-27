module tb_simple_register;

    // Testbench signals
    logic clk;
    logic rst;
    logic write_enable;
    logic [7:0] data_in;
    logic [7:0] data_out;

    // Clock generation
    always begin
        clk = 1; #5;
        clk = 0; #5;
    end

    // Instantiate the register
  simple_register #(.DATA_WIDTH(8)) uut (
        .clk(clk),
        .rst(rst),
        .write_enable(write_enable),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Test sequence
    initial begin
      $monitor("Time: %0t, clk changed to: %b, write_enable:%b, data_in: %b, data_out: %b", 
               $time, clk, write_enable, data_in, data_out);
      
        // Initialize testbench signals
        rst = 1; write_enable = 0; data_in = 0;
        #20; // Ensure reset is applied for a full clock cycle

        rst = 0; // Release reset
        #10; // Allow some time after reset before writing data

        rst = 1; // Reassert normal operation
      
      	#10;

        #5; // Allow stable operation after reset

        // Setup data ahead of the write enable and clock edge
        data_in = 8'h01;
        write_enable = 1;

        #5; // Data written on rising edge
      
      	#5;
        data_in = 8'h00;
        write_enable = 0;

        #10;

        if (data_out == 8'h01) begin
            $display("TEST PASSED: Data out is %h", data_out);
        end else begin
            $display("TEST FAILED: Data out is %h", data_out);
        end

        // Finish simulation
        #20;
        $finish;
    end

endmodule
