// ALU control unit test bench
`timescale 1ns/100ps

module alu_control_tb;
	
	reg [1:0]alu_op;
	reg [5:0]funct;
	
	wire [3:0]alu_ctrl_out;
	
	alu_control uut(.alu_op(alu_op), .funct(funct), .alu_ctrl_out(alu_ctrl_out));
	
	initial 
		begin
		
		//$dumpfile("alu_control.vcd");
		//$dumpvars("0, alu_control_tb");
		
		alu_op = 2'b00;
		funct = 6'b000000; #10
		
		alu_op = 2'b01;
		funct = 6'b100000; #10 //don't care function field.
		
		alu_op = 2'b10;
		funct = 6'b100000; #10
		
		alu_op = 2'b10;
		funct = 6'b100010; #10
		
		alu_op = 2'b10;
		funct = 6'b100100; #10
		
		alu_op = 2'b10;
		funct = 6'b100101; #10
		
		alu_op = 2'b10;
		funct = 6'b101010; #10
		
		$finish;
		
		end
	
    initial 
		$monitor("At time %2t, alu_op=%d, funct=%d, alu_ctrl_out=%d", $time, alu_op, funct, alu_ctrl_out);

endmodule	