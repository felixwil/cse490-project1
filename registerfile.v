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
        output reg [7:0] read0,
        output reg [7:0] read1,
        input [7:0] w,
        input rw,
        input wsel,
        input [1:0] rsel
    );
    reg [7:0] A;
    reg [7:0] B;
    always @(posedge sysclk) begin
        if (rw == 0) begin // 0 == reading
            #1 read0 <= (rsel[0]) ? read0 : read1;
            #1 read1 <= (rsel[1]) ? read0 : read1;
        end
        else begin // 1 == writing
            if (wsel == 0) begin #1 A <= w; end
            else           begin #1 B <= w; end
        end
    end
endmodule