`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.11.2022 16:02:02
// Design Name: 
// Module Name: count_clk
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


module count_clk(
    input clk,
    input reset,
    input in,
    output reg out
    );
    reg [2:0] count;
    always @(posedge clk or negedge reset)
    begin
        if (!reset)
        begin
            count <= 0;
            out <= 0;
        end
        else
        begin
            count <= count + 1;
            if (count == 4)
            begin
                out <= in;
                count <= 0;
            end
        end
    end
endmodule
