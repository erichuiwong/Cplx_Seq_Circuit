`include "alu_8bits.v"
module alutest();
reg f2, f1, f0;
reg [7:0] a, b;
wire ovf;
wire [7:0] R;

alu_8bits 	alu(f2, f1, f0, a, b, ovf, R);

wire [2:0] f;
assign f = {f2, f1, f0};
/*
 * 000 Not Used
 * 001 Add
 * 010 Sub
 * 011 Increment
 * 100 Decrement
 * 101 AND
 * 110 XOR
 * 111 NOT
 */
initial begin
$display("Time F   A  B  R  ovf");
$monitor("%4d %b %h %h %h %b", $time, f, a, b, R, ovf);
f2 = 0; f1 = 0; f0 = 1; a = 8'h7F; b = 8'h01; //#0 8'h7f + 8'h01
#10
f2 = 0; f1 = 1; f0 = 0; a = 8'h80; b = 8'h01; //#1 8'h80 - 8'h01
#10
f2 = 0; f1 = 1; f0 = 0; a = 8'h00; b = 8'h01; //#2 8'h00 - 8'h01
#10
f2 = 0; f1 = 0; f0 = 1; a = 8'h01; b = 8'hFF; //#3 8'h01 + 8'hFF
#10
f2 = 0; f1 = 0; f0 = 1; a = 8'hFF; b = 8'hFF; //#4 8'hFF + 8'hFF
#10
f2 = 0; f1 = 1; f0 = 1; a = 8'hFF; b = 8'hxx;	      //#5 8'hFF ++
#10
f2 = 1; f1 = 0; f0 = 0; a = 8'h00; b = 8'hxx;	      //#6 8'h00 --
#10
f2 = 1; f1 = 0; f0 = 1; a = 8'hFF; b = 8'hFF; //#7 8'hFF and 8'hFF
#10
f2 = 1; f1 = 1; f0 = 0; a = 8'hFF; b = 8'hFF; //#8 8'hFF XOR 8'hFF
#10
f2 = 1; f1 = 1; f0 = 0; a = 8'hFF; b = 8'hAA; //#9 8'hFF XOR 8'hAA
#10
f2 = 1; f1 = 1; f0 = 1; a = 8'h55; b = 8'h00; //#10 8'h55 NOT
#10
f2 = 0; f1 = 0; f0 = 0; a = 8'h55; b = 8'hAA; //#11 Not used Case
#10
$finish;
end
endmodule
