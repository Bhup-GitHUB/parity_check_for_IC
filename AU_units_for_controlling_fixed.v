module arithmetic_unit (
    input [7:0] operand1,
    input [7:0] operand2,
    input add_sub,
    output reg [7:0] result
);

    always @(*) begin
        if (add_sub == 1'b0)
            result = operand1 + operand2;
        else
            result = operand1 - operand2;
    end

endmodule
