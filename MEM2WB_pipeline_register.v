module MEM2WB (clk, rst, WB_EN_IN, ALUResIn, memReadValIn, destIn,
                         WB_EN,    ALURes,   memReadVal,   dest);
  input clk, rst;

  input [1:0] WB_EN_IN;
  input [4:0] destIn;
  input [31:0] ALUResIn, memReadValIn;

  output reg [1:0]WB_EN;
  output reg [4:0] dest;
  output reg [31:0] ALURes, memReadVal;

  always @ (posedge clk) begin
    if (rst) begin
      {WB_EN, dest, ALURes, memReadVal} <= 0;
    end
    else begin
      WB_EN <= WB_EN_IN;
      dest <= destIn;
      ALURes <= ALUResIn;
      memReadVal <= memReadValIn;
    end
  end
endmodule // MEM2WB