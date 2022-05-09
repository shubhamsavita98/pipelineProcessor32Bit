
module shift(signextend, signextendshift);

input signextend;
output signextendshift;

assign signextendshift = signextend << 2;

endmodule 