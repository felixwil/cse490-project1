`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2023 12:48:42 PM
// Design Name: 
// Module Name: alu
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


module alu(
        input sysclk,
        input [7:0] a,
        input [7:0] b,
        input [2:0] imm,
        input opcode,
        output reg [7:0] result
    );
    
    always @(posedge sysclk) begin
        if (opcode) 
            begin 
            result = a + b;
            end
        else 
            begin
            result = b << imm;
            end
    end

endmodule