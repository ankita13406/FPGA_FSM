//Performs the arithmetic operation (addition or multiplication) based on the mode input.

module calculator(
    input [3:0] a_reg,
    input [3:0] b_reg,
    input mode,
    output reg [7:0] y
);

always @(*)
begin
    case(mode)
        1'b0: y = a_reg + b_reg;
        1'b1: y = a_reg * b_reg;
        default: y = 8'b00000000;
    endcase
end

endmodule
