`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 14:16:35
// Design Name: 
// Module Name: alu
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
/*module alu(
    input  [31:0] ainn,        // First 32-bit operand
    input  [31:0] bin,         // Second 32-bit operand
    input  [3:0]  alu_ctrll,   // ALU control signal from ALUControl unit
    output reg [31:0] result,  // 32-bit result of the ALU operation
    output zero                // Zero flag, indicates if result is zero
);

    // Zero flag
    assign zero = (result == 32'b0);

    always @(*) begin
        case (alu_ctrll)
            4'b0010: result = ainn + bin;           // ADD operation
            4'b0110: result = ainn - bin;           // SUB operation
            4'b0000: result = ainn & bin;           // AND operation
            4'b0001: result = ainn | bin;           // OR operation
            4'b1100: result = ~(ainn | bin);        // NOR operation
            4'b0111: result = (ainn < bin) ? 32'b1 : 32'b0; // SLT (Set Less Than)
            4'b0011: result = ainn << bin;          // Logical shift left
            4'b0101: result = ainn >> bin;          // Logical shift right
            4'b0110: result = ainn * bin;           // MULTIPLY operation
            4'b0111: result = ainn ^ bin;           // XOR operation
            default: result = 32'b0;                // Default case
        endcase
    end

endmodule
*/
module alu(ainn,bin,alu_ctrll,result,zero);
 input  [31:0] ainn;           // First 32-bit operand
 input  [31:0] bin;     // Second 32-bit operand
 input  [3:0]  alu_ctrll;   // ALU control signal from ALUControl unit
 output reg [31:0] result; // 32-bit result of the ALU operation
 output zero ;               // Zero flag, indicates if result is zero

    // Zero flag
    assign zero = (result == 32'b0);

    always @(*) begin
        case (alu_ctrll)
            4'b0010: result = ainn + bin;          // ADD operation
            4'b0110: result = ainn - bin;          // SUB operation
            4'b0000: result = ainn & bin;          // AND operation
            4'b0001: result = ainn | bin;          // OR operation
            4'b1100: result = ~(ainn | bin);       // NOR operation
            4'b0111: result = (ainn < bin) ? 32'b1 : 32'b0; // SLT (Set Less Than)
            default: result = 32'b0;          // Default case
        endcase
    end

endmodule
