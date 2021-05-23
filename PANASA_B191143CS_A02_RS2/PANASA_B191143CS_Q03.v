module and_gate(c,a,b);
output c;
input a,b;
wire x;
nand(x,a,b);
nand(c,x,x);
endmodule
module xor_gate(c,a,b);
output c;
input a,b;
wire x,y,l,m;
nand(x,a,a);
nand(y,b,b);
nand(l,x,b);
nand(m,y,a);
nand(c,l,m);
endmodule
module or_gate(c,a,b);
output c;
input a,b;
wire x,y;
nand(x,a,a);
nand(y,b,b);
nand(c,x,y);
endmodule
module halfadder(s,c,a,b);
output s,c;
input a,b;
and_gate and_gate1(c,a,b);
xor_gate xor_gate1(s,a,b);
endmodule

module four_bit_incremenator(s,c,a,b);
input [3:0]a,b;
output [3:0]s;
output c;
wire [2:0]x;
halfadder halfadder_1(s[0],x[0],a[0],1'b1);
halfadder halfadder_2(s[1],x[1],a[1],x[0]);
halfadder halfadder_3(s[2],x[2],a[2],x[1]);
halfadder halfadder_4(s[3],c,a[3],x[2]);
endmodule


