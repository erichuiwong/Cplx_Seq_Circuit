module mux_2to1
(
	input [7:0] E, F,
	input s,
	output reg [7:0] G
);
always@(*)
begin
if (s == 1'b1) 
	G = E;
else
	G = F;
end
endmodule
