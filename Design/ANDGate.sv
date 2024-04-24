module AND (
    input logic x, y, output logic z
);
    logic nand_xy;
    NAND nand_gate(nand_xy, x, y);
    // or assign z = ~nand_xy;
    not not_gate (z, nand_xy);
endmodule

module AND2 (
    input logic x, y, output logic z
);
    assign z = x && y;
endmodule

