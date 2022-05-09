
module Branch(PCSrc, Br, Zero);

output PCSrc;
input Br, Zero;

assign PCSrc = Br & Zero;

endmodule 