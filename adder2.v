`timescale 1ns / 1ps
module adder2 (signed_offset,pc_present, pc_plus_signed_offset);

  input [31:0] signed_offset;
  input [31:0] pc_present;
  output reg [31:0] pc_plus_signed_offset;

    // Use an always block to handle procedural assignment
    always @(*) begin
        pc_plus_signed_offset = pc_present + signed_offset;
    end

endmodule   

