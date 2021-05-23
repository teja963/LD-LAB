module xor_gate_16(r,a,b);
output[15:0]r;
input[15:0]a,b;
xor_gate xor_gate_1[15:0](r,a,b);
endmodule


