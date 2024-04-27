module simple_register #(DATA_WIDTH=1) 
(
    input logic clk,
    input logic rst,
    input logic write_enable,
    input logic [DATA_WIDTH-1:0] data_in,
    output logic [DATA_WIDTH-1:0] data_out
);

    // Register declaration
    logic [DATA_WIDTH-1:0] register;

    // Output assignment
    assign data_out = register;

    // Register update process
    always_ff @(posedge clk or negedge rst) begin
        if (!rst) begin
            register <= {DATA_WIDTH{1'b0}};  // Reset the register to 0
        end else if (write_enable) begin
            register <= data_in;  // Write data_in to register when write_enable is high
        end
    end

endmodule