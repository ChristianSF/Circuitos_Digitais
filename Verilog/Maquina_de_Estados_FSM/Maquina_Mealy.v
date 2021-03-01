// Máquina de Mealy

module Maquina_Mealy(entradas, clock, reset, HEX4);

input clock, reset;
reg [3:0]estado;
output [6:0] HEX4;
reg [3:0]prox;
reg [3:0]saida;
input [1:0]entradas;
wire OUT;


parameter est0 = 3, est1 = 1, est2 = 8, est3 = 0, est4 = 5, 
			est5 = 7, est6 = 33, est7 = 6, est8 = 2, apagar = 10;
			
	// Chamando o Divisor de Frequência
	//divisor_freq chama_div (.clk (clock),.saida_divisor(OUT));
			
	always @(entradas or estado) begin 
	
		case(estado)
			// Primeiro Estado
			est0: if(entradas == 2'b00) begin
				prox = est0;
				saida = 4'b0011;
			end
			else if(entradas ==2'b01) begin
				prox = est1;
				saida = 4'b0001;
			end
			else if(entradas == 2'b10) begin
				prox = est8;
				saida = 4'b0010;
			end
			else begin
				prox = apagar;
				saida = 4'b1111;
			end
	
			// Segundo Estado
			est1: if(entradas == 2'b00) begin
				prox = est1;
				saida = 4'b0001;
			end
			else if(entradas ==2'b01) begin
				prox = est2;
				saida = 4'b1000;
			end
			else if(entradas == 2'b10) begin
				prox = est0;
				saida = 4'b0011;
			end
			else begin
				prox = apagar;
				saida = 4'b1111;
			end
	
	
			// Terceiro Estado
			est2: if(entradas == 2'b00) begin
				prox = est2;
				saida = 4'b1000;
			end
			else if(entradas == 2'b01) begin
				prox = est3;
				saida = 4'b0010;
			end
			else if(entradas == 2'b10) begin
				prox = est1;
				saida = 4'b0001;
			end
			else begin
				prox = apagar;
				saida = 4'b1111;
			end
	
	
			// Quarto Estado
			est3: if(entradas == 2'b00) begin
				prox = est3;
				saida = 4'b0000;
			end
			else if(entradas ==2'b01) begin
				prox = est4;
				saida = 4'b0101;
			end
			else if(entradas == 2'b10) begin
				prox = est3;
				saida = 4'b1000;
			end
			else begin
				prox = apagar;
				saida = 4'b1111;
			end
		
	
			// Quinto Estado
			est4: if(entradas == 2'b00) begin
				prox = est4;
				saida = 4'b0101;
			end
			else if(entradas ==2'b01) begin
				prox =  est5;
				saida = 4'b0111;
			end
			else if(entradas ==2'b10) begin
				prox =  est3;
				saida = 4'b0000;
			end
			else begin
				prox = apagar;
				saida = 4'b1111;
			end
	
			// Sexto Estado
			est5: if(entradas == 2'b00) begin
				prox = est5;
				saida = 4'b0111;
			end
			else if(entradas ==2'b01) begin
				prox =  est6;
				saida = 4'b0111;
			end
			else if(entradas ==2'b10) begin
				prox =  est4;
				saida = 4'b0101;
			end
			else begin
				prox = apagar;
				saida = 4'b1111;
			end
		
			// Sétimo Estado
			est6: if(entradas == 2'b00) begin
				prox = est6;
				saida = 4'b0011;
			end
			else if(entradas ==2'b01) begin
				prox =  est7;
				saida = 4'b0101;
			end
			else if(entradas ==2'b10) begin
				prox =  est5;
				saida = 4'b0111;
			end
			else begin
				prox = apagar;
				saida = 4'b1111;
			end
	
	
			// Oitavo Estado
			est7: if(entradas == 2'b00) begin
				prox = est7;
				saida = 4'b0101;
			end
			else if(entradas ==2'b01) begin
				prox =  est8;
				saida = 4'b0010;
			end
			else if(entradas ==2'b10) begin
				prox =  est6;
				saida = 4'b0011;
			end
			else begin
				prox = apagar;
				saida = 4'b1111;
			end
	
			// Nono Estado
			est8: if(entradas == 2'b00) begin
				prox = est8;
				saida = 4'b0010;
			end
			else if(entradas ==2'b01) begin
				prox =  est0;
				saida = 4'b0011;
			end
			else if(entradas ==2'b10) begin
				prox =  est7;
				saida = 4'b0101;
			end
			else begin
				prox = apagar;
				saida = 4'b1111;
			end
	
		// Décimo Estado - Apagar Display
			apagar: if(entradas == 2'b00) begin
				prox = apagar;
				saida = 4'b1111;
			end
			else if(entradas ==2'b01) begin
				prox = est0;
				saida = 4'b0011;
			end
			else if(entradas ==2'b10) begin
				prox = est0;
				saida = 4'b0011;
			end
			else begin
				prox = apagar;
				saida = 4'b1111;
			end
		endcase
	end	


	always @(posedge OUT or negedge reset)

		begin 
			if(reset == 0) begin
				estado <= est0;
				
			end
			else begin
				estado <= prox;
			end
		end
			
			//Chamando o decodificador
	decodificador_BCD chama_bcd (.BOX(saida),.HEX4(HEX4));

endmodule

//module divisor_freq (clk, saida_divisor);
	//input clk;
	//output reg saida_divisor;
	//reg [25:0] out_divisor;
	
	//always @ (posedge clk)
	
		//if (out_divisor == 26'd50000000 )
			//begin
				//out_divisor <= 26'd0;
				//saida_divisor <= 1;
         //end
     
		//else
        //begin
        //out_divisor<= out_divisor+1;
        //saida_divisor <= 0;
        
    //end
	 
    
//endmodule


module decodificador_BCD(BOX, HEX4);
    input [3:0]BOX;
    output [6:0]HEX4;
    reg [6:0] segmentos;
    always @ (*)
        begin
            case (BOX)
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
    assign HEX4 = segmentos;
    
endmodule

 
