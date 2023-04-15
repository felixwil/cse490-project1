`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2023 07:15:50 PM
// Design Name: 
// Module Name: instructiondecode_tb
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


module instructiondecode_tb();

    reg [2:0] opcode_tb;
    reg sysclk_tb;
    wire registerwrite_tb;
    wire aluop_tb;
    wire alusrc_tb;
    wire memw_tb;
    wire reg2mem_tb;
    
    //initial value
    initial
    begin
        opcode_tb=3'b000;
        sysclk_tb = 0;
        forever #5 sysclk_tb = ~sysclk_tb;
    end
    
    //instantiate
    instructiondecode dut(.sysclk(sysclk_tb), .inst(opcode_tb), .registerwrite(registerwrite_tb),
                          .aluop(aluop_tb), .alusrc(alusrc_tb), .memw(memw_tb), .mem2reg(mem2reg_tb));
    
    //test pattern
    always
        begin
            #5 opcode_tb=3'b100;
            #5 opcode_tb=3'b101;
            #5 opcode_tb=3'b110;
            #5 opcode_tb=3'b111;
            #5;
        end
        
    initial begin
        $display("sysclk\opcode_tb\registerwrite_tb\aluop_tb\alusrc_tb\memw_tb\mem2reg_tb"); //print this text to log
        $monitor("%d\t\t%d\t\t%d\t\t%d\t\t%d\t\t%d\t\t%d", sysclk_tb, opcode_tb, registerwrite_tb, aluop_tb, alusrc_tb, memw_tb, mem2reg_tb); // monitor these variables in log
    end
        
    initial
        #25 $finish;
    
endmodule
