`include "mux_2to1.v"
module mux1
(
	input [7:0] B, C, D,
	input [2:0] s,
	output [7:0] R
);

wire [7:0] H, I;

mux_2to1	m0(B, 0, s0, H);
mux_2to1	m1(D, C, s0, I);
mux_2to1	m2(I, H, s1, R);

/*always@(*)
begin
if (s == 2'b00)
	R = B;
else if (s == 2'b01)
	R = C;
else
	R = D;
end*/
endmodule
