module registerfile(
        input sysclk,
        input [7:0] w,
        input rw,
        input wsel,
        input [1:0] rsel,
        output reg [7:0] read0,
        output reg [7:0] read1
    );
    
    reg [7:0] S0;
    reg [7:0] S1;
    
    initial begin S0 <= 8'b00000000; end
    initial begin S1 <= 8'b00000000; end

    
    always @(posedge sysclk, w) begin
        #2;
        begin read0 = (rsel[0]) ? S0 : S1; end
        begin read1 = (rsel[1]) ? S0 : S1; end
        if (wsel == 0) begin S0 = w; end
        else           begin S1 = w; end
    end
endmodule
