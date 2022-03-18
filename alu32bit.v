/*
Group 3 
In-Class Activity for Week # 7
32 bit ALU 
*/

module alu32bit(input  [31:0] a ,b,
input  [3:0] ALUControl,
output reg [31:0] Result,
output reg Zeroflag);


always @ (a , b, ALUControl)
begin
	case(ALUControl)
	
		4'b0000: Result = a & b; //And
		
		4'b0001: Result = a | b; //OR
		
		4'b0010: Result = a + b; //Addition 
		
		4'b0110: Result = a - b; //sub
		
		4'b0111: Result = (a < b ) ? 1:0; //set-on-less-than
		
		default: Result <= 0;
		
	endcase

Zeroflag =(Result==32'b0)?1:0;

end

endmodule


