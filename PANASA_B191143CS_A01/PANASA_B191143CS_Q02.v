module and_gate(r,a,b);
output r;
input a,b;
wire c;
nand nand_1(c,a,b);
nand nand_2(r,c,c);
endmodule


