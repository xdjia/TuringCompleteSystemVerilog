// OR gate.
// Implementations:
// or(x, y) 
//   = (x | y) 
//   = ~(~(x | y))
//   = ~(~x & ~y)
//   = nand(~x, ~y)

module NOR (
    input logic x, y, output logic z
);
    

    NOT not_gate(.not_x(not_x), .x(x));
    NOT not_gate(.not_x(not_y), .x(y));
    AND nand_gate(.z(z), .x(not_x), .y(not_y));

endmodule

module NOR2 (
    input logic x, y, output logic z
);
    
    assign z = ~(~x & ~y);
endmodule

module NOR3 (
    input logic x, y, output logic z
);
    logic nor_xy;

    NOR nor_gate(.x(x), .y(y), .z(z));

    assign z = ~(~x & ~y);
endmodule