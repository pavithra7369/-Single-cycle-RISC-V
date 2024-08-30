`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 12:27:14
// Design Name: 
// Module Name: pc
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

//program counter is used to increment the pc by 4 , or increment the pc based on the branch offset
module pc(clk,rst,din,dout);
input clk,rst;
input [31:0]din;
output reg [31:0] dout;
//assign din=32'd0;
always@(posedge clk )
begin
if(rst)
dout<=32'h0;
else
dout<=din;
end

endmodule


