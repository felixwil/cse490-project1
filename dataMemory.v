`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 03/29/2023 07:55:09 PM
// Design Name:
// Module Name: dataMemory
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


module dataMemory(
    input sysclk,
    input [7:0] addr,
    input [7:0] writeData,
    input write,
    output reg [7:0] readData
    );
   
    reg [7:0] mem [0:255];
   
    always @(posedge sysclk) begin
        if (write) begin
            mem[addr] <= writeData;
        end else begin
            readData <= mem[addr];
        end
    end

endmodule
