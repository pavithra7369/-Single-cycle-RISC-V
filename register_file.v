`timescale 1ns / 1ps
module register_file(clk,read_reg1,read_reg2,write_reg,write_data,regwrite,alusrc,immediate,read_data1,read_data2);

input clk,regwrite,alusrc;               // Clock signal for synchronous operation
input [4:0] read_reg1, read_reg2,write_reg;
input [31:0] write_data, immediate, read_data1,read_data2;
// Declare memory for register file
reg [31:0] register[31:0];

// Initialize register values (for simulation purposes)
initial begin
    register[0]  = 32'h00000000;
    register[1]  = 32'h00000001;
    register[2]  = 32'h00000002;
    register[3]  = 32'h00000001;
    register[4]  = 32'h00000008;
    register[5]  = 32'h00000005;
    register[6]  = 32'h00000006;
    register[7]  = 32'h00000007;
    register[8]  = 32'h00000008;
    register[9]  = 32'h00000008;
    register[10] = 32'h00000010;
    // Initialize other registers as needed
end

// Read from the register file
assign read_data1 = (read_reg1 != 0) ? register[read_reg1] : 32'h00000000;
assign read_data2 = (read_reg2 != 0) ? register[read_reg2] : 32'h00000000;

// Write to the register file if regwrite is enabled
always @(posedge clk) begin
    if (regwrite && (write_reg != 0)) begin
        register[write_reg] <= write_data;
    end
end

endmodule



