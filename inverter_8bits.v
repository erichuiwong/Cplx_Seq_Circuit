module inverter_8bits
(
	input [7:0] b,
	input m,
	output reg[7:0] e
);

//wire [7:0] b, e;
always@(*)
begin
if (m == 1)
	e = b ^ 8'hFF;
else 
	e = b;
end
endmodule
