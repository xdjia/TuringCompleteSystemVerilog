// NOR gate.
// Implementations:
// nor(x, y) 
//   = ~(x || y) 
//   = ~x and ~y 
//   = ~(~x nand ~y)

module NOR (
    input logic x, y, output logic z
);
    

    NOT not_gate(not_x, x);
    NOT not_gate(not_y, y);
    AND and_gate(z, not_x, not_y);
endmodule

module NOR2 (
    input logic x, y, output logic z
);
    
    assign z = ~(x | y);
endmodule