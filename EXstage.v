
module EXstage(clk, rst, data1, Write_Data, data2, sign_extend, EX, Rs, Rt, Rd, Wb, MemR, MemW,
		Mem_WB, read_En, write_En, DataAddress, WriteData, dest, Write_Register);

input clk, rst;
input [31:0] data1, Write_Data, data2, sign_extend; 
input [3:0] EX;
input [4:0] Rs, Rt, Rd, Write_Register;
input [1:0] Wb;
input MemR, MemW;

output [1:0] Mem_WB;
output read_En, write_En;
output [31:0] DataAddress, WriteData;
output [4:0] dest;

wire Zeroflag,RegWrite;
wire [31:0] ALUData, dataAddress, in1, in2, Address;
wire [1:0] forward_A_mux, forward_B_mux;
wire forward_C_mux;
wire [4:0] destIn;

wire [5:0] funct;
wire [3:0] alu_ctrl;


assign funct = sign_extend[5:0];

//mux_2input32bit k(data2, sign_extend, EX[0], ALUData);

mux_2input32bit k(ALUData, sign_extend, EX[0], in2);

mux_3input32bit l(data1, Write_Data, dataAddress, forward_A_mux, in1);
//mux_3input32bit m(ALUData, dataAddress, Write_Data, forward_B_mux, in2);

mux_3input32bit m(data2, dataAddress, Write_Data, forward_B_mux, ALUData);

alu_control aluc(EX[2:1], funct, alu_ctrl);
alu32bit n(in1, in2, alu_ctrl, Address, ZeroFlag);
mux_2input5bit o(Rt, Rd, EX[3], destIn);

forwarding_unit p(forward_A_mux, forward_B_mux, forward_C_mux, Rs, Rt, dest, Write_Register, Mem_WB[1], RegWrite, MemW);

EXE2MEM q(clk, rst, Wb, MemR, MemW, Address, data2, destIn,
Mem_WB, read_En, write_En, DataAddress, WriteData, dest);

assign dataAddress = DataAddress;

endmodule 