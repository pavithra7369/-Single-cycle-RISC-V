`timescale 1ns / 1ps
module shift(o,l);
// take outpt from imm gen block and shift left once
// and give tht as input to adder2
input[31:0]o;
output [31:0]l;
assign l=o<<1;
endmodule
