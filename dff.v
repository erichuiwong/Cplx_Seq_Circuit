module dff (
	input clock, _reset, d, e,
	output reg q
	//output nq	
);

assign nq = ~q; //not q
always@(posedge clock,negedge _reset)
begin
	if (!_reset)
		q <= 0;
//	else if (!_preset)
//		q <= 1;
	else if (e)
		q <= d;
end
endmodule
