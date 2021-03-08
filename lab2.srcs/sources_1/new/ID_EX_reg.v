`timescale 1ns / 1ps

module ID_EX_reg(input clk, reset,

                 input [31:0] PC_ID,
                 input [31:0] IMM_ID,
                 input [31:0] REG_DATA1_ID, REG_DATA2_ID,
                 input [2:0] FUNCT3_ID,
                 input [6:0] FUNCT7_ID,
                 input [6:0] OPCODE_ID,
                 input [4:0] RD_ID,
                 input [4:0] RS1_ID,
                 input [4:0] RS2_ID,
                 
                 input MemRead_ID, MemtoReg_ID, MemWrite_ID, RegWrite_ID, Branch_ID, ALUSrc_ID,
                 input [1:0] ALUop_ID,
                 
                 output reg [31:0] PC_EX,
                 output reg [31:0] IMM_EX,
                 output reg [31:0] REG_DATA1_EX, REG_DATA2_EX,
                 output reg [2:0] FUNCT3_EX,
                 output reg [6:0] FUNCT7_EX,
                 output reg [4:0] RD_EX,
                 output reg [4:0] RS1_EX,
                 output reg [4:0] RS2_EX,
                 
                 output reg MemRead_EX, MemtoReg_EX, MemWrite_EX, RegWrite_EX, Branch_EX, ALUSrc_EX,
                 output reg [1:0] ALUop_EX);
    
    always @ (posedge clk) begin
        if (reset) begin
            PC_EX = 0;
            IMM_EX = 0;
            REG_DATA1_EX = 0; 
            REG_DATA2_EX = 0;
            FUNCT3_EX = 0;
            FUNCT7_EX = 0;
            RD_EX = 0;
            RS1_EX = 0;
            RS2_EX = 0;
            MemRead_EX = 0; 
            MemtoReg_EX = 0; 
            MemWrite_EX = 0; 
            RegWrite_EX = 0; 
            Branch_EX = 0; 
            ALUSrc_EX = 0;
            ALUop_EX = 0;
        end else begin
            PC_EX = PC_ID;
            IMM_EX = IMM_ID;
            REG_DATA1_EX = REG_DATA1_ID; 
            REG_DATA2_EX = REG_DATA2_ID;
            FUNCT3_EX = FUNCT3_ID;
            FUNCT7_EX = FUNCT7_ID;
            RD_EX = RD_ID;
            RS1_EX = RS1_ID;
            RS2_EX = RS2_ID;
            MemRead_EX = MemRead_ID; 
            MemtoReg_EX = MemtoReg_ID; 
            MemWrite_EX = MemWrite_ID; 
            RegWrite_EX = RegWrite_ID; 
            Branch_EX = Branch_ID; 
            ALUSrc_EX = ALUSrc_ID;
            ALUop_EX = ALUop_ID;
        end
    end

endmodule
