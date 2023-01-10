`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2022 10:54:47
// Design Name: 
// Module Name: sum_block
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


module sum_block(
    input clk,
    input reset,
    input [31:0] data_in,
    input ready,
    output [31:0] data_out,
    output reg done
    );
    
    wire [31:0] out;
    reg en;
    reg res;
    reg [1:0] count;
    
    assign data_out = out;
    c_addsub_0 _s0 (
        .CLK(clk),
        .A(data_in),
        .B(out & {32{res}}),
        .SCLR(!reset),
        .S(out)
    );
    
    always @(posedge clk or negedge reset)
    begin
        if (!reset)
        begin
            count <= 0;
            en <= 0;
            done <= 0;
        end
        else
        begin
            done <= 0;
            count <= count + 1;
            if (count == 2 && en == 1)
            begin
                done <= 1;
                count <= 0;
            end
            if (ready == 1 && en != 1)
            begin
                en <= 1;
                count <= 0;
                done <= 1;
            end
        end
        
    end
    
    always @(count)
    begin
        if (count==0 && en == 1) 
            res = 0;
        else
            res = 1;
    end
endmodule
