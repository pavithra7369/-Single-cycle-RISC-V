module instruction_mem(
    input [31:0] adrr_in,   // Address input, should be aligned to 4 bytes
    output reg [31:0] instr,    // Instruction at the given address
    input clk
);

    // Instruction memory declaration
    reg [31:0] mem1[0:31];  // 32 x 32-bit memory array

    // Initialize the memory with instructions
    initial begin
        // Example instructions  // we can either use a mem file , or pass instructions manually 
        mem1[1]  = 32'h00028263; // BEQ x1, x2, offset (0)
        mem1[32]  = 32'h00110093; // addi x2, x2, 1
        mem1[2]  = 32'h00302123; // sw x3, 3(x0)
        mem1[0]  = 32'h003101B3; // add x3, x2, x3
        mem1[4]  = 32'h00A101B3; // add x3, x2, x10
        mem1[5]  = 32'h00208113; // addi x2, x2, 2
        mem1[6]  = 32'h00A0006F; // JAL x1, offset (example offset)
        mem1[7]  = 32'h00208113; // addi x2, x2, 2
        mem1[8]  = 32'h00008063; // BEQ x1, x2, offset (example offset)
        mem1[9]  = 32'h00F101B3; // add x3, x2, x15
        mem1[10] = 32'h00108113; // addi x2, 1(x1)
        mem1[11] = 32'h008101B3; // add x3, x2, x8
        mem1[12] = 32'h00F021A3; // sw x5, 15(x0)
        mem1[13] = 32'hFE0FF063; // BEQ x1, x2, negative offset example
        mem1[14] = 32'h00402123; // sw x4, 4(x0)
        mem1[15] = 32'hF00FF06F; // JAL x1, negative offset example
        mem1[16] = 32'h00A021A3; // sw x5, 10(x0)
        mem1[17] = 32'hFF0FF063; // BEQ x1, x2, another negative offset example
        mem1[18] = 32'h00A021A3; // sw x5, 10(x0)
        mem1[19] = 32'h00110093; // addi x2, x2, 1
        mem1[20] = 32'h003101B3; // add x3, x2, x3
    end

    // Output the instruction from memory
    always @(*) begin
        instr = mem1[adrr_in]; // Divide address by 4 for word alignment
    end

endmodule
