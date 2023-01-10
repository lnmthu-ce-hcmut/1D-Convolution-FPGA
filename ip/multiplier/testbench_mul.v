`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2022 05:20:36 PM
// Design Name: 
// Module Name: testbench_mul
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


module test_mul( );
reg [3:0] a, b;
reg ck;
wire [7:0] mul;

newmul mmm(a, b, ck, mul);

initial begin
   ck = 1'b0;
   forever begin
   #1 ck = ~ck;
   end
end

initial 
begin
#10 
a = 2; b = 5;
#10 
a = 6; b = 4;
#10 
a = 1; b = 7;
#10 
a = 5; b = 3;
end
endmodule
