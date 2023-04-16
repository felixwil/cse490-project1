`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2023 03:42:44 PM
// Design Name: 
// Module Name: datapath_tb
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


module datapath_tb(

    );
    
    wire [2:0] inst_tb;  //instruction memory
    wire rt_tb, rs_tb;
    wire [2:0] aux_tb;
    wire [7:0] aluin_tb;
    
    wire registerwrite_tb; //decode
    wire aluop_tb;
    wire alusrc_tb;
    wire reg2mem_tb;
    
    wire [7:0] read0_tb; //register file
    wire [7:0] read1_tb;
    wire [1:0] rsel_tb;
    wire [7:0] writed_tb;
    assign rsel_tb[0] = rt_tb;
    assign rsel_tb[1] = rs_tb;
    
    wire [7:0] signextended_tb; //signextend
    
    wire [7:0] alu1_tb; //mux 1
    
    wire [7:0] aluresult_tb; //alu
    
    wire [7:0] readMemory_tb; //data memory
    
    //setup clock
    reg sysclk_tb;
    //reg [7:0]pc_tb;
    initial begin
        //pc_tb = 8'b0000;
        sysclk_tb = 0;
        forever #10 sysclk_tb = ~sysclk_tb;
    end
    //instantiate
    program_counter pc1(.sysclk(sysclk_tb), .b(aluin_tb));
    //addALU incrementpc(.numa(aluin_tb), .outa(pc_tb));
    instructMem retrieveinst(.addr(aluin_tb), .opcode(inst_tb), .rt(rt_tb), .rs(rs_tb), .aux(aux_tb));
    instructiondecode control(.inst(inst_tb), .sysclk(sysclk_tb), .registerwrite(registerwrite_tb), .aluop(aluop_tb), .alusrc(alusrc_tb), .reg2mem(reg2mem_tb));
    signextender ext(.aux(aux_tb), .sysclk(sysclk_tb), .signextended(signextended_tb));
    registerfile rf(.sysclk(sysclk_tb), .read0(read0_tb), .read1(read1_tb), .rsel(rsel_tb), .wsel(rt_tb), .rw(registerwrite_tb), .w(writed_tb));
    
    multiplexer mux1(.sysclk(sysclk_tb), .a(read1_tb), .b(signextended_tb), .sel(alusrc_tb), .x(alu1_tb));
    alu math(.sysclk(sysclk_tb), .a(read0_tb), .b(alu1_tb), .imm(aux_tb), .opcode(aluop_tb), .result(aluresult_tb));
    dataMemory dm(.sysclk(sysclk_tb), .addr(aluresult_tb), .writeData(read1_tb), .write(reg2mem_tb), .readData(readMemory_tb));
    multiplexer2 mux2(.sysclk(sysclk_tb), .a(readMemory_tb), .b(aluresult_tb), .w(registerwrite_tb), .sel(reg2mem_tb), .x(writed_tb));
    //print to log
    initial begin
        //$display("sysclk\tinst_tb\trt_tb\trs_tb\taux_tb"); //print this text to log
        //$monitor("%d\t\t%d\t\t%d\t\t%d\t\t%d", sysclk_tb, inst_tb, rt_tb, rs_tb, aux_tb); // monitor these variables in log
        $display("sysclk\tread0\tread1\twrited\t");
        //$monitor("%d\t\t%d\t\t%d\t\t%d", sysclk_tb, read0_tb, read1_tb, writed_tb);
    end
        
    initial
        #140 $finish;
    
endmodule
