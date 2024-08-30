`timescale 1ns / 1ps
module andd(zeroo,branchh, outt);
input zeroo,branchh;
output outt;
 assign outt=zeroo&&branchh;
 // zero is coming from alu 
 //branch is a control signal coming from control unit
endmodule
