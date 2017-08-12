module pg_unit_2bits
(
input [1:0] a, b,
output [1:0] p, g
);
//assign p = a ^ l;
assign p = (a & ~b) | (~a & b);
assign g = a & b;
endmodule
