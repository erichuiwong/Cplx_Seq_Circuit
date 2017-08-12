module cla_carry_generate_2bits (p, g, ci, c0, c1);
input [1:0] p, g;
input ci;
output c0, c1;
wire out1,out2,out3,out4,out5;

//assign c0 = g[0] | p[0] & ci;
nand n0(out1, ci, p[0]);
not n2(out2, g[0]);
nand n3(c0, out1, out2);

//assign c1 = gs[1] | ps[1] & gs[0] | ps[1] & ps[0] & ci;
nand n5(out4, p[1], g[0]);
not n6(out5, g[1]);
nand n4(out3, ci, p[0], p[1]);
nand n7(c1, out3, out4, out5);

endmodule
