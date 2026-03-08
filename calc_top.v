//The top-level module that integrates all submodules including the controller, counter, registers, calculator, and clock divider.

module calc_top(
    input clk,
    input rst,
    input go,
    input stop,
    input mode,
    input [3:0] a,
    input [3:0] b,
    output [7:0] y_reg,
    output idle,
    output active,
    output invalid
);

wire [3:0] a_reg, b_reg;
wire [7:0] y;
wire count_enable, dir, load;
wire [3:0] count;
wire slow_clk;

slow_clk dut(clk,rst,slow_clk);

reg_4bit R1(slow_clk, rst, load, a, b, a_reg, b_reg);

calculator CAL(a_reg, b_reg, mode, y);

reg_8bit R2(slow_clk, rst, load, y, y_reg);

counter CNT(slow_clk, rst, count_enable, dir, count);

controller CTRL(
    slow_clk, rst, go, stop, count,
    count_enable, dir, load,
    idle, active, invalid
);

endmodule
