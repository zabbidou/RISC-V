`timescale 1ns / 1ps

module EX(input [31:0] IMM_EX, // mux3, adder
          input [31:0] REG_DATA1_EX, // mux1
          input [31:0] REG_DATA2_EX, // mux2
          input [31:0] PC_EX, // adder
          input [2:0] FUNCT3_EX, // control
          input [6:0] FUNCT7_EX, // control
          input [4:0] RD_EX, // nu
          input [4:0] RS1_EX, // nu
          input [4:0] RS2_EX, // nu
          input RegWrite_EX, // nu
          input MemtoReg_EX, // nu
          input MemRead_EX, // nu
          input MemWrite_EX, // nu
          input [1:0] ALUop_EX, // control
          input ALUSrc_EX, // mux3
          input Branch_EX, // nu
          input [1:0] forwardA, forwardB, // mux1, mux2
          
          input [31:0] ALU_DATA_WB, // mux1, mux2
          input [31:0] ALU_OUT_MEM, // mux1, mux2
          
          output ZERO_EX, // alu
          output [31:0] ALU_OUT_EX, // alu
          output [31:0] PC_Branch_EX, // adder
          output [31:0] REG_DATA2_EX_FINAL // mux2
          );

    
    wire [31:0] out_mux1, out_mux2, out_mux3;
    wire [3:0] ALUinput_EX;
    mux4_1 mux1(REG_DATA1_EX, ALU_DATA_WB, ALU_OUT_MEM, 0, forwardA, out_mux1);
    mux4_1 mux2(REG_DATA2_EX, ALU_DATA_WB, ALU_OUT_MEM, 0, forwardB, out_mux2);
    
    mux2_1 mux3(out_mux2, IMM_EX, ALUSrc_EX, out_mux3);
    
    adder add(PC_EX, IMM_EX, PC_Branch_EX);
    
    ALUcontrol control(ALUop_EX, FUNCT7_EX, FUNCT3_EX, ALUinput_EX); 

    ALU alu(ALUinput_EX, out_mux1, out_mux3, ZERO_EX, ALU_OUT_EX);
    
    assign REG_DATA2_EX_FINAL = out_mux2;

endmodule