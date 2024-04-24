// Count the number of input bits that are 1.
// Yes, a 4-bit adder.


module CountingSignals (
  input logic [3:0] inputs, output logic [2:0] count
);

    assign count[0] = ^inputs;
    always_comb begin
        logic carry01 = inputs[0] & inputs[1];
        logic carry23 = inputs[2] & inputs[3];
        count[1] = carry01 ^ carry23;
    end
    assign count[2] = &inputs;
endmodule


module CountingSignals2 (
    input logic [3:0] inputs,
    output logic [2:0] count
);

    // SystemVerilog's internal $countones().
    assign count = $countones(inputs);
endmodule
