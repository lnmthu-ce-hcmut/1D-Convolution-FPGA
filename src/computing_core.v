`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2022 10:54:47
// Design Name: 
// Module Name: computing_core
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


module computing_core(

    input clk,
    input reset,
    input [31:0] data_kernel,
    input [31:0] data_in_0,
    //input [31:0] data_in_1,
    //input [31:0] data_in_2,
    //input [31:0] data_in_3,
    output [31:0] data_out_0,
    //output [31:0] data_out_1,
    //output [31:0] data_out_2,
    //output [31:0] data_out_3,
    output en,
    output done,
   
    );
    
    wire [31:0] mul_sum_0;
    wire [31:0] ker_mul;
    
    wire [31:0] D_mul;
    wire count_ready;
    wire read1;
    wire [31:0] FIFO_ker_0;
    wire [31:0] FIFO_mul_0;

    
    
    
    FIFO_in _FIFO_in_0(
        .clk        (clk),
        .reset      (reset),
        .data_in    (data_in_0),
        .kernel_in  (data_kernel),
        .data_out   (FIFO_mul_0),
        .kernel_out (FIFO_ker_0),
        .en         (en)
    );
    kernel_FIFO _FIFO(
        .data_in    (data_kernel), //FIFO_ker_0
        .clk        (clk),
        .reset      (reset),
        .data_out   (ker_mul),
        .ready      (read1)
    );
    
    D_ff _D_0(
        .clk        (clk),
        .reset      (reset),
        .D          (ker_mul),
        .Q          (D_mul)
    );
    
    count_clk _count_0(
        .clk        (clk),
        .reset      (reset),
        .in         (read1),
        .out        (count_ready)
    );
    mul_block _mul_0(
        .clk        (clk),
        .reset      (reset),
        .data_in    (FIFO_mul_0),
        .kernel_in  (D_mul),
        .data_out   (mul_sum_0)
    );
    
    sum_block _sum_0(
        .clk        (clk),
        .ready      (count_ready),
        .reset      (reset),
        .data_in    (mul_sum_0),
        .data_out   (data_out_0),
        .done       (done)
    );
    
    port p1(
    
    );
endmodule



