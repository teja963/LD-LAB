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

module halfadder(s,c,a,b);
output s,c;
input a,b;
and_gate and_gate1(c,a,b);
xor_gate xor_gate1(s,a,b);
endmodule



