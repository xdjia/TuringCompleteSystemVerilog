// Adding two bytes using two-bit adders.

module AddingBytes (
    input byte x, y, in_car,
    output byte sum, logic out_car
);
    logic [7:0] sum_intermediate;
    logic [8:0] car;

    assign car[0] = in_car,
            out_car = out_car[8];

    genvar i;
    generate
        for (i = 0; i < 8; i++) begin : adder_stage
            FullAdder two_bit_adder 
          (.x(x[i]), .y(y[i]), .z(car[i]), 
                 .sum(sum[i]), .car(car[i+1]))
        end
    endgenerate 
    
endmodule
