
module Branch(PCSrc, Br, Zero)

output PCSrc;
input Br, Zero;

PCSrc = Br & Zero;

endmodule 