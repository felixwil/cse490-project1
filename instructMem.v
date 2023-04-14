`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2023 12:48:42 PM
// Design Name: 
// Module Name: instructMem
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
module instructMem(
        input sysclk,
        input [7:0] addr,
        output [2:0] opcode,
        output rt,
        output rs,
        output [2:0] aux
    );
    reg[7:0] mem[0:255]; //initialize array of bytes
    initial begin //read instructions from memory
        $readmemb("instructions.mem", mem); // initialize memory
    end
    //assign output
    wire [7:0] inst;
    assign inst = mem[addr];
    assign opcode = inst[2:0];
    assign rt = inst[3];
    assign rs = inst[4];
    assign aux = inst[7:5];
endmodule
