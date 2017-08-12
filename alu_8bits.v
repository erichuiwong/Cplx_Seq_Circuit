`include "map_8bits.v"
`include "mux_8bits.v"
`include "addsub_8bits.v"
`include "mask.v"

module alu_8bits
(
	input f2, f1, f0,
	input [7:0] a, b,
	output ovf,
	output [7:0] R
);
wire m, s0, s1, s2, msk, ov_flag;
wire [7:0] t, W, X, Y, Z;

assign T = 8'h01;
assign X = a & b;
assign Y = a ^ b;
assign Z = ~a;

map_8bits	map(f0, f1, f2, msk, s0, s1, s2, m);
mux_2to1	mux0(b, 8'b00000001, s2, t);
addsub_8bits	addsub(a, t, m, W, ov_flag);
mask		mask0(msk, ov_flag, ovf);
mux_8bits	mux(W ,X ,Y ,Z, s0, s1, R);

endmodule 
