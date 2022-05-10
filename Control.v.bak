
module Control(WB, M, EX, flush, Op);

// Can separate them into separate outputs, but the outputs are written this way
// In align with how the control data paths are shown in the pipelining slide with the control module

output [1:0] WB; // RegWrite bit and MemtoReg bit

output [2:0] M; // Branch bit, MemRead bit, and MemWrite bit

output [3:0] EX; // RegDst bit, ALUOp 2 bits and ALUSrc bit

output reg flush;


input [5:0] Op; // 6 MSBs are read to determine the operation and bits for the other stages

reg [1:0] wb;
reg [2:0] m;
reg [3:0] ex;

always @(*) begin
	case(Op)
	
		6'b000000: begin // R type instruction
			wb = 2'b10;
			m = 3'b000;
			ex = 4'b1100; // 1101
			end
			
		6'b100011: begin // lw type instruction
			wb = 2'b11;
			m = 3'b010;
			ex = 4'b0001; 
			end
			
		6'b101011: begin // sw type instruction
			wb = 2'b00;
			m = 3'b001;
			ex = 4'b0001; 
			end
	
		6'b000100: begin // beq type instruction
			wb = 2'b00;
			m = 3'b100;
			ex = 4'b0010; 
			end

		6'b001000: begin // I type instruction
			wb = 2'b10;
			m = 3'b000;
			ex = 4'b1101;
			end

		6'b000010: begin // j instruction
			wb = 2'b00;
			m = 3'b100;
			ex = 4'b0010;
			end
	endcase 



	if(Op == 2 && m[2] == 1)begin
		assign flush = 1;
	end
	else begin 
		assign flush = 0;
	end 

end 

endmodule 