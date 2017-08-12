`include "pg_unit_2bits.v"
`include "cla_carry_generate_2bits.v"
`include "sum_unit_2bits.v"

module adder_2bits
(
	input [1:0] a, b,
	input ci,
	output [1:0] s, c 
);
wire [1:0] p, g;
pg_unit_2bits	pgu1(a, b, p, g);
cla_carry_generate_2bits	cgu1(p, g, ci, c[0], c[1]);
sum_unit_2bits	su1(p, {c[0], ci}, s);
endmodule  
