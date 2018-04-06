/*
Universidad de los Andes
Departamento Ingeniería Eléctrica y Electrónica
Arquitectura y Diseño de Sistemas Digitales

Módulo imagen FPGA - Max7219

Autor:José Francisco Molano Pulido (jf.molano1587@uniandes.edu.co)
*/

module system
#(parameter	clk_freq	= 50000000) 
(
	input wire	Clk_System, lowRst_System, left_n, right_n, up_n, down_n,
	output max7219_din,max7219_ncs,max7219_clk
);
wire [7:0] data_max;
wire [7:0] fila0, fila1, fila2, fila3, fila4, fila5, fila6, fila7;
wire [7:0] pos_rana0, pos_rana1, pos_rana2, pos_rana3, pos_rana4, pos_rana5, pos_rana6, pos_rana7;
wire [2:0] add;
wire left, right, up, down;
wire left_tick, right_tick, up_tick, down_tick;

//	input			C_CLOCK_50;
//	input			C_Reset;
//	input			Rana_Up;
//	input			Rana_Down;

//	input			Rana_Left;
//	input			Rana_Right;

rana rana_object(
	.Rana_CLOCK_50(Clk_System),
	.Rana_Reset(lowRst_System),
	.Rana_Up(up_tick),
	.Rana_Down(down_tick),
	.Rana_Left(left_tick),
	.Rana_Right(right_tick)
	.Rana_Led_Map_Bus_0(pos_rana0),
	.Rana_Led_Map_Bus_1(pos_rana1),
	.Rana_Led_Map_Bus_2(pos_rana2),
	.Rana_Led_Map_Bus_3(pos_rana3),
	.Rana_Led_Map_Bus_4(pos_rana4),
	.Rana_Led_Map_Bus_5(pos_rana5),
	.Rana_Led_Map_Bus_6(pos_rana6),
	.Rana_Led_Map_Bus_7(pos_rana7)
	
)


matrix_ctrl matrix_ctrl_unit_0(
	.max7219_din(max7219_din),.max7219_ncs(max7219_ncs),.max7219_clk(max7219_clk),
	.disp_data(data_max),.disp_addr(add),.intensity(4'hA),
    	.clk(Clk_System),.reset(~lowRst_System)
);

imagen img1(
    .clk(max7219_clk),
    .act_add(add),
    .fila_0(fila0),
    .fila_1(fila1),
    .fila_2(fila2),
    .fila_3(fila3),
    .fila_4(fila4),
    .fila_5(fila5),
    .fila_6(fila6),
    .fila_7(fila7),
    .max_in(data_max)
    );

rebote rebote_1(
    .clk(Clk_System), .reset(~lowRst_System),
    .sw(up),
    .db_level(), .db_tick(up_tick)
    );

rebote rebote_2(
    .clk(Clk_System), .reset(~lowRst_System),
    .sw(down),
    .db_level(), .db_tick(down_tick)
    );

rebote rebote_3(
    .clk(Clk_System), .reset(~lowRst_System),
    .sw(left),
    .db_level(), .db_tick(left_tick)
    );

rebote rebote_4(
    .clk(Clk_System), .reset(~lowRst_System),
    .sw(right),
    .db_level(), .db_tick(right_tick)
    );

states st_1
   (
    .clk(Clk_System), .reset(~lowRst_System),
    .sw(pulso),
    .data0(fila0),
    .data1(fila1),
    .data2(fila2),
    .data3(fila3),
    .data4(fila4),
    .data5(fila5),
    .data6(fila6),
    .data7(fila7)
   );

assign left = ~left_n;
assign right = ~right_n;
assign up = ~up_n;
assign down = ~down_n;
assign pulso = up_tick ^ down_tick ^ right_tick ^ left_tick;

endmodule
