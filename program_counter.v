`timescale 1ns/100ps

module program_counter(
	input clk, reset, pc_write, hz_detect,
	input [31:0] in_PC,
	output reg [31:0] out_PC);

	initial 
		begin
			out_PC <= 32'b0;
		end

	always@(posedge clk) 
	begin
		if(reset == 1'b1) 
			out_PC <= 32'b0;
		else if(pc_write == 1'b0)
				out_PC <= in_PC;   //Incremeted PC is assigned to out_PC
		else if (hz_detect == 1'b0)
				out_PC <= in_PC;  //PC remains same, no change
		
	end
endmodule 