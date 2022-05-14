//module testbench
`timescale 1ns/10ps

module mipsTestbench;
	reg reset;
	reg clk;
	
top uut(reset, clk);
	
always #10 clk = ~clk;

initial
	begin
		reset = 1;
		clk = 0;
		#10 reset = 0;
	end

endmodule	
