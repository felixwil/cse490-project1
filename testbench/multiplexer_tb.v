`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2023 04:17:36 PM
// Design Name: 
// Module Name: multiplexer_tb
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


module multiplexer_tb();

    reg[7:0] a_tb;
    reg[7:0] b_tb;
    reg sysclk_tb;
    reg sel_tb;
    wire[7:0] x_tb;
    
    initial begin
        a_tb = 0;
        b_tb = 0;
        sysclk_tb = 0;
        sel_tb = 0;
        forever #5 sysclk_tb = ~sysclk_tb;
    end
    
    multiplexer mux(.a(a_tb), .b(b_tb), .sysclk(sysclk_tb), .sel(sel_tb), .x(x_tb));
    
    always begin
        
        #5 sel_tb = 1;
        a_tb = 0;
        b_tb = 0;
        
        #5 sel_tb = 0;
        a_tb = 255;
        b_tb = 0;
        
        #5 sel_tb = 1;
        a_tb = 255;
        b_tb = 0;
        
        #5 sel_tb = 0;
        a_tb = 0;
        b_tb = 255;
        
        #5 sel_tb = 1;
        a_tb = 0;
        b_tb = 255;
        
        #5 sel_tb = 0;
        a_tb = 255;
        b_tb = 255;
        
        #5 sel_tb = 1;
        a_tb = 255;
        b_tb = 255;
        
        #5;
        
    end
    
    initial
        #40 $finish;

endmodule
