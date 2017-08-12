`include "inverter_8bits.v"
`include "adder_2bits.v"
module addsub_8bits
(
	input [7:0] a, b,
	input m,
	output [7:0] w,
	output ov_flag
); 
wire [7:0] e;
wire [7:0] c;

inverter_8bits		inv1(b, m, e);

adder_2bits cla1(a[1:0], e[1:0], m, w[1:0], c[1:0]);
adder_2bits cla2(a[3:2], e[3:2], c[0], w[3:2], c[3:2]);
adder_2bits cla3(a[5:4], e[5:4], c[2], w[5:4], c[5:4]);
adder_2bits cla4(a[7:6], e[7:6], c[4], w[7:6], c[7:6]);

assign ov_flag = c[7] ^ c[6];
endmodule
