`include "cpa.v"
module test();
reg [7:0] a, b; 
reg ci;

wire [7:0]s; 
wire c6, c7;

cpa ad1(a, b, ci, s, c6, c7);

initial begin
$display("a\tb\t ci s        c6 c7");
$monitor("%b %b %b %b %b  %b", a, b, ci, s, c6, c7);
a = 8'h80; b = 8'h01; ci = 1'b1;
#10
a = 8'h00; b = 8'h01; ci = 1'b1;
#10
a = 8'h01; b = 8'hFF; ci = 1'b0;
#10
a = 8'hFF; b = 8'hFF; ci = 1'b0;
#10
$finish;
end
endmodule
