
module PCAdder(Instruction_Address, Next_Address)

input [31:0] Instruction_Address;
output [31:0] Next_Address;

Next_Address = Instruction_Address + 4;

endmodule 