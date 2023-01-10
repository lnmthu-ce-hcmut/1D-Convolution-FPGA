`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2022 15:13:51
// Design Name: 
// Module Name: D_ff
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


module D_ff(
    input clk,
    input reset,
    input [31:0] D,
    output reg [31:0] Q
    );
    
    always @(posedge clk or negedge reset)
    begin
        if (!reset)
        begin
            Q <= 0;
        end
        else
        begin
            Q <= D;
        end
    end
endmodule
