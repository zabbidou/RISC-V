`timescale 1ns / 1ps

module ALUcontrol(input [1:0] ALUop,
                  input [6:0] funct7,
                  input [2:0] funct3,
                  output reg [3:0] ALUinput);

    always @ (*) begin
        case (ALUop)
            2'b00 : ALUinput = 4'b0010; // ld / st        
            2'b01 : begin
                case (funct3[2:1])
                    2'b00 : ALUinput = 4'b0110; // beq / bne
                    2'b10 : ALUinput = 4'b1000; // blt / bge
                    2'b11 : ALUinput = 4'b0111; // bltu / bgeu
                endcase       
            end
            2'b10 : begin
                case (funct3) //                           add       sub
                    3'b000 : ALUinput = (funct7 == 0) ? 4'b0010 : 4'b0110;
                    3'b001 : ALUinput = 4'b0100;
                    3'b010 : ALUinput = 4'b1000;
                    3'b011 : ALUinput = 4'b0111;
                    3'b100 : ALUinput = 4'b0011; //        srl       sra
                    3'b101 : ALUinput = (funct7 == 0) ? 4'b0101 : 4'b1001;
                    3'b110 : ALUinput = 4'b0001;
                    3'b111 : ALUinput = 4'b0000;
                endcase
            end
        endcase
    end

endmodule