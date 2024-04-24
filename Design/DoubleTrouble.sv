// output 1 iff two or more of the four input bits is 1

module DoubleTrouble (
    input logic [3:0] inputs, output logic z
);
    always_comb begin
        z = 0;
        for (int i = 0; i < 3; i++) 
            for (int j = i + 1; j < 4; j++) 
                z |= inputs[i] & inputs[j];
    end 

endmodule