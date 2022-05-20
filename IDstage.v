
module IDstage(clk, rst, Instruction, Write_Register, RegWrite, Next_Address, Write_Data,
		Branch_Address, PCWrite, freeze, MemR, MemW, Ex, Wb, RegRs, RegRt, RegRd, Exsign_extend,
		data1, data2, PCSrc, flush);

input clk, rst, RegWrite;
input [31:0] Instruction, Write_Data, Next_Address;
input [4:0] Write_Register;

output [31:0] Branch_Address;
output PCWrite, freeze;
output [3:0] Ex;
output MemR, MemW;
output [4:0] RegRs, RegRt, RegRd;
output [31:0] Exsign_extend, data1, data2;
output [1:0] Wb;
output PCSrc; 
output flush;

wire ctrl_mux;
wire [5:0] Op;
wire [4:0] Read_Register1, Read_Register2, Rt, Rd;
wire [31:0] read_data1, read_data2;
wire [15:0] sign_extend_in;
wire [31:0] sign_extend, sign_extend_shift;
wire [8:0] op, zero;
wire [8:0] ctrlop;
wire [1:0] wb;
wire [2:0] m;
wire [3:0] ex;
wire [1:0] WB;
wire [2:0] M;
wire [3:0] EX;

wire Zero;

assign Op = Instruction[31:26]; // takes top 6 bits
assign Read_Register1 = Instruction [25:21];
assign Read_Register2 = Instruction [20:16];
assign sign_extend_in = Instruction [15:0];
assign Rd = Instruction [15:11];

Register_Block e(read_data1, read_data2, Write_Data, Read_Register1, Read_Register2, Write_Register, RegWrite, clk);
signExtend f(sign_extend_in, sign_extend);
shift x(sign_extend, sign_extend_shift);
BrAdder y(sign_extend_shift, Next_Address, Branch_Address);
Control Con(WB, M, EX, flush, Op, Zero);

assign op = {WB, M, EX};
assign zero = 9'b0;
mux_control9bit h(zero, op, ctrl_mux, ctrlop);
assign wb = ctrlop[8:7];
assign m = ctrlop[6:4];
assign ex = ctrlop[3:0];

// adding hazard detect for if a beq happens after an instruction updating one of its checks
hazardDetector i(ctrl_mux, PCWrite, freeze, Rt, Read_Register1, Read_Register2, MemR, rst);
// input regRt

comparator c(read_data1, read_data2, Zero);

Branch r(PCSrc, m[2], Zero, Op);

ID2EXE j(clk, rst, Rd, sign_extend, read_data1, read_data2,
ex, m[1], m[0], wb, Read_Register1, Read_Register2, 
RegRd, Exsign_extend, data1, data2,
Ex, MemR, MemW, Wb, RegRs, RegRt); //unsure of if I connected the ports right to the ID2EX module
// wb needs to be 2 bit width

assign Rt = RegRt;

endmodule 