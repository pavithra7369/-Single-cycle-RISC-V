
module mux1(pc_plus_four,pc_plus_offset,branch_select, pc_next);
input [31:0] pc_plus_four;
input [31:0] pc_plus_offset;
input branch_select;
output reg [31:0] pc_next;
    // Always block to handle input changes
    always @(*) begin
        pc_next = branch_select ? pc_plus_offset : pc_plus_four;
    end
initial begin  pc_next=32'd0; end
endmodule
