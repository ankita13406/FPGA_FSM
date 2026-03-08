//Stores the 8-bit result produced by the calculator before sending it to the LEDs.

module reg_8bit(
    input clk,
    input rst,
    input load,
    input [7:0] y,
    output reg [7:0] y_reg
);

always @(posedge clk or posedge rst)
begin
    if(rst)
        y_reg <= 8'b00000000;
    else if(load)
        y_reg <= y;
end

endmodule
