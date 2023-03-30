`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2023 12:52:46 PM
// Design Name: 
// Module Name: instructMem_tb
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


module instructMem_tb();
    reg [7:0] addr_tb;
    wire [7:0] instr_tb;
    //initial value
    initial
        begin
            addr_tb=8'b0;
        end
    //instantiate
    instructMem dut(.addr(addr_tb), .instr(instr_tb));
    //test pattern
    always
        begin
            #5 addr_tb=8'b1;
            #5 addr_tb=8'b10;
            #5;
        end
    //print to log
    initial
        begin
            $display("addr\tinstr"); //print this text to log
            $monitor("%d\t%d", addr_tb, instr_tb); // monitor these variables in log
        end
        
    initial
        #15 $finish;
    
endmodule
