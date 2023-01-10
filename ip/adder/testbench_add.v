`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
module test_add( );
reg [3:0] a, b;
reg ck;
wire cout;
wire [3:0] sum;
newadd abc(a, b, ck, cout, sum);

initial begin
   ck = 1'b0;
   forever begin
   #1 ck = ~ck;
   end
end

initial begin
#10 
a = 5; b = 6;
#10
a = 2; b = 11;
#10 
a = 7; b = 5;
#10 
a = 4; b = 6;
end
endmodule
