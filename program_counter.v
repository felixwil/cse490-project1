`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2023 07:56:01 PM
// Design Name: 
// Module Name: program_counter
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


module program_counter(
    //input [7:0] a,
    input sysclk,
    output reg [7:0] b
    );
    
    reg [7:0] inter;
    initial begin
        assign inter = -1; 
    end
    
    always @(posedge sysclk) begin
        //assign b = inter;
        assign inter = inter + 1;
        assign b = inter;
    end
    
endmodule
