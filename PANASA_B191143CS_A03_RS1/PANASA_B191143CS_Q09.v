module NotGate(a,b) ;

output b ;
input a ;

nand(b,a,a) ;

endmodule 

module AndGate(a,b,c) ;

output c ;
input a,b ;
wire x ;

nand(x,a,b) ;
nand(c,x,x) ; 

endmodule 

module OrGate(a,b,c) ;

output c ;
input a,b ;
wire x,y ;

nand(x,a,a) ;
nand(y,b,b) ;
nand(c,x,y) ;

endmodule 

module XorGate(a,b,c) ;

output c ; 
input a,b ;
wire a_,b_,x,y ;

NotGate Na(a,a_) ;
NotGate Nb(b,b_) ;
AndGate A1(a,b_,x) ;
AndGate A2(a_,b,y) ;
OrGate O(x,y,c) ;

endmodule 

module DLatch(d,c,q,q_) ;

output q,q_ ;
input d,c ;
wire c_,s,r,x,y ;

AndGate S(d,d,s) ;
NotGate R(d,r) ;
nand(x,c,s) ;
nand(y,c,r) ;
nand(q,q_,x) ;
nand(q_,q,y) ;

endmodule

module DFlipFlopRE(d,c,q,q_) ;

output q,q_ ;
input d,c ;
wire c_,Q,Q_ ;

NotGate C_(c,c_) ;

DLatch D1(d,c_,Q,Q_) ;
DLatch D2(Q,c,q,q_) ;

endmodule 

module BinaryCell(DIn,clk,cs,w,r,DOut) ;

output DOut ;
input DIn,clk,cs,w,r ;
wire s1,s2,d,q,q_ ;

AndGate In(w,cs,s1) ;
AndGate Out(r,cs,s2) ;
Mux2x1 M1(q,DIn,s1,d) ;
DFlipFlopRE D(d,clk,q,q_) ;
Mux2x1 M2(1'bx,q,s2,DOut) ;

endmodule

module Reg16Bit(DIn,clk,cs,w,r,DOut) ;

output [15:0] DOut ;
input [15:0] DIn;
input clk,cs,w,r ;

BinaryCell B[15:0](DIn,clk,cs,w,r,DOut) ; 

endmodule 

module Mux2x1(a,b,s,c) ;  // 12

output c ;
input a,b,s ;
wire x,y,z ;

NotGate NG_1(s,z );
AndGate AG_1(a,z,x) ;
AndGate AG_2(b,s,y) ;
OrGate OG_1(x,y,c) ;

endmodule 

module Mux2x1_16(a,b,s,c) ;

output [15:0] c ;
input [15:0] a,b;
input s ;

Mux2x1 M[15:0](a,b,s,c) ;

endmodule

module HalfAdder(a,b,s,c) ;

output s,c ;
input a,b ;

AndGate A(a,b,c) ;
XorGate X(a,b,s) ;

endmodule

module Inc16Bit(a,b) ;

output [15:0] b;
input [15:0] a ;
wire [15:0] c ;

HalfAdder H1(a[0],1'b1,b[0],c[0]) ;
HalfAdder H2(a[1],c[0],b[1],c[1]) ; 
HalfAdder H3(a[2],c[1],b[2],c[2]) ; 
HalfAdder H4(a[3],c[2],b[3],c[3]) ; 
HalfAdder H5(a[4],c[3],b[4],c[4]) ; 
HalfAdder H6(a[5],c[4],b[5],c[5]) ; 
HalfAdder H7(a[6],c[5],b[6],c[6]) ; 
HalfAdder H8(a[7],c[6],b[7],c[7]) ; 
HalfAdder H9(a[8],c[7],b[8],c[8]) ; 
HalfAdder H10(a[9],c[8],b[9],c[9]) ; 
HalfAdder H11(a[10],c[9],b[10],c[10]) ; 
HalfAdder H12(a[11],c[10],b[11],c[11]) ; 
HalfAdder H13(a[12],c[11],b[12],c[12]) ;
HalfAdder H14(a[13],c[12],b[13],c[13]) ; 
HalfAdder H15(a[14],c[13],b[14],c[14]) ; 
HalfAdder H16(a[15],c[14],b[15],c[15]) ;  

endmodule 

module PC(re,inc,load,l,clk,cs,w,r,DOut) ;

input re,inc,l,clk,cs,w,r ;
input [15:0] load ;
output [15:0] DOut ;
wire [15:0] d,D,D_,D__,x ;

Mux2x1_16 M(DOut,load,l,d) ;
Inc16Bit I(d,D) ;
AndGate A[15:0](d,d,x) ;
Mux2x1_16 M2(x,D,inc,D_) ;
Mux2x1_16 M3(D_,16'b0,re,D__);
Reg16Bit R(D__,clk,cs,w,r,DOut) ;

endmodule  
