/*
Group 3 
In-Class Activity for Week # 7
32 bit ALU Testbench 
*/

module alu32bittb;

	reg [31:0] a, b;
	reg [3:0] ALUControl;
	wire [31:0] Result;
	wire Zeroflag ;

	alu32bit UUT(a ,b, ALUControl, Result,Zeroflag);

initial 
	begin
		a = 32'h01101111;
		b = 32'h00001111;
		ALUControl = 4'b0000; //AND
		#50;
		
		a = 32'h10010110;
		b = 32'h01101111;
		ALUControl = 4'b0001; //OR
		#50;
		
		a = 32'h10101111;
		b = 32'h01101111;
		ALUControl = 4'b0010; //add
		#50;

		a = 32'h10101111;
		b = 32'h10001011;
		ALUControl = 4'b0110; //subtract
		#50;
		
		a = 32'h10101111;
		b = 32'h10101111;
		ALUControl = 4'b0110; //subtract to show flag 0
		#50;

		a = 32'h00001111;
		b = 32'h01101111;
		ALUControl = 4'b0111; //set-on-less-than
		#50;
		
	end
	
endmodule	
	
	
