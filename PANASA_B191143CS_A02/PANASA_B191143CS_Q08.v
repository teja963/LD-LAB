module not_gate(b,a);

output b;
input a;

nand(b,a,a);

endmodule

module not_gate_16(b,a);

output [15:0] b;
input [15:0] a;

not_gate not_gate_1[15:0](b,a);

endmodule

module and_gate(c,a,b);

output c;
input a,b;
wire x;

nand(x,a,b);
nand(c,x,x);

endmodule

module and_gate_16(c,a,b);

output [15:0] c;
input [15:0] a,b;

and_gate and_gate_1[15:0](c,a,b);

endmodule

module nor_gate(c,a,b);

output c;
input a,b;
wire x,y,z;

nand(x,a,a);
nand(y,b,b);
nand(z,x,y);
nand(c,z,z);

endmodule

module or_gate(c,a,b);

output c;
input a,b;
wire p,q;

nand(p,a,a);
nand(q,b,b);
nand(c,p,q);

endmodule

module or_gate_in16(out,in);

output out;
input [15:0] in;

or_gate or_gate_1(a,in[1],in[2]);
or_gate or_gate_2(b,in[4],a);
or_gate or_gate_3(c,in[5],b);
or_gate or_gate_4(d,in[6],c);
or_gate or_gate_5(e,in[7],d);
or_gate or_gate_6(f,in[8],e);
or_gate or_gate_7(g,in[9],f);
or_gate or_gate_8(h,in[10],g);
or_gate or_gate_9(i,in[11],h);
or_gate or_gate_10(j,in[12],i);
or_gate or_gate_11(k,in[13],j);
or_gate or_gate_12(l,in[14],k);
or_gate or_gate_13(m,in[15],l);
or_gate or_gate_14(n,in[0],m);
or_gate or_gate_15(out,in[3],n);


endmodule


module or_gate_16(c,a,b);

output [15:0] c;
input [15:0] a,b;

or_gate or_gate_1[15:0](c,a,b);

endmodule

module mux_2x1(o,a,b,c);

output o;
input a,b,c;
wire x,y,z;

not_gate not_gate1(x,c);
and_gate and_gate1(y,a,x);
and_gate and_gate2(z,b,c);
or_gate or_gate1(o,y,z);

endmodule

module mux_16(o,a,b,s);  

output [15:0] o;
input [15:0] a,b;
input s;  

mux_2x1 mux_2x1_1[15:0](o,a,b,s);  

endmodule

module xor_gate(c,a,b);

output c;
input a,b;
wire x,y,m,n;
not_gate not_gate1(x,a);
not_gate not_gate2(y,b);
and_gate and_gate1(m,a,y);
and_gate and_gate2(n,b,x);
or_gate or_gate1(c,m,n);

endmodule

module half_adder(s,c,a,b);

output s,c;
input a,b;

and_gate and_gate_1(c,a,b);
xor_gate xor_gate_1(s,a,b);

endmodule

module full_adder(s,c,a,b,cin);

output c,s;
input a,b,cin;

half_adder half_adder_1(s1,c1,a,b);
half_adder half_adder_2(s,c2,s1,cin);
or_gate or_gate_1(c,c1,c2);

endmodule



module adder_16bit(s,c,in1,in2);

output [15:0] s;
output c;
input [15:0] in1,in2;

full_adder full_adder_1(s[0],a,in1[0],in2[0],0);
full_adder full_adder_2(s[1],b,in1[1],in2[1],a);
full_adder full_adder_3(s[2],c7,in1[2],in2[2],b);
full_adder full_adder_4(s[3],d,in1[3],in2[3],c7);
full_adder full_adder_5(s[4],e,in1[4],in2[4],d);
full_adder full_adder_6(s[5],f,in1[5],in2[5],e);
full_adder full_adder_7(s[6],g,in1[6],in2[6],f);
full_adder full_adder_8(s[7],h,in1[7],in2[7],g);
full_adder full_adder_9(s[8],i,in1[8],in2[8],h);
full_adder full_adder_10(s[9],j,in1[9],in2[9],i);
full_adder full_adder_11(s[10],k,in1[10],in2[10],j);
full_adder full_adder_12(s[11],l,in1[11],in2[11],k);
full_adder full_adder_13(s[12],m,in1[12],in2[12],l);
full_adder full_adder_14(s[13],n,in1[13],in2[13],m);
full_adder full_adder_15(s[14],o,in1[14],in2[14],n);
full_adder full_adder_16(s[15],c,in1[15],in2[15],o);

endmodule
module alu_design(o,zr,ng,x,y,s);
input[15:0]x,y;
input[5:0]s;
output[15:0]o;
output zr,ng;
wire[15:0]x1,x2,x3,y1,y2,y3,add_s1,and1,f1,f2;
wire zx1,nx1,add_c1,zr1;
not_gate not_gate1(zx1,s[5]);
and_gate and_gate1[15:0](x1,x,zx1);

not_gate_16 not_gate_16_2(x2,x1);
mux_16 mux_16_1(x3,x1,x2,s[4]);

not_gate not_gate2(zy1,s[3]);
and_gate and_gate2[15:0](y1,y,zy1);

not_gate_16 not_gate_16_1(y2,y1);
mux_16 mux_16_2(y3,y1,y2,s[2]);

adder_16bit adder_16bit_1(add_s1,add_c1,x3,y3);

and_gate_16 and_gate_16_1(and1,x3,y3);

mux_16 mux_16_3(f1,and1,add_s1,s[1]);

not_gate_16 not_gate_16_3(f2,f1);
mux_16 mux_16_4(o,f1,f2,s[0]);

or_gate_in16 or_gate_in16_1(zr1,o);
not_gate not_gate_3(zr,zr1);
 
and_gate and_gate_3(ng,o[15],o[15]);
endmodule


