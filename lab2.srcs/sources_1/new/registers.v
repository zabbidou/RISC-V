`timescale 1ns / 1ps

module registers(input clk, reg_write,
                 input [4:0] read_reg1, read_reg2, write_reg,
                 input [31:0] write_data,
                 output [31:0] read_data1, read_data2);

    reg [31:0] registers [0:31];
    integer i;
    // primul reg -> registers[0]
    // bit 2 din reg 5 -> registers[5][2]
    
    // initializam cu date
    initial begin
        for (i = 0; i < 32; i = i + 1)
            registers[i] = i;
    end
    // scriem asincron
    always @ (posedge clk) begin
        if (reg_write == 1) begin // scriem aici
            registers[write_reg] = write_data;
        end
    end
    // citim asincron
    assign read_data1 = registers[read_reg1];
    assign read_data2 = registers[read_reg2];
endmodule
