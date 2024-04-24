// Always output 1.

module ON (
    logic input x, logic output out
);
    assign out = x | ~x;
endmodule