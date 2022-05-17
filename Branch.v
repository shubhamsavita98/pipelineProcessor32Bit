
module Branch(PCSrc, Br, Zero, Op);

output reg PCSrc;
input Br, Zero;
input [5:0] Op;

always@(*) begin

	PCSrc <= Br & Zero;

	if(Op == 6'b000010) //jump instruction 
		PCSrc <= Br;
	
end

endmodule 