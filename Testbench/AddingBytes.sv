`timescale 1ns / 1ps

module AddingBytes_tb;

    // Inputs
    reg [7:0] x;
    reg [7:0] y;
    reg in_car;

    // Outputs
    wire [7:0] sum;
    wire out_car;

    // Instantiate the Unit Under Test (UUT)
    AddingBytes uut (
        .x(x), 
        .y(y), 
        .in_car(in_car), 
        .sum(sum), 
        .out_car(out_car)
    );

    // Test cases
    initial begin
        // Initialize Inputs
        x = 0;
        y = 0;
        in_car = 0;

        // Display test header
        $display("Time\tX\tY\tCarry In\tSum\tCarry Out");
        $monitor("%g\t%h\t%h\t%b\t\t%h\t%b", $time, x, y, in_car, sum, out_car);

        // Wait 100 ns for global reset
        #100;

        // Add two numbers without carry-in
        x = 8'h55;  // 01010101
        y = 8'hAA;  // 10101010
        in_car = 0;
        #10;  // Delay to allow processing

        // Add two numbers with carry-in
        x = 8'hFF;  // 11111111
        y = 8'h01;  // 00000001
        in_car = 1;
        #10;  // Delay to allow processing

        // Check overflow
        x = 8'h80;  // 10000000
        y = 8'h80;  // 10000000
        in_car = 0;
        #10;  // Delay to allow processing

        // Finish the test
        #100;
        $finish;
    end
      
endmodule
