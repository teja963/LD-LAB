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


module sixteen_bit_adder(s,ci,a,b,p);
input [15:0]a,b;
input p;
output [15:0]s;
output ci;
wire [14:0]c;
fulladder FA1(s[0],c[0],a[0],b[0],p);
fulladder FA2(s[1],c[1],a[1],b[1],c[0]);
fulladder FA3(s[2],c[2],a[2],b[2],c[1]);
fulladder FA4(s[3],c[3],a[3],b[3],c[2]);
fulladder FA5(s[4],c[4],a[4],b[4],c[3]);
fulladder FA6(s[5],c[5],a[5],b[5],c[4]);
fulladder FA7(s[6],c[6],a[6],b[6],c[5]);
fulladder FA8(s[7],c[7],a[7],b[7],c[6]);
fulladder FA9(s[8],c[8],a[8],b[8],c[7]);
fulladder FA10(s[9],c[9],a[9],b[9],c[8]);
fulladder FA11(s[10],c[10],a[10],b[10],c[9]);
fulladder FA12(s[11],c[11],a[11],b[11],c[10]);
fulladder FA13(s[12],c[12],a[12],b[12],c[11]);
fulladder FA14(s[13],c[13],a[13],b[13],c[12]);
fulladder FA15(s[14],c[14],a[14],b[14],c[13]);
fulladder FA16(s[15],ci,a[15],b[15],c[14]);
endmodule
