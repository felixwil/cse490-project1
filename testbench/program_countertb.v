`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2023 08:29:55 PM
// Design Name: 
// Module Name: program_countertb
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


module program_countertb();
    wire [7:0] out_tb;
    //initial value
    reg sysclk_tb;
    initial begin
        sysclk_tb = 0;
        forever #10 sysclk_tb = ~sysclk_tb;
    end
    //instantiate
    program_counter dut(.sysclk(sysclk_tb), .b(out_tb));
    //print to log
    initial
        begin
            $display("sysclk\tout"); //print this text to log
            $monitor("%d\t%d", sysclk_tb, out_tb); // monitor these variables in log
        end
        
    initial
        #140 $finish;
endmodule
