`timescale 1ns / 1ps

module imm_gen(input [31:0] in, output reg [31:0] out);
    reg [6:0] opcode;
    
    always @ (in) begin
        // opcode
        // nu avem imm
        if (in[6:0] == 7'b0110011)
            out = 0;
        else
        if (in[6:0] == 7'b0010011) begin // I type
            out[31:11] = {21{in[31]}};
            out[10:0] = in[30:20];
        end else
        if (in[6:0] == 7'b0000011) begin // LW
            out[31:11] = {21{in[31]}};
            out[10:0] = in[30:20];
        end else
        if (in[6:0] == 7'b0100011) begin // SW
            out[31:11] = {22{in[31]}};
            out[10:0] = {in[30:25], in[11:8], in[7]};
        end else begin // B type
            out[31:12] = {20{in[31]}};
            out[11:0] = {in[7], in[30:25], in[11:8], 1'b0};
        end
    end
endmodule
