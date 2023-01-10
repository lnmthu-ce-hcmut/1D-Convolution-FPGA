`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2022 10:54:47
// Design Name: 
// Module Name: mul_block
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


module mul_block(
    input clk,
    input reset,
    input [31:0] data_in,
    input [31:0] kernel_in,
    output wire [31:0] data_out
    );
    
    mult_gen_0 _m0 (
        .CLK(clk),
        .A(data_in),
        .B(kernel_in),
        .SCLR(!reset),
        .P(data_out)
    );
    
endmodule
