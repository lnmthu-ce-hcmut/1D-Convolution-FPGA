`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2022 01:48:39 PM
// Design Name: 
// Module Name: newadd
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


module newadd(a, b, ck, cout, sum);
input [3:0] a, b;
input ck;
output cout;
output [3:0] sum;
c_addsub_0 add1 (
  .A(a),          // input wire [3 : 0] A
  .B(b),          // input wire [3 : 0] B
  .CLK(ck),      // input wire CLK
  .C_OUT(cout),  // output wire C_OUT
  .S(sum)          // output wire [3 : 0] S
);
endmodule
