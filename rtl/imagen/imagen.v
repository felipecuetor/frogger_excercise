/*
Universidad de los Andes
Departamento Ingeniería Eléctrica y Electrónica
Arquitectura y Diseño de Sistemas Digitales

Módulo imagen FPGA - Max7219

Autor:José Francisco Molano Pulido (jf.molano1587@uniandes.edu.co)
*/


module imagen(
    input clk,
    input wire [2:0] act_add,
    input wire [7:0] fila_0,
    input wire [7:0] fila_1,
    input wire [7:0] fila_2,
    input wire [7:0] fila_3,
    input wire [7:0] fila_4,
    input wire [7:0] fila_5,
    input wire [7:0] fila_6,
    input wire [7:0] fila_7,
    output reg [7:0] max_in
    );
always@(posedge clk)
begin
case (act_add)
	3'b000:
		begin
		max_in <= fila_0;
		end
	3'b001:
		begin
		max_in <= fila_1;
		end
	3'b010:
		begin
		max_in <= fila_2;
		end
	3'b011:
		begin
		max_in <= fila_3;
		end
	3'b100:
		begin
		max_in <= fila_4;
		end
	3'b101:
		begin
		max_in <= fila_5;
		end
	3'b110:
		begin
		max_in <= fila_6;
		end
	3'b111:
		begin
		max_in <= fila_7;
		end
	default:max_in <= 8'b00000000;
endcase	
end

endmodule
