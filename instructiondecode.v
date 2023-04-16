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
        input sysclk,
        output reg registerwrite,
        output reg aluop,
        output reg alusrc,
        output reg memw,
        output reg reg2mem
    );
    parameter ADD   = 0;
    parameter ADDI  = 4;
    parameter SW    = 5;
    parameter LW    = 6;
    parameter SLL   = 7;

    always @(posedge sysclk) begin
        #1;
        // if the instruction is not SW, we are writing back to regs
        //assign registerwrite = inst != SW;
        if (inst == SW) begin
            assign registerwrite = 0;
        end
        else begin
            assign registerwrite = 1;
        end
        // we are adding unless the instruction is SLL
        //assign aluop  = inst == SLL;
        if (inst == SLL) begin
            assign aluop = 0;
        end
        else begin
            assign aluop = 1;
        end
        // only time immediate data goes right to the ALU is for ADDI, SW,LW
        //assign alusrc = inst == ADDI;
        if (inst == ADDI || inst == SW || inst == LW) begin
            assign alusrc = 0;
        end
        else begin
            assign alusrc = 1;
        end
        // write to mem if inst == SW
        //assign memw = inst == SW;
        if (inst == SW) begin
            assign memw = 1;
        end
        else begin
            assign memw = 0;
        end
        // update regs from mem if inst == LW
        //assign reg2mem = inst == LW;
        if (inst == LW) begin
            assign reg2mem = 1;
        end
        else begin
            assign reg2mem = 0;
        end
    end
endmodule
