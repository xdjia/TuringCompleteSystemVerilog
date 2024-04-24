`timescale 1ns / 1ps


module testbench();
    // Declare testbench signals
    logic i3, i2, i1, i0;

  
    // Test vector and outputs
    logic [3:0] inputs;
    logic [2:0] outputs1, outputs2;

  
    // Instantiate the module under test
    CountingSignals dut1(
        .inputs(inputs),
        .count(outputs1)
    );
  
    CountingSignals dut2(
        .inputs(inputs),
        .count(outputs2)
    );

    initial begin
        // Initialize inputs
        i3 = 0; i2 = 0; i1 = 0; i0 = 0;
        // Test all input combinations
        for (int i = 0; i < 16; i++) begin
            inputs = i;  // Assign test vector to inputs
            #10;  // Wait 10 time units for outputs to settle
            $display("Inputs: %b, Outputs: %b %b", i, outputs1, outputs2);
            assert (outputs1 == outputs2);
        end
        $finish;  // Terminate simulation
    end
endmodule
