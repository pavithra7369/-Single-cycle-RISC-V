  
`timescale 1ns / 1ps

module imm_gen(instruction,imm_out);
input [31:0] instruction; // 32-bit instruction input
output reg [31:0] imm_out; // 32-bit immediate value output
    always @(*) begin
        case (instruction[6:0]) // Check opcode to determine immediate type
            7'b0000011: begin // I-type (Load)
                imm_out = {{20{instruction[31]}}, instruction[31:20]};
            end
            7'b0010011: begin // I-type (Arithmetic)
                imm_out = {{20{instruction[31]}}, instruction[31:20]};
            end
            7'b0100011: begin // S-type (Store)
                imm_out = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
            end
            7'b1100011: begin // B-type (Branch)
                imm_out = {{19{instruction[31]}}, instruction[7], instruction[30:25], instruction[11:8], 1'b0};
            end
            7'b0110111: begin // U-type (LUI)
                imm_out = {instruction[31:12], 12'b0};
            end
            7'b1101111: begin // J-type (JAL)
                imm_out = {{11{instruction[31]}}, instruction[19:12], instruction[20], instruction[30:21], 1'b0};
            end
            default: begin
                imm_out = 32'b0; // Default case (should be handled according to your design)
            end
            // the imm_out is going to be given to mux2 as a input 
        endcase
    end
endmodule
  
