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


module instructMem(
    input [7:0] addr,
    output [7:0] instr
    );
    reg[7:0] mem[0:255]; //initialize array of bytes
    initial //read instructions from memory
        begin
            $readmemb("instructions.mem",mem); // initialize memory
        end
    //assign output
    assign instr = mem[addr];
endmodule
