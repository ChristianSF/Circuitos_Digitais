module ULA(sel,numum,numdois, HEX2);
    input [2:0]sel;
    input [3:0]numum;
    input [3:0]numdois;
    output [6:0]HEX2;
    reg [3:0] segmentos;
    
    always @ (*)
        begin
            case (sel)
                3'b000: segmentos = numum & numdois;
                3'b001: segmentos = numum | numdois;
                3'b010: segmentos= numum + numdois];
                3'b011: segmentos = numum - numdois;
                3'b100: segmentos = numum * 2;
                3'b101: segmentos = numum / 2;
            endcase
        end
    decodificador_BCD printar(.BOX1(segmentos),.HEX2(HEX2));
endmodule

module decodificador_BCD(BOX1, HEX2);
    input [3:0]BOX1;
    output [6:0]HEX2;
    reg [6:0] segmentos;
    always @ (*)
        begin
            case (BOX1)
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