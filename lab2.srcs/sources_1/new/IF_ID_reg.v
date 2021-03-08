`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2020 12:44:30 AM
// Design Name: 
// Module Name: IF_ID_reg
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

module IF_ID_reg(input clk, input reset, input write, input[31:0] PC_IF, input[31:0] INSTR_IF,
                 output reg [31:0] PC_ID, output reg [31:0] INSTR_ID);
                 
    always @ (reset) begin
        if (reset == 1) begin
            PC_ID = 0;
            INSTR_ID = 0;
        end
    end
    
    always @ (posedge clk) begin
        if (write == 1) begin
            PC_ID = PC_IF;
            INSTR_ID = INSTR_IF;
        end
    end
endmodule
