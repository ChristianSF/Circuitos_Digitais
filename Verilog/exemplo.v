module exemplo (SW, LEDR);
input [0:17] SW;
output [0:9] LEDR;

assign LEDR[0] = SW[0] & SW[1];
assign LEDR[9] = SW[0] | SW[1];

endmodule