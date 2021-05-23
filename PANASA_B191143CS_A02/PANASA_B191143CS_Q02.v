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
wire w,x,y,z;
nand(w,a,a);
nand(x,b,b);
nand(z,b,w);
nand(y,x,a);
nand(c,y,z);
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
output s,c;
input a,b,p;
wire x,y,z;
halfadder halfadder_1(x,y,a,b);
halfadder halfadder_2(s,z,x,p);
or_gate or_gate_1(c,y,z);
endmodule




