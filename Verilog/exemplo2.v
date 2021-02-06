module exemplo2 (SW, LEDG);
input [0:17] SW;
output [0:8] LEDG;

assign LEDG[0] = SW[0] & SW[1];
assign LEDG[8] = SW[0] | SW[1];

endmodule