`timescale 1ns / 1ps

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
