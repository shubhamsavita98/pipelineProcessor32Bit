//instruction Memory 
// Fig. 4.5 page 252, COD 5th edition

module instructionMemory(
	output reg [31:0] inst_out,
	input [31:0] inst_in); 

reg [31:0] inst_mem[0:1023];


initial 
	begin
	$readmemb("sample_instructions.txt",inst_mem);
	end

always @(inst_in) begin

	inst_out <= inst_mem[inst_in];

end

//assign inst_out = inst_mem[inst_in]; 

endmodule
	