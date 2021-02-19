module ULA(SW, HEX2);
    input [0:17]SW;
    output [0:6]HEX2;
    reg [0:3] segmentos;
    
    always @ (*)
        begin
            case ({SW[2], SW[1], SW[0]})
                3'b000: segmentos = SW[14:17] & SW[10:13];
                3'b001: segmentos = SW[14:17] | SW[10:13];
                3'b010: segmentos= SW[14:17] + SW[10:13];
                3'b011: segmentos = SW[14:17] - SW[10:13];
                3'b100: segmentos = SW[14:17] * 2;
                3'b101: segmentos = SW[14:17] / 2;
            endcase
        end
    decodificador_BCD printar(.BOX1(segmentos),.HEX2(HEX2));
endmodule

module decodificador_BCD(BOX1, HEX2);
    input [0:3]BOX1;
    output [0:6]HEX2;
    reg [0:6] segmentos;
    always @ (*)
        begin
            case ({BOX1[3], BOX1[2], BOX1[1], BOX1[0]})
                4'b0000: segmentos=7'b0000001;
                4'b0001: segmentos=7'b1001111;
                4'b0010: segmentos=7'b0010010;
                4'b0011: segmentos=7'b0000110;
                4'b0100: segmentos=7'b1001100;
                4'b0101: segmentos=7'b0100100;
                4'b0110: segmentos=7'b0100000;
                4'b0111: segmentos=7'b0001111;
                4'b1000: segmentos=7'b0000000;
                4'b1001: segmentos=7'b0000100;
                default: segmentos = 7'b1111111;
            endcase
        end
    assign HEX2 = segmentos;
    
endmodule