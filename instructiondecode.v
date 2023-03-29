`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2023 11:36:33 AM
// Design Name: 
// Module Name: instructiondecode
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
module instructiondecode(
        input [2:0] inst,
        output registerwrite,
        output aluop,
        output alusrc,
        output reg2mem,
    );
    parameter ADD   = 0;
    parameter ADDI  = 1;
    parameter SW    = 2;
    parameter LW    = 3;
    parameter SLL   = 4;

    // if the instruction is not SW, we are writing back to regs
    assign registerwrite = inst != SW;
    // we are adding unless the instruction is SLL
    assign aluop  = inst == SLL;
    // only time immediate data goes right to the ALU is for ADDI
    assign alusrc = inst == ADDI;
    // write to mem if inst == SW
    assign memw = inst == SW;
    // update regs from mem if inst == LW
    assign reg2mem = inst == LW;
endmodule

