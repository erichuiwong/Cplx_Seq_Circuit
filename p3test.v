`include "scircuit.v"
module p3test ();

reg clk, reset, start;
reg [7:0] A, B, C, D;
reg m;
wire [7:0] R;
scircuit	sc0(clk, reset, start, m, A, B, C, D, R, error, done);

initial begin
$monitor("time = %2d: R = %b, error = %b, done = %b", $time, R, error, done);
clk = 0;
reset = 1; //reset the FF
#10	reset = 0;
end
always
begin
#5clk = ~clk;//generates a clock signal with period 10
end
initial begin
#10 A = 1; B = 2; C = 3; D = 8'hF0; start = 1'b1; m = 1'b0;     	      //a
$display( "A. time = %2d: A = %b, B = %b, C = %b, D = %b", $time, A,B,C,D); 
#300 start = 0;
#500
#10 A = 1; B = 2; C = 3; D = 8'hF0; start = 1'b1; m = 1'b1;  	      //b. 
$display( "B. time = %2d: A = %b, B = %b, C = %b, D = %b", $time, A,B,C,D);
#300 start = 0;
#200
#10 A = 8'h7f; B = 8'h01; C = 8'h01; D = 8'h00; start = 1'b1; m = 1'b0; //c.
$display( "C. time = %2d: A = %b, B = %b, C = %b, D = %b", $time, A,B,C,D);
#300 start = 0;
#200
#10 A = 8'h7e; B = 8'h01; C = 8'h01; D = 8'h00; start = 1'b1; m = 1'b0; //d.
$display( "D. time = %2d: A = %b, B = %b, C = %b, D = %b", $time, A,B,C,D);
#300 start = 0;
#200
#10 A = 8'h7e; B = 8'h01; C = 8'h01; D = 8'h00; start = 1'b1; m = 1'b1; //e.
$display( "E. time = %2d: A = %b, B = %b, C = %b, D = %b", $time, A,B,C,D);
#300 start = 0;
#200
#10 A = 8'hff; B = 8'h01; C = 8'h7F; D = 8'h01; start = 1'b1; m = 1'b0; //f.
$display( "F. time = %2d: A = %b, B = %b, C = %b, D = %b", $time, A,B,C,D);
#300 start = 0;
#200 
#10 A = 8'hff; B = 8'h01; C = 8'h55; D = 8'hFF; start = 1'b1; m = 1'b1; //g.
$display( "G. time = %2d: A = %b, B = %b, C = %b, D = %b", $time, A,B,C,D);
#300 start = 0;
#200
$finish;
end 
endmodule 
