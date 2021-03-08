`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2020 05:25:11 PM
// Design Name: 
// Module Name: test
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


module test(

    );
    
    reg [4:0] a;
    reg true;
    
    initial begin
        a = 5'b11001;
        #10
        true = (a == 0);
        
        #20
        a = 5'b00000;
        #10
        true = (a == 0);
        
        
        #20
        $stop;
    end
endmodule
