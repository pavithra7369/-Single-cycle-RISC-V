`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 12:03:12
// Design Name: 
// Module Name: RISCV_TOP
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
/*

module RISCV_TOP(clk,rst );
input clk,rst;

wire [31:0]w1,w2,w3,w4,w8,w12,w9,w10,w11,w12,w15,w22,w23,w30;
wire w5,w6,w7,w13,w18,w19,w20,w21;
wire [1:0] w16;
wire [3:0] w17;
//w1 pc and mux1
//w2 pc and adder1pc+4
//w3 adder2 output is mux1 input
//w4 shift output
//w5 for andd gate outputand mux1 select signal
//w6 for zero of alu block
//w7 for branch from control unit
//instantiation of other blocks
//pc fetch stage, pc supplies address to instruction memeory
pc pc1(.clk(clk),.rst(rst),.din(w1),.dout(w2));
// one adder does pc+a2
adder1 ad1(.a(w2),.b(b),.sum(w30));
//second adder does addition branch offset, or branch destination address calculation is done here
adder2 ad2(.c(w2),.d(w4),.result(w3));
//the mux1 is used in fec=tch stage with control coming from and gate , it selscts between pc+4  and branch offset
mux1 m1(.p(w3),.q(w30),.s(w5),.y(w1));
// instruction mem has the instructions 
andd(.zeroo(w6),.branchh(w7),.outt(w5));
//w8 for output of instruction memory
instruction_mem mem(.adrr_in(w2),.instr(w8),.clk(clk));
// genrate immediate value based on msb
imm_gen im(.instruction(w8),.imm_out(w12));
//register file is where the insttruction gets sliced 
register_file regfile(.read_reg1(w8[19:15]),.read_reg2(w8[24:20]),.write_reg(w8[11:7]),.write_data(w9),.read_data1(w10),.read_data2(w11),.writeregister(w21));
//this mux output returns to register file, is used to steer the output of alu or of data memory for writing into register file
mux2 m2(.d1(w11),.d2(w12),.s2(w13),.y2(w15));
//alu control based on opcode gives a signal to alu
alu_control a2( .aluop(w16), .funct3(w8[14:12]),.funct7(w8[30]),.alu_ctrl(w17));
// alu block , actions differ based on instruction classes

// this mux is to determine whether the 2nd input is from register or from offset feild of instruction
mux3 m3(.h(w22),.i(w23),.j(w19),.k(w9) );
// used for genrating control signslas , main decoder and alu decoder are sub blocks
control ac(.dinput(w8[6:0]),.branch(w7),.memread(w18),.memtoreg(w19),.aluop(w16),.memwrite(w20),.alusrc(w13),.regwrite(w21));
// data memory
data_memory dm(.clk(clk),.address(w23),.write_data(w11),.Memwrite(w20),.Memread(w18),.read_data(w22) );
//shift 
shift s1(.o(w12),.l(w4));
 alu a1(.ainn(w10),.bin(w15),.alu_ctrll(w17),.result(w23),zero(w6));
endmodule */

module RISCV_TOP (
    input clk,
    input rst
);

    // Wires and registers
    wire [31:0] pc_out, pc_next, instr, imm, shifted_imm, reg_data1, reg_data2, alu_result, mem_read_data, mux1_out, mux2_out, mux3_out;
    wire [3:0] alu_ctrl;
    wire zero, branch, memread, memwrite, memtoreg, alusrc, regwrite;
    wire [1:0] aluop;
    wire branch_decision;

    // Instantiate the modules
    pc PC (
        .clk(clk),
        .rst(rst),
        .din(32'd0),
        .dout(pc_out)
    );

    adder1 ADDER1 (
        .a(pc_out),
        .out(mux1_out)  // Output to mux1 (PC + 4)
    );

    instruction_mem IMEM (
        .adrr_in(pc_out),
        .instr(instr),
        .clk(clk)
    );

    imm_gen IMM_GEN (
        .instruction(instr),
        .imm_out(imm)
    );

    shift SHIFT (
        .o(imm),
        .l(shifted_imm)  // Output after shifting
    );

    register_file REG_FILE (
        .read_reg1(instr[19:15]),  // rs1
        .read_reg2(instr[24:20]),  // rs2
        .write_reg(instr[11:7]),   // rd
        .write_data(mux3_out),
        .regwrite(regwrite),
        .alusrc(alusrc),
        .immediate(shifted_imm),  // Use shifted_imm here
        .read_data1(reg_data1),
        .read_data2(reg_data2),
        .clk(clk) // Add clock input to register_file
    );

    mux2 MUX2 (
        .d1(reg_data2),
        .d2(shifted_imm),
        .s2(alusrc),
        .y2(mux2_out)
    );

    alu_control ALU_CTRL (
        .aluop(aluop),
        .funct3(instr[14:12]),
        .funct7(instr[30]),
        .alu_ctrl(alu_ctrl)
    );

    alu ALU (
        .ainn(reg_data1),
        .bin(mux2_out),
        .alu_ctrll(alu_ctrl),
        .result(alu_result),
        .zero(zero)
    );

    data_memory DMEM (
        .clk(clk),
        .address(alu_result),
        .write_data(reg_data2),
        .Memwrite(memwrite),
        .Memread(memread),
        .read_data(mem_read_data)
    );

    mux3 MUX3 (
        .h(alu_result),
        .i(mem_read_data),
        .j(memtoreg),
        .k(mux3_out)
    );

    control CTRL (
        .dinput(instr[6:0]),
        .branch(branch),
        .memread(memread),
        .memtoreg(memtoreg),
        .aluop(aluop),
        .memwrite(memwrite),
        .alusrc(alusrc),
        .regwrite(regwrite)
    );

    adder2 ADDER2 (
        .signed_offset(shifted_imm),
        .pc_present(pc_out),
        .pc_plus_signed_offset(pc_next)  // Branch address
    );

    andd ANDD (
        .zeroo(zero),
        .branchh(branch),
        .outt(branch_decision)  // Control signal for mux1
    );

    mux1 MUX1 (
        .pc_plus_four(mux1_out),         // PC + 4
        .pc_plus_offset(pc_next),        // Branch address
        .branch_select(branch_decision), // Branch decision signal
        .pc_next(pc_next)                // Input for PC
    );


 
endmodule




