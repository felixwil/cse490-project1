`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2023 03:42:44 PM
// Design Name: 
// Module Name: datapath_tb
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


module datapath_tb(

    );
    
    wire [2:0] inst_tb;
    wire rt_tb, rs_tb;
    wire [2:0] aux_tb;
    wire [7:0] aluin_tb;
    
    //setup clock
    reg sysclk_tb;
    //reg [7:0]pc_tb;
    initial begin
        //pc_tb = 8'b0000;
        sysclk_tb = 0;
        forever #5 sysclk_tb = ~sysclk_tb;
    end
    //instantiate
    program_counter pc1(.sysclk(sysclk_tb), .b(aluin_tb));
    //addALU incrementpc(.numa(aluin_tb), .outa(pc_tb));
    instructMem retrieveinst(.addr(aluin_tb), .opcode(inst_tb), .rt(rt_tb), .rs(rs_tb), .aux(aux_tb));
    //print to log
    initial begin
        $display("sysclk\tinst_tb\trt_tb\trs_tb\taux_tb"); //print this text to log
        $monitor("%d\t\t%d\t\t%d\t\t%d\t\t%d", sysclk_tb, inst_tb, rt_tb, rs_tb, aux_tb); // monitor these variables in log
    end
        
    initial
        #120 $finish;
    
endmodule
