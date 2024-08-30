`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 12:46:37
// Design Name: 
// Module Name: instruction_mem
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


module instruction_mem(adrr_in,instr,clk);
input [31:0]adrr_in; // this input is output of pc 
output [31:0] instr; // this shud contain the instruction at tht memory adrress
input clk;
//instruction memory declaration
reg [31:0]mem1[0:31]; //32 X 32
//
initial begin
 mem1[7] = 32'h00108113;
mem1[15] = 32'h00108113;     //addi x2 ,1 ,(x1)
mem1[2] = 32'h00302123; //sw x3 2(x0)
mem1[3] = 32'h003101B3; //add x3 x2 x3
mem1[4] = 32'h003021A3; //sw x3 3(x0)
      
mem1[11] = 32'h00010093; //     addi x1 0 (x2)
mem1[13] = 32'h00108113; //addi x2 1(x1)
mem1[0] = 32'h003101B3; // add x3 x2 x3
mem1[8] = 32'h00302223; //sw x3 4(x0)

mem1[6] = 32'h00010093; // addi x1 0 (x2)
mem1[10] = 32'h00108113; //   addi x2 1(x1)
mem1[20] = 32'h003101B3; //add x3 x2 x3
mem1[12] = 32'h003022A3; //  sw x3 5(x0)

//mem1[0]  = 32'h00008063; // BEQ x1, x2, offset (example offset)
mem1[17]=32'hFF0FF063;
mem1[1]  = 32'h00A0006F; // JAL x1, offset (example offset)

end
assign instr = mem1[adrr_in];
endmodule
