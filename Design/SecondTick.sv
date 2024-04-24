// output on 01 only

module SECONDTICK (
    logic input x, y, logic output z
);
    assign z = x & (~y);
endmodule