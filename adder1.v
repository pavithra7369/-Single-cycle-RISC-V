`timescale 1ns / 1ps
module adder1 (a,out);
input [31:0] a;
    output [31:0] out;
    assign out = a + 32'd4;

endmodule
