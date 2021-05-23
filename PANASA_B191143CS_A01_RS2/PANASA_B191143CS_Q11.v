module or_q11(z,a,b,c,d,e,f,g,h);
  input a,b,c,d,e,f,g,h;
  output z;
 wire p,q,r,s,t,u;
 or_q3 or_q31(p,a,b);
 or_q3 or_q32(q,c,p);
 or_q3 or_q33(r,d,q);
 or_q3 or_q34(s,e,r);
 or_q3 or_q35(t,f,s);
 or_q3 or_q36(u,g,t);
 or_q3 or_q37(z,h,u);
endmodule

