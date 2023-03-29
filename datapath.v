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

// IF ID EXE MEM WB
module datapath();
    wire [2:0] inst;
    wire [7:0] reg0;
    wire [7:0] reg1;
    wire [7:0] alu1;
    wire [7:0] aluresult;
    wire [7:0] regwritedata;
    wire [7:0] signextimm;
    wire [7:0] pc;
    wire [2:0] aux;
    wire registerwrite;
    wire regwriteselect;
    wire [1:0] rsel;
    assign rsel[0] = rt;
    assign rsel[1] = rs;
    wire sysclk;
    instructMem retrieveinst(pc, inst, rt, rs, aux);
    instructiondecode control(
        inst,
        registerwrite,
        aluop, alusrc,
        reg2mem,
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
    alu math(reg0, alu1, aluop, aluresult);
    memory mem(reg0, reg1, aux, memout);
    multiplexer aluselect(memout, aluresult, reg2mem, regwritedata);
endmodule
