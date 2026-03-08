//A 4-bit up/down counter used to control timing and state transitions in the system.

module counter(
    input clk,
    input rst,
    input count_enable,
    input dir,
    output reg [3:0] count
);

always @(posedge clk or posedge rst)
begin
    if(rst)
        count <= 4'd0;
    else if(count_enable) begin
        if(dir) begin
            if(count<=12)
                count <= count + 1;
        end
        else begin
            if(count>0)
                count <= count - 1;
        end
    end
end

endmodule

