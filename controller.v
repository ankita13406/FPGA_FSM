//Implements a Finite State Machine (FSM) that controls the calculator workflow, counter direction, and register loading.

module controller(
    input clk,
    input rst,
    input go,
    input stop,
    input [3:0] count,
    output reg count_enable,
    output reg dir,
    output reg load,
    output reg idle,
    output reg active,
    output reg invalid
);

parameter S0 = 2'b00,
          S1 = 2'b01,
          S2 = 2'b10,
          S3 = 2'b11;

reg [1:0] present_state, next_state;

always @(posedge clk or posedge rst)
begin
    if(rst)
        present_state <= S0;
    else
        present_state <= next_state;
end

always @(*)
begin
    case(present_state)

        S0: begin
            if(go)
                next_state = S1;
            else
                next_state = S0;
        end

        S1: begin
            if(count == 4'd12)
                next_state = S2;
            else
                next_state = S1;
        end

        S2: begin
            if(stop)
                next_state = S3;
            else
                next_state = S2;
        end

        S3: begin
            if(count == 4'd0)
                next_state = S0;
            else
                next_state = S3;
        end

        default: next_state = S0;

    endcase
end

always @(*)
begin
    count_enable = 0;
    dir = 1;
    load = 0;
    idle = 0;
    active = 0;
    invalid = 0;

    case(present_state)

        S0: idle = 1;

        S1: begin
            count_enable = 1;
            dir = 1;
        end

        S2: begin
            active = 1;
            load = 1;
        end

        S3: begin
            invalid = 1;
            count_enable = 1;
            dir = 0;
        end

    endcase
end

endmodule
