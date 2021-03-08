`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2020 05:21:34 PM
// Design Name: 
// Module Name: IF
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

module IF(input clk, reset,
          input PC_Src, PC_Write,
          input [31:0] PC_Branch,
          output [31:0] PC_IF, INSTRUCTION_IF);

    wire [31:0] PC_Plus_4, PC_Mux, PC_Out;
    // incrementam cu 4 PC-ul anterior
    adder adder(PC_Out, 4, PC_Plus_4);
    // in functie de PC_Src, alegem daca urmatoarea instructiune e
    // la distanta de 4 sau trebuie salt
    mux2_1 mux(PC_Plus_4, PC_Branch, PC_Src, PC_Mux);
    
    PC PC(clk, reset, PC_Write, PC_Mux, PC_Out);
    
    assign PC_IF = PC_Out;
    
    // Citim instructiunea din memorie de la PC-ul curent.
    // Pentru ca, daca dadeam PC_Out[9:0] si shiftam cu 2 in instruction_memory,
    // pierdem din memorie practic (nu mai putem ajunge pana la 1024), am ales
    // sa "shiftez" aici direct, ca sa nu pierdem spatiu de adresare
    instruction_memory mem(PC_Out[11:2], INSTRUCTION_IF);
endmodule
