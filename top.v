
module top(input reset, clk);

// IF wires
wire [31:0] Next_Address_out, Instruction_out;

// IF wires
wire[31:0] Branch_Address;
wire PCWrite, freeze, MemR, MemW, Br; 
wire [3:0] Ex;
wire [1:0] Wb;
wire [4:0] Rs, Rt, Rd, sign_extend, data1, data2;

// EX wires
wire Mem_Br, Zero, write_En, read_En;
wire [31:0] DataAddress, WriteData, WB_Address, WB_Data;
wire [1:0] Mem_WB;
wire [4:0] dest;

// MEM wires
wire [31:0] Write_Data;

IFstage(clk, reset, PCWrite, hzdetect, Branch_Address, PCSrc, flush, freeze, 
Next_Address_out, Instruction_out);

IDstage(clk, reset, Instruction, Write_Register, RegWrite, Next_Address, Write_Data,
Branch_Address, PCWrite, freeze, MemR, MemW, Br, Ex, Wb, Rs, Rt, Rd, sign_extend,
data1, data2);

EXstage(clk, reset, data1, Write_Data, data2, sign_extend, EX, Rs, Rt, Rd, Wb, MemR, MemW, Branch,
Mem_WB, read_En, write_En, Mem_Br, Zero, DataAddress, WriteData, dest);

MEMstage(clk, reset, Mem_Br, Zero, write_En, read_En, DataAddress, WriteData, Mem_WB, dest,
WB_Address, WB_Data, PCSrc, Write_Register, WB);

WBstage(WB, WB_Data, WB_Address, Write_Data);

endmodule
