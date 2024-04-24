// NAND derives NOT.

module NOT (
    input logic x, output logic not_x
);
    NANDGate nand_gate(not_x, x, x);
endmodule

module NOT2 (
    input logic x, output logic not_x
);
    assign not_x = ~x;
endmodule