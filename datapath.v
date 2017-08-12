`include "alu_8bits.v"
`include "reg_8bits.v"
module datapath
(
	input clk, reset, s2, s1, s0, f0, f1, f2,
	input [7:0] a, b, c, d,
	output [7:0] S,
	output ovf	
);
wire e = 1;
wire [7:0] s, O;
reg [7:0] mout, R;
//MUX1
	always@(*)
	begin
		if(~s2 && ~s1)
			mout = b;
		else if(~s2 && s1)
			mout = c;
		else
			mout = d;
	end
//ALU	
alu_8bits	alu0(f2, f1, f0, mout, R, ovf, s);
//MUX2
	always@(*)
	begin
		if(s0) 
			R = a;
		else
			R = s;
	end
//REG
reg_8bits	reg0(clk, reset, e, R, O);
assign S = O;
endmodule
