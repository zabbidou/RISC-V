`timescale 1ns / 1ps

module MEM_WB_reg(input clk, reset,
                  input [31:0] ALU_OUT_MEM,
                  input [31:0] read_data_MEM,
                  input MemRead_MEM, MemtoReg_MEM, MemWrite_MEM, RegWrite_MEM, Branch_MEM,
                  input [4:0] RD_MEM,
                  output reg [31:0] ALU_OUT_WB,
                  output reg [31:0] read_data_WB,
                  output reg MemRead_WB, MemtoReg_WB, MemWrite_WB, RegWrite_WB, Branch_WB,
                  output reg [4:0] RD_WB);

    always @ (posedge clk) begin
        if (reset) begin
            ALU_OUT_WB = 0;
            read_data_WB = 0;
            MemRead_WB = 0; 
            MemtoReg_WB = 0; 
            MemWrite_WB = 0; 
            RegWrite_WB = 0; 
            Branch_WB = 0; 
            RD_WB = 0;
        end else begin
            ALU_OUT_WB = ALU_OUT_MEM;
            read_data_WB = read_data_MEM;
            MemRead_WB = MemRead_MEM; 
            MemtoReg_WB = MemtoReg_MEM; 
            MemWrite_WB = MemWrite_MEM; 
            RegWrite_WB = RegWrite_MEM; 
            Branch_WB = Branch_MEM; 
            RD_WB = RD_MEM;
        end
    end

endmodule
