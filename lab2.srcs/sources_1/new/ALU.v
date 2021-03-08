`timescale 1ns / 1ps

module ALU(input [3:0] ALUop,
           input [31:0] ina,inb,
           output zero,
           output reg [31:0] out);

    always @(*) begin
        case (ALUop)
            4'b0010 : out = ina + inb; // ld, sd, add
            4'b0110 : out = ina - inb; // sub, beq, bge
            4'b0000 : out = ina & inb; // and
            4'b0001 : out = ina | inb; // or
            4'b0011 : out = ina ^ inb; // xor
            4'b0101 : out = ina >> inb; // srl, srli
            4'b0100 : out = ina << inb; // sll, slli
            4'b1001 : out = ina >>> inb; // sra, srai
            // comparatia din verilog e unsigned in mod normal
            // sltu -> unsigned -> out = 1 daca ina < inb
            4'b0111 : out = (ina < inb); // sltu, bltu, bgeu
            4'b1000 : out = ($signed(ina) < $signed(inb)); // slt, blt, bge
        endcase
    end
    
    assign zero = (out == 0);

endmodule