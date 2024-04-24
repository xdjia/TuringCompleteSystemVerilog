module ByteOR (
    input byte x, y,
    output byte x_or_y
);
    assign x_or_y = x | y;
endmodule