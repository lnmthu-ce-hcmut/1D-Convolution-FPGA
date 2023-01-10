`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2022 10:54:47
// Design Name: 
// Module Name: kernel_FIFO
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


module kernel_FIFO(
    input reset,
    input clk,
    input [31:0] data_in,
    output reg [31:0] data_out,
    output reg ready
    );
    
    reg [31:0] FIFO [2:0];
    reg [2:0] wr_pt = 0;
    reg [2:0] rd_pt = 0;
    reg en;
    
    always @(posedge clk or negedge reset)
    begin
        if (!reset)
        begin
            wr_pt <= 0;
            rd_pt <= 0;
            data_out <= 0;
            ready <= 0;
            en <= 0;
        end
        else
        begin
            if (wr_pt < 3)
            begin
                FIFO[wr_pt] <= data_in;
                wr_pt <= wr_pt + 1;
                en <= 1;
            end
            
            if (en <= 1)
            begin
                data_out <= FIFO[rd_pt];
                ready <= 1;
                rd_pt <= rd_pt + 1;
            end
            if (rd_pt >= 2)
            begin
                rd_pt <= 0;
            end
        end
    end
endmodule
