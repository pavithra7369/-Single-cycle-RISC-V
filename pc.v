
`timescale 1ns / 1ps
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
initial begin
dout=32'd0;
end
endmodule

