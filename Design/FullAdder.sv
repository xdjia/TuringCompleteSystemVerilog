// A 3-bit adder.

module FullAdder #(
    
) (
    input logic x, y, z,
    output logic sum, car
);

    assign sum = ^{x,y,z};
    assign car = &{x,y,z};
    
endmodule