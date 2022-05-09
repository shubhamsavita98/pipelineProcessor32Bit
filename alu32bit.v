
module alu32bit(input  [31:0] a ,b,
input  [3:0] ALUControl,
output reg [31:0] ALUOut,
output reg Zeroflag);

always @ (a , b, ALUControl)
begin
	case(ALUControl)
	
		4'b0000: ALUOut <= a & b; //And
		
		4'b0001: ALUOut <= a | b; //OR
		
		4'b0010: ALUOut <= a + b; //Add
		
		4'b0110: ALUOut <= a - b; //sub
		
		4'b0111: ALUOut <= (a < b ) ? 1:0; //set-on-less-than
		
		4'b1100: ALUOut <= ~(a | b); //NOR
		
		4'b1010: ALUOut <= a - b; //addi
		
		4'b1110: ALUOut <= a / b; //div
		
		4'b1111: ALUOut <= a * b; //mult
		
		default: ALUOut <= 0;
		
	endcase

assign Zeroflag = (ALUOut==32'b0)?1:0;

end

endmodule


