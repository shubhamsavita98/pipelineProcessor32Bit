
module IFstage(clk, rst, PCWrite, hzdetect, Branch_Address, PCSrc, flush, freeze, 
Next_Address_out, Instruction_out);

input clk, rst, PCWrite, hzdetect, flush, freeze, PCSrc;
input [31:0] Branch_Address;

output [31:0] Next_Address_out, Instruction_out;

wire [31:0] PC_Address, Instruction_Address;
wire [31:0] Instruction;
wire [31:0] Next_Address;

program_counter a(clk, rst, PCWrite, hzdetect, PC_Address, Instruction_Address);
instructionMemory b(Instruction,Instruction_Address);
PCAdder c(Instruction_Address, Next_Address); 
mux_2input32bit d(Next_Address, Branch_Address, PCSrc, PC_Address); 

IF2ID e(clk, rst, flush, freeze, Next_Address, Instruction, Next_Address_out, Instruction_out);

endmodule 