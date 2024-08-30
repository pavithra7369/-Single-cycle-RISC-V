`timescale 1ns / 1ps
//mux2 is to select between imm_gen and registterfile and give output to alu block
module mux2(d1,d2,s2,y2);
input [31:0] d1,d2;
input s2;
output [31:0] y2;
// d1 is input coming from registerfile
//d2 is input coming from imm_gen 
// select signal fro this comes from control unit, the control signal is ALUsrc
assign y2=s2?d2:d1;

endmodule

