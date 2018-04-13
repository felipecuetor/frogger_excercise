/*
Universidad de los Andes
Departamento Ingeniería Eléctrica y Electrónica
Arquitectura y Diseño de Sistemas Digitales

Módulo imagen FPGA - Max7219

Autor:José Francisco Molano Pulido (jf.molano1587@uniandes.edu.co)
*/


module imagen(
    input wire [2:0] act_add,
    output reg [7:0] max_in
    );
	 
reg [2:0] aux;
always@(*)
begin
	aux = act_add;	
	//Caracol
	case (aux)
	  3'b000 : max_in = 8'b11111110;
	  3'b001 : max_in = 8'b10000000;
	  3'b010 : max_in = 8'b10111111;
	  3'b011 : max_in = 8'b10100001;
	  3'b100 : max_in = 8'b10101101;
	  3'b101 : max_in = 8'b10111101;
	  3'b110 : max_in = 8'b10000001;
	  3'b111 : max_in = 8'b11111111;
	  default: max_in = 8'b00000000;
	endcase
	//X
	/*
	case (aux)
	  3'b000 : max_in = 8'b10000001;
	  3'b001 : max_in = 8'b01000010;
	  3'b010 : max_in = 8'b00100100;
	  3'b011 : max_in = 8'b00011000;
	  3'b100 : max_in = 8'b00011000;
	  3'b101 : max_in = 8'b00100100;
	  3'b110 : max_in = 8'b01000010;
	  3'b111 : max_in = 8'b10000001;
	  default: max_in = 8'b00000000;
	endcase
	*/
	//Lineas
	/*
	case (aux)
	  3'b000 : max_in = 8'b11111111;
	  3'b001 : max_in = 8'b00000000;
	  3'b010 : max_in = 8'b11111111;
	  3'b011 : max_in = 8'b00000000;
	  3'b100 : max_in = 8'b11111111;
	  3'b101 : max_in = 8'b00000000;
	  3'b110 : max_in = 8'b11111111;
	  3'b111 : max_in = 8'b00000000;
	  default: max_in = 8'b00000000;
	endcase
	*/
	//Carita feliz - muy inteligente
	/*
	case (aux)
	  3'b000 : max_in = 8'b00111100;
	  3'b001 : max_in = 8'b01000010;
	  3'b010 : max_in = 8'b10100101;
	  3'b011 : max_in = 8'b10100101;//
	  3'b100 : max_in = 8'b10000001;//
	  3'b101 : max_in = 8'b10000001;//
	  3'b110 : max_in = 8'b01000010;
	  3'b111 : max_in = 8'b00111100;
	  default: max_in = 8'b00000000;
	endcase
	*/
end
endmodule
