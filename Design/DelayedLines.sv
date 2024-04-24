// Delay the input for 1 clock.
// Basically a register.

module delay_module (
    input logic clk,          // Clock signal
    input logic rst_n,        // Asynchronous reset, active low
    input logic data_in,      // Input data
    output logic data_out     // Output data delayed by 1 clock cycle
);

  // Register to hold the data for one clock cycle
  logic data_reg;

  always_ff @(posedge clk or negedge rst_n) begin
      if (!rst_n) begin
          // Reset the register to a known state, e.g., 0
          data_reg = 0;
      end else begin
          // On every rising edge of the clock, capture the input in the register
          data_reg = data_in;
      end
  end

  // Assign the registered value to the output
  assign data_out = data_reg;

endmodule
