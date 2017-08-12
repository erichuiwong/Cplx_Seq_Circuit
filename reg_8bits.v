`include "dff.v"

module reg_8bits (
	input clk, reset, e,
	input [7:0] d,
	output [7:0] x
);

dff	d0(clk,reset,e,d[0],x[0]);
dff	d1(clk,reset,e,d[1],x[1]);
dff	d2(clk,reset,e,d[2],x[2]);
dff	d3(clk,reset,e,d[3],x[3]);
dff	d4(clk,reset,e,d[4],x[4]);
dff	d5(clk,reset,e,d[5],x[5]);
dff	d6(clk,reset,e,d[6],x[6]);
dff	d7(clk,reset,e,d[7],x[7]);

endmodule
