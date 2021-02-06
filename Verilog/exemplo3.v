module exemplo3 (SW, V_BT, LEDG);
input wire [0:17] SW;
input wire [0:2] V_BT;
output wire [0:8] LEDG;

assign LEDG[0] = SW[0] & V_BT[0];
assign LEDG[1] = SW[0] & V_BT[1];
assign LEDG[2] = SW[0] & V_BT[2];

endmodule 