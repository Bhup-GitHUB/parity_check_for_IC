module traffic_light_controller (
    input clk,
    input reset,
    output reg [1:0] light
);

    typedef enum reg [1:0] { 
        GREEN = 2'b00,
        YELLOW = 2'b01,
        RED = 2'b10
    } state_t;

    state_t state, next_state;

    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= GREEN;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)
            GREEN:  next_state = YELLOW;
            YELLOW: next_state = RED;
            RED:    next_state = GREEN;
            default: next_state = GREEN;
        endcase
    end

    always @(state) begin
        case (state)
            GREEN:  light = 2'b00;
            YELLOW: light = 2'b01;
            RED:    light = 2'b10;
            default: light = 2'b00;
        endcase
    end

endmodule
