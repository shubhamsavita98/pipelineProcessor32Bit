
module Data_Memory(clk, rst, writeEn, readEn, address, WriteData, ReadData);
  input clk, rst, readEn, writeEn;
  input [31:0] address, WriteData;
  output [31:0] ReadData;

  integer i;
  reg [7:0] dataMem [0:1023];
  wire [31:0] base_address;

  always @ (negedge clk) begin
	// This rst is a reset signal, and resets the memory address spaces to 0, so can
	// possibly remove if we have a different idea to use for inital state of data memory
    if (rst)
		for (i = 0; i < 1024; i = i + 1)
        dataMem[i] <= 0;
    else if (writeEn)
		// This fills up a word spaced address with the value from Write Data into the updated base_address
      {dataMem[base_address], dataMem[base_address + 1], dataMem[base_address + 2], dataMem[base_address + 3]} <= WriteData;
  end

  // This calculates the base address which will be the address currently being looked at
  // and anding with the binary value shifted left by 2 before shifting the and result right by 2
  // before updating the base address
  assign base_address = ((address & 32'b11111111111111111111101111111111) >> 2) << 2;
  assign ReadData = (address < 1024) ? 0 : {dataMem[base_address], dataMem[base_address + 1], dataMem[base_address + 2], dataMem[base_address + 3]};
endmodule // dataMem