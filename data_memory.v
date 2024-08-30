`timescale 1ns / 1ps
module data_memory(clk,address,write_data,Memwrite,Memread,read_data );
input[31:0]address; 
input clk; //address is coming from alu
input[31:0]write_data; //rd2 from registerfile
input Memwrite,Memread;
output [31:0]read_data;
//memory
reg [31:0]mems[0:31];

initial
begin
mems[0] = 32'h00000000;
mems[1] = 32'h00000000;
mems[2] = 32'h00000000;
mems[3] = 32'h00000000;
mems[4] = 32'h00000000;
mems[5] = 32'h00000000;
mems[6] = 32'h00000000;
mems[7] = 32'h00000000;
mems[8] = 32'h00000000;
mems[9] = 32'h00000000;
mems[10] = 32'h00000000;
mems[11] = 32'h00000000;
mems[12] = 32'h00000000;
mems[13] = 32'h00000000;
mems[14] = 32'h00000000;
mems[15] = 32'h00000000;
mems[16] = 32'h00000000;
mems[17] = 32'h00000000;
mems[18] = 32'h00000000;
mems[19] = 32'h00000000;
mems[20] = 32'h00000000;
mems[21] = 32'h00000000;
mems[22] = 32'h00000000;
mems[23] = 32'h00000000;
mems[24] = 32'h00000000;
mems[25] = 32'h00000000;
mems[26] = 32'h00000000;
mems[27] = 32'h00000000;
mems[28] = 32'h00000000;
mems[29] = 32'h00000000;
mems[30] = 32'h00000000;

end


always @(posedge clk)
begin

if(Memwrite==1'b1)
mems[address] <= write_data;

end

assign read_data = (Memread==1'b1) ? mems[address]: 32'd0; 


endmodule
