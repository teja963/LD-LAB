module or_gate(r,a,b);
output r;
input a,b;
wire c,d;
nand nand_1(c,a,a);
nand nand_2(d,b,b);
nand nand_3(r,c,d);
endmodule


