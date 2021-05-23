module xor_gate(r,a,b);
output r;
input a,b;
wire c,d,e;
nand nand_1(c,a,b);
nand nand_2(d,a,c);
nand nand_3(e,b,c);
nand nand_4(r,d,e);
endmodule


