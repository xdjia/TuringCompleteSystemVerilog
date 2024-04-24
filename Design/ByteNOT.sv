module ByteNOT (
    input byte x,
    output byte not_x
);
    assign not_x = ~x;
endmodule