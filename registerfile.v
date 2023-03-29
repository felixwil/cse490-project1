`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2023 11:47:36 AM
// Design Name: 
// Module Name: registermux
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

module registerfile(
        output reg [7:0] read0,
        output reg [7:0] read1,
        input [7:0] w,
        input rw,
        input wsel,
        input [1:0] rsel,
        input set
    );
    reg [7:0] A;
    reg [7:0] B;
    always @(posedge set) begin
        if (rw == 0) begin // 0 == reading
            read0 <= (rsel[0]) ? reg0 : reg1;
            read1 <= (rsel[1]) ? reg0 : reg1;
        end
        else begin // 1 == writing
            if (wsel == 0) begin A <= w; end
            else           begin B <= w; end
        end
    end;
endmodule
