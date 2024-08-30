`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 12:44:31
// Design Name: 
// Module Name: andd
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module andd(zeroo,branchh, outt);
input zeroo,branchh;
output outt;
 assign outt=zeroo&&branchh;
 // zero is coming from alu 
 //branch is a control signal coming from control unit
endmodule
