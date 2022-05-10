//comparator for rs and rt for branch decision.

module comparator(input [31:0] in1, in2, output equal);
	
	if (in1==in2) begin
		assign equal = 1'b1;
	else
		assign equal = 1'b0;
	end	

endmodule
