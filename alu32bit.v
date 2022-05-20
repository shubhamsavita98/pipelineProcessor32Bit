
module alu32bit(input  [31:0] a ,b,
input  [3:0] ALUControl,
output reg [31:0] ALUOut,
output reg Zeroflag,
input clk);

reg [63:0] HiLo;

initial begin

	HiLo = 0;

end

always @ (a , b, ALUControl)

begin

	case(ALUControl)
	
		4'b0000: ALUOut = a & b; //And
		
		4'b0001: ALUOut = a | b; //OR
		
		4'b0010: ALUOut = a + b; //Add
		
		4'b0110: ALUOut = a - b; //sub
		
		4'b0111: ALUOut = (a < b ) ? 1:0; //set-on-less-than
		
		4'b1100: ALUOut = ~(a | b); //NOR
		
		4'b1010: ALUOut = a + b; //addi
		
		4'b0011: ALUOut = HiLo[63:32]; // Hi
		
		4'b0100: ALUOut = HiLo[31:0]; // Lo
		
		
		default: ALUOut = 0;
		
	endcase

 Zeroflag = (ALUOut==32'b0)?1:0;

end

always @(negedge clk)
		begin
			if(ALUControl == 4'b1111) //Multiply
				HiLo = a * b;
			if(ALUControl == 4'b1110) 
				begin//Divide
					HiLo[31:0] = a / b;
					HiLo[63:32] = a % b;
				end
				
		end


endmodule


