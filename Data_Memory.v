
module Data_Memory(clk, rst, writeEn, readEn, address, WriteData, ReadData);
  input clk, rst, readEn, writeEn;
  input [31:0] address, WriteData;
  output reg [31:0] ReadData;

  integer i;
  reg [31:0] dataMem [0:1023];
  wire [31:0] base_address;

  if (rst)
		for (i = 0; i < 1024; i = i + 1)
      dataMem[i] <= 0;
  end 

  always @(address)
    begin
      if(readEn==1'b1)
        readData <= DMEMORY[address] ;       
    end
  always @(negedge clk)
    begin
     if (writeEn==1'b1)
      DMEMORY[address]<=WriteData;   
    end        

endmodule 