// Invert the sign of a signed number

module SignedNegator (
    input byte x, output byte neg_x
);
    assign neg_x = ~x + 1;
endmodule