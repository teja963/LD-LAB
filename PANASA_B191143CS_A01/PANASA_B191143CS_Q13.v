module demux(r,s,a,b);
output r,s;
input a,b;
wire p,q,r;
nand(p,a,a);
nand(r,a,b);
nand(q,p,b);
nand(r,q,q);
nand(s,r,r);
endmodule

