
module IDstage(clk, rst, Instruction, Write_Register, RegWrite, Next_Address, Write_Data,
		Branch_Address, PCWrite, freeze, MemR, MemW, Br, Ex, Wb, RegRs, RegRt, RegRd, Exsign_extend,
		data1, data2);

input clk, rst, RegWrite;
input [31:0] Instruction, Write_Data, Next_Address;
input [4:0] Write_Register;

output [31:0] Branch_Address;
output PCWrite, freeze;
output [3:0] Ex;
output MemR, MemW, Br;
output [4:0] RegRs, RegRt, RegRd;
output [31:0] Exsign_extend, data1, data2;
output [1:0] Wb;

wire [5:0] Op;
wire [4:0] Read_Register1, Read_Register2, Rt, Rd;
wire [31:0] read_data1, read_data2;
wire [15:0] sign_extend_in;
wire [31:0] sign_extend, sign_extend_shift;
wire [8:0] op;
wire zero;
wire [8:0] ctrlop;
wire [1:0] wb;
wire [2:0] m;
wire [3:0] ex;
wire [1:0] WB;
wire [2:0] M;
wire [3:0] EX;

assign Op = Instruction[31:26]; // takes top 6 bits
assign Read_Register1 = Instruction [25:21];
assign Read_Register2 = Instruction [20:16];
assign sign_extend_in = Instruction [15:0];
assign Rd = Instruction [15:11];
assign Rt = Instruction [20:16];

Register_Block e(read_data1, read_data2, Write_Data, Read_Register1, Read_Register2, Write_Register, RegWrite, clk);
signExtend f(sign_extend_in, sign_extend);
shift x(sign_extend, sign_extend_shift);
BrAdder y(sign_extend_shift, Next_Address, Branch_Address);
Control g(WB, M, EX, Op);

assign op = {WB, M, EX};
assign zero = 0;
mux h(op, zero, ctrl_mux, ctrlop);
assign wb = ctrlop[8:7];
assign m = ctrlop[6:4];
assign ex = ctrlop[3:0];

hazardDetector i(ctrl_mux, PCWrite, freeze, Rt, Read_Register1, Read_Register2, MemR, rst);
// input regRt


ID2EX j(clk, rst, Rd, sign_extend, read_data1, read_data2,
ex, m[1], m[0], wb, m[2], Read_Register1, Read_Register2, 
RegRd, Exsign_extend, data1, data2,
Ex, MemR, MemW, Wb, Br, RegRs, RegRt); //unsure of if I connected the ports right to the ID2EX module
// wb needs to be 2 bit width

assign Rt = RegRt;

endmodule 