`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2023 12:37:33 PM
// Design Name: 
// Module Name: datapath
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
`include "instructiondecode.v"
`include "signextender.v"
`include "instructMem.v"
`include "registerfile.v"
`include "multiplexer.v"
`include "alu.v"
`include "dataMemory.v"

// IF ID EXE MEM WB
module datapath();
    wire [2:0] inst;
    wire rt, rs;
    wire [7:0] reg0;
    wire [7:0] reg1;
    wire [7:0] alu1;
    wire [7:0] aluresult;
    wire [7:0] regwritedata;
    wire [7:0] signextimm;
    wire [7:0] pc;
    wire [2:0] aux;
    wire memw;
    wire registerwrite;
    wire [7:0] memout;
    wire [1:0] rsel;
    assign rsel[0] = rt;
    assign rsel[1] = rs;
    wire sysclk;
    instructMem retrieveinst(sysclk, pc, inst, rt, rs, aux);
    instructiondecode control(
        sysclk,
        inst,
        registerwrite,
        aluop, 
        alusrc,
        memw,
        reg2mem
    );
    registerfile rf(
        sysclk,
        reg0, reg1,
        regwritedata,
        registerwrite,
        rt, rsel
    );
    signextender alusignext(aux, signextimm);
    multiplexer aluselect(reg1, signextimm, alusrc, alu1);
    alu math(sysclk, reg0, alu1, aux, aluop, aluresult);
    // input [7:0] addr,
    // input [7:0] writeData,
    // input [2:0] imm,
    // input write,
    // output reg [7:0] readData
    dataMemory memory(sysclk, reg0, reg1, aux, memw, memout);
    multiplexer regwriteselect(memout, aluresult, reg2mem, regwritedata);
endmodule
