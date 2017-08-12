//2 bit SU
module sum_unit_2bits (
input [1:0] p, c,
output [1:0] s
);
//assign s = p ^ c;
/*assign s[0] = p[0] & ~ci | ~p[0] & ci;
assign s[1] = p[1] & ~c0 | ~p[1] & ~c0;
*/
assign s = (p & ~c) | (~p & c);
endmodule
