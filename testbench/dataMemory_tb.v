`timescale 1ns / 1ps


module dataMem_tb;

  // Inputs
  reg sysclk;
  reg [7:0] addr;
  reg [7:0] din;
  reg write;

  // Outputs
  wire [7:0] dout;

  // Instantiate the data memory module
  dataMemory mem(
    .sysclk(sysclk),
    .addr(addr),
    .writeData(din),
    .write(write),
    .readData(dout)
  );

  // Initialize inputs
  initial begin
    sysclk = 0;
    addr = 8'h00;
    din = 8'h55;
    write = 1;
    #10;
    write = 0;
  end
  
  always #5 sysclk = ~sysclk;
  
  // Read test
  always @(addr) begin
    addr <= 8'h00;
    #5;
    addr <= 8'h01;
    #5; 
    addr <= 8'h02;
    #5; 
    addr <= 8'h03;
    #5;    
  end

  // Print output
  always @(dout) begin
    $display("Memory contents at address %h: %h", addr, dout);
  end
  


  // Stop simulation after 100 time units
  initial begin
    #100 $finish;
  end

endmodule
  








