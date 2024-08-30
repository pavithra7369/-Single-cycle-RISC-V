`timescale 1ns / 1ps

module mux3(h,i,j,k );
input [31:0]h,i;
//select signal is mem2reg 
input j;
output [31:0]k;
assign k=(j)?i:h;
//consider i is output from data_memory, read_data
//the other is output of slu block
endmodule
