

module EXE2MEM (clk, rst, WB_EN_IN, MEM_R_EN_IN, MEM_W_EN_IN, ALUResIn, STValIn, destIn,Zeroflag, branch
                          WB_EN,    MEM_R_EN,    MEM_W_EN, Zero,branch_out,  ALURes,   STVal,   dest);
  input clk, rst, Zeroflag,branch;

  input WB_EN_IN, MEM_R_EN_IN, MEM_W_EN_IN;
  input [4:0] destIn;
  input [31:0]  ALUResIn, STValIn;

  output reg WB_EN, MEM_R_EN, MEM_W_EN, Zero,branch_out;
  output reg [4:0] dest;
  output reg [31:0] ALURes, STVal;

  always @ (posedge clk) begin
    if (rst) begin
      {WB_EN, MEM_R_EN, MEM_W_EN, ALURes, STVal, dest} <= 0;
    end
    else begin
      Zero <= Zeroflag;
      WB_EN <= WB_EN_IN;
      MEM_R_EN <= MEM_R_EN_IN;
      MEM_W_EN <= MEM_W_EN_IN;
      ALURes <= ALUResIn;
      STVal <= STValIn;
      dest <= destIn;
      branch_out<=branch;
    end
  end
endmodule // EXE2MEM