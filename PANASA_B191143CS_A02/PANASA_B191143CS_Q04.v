

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

module fulladder(s,c,a,b,p);
input a,b,p;
output s,c;
halfadder halfadder_gate1(x,y,a,b);
halfadder halfadder_gate2(s,z,x,p);
or_gate or_gate1(c,z,y);
endmodule




module four_bit_adder(s,c,a,b,p);
input [3:0]a,b,p;
output [3:0]s;
output c;
wire [2:0]x;
fulladder fulladder_1(s[0],x[0],a[0],b[0],1'b0);
fulladder fulladder_2(s[1],x[1],a[1],b[1],x[0]);
fulladder fulladder_3(s[2],x[2],a[2],b[2],x[1]);
fulladder fulladder_4(s[3],c,a[3],b[3],x[2]);
endmodule

