`include "mux_2to1.v"
module mux_8bits
(
	input [7:0] W, X, Y, Z,
	input s0, s1,
	output [7:0] R
);
wire [7:0] H, I;

mux_2to1	m0(X, W, s0, H);
mux_2to1 	m1(Z, Y, s0, I);
mux_2to1	m2(I, H, s1, R);  

endmodule
