`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2023 14:54:42 PM
// Design Name: 
// Module Name: signextender
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


module signextender(input [2:0] aux, input sysclk, output reg [7:0] signextended);
    always @(posedge sysclk) begin
        #1;
        //signextended = $signed(aux);
        assign signextended = aux;
    end
endmodule
