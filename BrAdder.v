
module BrAdder(signexshift, PCAddress, Branch_Address)

input [31:0]signexshift, PCAddress;
output [31:0] Branch_Address;

Branch_Address = signexshift + PCAddress;

endmodule 