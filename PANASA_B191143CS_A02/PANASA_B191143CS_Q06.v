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

module sixteen_bit_incremenator(s,c,a,b);
input [15:0]a,b;
output [15:0]s;
output c;
wire [14:0]x;
halfadder halfadder_1(s[0],x[0],a[0],1'b1);
halfadder halfadder_2(s[1],x[1],a[1],x[0]);
halfadder halfadder_3(s[2],x[2],a[2],x[1]);
halfadder halfadder_4(s[3],x[3],a[3],x[2]);
halfadder halfadder_5(s[4],x[4],a[4],x[3]);
halfadder halfadder_6(s[5],x[5],a[5],x[4]);
halfadder halfadder_7(s[6],x[6],a[6],x[5]);
halfadder halfadder_8(s[7],x[7],a[7],x[6]);
halfadder halfadder_9(s[8],x[8],a[8],x[7]);
halfadder halfadder_10(s[9],x[9],a[9],x[8]);
halfadder halfadder_11(s[10],x[10],a[10],x[9]);
halfadder halfadder_12(s[11],x[11],a[11],x[10]);
halfadder halfadder_13(s[12],x[12],a[12],x[11]);
halfadder halfadder_14(s[13],x[13],a[13],x[12]);
halfadder halfadder_15(s[14],x[14],a[14],x[13]);
halfadder halfadder_16(s[15],c,a[15],x[14]);
endmodule

