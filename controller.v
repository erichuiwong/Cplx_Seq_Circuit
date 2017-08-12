module controller
(
	input clk, reset, start, ovf, mode,
	output reg s2, s1, s0, done, error, f0, f1, f2			
);

parameter
	A = 3'b000,
	B = 3'b001,
	C = 3'b010,
	D = 3'b011,
	E = 3'b100,
	F = 3'b101,
	G = 3'b110,
	H = 3'b111;
reg [2:0] state, nextstate;
//NSG
always@(*)
begin
	case(state)
	A: if (start == 1)
		assign nextstate = B;
	B: if (ovf == 1)
	        assign nextstate = E;
	   else
		assign nextstate = C;
	C: if (ovf == 1)
		assign nextstate = E;
	   else
		assign nextstate = D;
	D: if (ovf == 1)
		assign nextstate = E;
           else
		assign nextstate = A;
	E:assign nextstate = E;
	F:assign nextstate = E;	
	G:assign nextstate = E;
	H:assign nextstate = E;
	endcase
end
//OG
always@(*)
begin
	if (start == 1 & state == A)
		s0 <= 0;
		done <= 0;
		error <= 0;
		f2 <= 0;
		f1 <= 0;
		f0 <= 0;
	if(state == B) 
		s2 <= 0;
		s1 <= 0;
		s0 <= 0;	
		done <= 0;
		error <= 0;
		f2 <= 0;
		f1 <= 0;
		f0 <= 0;
	if(state == C)
		if (mode == 0)
			s2 <= 0;
			s1 <= 1;
			s0 <= 1;
			done <= 0;
			error <= 0;
			f2 <= 0;
			f1 <= 0;
			f0 <= 0;
		if (mode == 1) 
			s2 <= 0;
			s1 <= 1;
			s0 <= 1;
			done <= 0;
			error <= 0;
			f2 <= 0;
			f1 <= 1;
			f0 <= 0;
	if(state == D)
			s2 <= 1;
			s1 <= 1;
			s0 <= 1;
			done <= 1;
			error <= 0;
			f2 <= 1;
			f1 <= 1;
			f0 <= 0;
	if(state == E)
		done <= 1;
		error <= 1;
	if(state == F)
		done <= 1;
		error <= 1;
	if(state == G)
		done <= 1;
		error <= 1;
	if(state == H)
		done <= 1;
		error <= 1;
end
//FF
always@(posedge clk, posedge reset)
begin
	if(!reset)
		state <= A;
	else
		state <= nextstate;	
end
endmodule
