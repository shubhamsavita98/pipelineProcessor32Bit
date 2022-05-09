
module shift(signextend, signextendshift)

input signextend;
output signextendshift;

signextendshift = signextend << 2;

endmodule 