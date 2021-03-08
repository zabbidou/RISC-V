`timescale 1ns / 1ps

module control_path(input [6:0] opcode,
                    input control_sel,
                    output reg MemRead,MemtoReg,MemWrite,RegWrite,Branch,ALUSrc,
                    output reg [1:0] ALUop);

    always @ (opcode or control_sel) begin
        if (control_sel == 1) begin
            {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUop} = 8'b00000000;
        end else begin
            case (opcode)
                7'b0000011 : {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUop} = 8'b11110000; // lw
                7'b0100011 : {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUop} = 8'b10001000; // sw
                7'b1100011 : {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUop} = 8'b00000101; // branch
                // am adaugat I type pt ca am vazut ca ALUSrc decide daca ALU ia valoarea din registru sau
                // valoarea immediate. Daca se ia immediate, ALUSrc trebuie sa fie 1
                7'b0010011 : {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUop} = 8'b10100010; // I type
                7'b0110011 : {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUop} = 8'b00100010; // R type
                // nu am pus default ca nu am considerat ca putem primi instructiuni netratate
                default: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUop} = 8'b0;
            endcase
        end
    end

endmodule