`include "datapath.v"
`include "controller.v"
module scircuit(
	input clk, reset, start, m, 
	input [7:0] A, B, C, D,
	output [7:0] R,
	output error, done
);

wire f0, f1, f2, s0, s1, s2, ovf;

controller	cunit1(clk, reset, start, ovf, m, s2, s1, s0, done, error, f0, f1, f2);
datapath	dpath1(clk, reset, s2, s1, s0, f0, f1, f2, A, B, C, D, R, ovf);
endmodule
