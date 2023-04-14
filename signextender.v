`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2023 14:54:42 PM
// Design Name: 
// Module Name: signextender
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
module signextender(input [2:0] aux, output [7:0] signextimm);
    assign signextimm[7:2] = 0;
    assign signextimm[2:0] = aux;
endmodule
