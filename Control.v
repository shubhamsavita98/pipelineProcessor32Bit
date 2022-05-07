
module Control(WB, M, EX, Op);

// Can separate them into separate outputs, but the outputs are written this way
// In align with how the control data paths are shown in the pipelining slide with the control module

output [1:0] WB; // RegWrite bit and MemtoReg bit

output [2:0] M; // Branch bit, MemRead bit, and MemWrite bit

output [3:0] EX; // RegDst bit, ALUOp 2 bits and ALUSrc bit

input [5:0] Op; // 6 MSBs are read to determine the operation and bits for the other stages

reg [1:0] wb;
reg [2:0] m;
reg [3:0] ex;

always @(*) begin
	case(Op) begin
	
		6'b000000: begin // R type instruction
			wb = 2'b10;
			m = 3'b000;
			ex = 4'1100; 
			end
			
		6'b100011: begin // lw type instruction
			wb = 2'b11;
			m = 3'b010;
			ex = 4'0001; 
			end
			
		6'b101011: begin // sw type instruction
			wb = 2'b00;
			m = 3'b001;
			ex = 4'0001; 
			end
	
		6'b000100: begin // beq type instruction
			wb = 2'b00;
			m = 3'b100;
			ex = 4'0010; 
			end
	
	
	end 
end 