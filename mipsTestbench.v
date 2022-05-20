//module testbench
`timescale 1ns/10ps

module mipsTestbench;
	reg reset;
	reg clk;
	
top uut(reset, clk, inst_mem, inst_in);
	
always #10 clk = ~clk;

initial
	begin
		reset = 1;
		clk = 0;
		#20 reset = 0;
		
		#980 $stop;
	end

endmodule	
