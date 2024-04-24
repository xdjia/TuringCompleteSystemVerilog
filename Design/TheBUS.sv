// sel[0] selects an input, sel[1] selects an output
// Using only BitSwitch

module TheBUS #(
    
) (
    input byte x1, x2, [1:0] sel,
    output wire [7:0] z1, z2  // use wire to allow multiple drivers
);
    wire [7:0] w;

    BitSwitch swc1 (.swc( sel[0]), .x(x1), .y(w));
    BitSwitch swc2 (.swc(~sel[0]), .x(x1), .y(w));

    BitSwitch swc3 (.swc( sel[1]), .x(w), .y(z1));
    BitSwitch swc4 (.swc(~sel[1]), .x(w), .y(z2));

endmodule