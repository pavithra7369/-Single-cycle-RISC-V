`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 12:31:14
// Design Name: 
// Module Name: adder1
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

////pc+4 adder
//module adder1(a,b,sum);
//input [31:0]a;  // a in the input , it is pc output
//input [31:0]b;

//output [31:0]sum;
////assign b =32'd4;
//assign sum=a+b;  // sum is one input to mux1

//endmodule

/*module adder1(a, b, sum);
    input [31:0] a;  // a is the input, it is the PC output
    input [31:0] b;

    output [31:0] sum;

    assign sum = a + b;  // sum is one input to mux1
endmodule
*/

module adder1 (a,out);
input [31:0] a;
    output [31:0] out;
    assign out = a + 32'd4;

endmodule
