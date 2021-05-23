module mux(r,a,i0,i1);
output r;
input a,i0,i1;
wire h,t,m;
nand(h,a,i0);
nand(t,a,a);
nand(m,t,i1);
nand(r,h,m);
endmodule

