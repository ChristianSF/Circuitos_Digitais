module exemplo_NAND (a, b, d)
input wire a, b;
output wire d;

assign d = a ~& b;

endmodule
