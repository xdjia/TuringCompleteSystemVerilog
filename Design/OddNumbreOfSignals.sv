module OddNumbreOfSignals (
    input logic [3:0] inputs, output logic z
);
    assign z = ^inputs;
endmodule