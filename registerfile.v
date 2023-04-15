`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2023 11:47:36 AM
// Design Name: 
// Module Name: registerfile
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// IF ID EXE MEM WB
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

    
    always @(posedge sysclk) begin
        if (rw == 0) begin // 0 == reading
            begin read0 = (rsel[0]) ? S0 : S1; end
            begin read1 = (rsel[1]) ? S0 : S1; end
        end
        else begin // 1 == writing
            if (wsel == 0) begin S0 = w; end
            else           begin S1 = w; end
        end
    end
endmodule