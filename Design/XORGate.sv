// Implement XOR
// ______________
// x y | xor(x,y)
// 0 0 | 0
// 0 1 | 1
// 1 0 | 1
// 1 1 | 0
// --------------
// 
// x ^ y
//    = (~x & y) | (x & ~y)

module XOR (
    logic input x, y, logic output z
);
    assign z = (~x & y) | (x & ~y);
endmodule