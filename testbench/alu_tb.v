`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2023 02:33:21 PM
// Design Name: 
// Module Name: alu_tb
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


module alu_tb();

    reg sysclk_tb;
    reg [7:0] a_tb;
    reg [7:0] b_tb;
    reg [2:0] imm_tb;
    reg opcode_tb;
    wire [7:0] result_tb;
    
    //initial value
    initial
    begin
        sysclk_tb <= 0;
        a_tb <= 8'b10101010;
        b_tb <= 8'b01010101;
        imm_tb <= 1;
        opcode_tb <= 0;
        forever #5 sysclk_tb <= ~sysclk_tb;
    end
    
    alu a(.sysclk(sysclk_tb), .a(a_tb), .b(b_tb), .imm(imm_tb), .opcode(opcode_tb), .result(result_tb));
    
    always
    begin
        #5 opcode_tb <= 1;
        b_tb <= 8'b00000001;
        imm_tb <= 3'b001;
        
        #5 opcode_tb <= 1;
        b_tb <= 8'b10000001;
        imm_tb <= 3'b100;
        
        #5 opcode_tb <= 0;
        a_tb <= 8'b00001111;
        b_tb <= 8'b00001111;
        
        #5 opcode_tb <= 0;
        a_tb <= 8'b10000000;
        b_tb <= 8'b10000000;
        
        #5;
    end
    
    
    initial
        #25 $finish;

endmodule
