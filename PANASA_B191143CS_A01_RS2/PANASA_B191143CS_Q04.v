module nor_gate(r,a,b);
output r;
input a,b;
wire c,d,e;
nand nand_1(c,a,a);
nand nand_2(d,b,b);
nand nand_3(e,c,d);
nand nand_4(r,e,e);
endmodule


