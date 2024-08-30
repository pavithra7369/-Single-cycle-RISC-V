`timescale 1ns / 1ps
module instruction_mem(adrr_in,instr,clk);
input [31:0]adrr_in; // this input is output of pc 
output [31:0] instr; // this shud contain the instruction at tht memory adrress
input clk;
//instruction memory declaration
reg [31:0]mem1[0:31]; //32 X 32
//
initial begin
mem1[5]  = 32'h00208113; // addi x2, x2, 2
mem1[14] = 32'h00402123; // sw x4, 4(x0)
mem1[9]  = 32'h00F101B3; // add x3, x2, x15
mem1[18] = 32'h00A021A3; // sw x5, 10(x0)

mem1[1]  = 32'h00110093; // addi x2, x2, 1
mem1[7]  = 32'h00208113; // addi x2, x2, 2
mem1[4]  = 32'h00A101B3; // add x3, x2, x10
mem1[12] = 32'h00F021A3; // sw x5, 15(x0)

mem1[0]  = 32'h00120093; // addi x2, x2, 1
mem1[2]  = 32'h00302123; // sw x3, 3(x0)
mem1[11] = 32'h008101B3; // add x3, x2, x8
mem1[20] = 32'h00A021A3; // sw x5, 10(x0)

mem1[8]  = 32'h00008063; // BEQ x1, x2, offset (example offset)
mem1[13] = 32'hFE0FF063; // BEQ x1, x2, offset (negative offset example)
mem1[6]  = 32'h00A0006F; // JAL x1, offset (example offset)
mem1[15] = 32'hF00FF06F; // JAL x1, offset (negative offset example)

end
assign instr = mem1[adrr_in];
endmodule
