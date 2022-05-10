

module EXE2MEM (clk, rst, WB_EN_IN, MEM_R_EN_IN, MEM_W_EN_IN, ALUResIn, STValIn, destIn, WB_EN, MEM_R_EN,    MEM_W_EN,  ALURes,   STVal,   dest);
  input clk, rst;

  input MEM_R_EN_IN, MEM_W_EN_IN;
  input [1:0] WB_EN_IN;
  input [4:0] destIn;
  input [31:0]  ALUResIn, STValIn;

  output reg  MEM_R_EN, MEM_W_EN;
  output reg [1:0] WB_EN;
  output reg [4:0] dest;
  output reg [31:0] ALURes, STVal;

  always @ (posedge clk) begin
    if (rst) begin
      {WB_EN, MEM_R_EN, MEM_W_EN, ALURes, STVal, dest} <= 0;
    end
    else begin
      WB_EN <= WB_EN_IN;
      MEM_R_EN <= MEM_R_EN_IN;
      MEM_W_EN <= MEM_W_EN_IN;
      ALURes <= ALUResIn;
      STVal <= STValIn;
      dest <= destIn;
    end
  end
endmodule // EXE2MEM