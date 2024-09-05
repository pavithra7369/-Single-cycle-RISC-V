`timescale 1ns / 1ps

module control(dinput,branch,memread,memtoreg,aluop,memwrite,alusrc,regwrite);

    input [6:0] dinput;    // 7-bit opcode input
    output reg branch;       // Branch control signal
    output reg memread;      // Memory read control signal
    output reg memtoreg;     // Memory to register control signal
    output reg [1:0] aluop;  // ALU operation control signal
    output reg memwrite;  // Memory write control signal
    output reg alusrc;     // ALU source control signal
    output reg regwrite;      // Register write control signal

    always @(*) begin
        // Default values (if no match)
        branch   = 0;
        memread  = 0;
        memtoreg = 0;
        aluop    = 2'b00;
        memwrite = 0;
        alusrc   = 0;
        regwrite = 0;
        
        case (dinput)
            7'b0110011: begin // R-type
                branch   = 0;
                memread  = 0;
                memtoreg = 0;
                aluop    = 2'b10; // ALU operation (R-type uses ALU)
                memwrite = 0;
                alusrc   = 0;
                regwrite = 1;
            end 
            7'b0000011: begin // I-type (Load)
                branch   = 0;
                memread  = 1;
                memtoreg = 1;
                aluop    = 2'b00; // ALU operation (Load)
                memwrite = 0;
                alusrc   = 1;
                regwrite = 1;
            end
            7'b0100011: begin // S-type (Store)
                branch   = 0;
                memread  = 0;
                memtoreg = 0;
                aluop    = 2'b00; // ALU operation (Store)
                memwrite = 1;
                alusrc   = 1;
                regwrite = 0;
            end
            7'b1100011: begin // B-type (Branch)
                branch   = 1;
                memread  = 0;
                memtoreg = 0;
                aluop    = 2'b01; // ALU operation (Branch)
                memwrite = 0;
                alusrc   = 0;
                regwrite = 0;
            end
            7'b0010011: begin // I-type (Immediate)
                branch   = 0;
                memread  = 0;
                memtoreg = 0;
                aluop    = 2'b10; // ALU operation (Immediate)
                memwrite = 0;
                alusrc   = 1;
                regwrite = 1;
            end
            7'b1100111: begin // JALR-type (Jump and Link Register)
                branch   = 0;
                memread  = 0;
                memtoreg = 1;
                aluop    = 2'b11; // ALU operation (JALR)
                memwrite = 0;
                alusrc   = 1;
                regwrite = 1;
            end
            7'b1101111: begin // JAL-type (Jump and Link)
                branch   = 1;
                memread  = 0;
                memtoreg = 1;
                aluop    = 2'b11; // ALU operation (JAL)
                memwrite = 0;
                alusrc   = 0;
                regwrite = 1;
            end
            default: begin
                branch   = 1'bx;
                memread  = 1'bx;
                memtoreg = 1'bx;
                aluop    = 2'bxx;
                memwrite = 1'bx;
                alusrc   = 1'bx;
                regwrite = 1'bx;
            end
        endcase
    end

endmodule

