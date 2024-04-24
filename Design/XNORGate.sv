module XNOR (
    input logic x, y, output logic z
);
    assign z = ~(x ^ y);
endmodule