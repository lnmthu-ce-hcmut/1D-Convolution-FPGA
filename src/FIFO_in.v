`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.11.2022 11:07:59
// Design Name: 
// Module Name: FIFO_in
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


module FIFO_in(
    input clk,
    input reset,
    input [31:0] data_in,
    input [31:0] kernel_in,
    output reg [31:0] data_out,
    output reg [31:0] kernel_out,
    output reg en    
    );
    
    reg [31:0] FIFO [7:0];
    reg [2:0] w_pt;
    reg [2:0] r_pt;
    reg [1:0] countr;
    
    always @(posedge clk or negedge reset)
    begin
        if (!reset)
        begin
            r_pt <= 0;
            w_pt <= 0;
            countr <= 0;
            en <= 1;
            data_out <= 0;
        end
        else
        begin
            if (w_pt - r_pt < 7)
            begin
                en <= 1;
                FIFO[w_pt] <= data_in;
                w_pt <= w_pt + 1;
            end
            else
            begin
                en <= 0;
            end
            
            if (w_pt - r_pt != 0)
            begin
               data_out <= FIFO[r_pt];
               r_pt <= r_pt + 1;
               countr <= countr + 1;
            end
            if (countr == 2)
            begin
                countr <= 0;
                r_pt <= r_pt - 1;
            end
        end
    end
endmodule
