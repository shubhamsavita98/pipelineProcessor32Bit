
module shift(signextend, signextendshift);

input [31:0] signextend;
output [31:0] signextendshift;

assign signextendshift = signextend << 2;

endmodule 