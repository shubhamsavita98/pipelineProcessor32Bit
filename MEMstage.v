
module MEMstage(clk, rst, write_En, read_En, DataAddress, WriteData, Mem_WB, dest,
WB_Address, WB_Data, Write_Register, WB);

input clk, rst, write_En, read_En; 
input [31:0] DataAddress, WriteData;
input [1:0] Mem_WB;
input [4:0] dest;

wire [31:0] ReadData;

output [31:0] WB_Address, WB_Data;
output PCSrc;
output [4:0] Write_Register;
output [1:0] WB;


Data_Memory s(clk, rst, write_En, read_En, DataAddress, WriteData, ReadData);

MEM2WB t(clk, rst, Mem_WB, DataAddress, ReadData, dest,
			WB_WB, WB_Address, WB_Data, Write_Register);

endmodule 