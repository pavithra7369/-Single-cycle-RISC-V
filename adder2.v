`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 12:31:27
// Design Name: 
// Module Name: adder2
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


/*module adder2(c,d,result);
// c is output from shift 'l'
//d is the output coming froom instruction memory
input [31:0]c,d;
output [31:0]result;
assign result=c+d;
// this result is another input for mux


endmodule
*/

/*module adder2(c, d, result);
    input [31:0] c, d;
    output [31:0] result;

    assign result = c + d;  // result is another input for mux
endmodule
*/

module adder2 (signed_offset,pc_present, pc_plus_signed_offset);

  input [31:0] signed_offset;
  input [31:0] pc_present;
  output reg [31:0] pc_plus_signed_offset;

    // Use an always block to handle procedural assignment
    always @(*) begin
        pc_plus_signed_offset = pc_present + signed_offset;
    end

endmodule   

