`timescale 1ns / 1ps

module alu(
    input [31:0] ainn,         // First 32-bit operand
    input [31:0] bin,          // Second 32-bit operand
    input [3:0] alu_ctrll,     // ALU control signal
    output reg [31:0] result,  // 32-bit result of the ALU operation
    output zero                // Zero flag, indicates if result is zero
);

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
            4'b0011: result = ainn << bin;         // SLL (Shift Left Logical)
            4'b1000: result = ainn >> bin;         // SRL (Shift Right Logical)
            4'b1010: result = ainn >>> bin;        // SRA (Shift Right Arithmetic)
            4'b1111: result = ainn ^ bin;          // XOR operation
            default: result = 32'b0;               // Default case
        endcase
    end

endmodule

