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
    din = 8'h01;
    write = 1;
    #10;
    write = 0;
    #10;
  end
  
  always #5 sysclk = ~sysclk;

  initial begin
    // Write to address 0, 1, 2, 3
    addr = 8'h00;
    din = 8'h01;
    write = 1;
    #10;
    write = 0;
    #10;

    addr = 8'h01;
    din = 8'h02;
    write = 1;
    #10;
    write = 0;
    #10;

    addr = 8'h02;
    din = 8'h03;
    write = 1;
    #10;
    write = 0;
    #10;

    addr = 8'h03;
    din = 8'h04;
    write = 1;
    #10;
    write = 0;
    #10;

    // Read from addresses
    addr = 8'h00;
    #10;
    $display("Memory contents at address 0: %h", dout);

    addr = 8'h01;
    #10;
    $display("Memory contents at address 1: %h", dout);

    addr = 8'h02;
    #10;
    $display("Memory contents at address 2: %h", dout);

    addr = 8'h03;
    #10;
    $display("Memory contents at address 3: %h", dout);

    #10 $finish;
  end

endmodule
