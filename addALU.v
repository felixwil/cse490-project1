`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2023 12:32:11 PM
// Design Name: 
// Module Name: addALU
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
module addALU(
    input sysclk,
    input [7:0] numa,
    output [7:0] outa
    );
    always @(posedge sysclk) begin
        outa <= numa + 1;
    end
endmodule
