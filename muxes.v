// multiplexers for pipeline stages
//`timescale 1ns/100ps
module mux (in1, in2, sel, out);
  input sel;
  input [1:0] in1, in2;
  output [1:0] out;

  assign out = (sel == 0) ? in1 : in2;
endmodule


module mux_3input (in1, in2, in3, sel, out);
  input [2:0] in1, in2, in3;
  input [1:0] sel;
  output [2:0] out;

  assign out = (sel == 2'd0) ? in1 : (sel == 2'd1) ? in2 : in3;
endmodule
