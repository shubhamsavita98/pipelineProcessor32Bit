//module testbench
`timescale 1ns/100ps

module mipsTestbench;
	reg reset;
	reg clk;
	
top uut(reset, clk);
	
always #10 clk = ~clk;

initial
	begin
		reset = 1;
	end


endmodule	
