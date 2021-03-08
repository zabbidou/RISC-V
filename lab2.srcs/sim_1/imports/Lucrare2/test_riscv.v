`timescale 1ns / 1ps

module RISC_V_TB (

    );
    reg clock, reset;
    wire [31:0] PC_EX;
    wire [31:0] ALU_OUT_EX;
    wire [31:0] PC_MEM;
    wire PCSrc;
    wire [31:0] DATA_MEMORY_MEM;
    wire [31:0] ALU_DATA_WB;
    wire [1:0] forwardA, forwardB;
    wire pipeline_stall;
    
    RISC_V procesor(clock,
              reset,
              PC_EX,
              ALU_OUT_EX,
              PC_MEM,
              PCSrc,
              DATA_MEMORY_MEM,
              ALU_DATA_WB,
              forwardA, forwardB,
              pipeline_stall
             );
    
    always #5 clock=~clock;
    
    initial 
    begin
        #0 clock = 1'b0;
        reset = 1'b1;
        
        #1
        $stop;
        
        #12
        reset = 1'b0;
    end
    
endmodule