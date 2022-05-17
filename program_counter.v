
module program_counter(
	input clk, reset, pc_write,
	input [31:0] in_PC,
	output reg [31:0] out_PC);
	reg none = 1;

	initial 
		begin
			out_PC <= 32'b0;
		end

	always@(posedge clk) 
	begin
		if(reset == 1'b1) 
			out_PC <= 32'b0;
		else if(pc_write == 1'b1) begin
				out_PC <= in_PC;		//Incremeted PC is assigned to out_PC
			end	
		else
			none <= ~none;
	end
endmodule