`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2022 05:17:10 PM
// Design Name: 
// Module Name: newmul
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


module newmul(a, b, ck, mul);
input ck;
input [3:0]a, b;
output [7:0] mul;
mult_gen_0 mul1 (
  .CLK(ck),  // input wire CLK
  .A(a),      // input wire [3 : 0] A
  .B(b),      // input wire [3 : 0] B
  .P(mul)      // output wire [7 : 0] P
);

endmodule
