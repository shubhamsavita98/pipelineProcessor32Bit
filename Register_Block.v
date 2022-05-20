// Register Block

module Register_Block(Read_d1, Read_d2, Data, Read_r1, Read_r2, Write_r, RegWrite, clk);

output [31:0] Read_d1;
output [31:0] Read_d2;

input [31:0] Data;
input [4:0] Read_r1, Read_r2, Write_r;
input RegWrite;
input clk;


reg [31:0] reg_s [31:0];
	
/* Read is not synchronized with clock here, as soon as data is available,
   it should be assigned to the output Read_d1 and Read_d2. 
*/


initial begin

		reg_s[0] <= 0;
		reg_s[1] <= 0;
		reg_s[2] <= 0;
		reg_s[3] <= 0;
		reg_s[4] <= 0;
		reg_s[9] <= 0;
		reg_s[6] <= 0;
		reg_s[8] <= 0;
		reg_s[10] <= 0;
		reg_s[11] <= 0;
		reg_s[12] <= 0;
		reg_s[19] <= 0;
		reg_s[18] <= 0;

end

assign Read_d1 = reg_s[Read_r1];  // read rs(Read_r1) source register
assign Read_d2 = reg_s[Read_r2];  // read rt(Read_r2) destination register
	
	
// Wirte operation is synchronized with clock and data is updated at negative edge of the clock.	
always @(negedge clk)
	begin
		

	if(RegWrite == 1)
		begin
	
		reg_s[Write_r] <= Data;  // write new data replacing old data at negative edge of the clock.
		
		end
		
	else
		begin
		
		reg_s[Write_r] <= reg_s[Write_r];
		
		end
	
	end
	
endmodule 