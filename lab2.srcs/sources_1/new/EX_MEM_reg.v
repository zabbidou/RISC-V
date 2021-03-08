`timescale 1ns / 1ps

module EX_MEM_reg(input clk, reset,
                  input ZERO_EX, // alu
                  input [31:0] ALU_OUT_EX, // alu
                  input [31:0] PC_Branch_EX, // alu
                  input [31:0] REG_DATA2_EX, // alu
                  input MemRead_EX, MemtoReg_EX, MemWrite_EX, RegWrite_EX, Branch_EX, // control path
                  input [4:0] RD_EX, // id
                  
                  output reg ZERO_MEM, // alu
                  output reg [31:0] ALU_OUT_MEM, // alu
                  output reg [31:0] PC_Branch_MEM, // alu
                  output reg [31:0] REG_DATA2_MEM, // alu
                  output reg MemRead_MEM, MemtoReg_MEM, MemWrite_MEM, RegWrite_MEM, Branch_MEM, // control path
                  output reg [4:0] RD_MEM); // id

    always @ (posedge clk) begin
        if (reset) begin
            ZERO_MEM = 0;
            ALU_OUT_MEM = 32'b0;
            PC_Branch_MEM = 32'b0;
            REG_DATA2_MEM = 32'b0;
            MemRead_MEM = 0; 
            MemtoReg_MEM = 0; 
            MemWrite_MEM = 0; 
            RegWrite_MEM = 0; 
            Branch_MEM = 0; 
            RD_MEM = 5'b0;
        end else begin
            ZERO_MEM = ZERO_EX;
            ALU_OUT_MEM = ALU_OUT_EX;
            PC_Branch_MEM = PC_Branch_EX;
            REG_DATA2_MEM = REG_DATA2_EX;
            MemRead_MEM = MemRead_EX; 
            MemtoReg_MEM = MemtoReg_EX; 
            MemWrite_MEM = MemWrite_EX; 
            RegWrite_MEM = RegWrite_EX; 
            Branch_MEM = Branch_EX; 
            RD_MEM = RD_EX;
        end
    end
endmodule
