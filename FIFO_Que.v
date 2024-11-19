module fifo_queue #(
    parameter WIDTH = 8,
    parameter DEPTH = 16
)(
    input clk,
    input reset,
    input wr_en,
    input rd_en,
    input [WIDTH-1:0] din,
    output reg [WIDTH-1:0] dout,
    output full,
    output empty
);

    reg [WIDTH-1:0] fifo_mem [0:DEPTH-1];
    reg [4:0] write_ptr, read_ptr, count;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            write_ptr <= 0;
            count <= 0;
        end else if (wr_en && !full) begin
            fifo_mem[write_ptr] <= din;
            write_ptr <= write_ptr + 1;
            count <= count + 1;
        end
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            read_ptr <= 0;
            dout <= 0;
        end else if (rd_en && !empty) begin
            dout <= fifo_mem[read_ptr];
            read_ptr <= read_ptr + 1;
            count <= count - 1;
        end
    end

    assign full = (count == DEPTH);
    assign empty = (count == 0);

endmodule
