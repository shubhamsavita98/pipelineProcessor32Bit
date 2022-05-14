
module Data_Memory(clk, rst, writeEn, readEn, address, WriteData, ReadData);
  input clk, rst, readEn, writeEn;
  input [31:0] address, WriteData;
  output reg [31:0] ReadData;

  integer i;
  reg [31:0] dataMem [0:1023];
  wire [31:0] base_address;


  always @(negedge clk)
    begin
	 if (rst)
			for (i = 0; i < 1024; i = i + 1)
				dataMem[i] <= 0;
	 
	if(readEn==1'b1)
        ReadData <= dataMem[address] ; 
   if (writeEn==1'b1)
      dataMem[address]<=WriteData;   
    end        
	 
endmodule 