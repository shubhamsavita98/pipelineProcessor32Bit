//instruction Memory 
// Fig. 4.5 page 252, COD 5th edition

module instructionMemory(
	output reg[31:0] inst_out,
	input [31:0] inst_in); 

reg [7:0] inst_mem[0:1023];


initial 
	begin
	$readmemb("sample_instructions.txt",inst_mem);
	end
always @(inst_in) begin

	inst_out <= {inst_mem[inst_in], inst_mem[inst_in + 1], inst_mem[inst_in + 2], inst_mem[inst_in + 3]};

end

//assign inst_out = inst_mem[inst_in]; 

endmodule
	