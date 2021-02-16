module contador_sincrono(SW, HEX1, V_BT);
    input [17:0]SW;
    input [0:2] V_BT;
    output [0:6]HEX1;
    
    reg [3:0] display;
    reg [3:0] contrario;
    always @(posedge V_BT[2] or posedge SW[0] )
    begin
        if(SW[0])
            begin
                display <= 4'b0000;
            end
        else if (display == 4'b0111)
            begin
                display <= 4'b0000;
             end
        else
            begin
                display <= display + 1;
             end
             
        contrario[0] = display[3];
        contrario[1] = display[2];
        contrario[2] = display[1];
        contrario[3] = display[0];
    end
    
    decodificador_BCD printar(.SW(contrario),.HEX1(HEX1));
    
endmodule