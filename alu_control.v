`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 13:52:35
// Design Name: 
// Module Name: alu_control
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


module alu_control(aluop,funct3,funct7,alu_ctrl);

 input [1:0] aluop;    // ALU operation signal from control unit
 input [2:0] funct3;    // funct3 field from the instruction
 input funct7;     // funct7 field from the instruction (R-type only)
 output reg [3:0] alu_ctrl; // ALU control signals

    always @(*) begin
        case (aluop)
            2'b00: begin // Load/Store instructions (I-type)
                case (funct3)
                    3'b000: alu_ctrl = 4'b0010; // ADD
                    3'b100: alu_ctrl = 4'b0110; // SUB (or others like AND, OR as per instruction)
                    default: alu_ctrl = 4'b0000; // Default case (should handle as per requirement)
                endcase
            end
            2'b01: begin // Branch instructions (B-type)
                case (funct3)
                    3'b000: alu_ctrl = 4'b0110; // SUB (for BEQ)
                    3'b001: alu_ctrl = 4'b0110; // SUB (for BNE)
                    default: alu_ctrl = 4'b0000; // Default case
                endcase
            end
            2'b10: begin // R-type instructions
                case ({funct7, funct3})
                    10'b0000000_000: alu_ctrl = 4'b0010; // ADD
                    10'b0000000_111: alu_ctrl = 4'b0000; // AND
                    10'b0000000_110: alu_ctrl = 4'b0001; // OR
                    10'b0100000_000: alu_ctrl = 4'b0110; // SUB
                    default: alu_ctrl = 4'b0000; // Default case
                endcase
            end
            2'b11: begin // Immediate-type (for I-type operations)
                case (funct3)
                    3'b000: alu_ctrl = 4'b0010; // ADD
                    3'b111: alu_ctrl = 4'b0000; // AND (for example)
                    default: alu_ctrl = 4'b0000; // Default case
                endcase
            end
            default: alu_ctrl = 4'b0000; // Default case
        endcase
    end

endmodule
