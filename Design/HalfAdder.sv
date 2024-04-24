// Adder without input carry bit.

module CountingSignals (
  input logic [2:0] inputs, output sum, car
);

    assign sum = inputs[0] ^ inputs[1];
    assign car = inputs[0] & inputs[1];
endmodule
