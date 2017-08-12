module mask 
(
	input msk, ov_flag,
	output ovf	
);
assign ovf = ~msk & ov_flag;

endmodule
