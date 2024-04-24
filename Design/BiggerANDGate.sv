// or (x,y,z)

module BiggerOr (
    logic input x, y, z, logic output w
);
    assign w = x | y | z;
endmodule