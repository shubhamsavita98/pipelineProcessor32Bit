
module top(input reset, clk);



// IF wires
wire [31:0] Next_Address_out, Instruction_out;

// ID wires
wire[31:0] Branch_Address, data1, data2;
wire PCWrite, freeze, MemR, MemW,hzdetect,PCSrc,flush; 
wire [3:0] Ex;
wire [1:0] Wb;
wire [1:0] WB;
wire RegWrite;
wire [4:0] Rs, Rt, Rd;

// EX wires
wire Mem_Br, Zero, write_En, read_En;
wire [31:0] DataAddress, WriteData, WB_Address, WB_Data, sign_extend;
wire [1:0] Mem_WB;
wire [4:0] dest, Write_Register;

// MEM wires
wire [31:0] Write_Data;

IFstage ifs(clk, reset, PCWrite, Branch_Address, PCSrc, flush, freeze, 
Next_Address_out, Instruction_out);

IDstage ids(clk, reset, Instruction_out, Write_Register, RegWrite, Next_Address_out, Write_Data,
Branch_Address, PCWrite, freeze, MemR, MemW, Ex, Wb, Rs, Rt, Rd, sign_extend,
data1, data2, PCSrc, flush);

EXstage exs(clk, reset, data1, Write_Data, data2, sign_extend, Ex, Rs, Rt, Rd, Wb, MemR, MemW,
Mem_WB, read_En, write_En, DataAddress, WriteData, dest, Write_Register, RegWrite);

MEMstage mems(clk, reset, write_En, read_En, DataAddress, WriteData, Mem_WB, dest,
WB_Address, WB_Data, Write_Register, WB);

WBstage wbs(WB, WB_Data, WB_Address,RegWrite, Write_Data);

endmodule
