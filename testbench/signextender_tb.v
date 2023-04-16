`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2023 03:58:33 PM
// Design Name: 
// Module Name: signextender_tb
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


module signextender_tb();

    reg[2:0] aux_tb;
    reg sysclk_tb;
    wire[7:0] signextended_tb;
    
        //initial value
    initial
    begin
        aux_tb=3'b100;
        sysclk_tb = 0;
        forever #5 sysclk_tb = ~sysclk_tb;
    end
    
    signextender sig(.aux(aux_tb), .sysclk(sysclk_tb), .signextended(signextended_tb));
    
    always begin
        #5 aux_tb = 3'b100;
        #5 aux_tb = 3'b000;
        #5 aux_tb = 3'b111;
        #5 aux_tb = 3'b010;
        #5;
    end
    
    initial
        #25 $finish;

endmodule
