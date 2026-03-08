//Stores the 4-bit input operands A and B when the load signal is enabled.

module reg_4bit(
    input clk,
    input rst,
    input load,
    input [3:0] a,
    input [3:0] b,
    output reg [3:0] a_reg,
    output reg [3:0] b_reg
);

always @(posedge clk or posedge rst)
begin
    if(rst) begin
        a_reg <= 4'b0000;
        b_reg <= 4'b0000;
    end
    else if(load) begin
        a_reg <= a;
        b_reg <= b;
    end
end

endmodule
