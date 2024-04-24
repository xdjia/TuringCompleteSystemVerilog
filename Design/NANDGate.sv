module NAND (
    input logic x, y, output logic z
);
    nand nand_gate(z, x, y);
endmodule

// In SystemVerilog, there is no direct NAND operator.
module NAND2 (
    input logic x, y, output logic z
);
    assign z = x ~& y;
endmodule

