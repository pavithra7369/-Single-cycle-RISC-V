`timescale 1ns / 1ps

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




