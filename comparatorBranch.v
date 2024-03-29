//comparator for rs and rt for branch decision.

module comparator(input [31:0] in1, in2, output reg equal);
	
always @(*) begin
	if (in1==in2) 
		 equal = 1'b1;
	else  
		 equal = 1'b0;
end
endmodule

/*
module Comparator(inData1 ,inData2 ,equalFlag);

input [31:0]  inData1;
input [31:0]  inData2;
output equalFlag;

assign equalFlag = (inData1 == inData2) ? 1'b1 : 1'b0;

endmodule
*/