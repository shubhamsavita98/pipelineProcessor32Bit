
module IFstage(clk, rst, PCWrite, Branch_Address, PCSrc, flush, freeze, 
Next_Address_out, Instruction_out, inst_mem);

input clk, rst, PCWrite, flush, freeze, PCSrc;
input [31:0] Branch_Address, inst_mem;

output [31:0] Next_Address_out, Instruction_out;

wire [31:0] PC_Address, Instruction_Address;
wire [31:0] Instruction;
wire [31:0] Next_Address;

// instruction == inst_mem
// output instruction_address?

program_counter a(clk, rst, PCWrite, PC_Address, Instruction_Address);
instructionMemory b(Instruction, Instruction_Address);
PCAdder c(Instruction_Address, Next_Address); 
mux_2input32bit d(Next_Address, Branch_Address, PCSrc, PC_Address); 

IF2ID e(clk, rst, flush, freeze, Next_Address, Instruction, Next_Address_out, Instruction_out);

endmodule 