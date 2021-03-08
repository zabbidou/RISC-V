`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2020 04:32:50 PM
// Design Name: 
// Module Name: PC
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

module PC(input clk, res, write,
          input [31:0] in,
          output reg [31:0] out);
          
    always @ (res) begin
        if (res == 1) out = 0;
    end
         
    always @ (posedge clk) begin
        if (write == 1) out = in;
    end
endmodule
