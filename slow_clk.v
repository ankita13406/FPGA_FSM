//Generates a slower clock from the 100 MHz FPGA clock to make the system operations observable.

module slow_clk (
    input clk, 
    input rst,
    output reg slow_clk
);

    reg [25:0] counter; 

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 0;
            slow_clk <= 0;
        end
        else begin
            if (counter == 49_999_999) begin
                counter <= 0;
                slow_clk <= ~slow_clk;
            end
            else
                counter <= counter + 1;
        end
    end

endmodule
