// Invert a bit.

module BitInverter #(
    
) (
    input logic x, inv,
    output logic inv_x
);
    assign inv_x = x ^ inv;
endmodule