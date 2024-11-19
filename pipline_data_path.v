module pipelined_data_path (
    input clk,
    input reset,
    input [7:0] data_in,
    output reg [7:0] data_out
);

    reg [7:0] stage_1, stage_2, stage_3;

    always @(posedge clk or posedge reset) begin
        if (reset)
            stage_1 <= 8'b0;
        else
            stage_1 <= data_in;
    end

    always @(posedge clk or posedge reset) begin
        if (reset)
            stage_2 <= 8'b0;
        else
            stage_2 <= stage_1 + 1;
    end

    always @(posedge clk or posedge reset) begin
        if (reset)
            stage_3 <= 8'b0;
        else
            stage_3 <= stage_2 * 2;
    end

    always @(posedge clk or posedge reset) begin
        if (reset)
            data_out <= 8'b0;
        else
            data_out <= stage_3 - 1;
    end

endmodule
