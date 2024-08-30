`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 12:35:53
// Design Name: 
// Module Name: mux1
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
/*

module mux1(p,q,s,y);
input [31:0]p,q;
input s;
output [31:0]y;
// p is output from adder2
//p connect to result
// q is coming from adder1, pc+4 adder1
// q connect to sum of adder1
// select signal is coming from and gate
//y is connected  to pc as input
assign y=s?q:p;
endmodule
*/

/*
module mux1(p, q, s, y);
    input [31:0] p, q;
    input s;
    output reg [31:0] y;
always@(*)
begin
    // When `s` is high, `y` should be equal to `q` (Branch address from `adder2`)
    // When `s` is low, `y` should be equal to `p` (PC + 4 from `adder1`)
    assign y = s ? p:q;
    end
endmodule
*/

module mux1(pc_plus_four,pc_plus_offset,branch_select, pc_next);
input [31:0] pc_plus_four;
input [31:0] pc_plus_offset;
input branch_select;
output reg [31:0] pc_next;
    // Always block to handle input changes
    always @(*) begin
        pc_next = branch_select ? pc_plus_offset : pc_plus_four;
    end

endmodule

