module mux2
(
	input [7:0] A, B,
	input t,
	output reg [7:0] R
);
always@(*)
begin
if (t == 0)
	R = A;
else
	R = B;
end
endmodule
