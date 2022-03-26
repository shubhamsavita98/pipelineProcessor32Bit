//ALU control Unit

//*****************************************************
/*
Alu control module : page no. 260(5th edition) fig. 4.12
AluOp : 2 bits
Funtion : 6 bits
Alu Control : 4 bits

ALUoperation    | AluOp| Function| AluControl
lw              |  00  | xxxxxx  |  0010
sw              |  00  | xxxxxx  |  0010
Branch equal    |  01  | xxxxxx  |  0110
add             |  10  | 100000  |  0010
subtract        |  10  | 100010  |  0110
AND             |  10  | 100100  |  0000
OR              |  10  | 100101  |  0001
set on less than|  10  | 101010  |  0111

*/
//*****************************************************
`timescale 1ns/100ps
module alu_control(
       input [1:0] alu_op, // 2 bit control field
	   input [5:0] funct, // 6 bits function field
	   output reg [3:0] alu_ctrl_out // 4 bit output as ALU control input to ALU.
	   );
	  
always @(alu_op, funct)
	begin
		case(alu_op)
			2'b00	: if(funct == 6'b000000) alu_ctrl_out <=  4'b0010; //for load and store
			2'b01	: alu_ctrl_out <= 4'b0110;
			2'b10	: if(funct == 6'b100000) begin alu_ctrl_out <=  4'b0010; end
					  else if(funct == 6'b100010) begin alu_ctrl_out <=  4'b0110; end
					  else if(funct == 6'b100100) begin alu_ctrl_out <=  4'b0000; end
					  else if(funct == 6'b100101) begin alu_ctrl_out <=  4'b0001; end
					  else if(funct == 6'b101010) begin alu_ctrl_out <=  4'b0111; end
			default	: alu_ctrl_out <=  4'b1111;
	    endcase
	end	
endmodule 