`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2023 12:51:13 PM
// Design Name: 
// Module Name: registerfile_tb
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


module registerfile_tb();
    
    reg sysclk_tb;
    reg [7:0] w_tb;
    reg rw_tb;
    reg wsel_tb;
    reg[1:0] rsel_tb;
    wire[7:0] read0_tb;
    wire[7:0] read1_tb;
    
    initial
    begin
        sysclk_tb = 0;
        w_tb = 0;
        wsel_tb = 0;
        rw_tb = 0;
        rsel_tb = 2'b01;
        forever #5 sysclk_tb = ~sysclk_tb;
    end
    
    registerfile rf(.sysclk(sysclk_tb), .w(w_tb), .rw(rw_tb), .wsel(wsel_tb), .rsel(rsel_tb), 
                    .read0(read0_tb), .read1(read1_tb));
                    
    always
        begin
            #5 w_tb=8'b11111111;
            rw_tb = 1;
            wsel_tb = 0;
            
            #5 w_tb = 8'b11111111;
            rw_tb = 1;
            wsel_tb = 1;
            
            #5 rw_tb = 0;
            wsel_tb = 0;
        end
        
        
    initial
        #25 $finish;
    

endmodule
