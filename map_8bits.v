module map_8bits
(
	input f0, f1, f2,
	output reg msk, s0, s1, s2, m
);
//reg msk, s0, s1, s2, m;
//wire msk, s0, s1, s2, m;
wire [2:0] f;
assign f = {f2,f1,f0};
assign d = 1'bx;
always@(*)
begin
	case(f)
	3'b000: begin 
		s2 = d; s1 = d; s0 = d; m = d; msk = 1; //Not Defined
	   end 
	3'b001: begin
		s2 = 1; s1 = 0; s0 = 0; m = 0; msk = 0; //Add  
	   end
	3'b010: begin
		s2 = 1; s1 = 0; s0 = 0; m = 1; msk = 0; //Subtract
	   end
	3'b011: begin 
		s2 = 0; s1 = 0; s0 = 0; m = 0; msk = 0; //Increment
	   end
	3'b100: begin
		s2 = 0; s1 = 0; s0 = 0; m = 1; msk = 0; //Decrement
	   end
	3'b101: begin
		s2 = d; s1 = 0; s0 = 1; m = d; msk = 1; //Bit-wised AND
	   end
	3'b110: begin 
		s2 = d; s1 = 1; s0 = 0; m = d; msk = 1; //Bit-wised XOR
	   end
	3'b111: begin
		s2 = d; s1 = 1; s0 = 1; m = d; msk = 1; //Bit-wised NOT
	   end

	endcase
end
endmodule
