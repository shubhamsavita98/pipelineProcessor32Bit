
module EXstage(clk, rst, data1, Write_Data, data2, sign_extend, EX, Rs, Rt, Rd, Wb, MemR, MemW, Branch,
		Mem_WB, read_En, write_En, Mem_Br, Zero, DataAddress, WriteData, dest);

input clk, rst;
input [31:0] data1, Write_Data, data2, sign_extend; 
input [3:0] EX;
input [4:0] Rs, Rt, Rd;
input [1:0] Wb;
input MemR, MemW, Branch;

output [1:0] Mem_WB;
output read_En, write_En, Mem_Br, Zero;
output [31:0] DataAddress, WriteData;
output [4:0] dest;

wire [31:0] ALUData, dataAddress, in1, in2;
wire [1:0] forward_A_mux, forward_B_mux;
wire forward_C_mux;
wire [4:0] destIn;

wire [5:0] funct;
wire [3:0] alu_ctrl;

assign funct = sign_extend[5:0];

mux k(data2, sign_extend, EX[0], ALUData);

mux_3input l(data1, Write_Data, dataAddress, forward_A_mux, in1);
mux_3input m(ALUData, dataAddress, Write_Data, forward_B_mux, in2);

alu_control(EX[2:1], funct, alu_ctrl);
alu32bit n(in1, in2, alu_ctrl, Address, ZeroFlag);
mux o(Rt, Rd, EX[3], destIn);

forwarding_unit p(forward_A_mux, forward_B_mux, forward_C_mux, Rs, Rt, dest, Write_Register, Mem_WB[1], RegWrite, MemW);

EXE2MEM q(clk, rst, Wb, MemR, MemW, Branch, Address, ZeroFlag, data2, destIn,
Mem_WB, read_En, write_En, Mem_Br, DataAddress, Zero, WriteData, dest);

assign dataAddress = DataAddress;

endmodule 