`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2023 14:09:33 PM
// Design Name: 
// Module Name: instructionsplitter
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
module instructionsplitter(
        input  [7:0] inst,
        output [2:0] opcode,
        output rt,
        output rs,
        output [2:0] aux,
    );
    assign opcode = inst[0:2];
    assign rt = inst[3];
    assign rs = inst[4];
    assign aux = inst[7:5];
endmodule

