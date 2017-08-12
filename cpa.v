`include "adder_2bits.v"
module cpa
(
	input [7:0] a, b,
	input ci,
	output [7:0] s,
	output c2, c3
);
wire [8:0] c;
assign c2 = c[6];
assign c3 = c[7];
adder_2bits	cla1(a[1:0], b[1:0], ci, s[1:0], c[1:0]);
adder_2bits	cla2(a[3:2], b[3:2], c[0], s[3:2], c[3:2]);
adder_2bits	cla3(a[5:4], b[5:4], c[2], s[5:4], c[5:4]);
adder_2bits	cla4(a[7:6], b[7:6], c[4], s[7:6], c[7:6]);
//might not need that last bit for c
endmodule
