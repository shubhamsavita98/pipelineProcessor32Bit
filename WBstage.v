
module WBstage(WB, WB_Data, WB_Address, RegWrite, Write_Data);

input [1:0] WB;
input [31:0] WB_Data, WB_Address;
output RegWrite;
output [31:0] Write_Data;

assign RegWrite = WB[1];

mux_2input32bit u(WB_Data, WB_Address, WB[0], Write_Data);

endmodule