`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2023 12:33:33 PM
// Design Name: 
// Module Name: multiplexer
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
module multiplexer(
        input [7:0] a,
        input [7:0] b,
        input sysclk,
        input sel,
        output reg [7:0] x
    );
    always @(posedge sysclk) begin
        #3;
        assign x = (sel) ? a : b;
    end
endmodule
