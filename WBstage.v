
module WBstage(WB, WB_Data, WB_Address, Write_Data)

input [1:0] WB;
input [31:0] WB_Data, WB_Address;

output [31:0] Write_Data;

RegWrite <= WB_WB[1];
mux u(WB_Data, WB_Address, WB_WB[0], Write_Data)

endmodule 