`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 14:41:13
// Design Name: 
// Module Name: mux3
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


module mux3(h,i,j,k );
input [31:0]h,i;
//select signal is mem2reg 
input j;
output [31:0]k;
assign k=(j)?i:h;
//consider i is output from data_memory, read_data
//the other is output of slu block
endmodule
