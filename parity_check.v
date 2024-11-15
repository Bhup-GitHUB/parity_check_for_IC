module parity_74x280 (
    input wire [8:0] I,
    output wire EVEN,
    output wire ODD
);
    wire parity = ^I;         // XOR all bits to get odd parity
    assign ODD = parity;      // Odd parity output
    assign EVEN = ~parity;    // Even parity output (inverted odd parity)
endmodule

module parity_74x280_tb;
    reg [8:0] I;
    wire EVEN, ODD;
    
    parity_74x280 uut (
        .I(I),
        .EVEN(EVEN),
        .ODD(ODD)
    );
    
    initial begin
        I = 9'b000000000;  // Even parity (EVEN=1, ODD=0)
        #10;
        
        I = 9'b000000001;  // Odd parity (EVEN=0, ODD=1)
        #10;
        
        I = 9'b101010101;  // Odd parity (EVEN=0, ODD=1)
        #10;
        
        I = 9'b111111110;  // Even parity (EVEN=1, ODD=0)
        #10;
        
        I = 9'b111111111;  // Odd parity (EVEN=0, ODD=1)
        #10;
        
        $finish;
    end
    
    initial begin
        $monitor("Time=%0d I=%b EVEN=%b ODD=%b", $time, I, EVEN, ODD);
    end
endmodule
