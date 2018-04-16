//=======================================================
//  MODULE Definition
//=======================================================
module  PINTAR_MATRIZ (
//////////// OUTPUTS //////////
	PINTAR_7_OUT,
	PINTAR_6_OUT,
	PINTAR_5_OUT,
	PINTAR_4_OUT,
	PINTAR_3_OUT,
	PINTAR_2_OUT,
	PINTAR_1_OUT,
	PINTAR_0_OUT,
//////////// INPUTS //////////
	PINTAR_RANA_7_IN,
	PINTAR_RANA_6_IN,
	PINTAR_RANA_5_IN,
	PINTAR_RANA_4_IN,
	PINTAR_RANA_3_IN,
	PINTAR_RANA_2_IN,
	PINTAR_RANA_1_IN,
	PINTAR_RANA_0_IN,
	
	PINTAR_VEHICULOS_7_IN,
	PINTAR_VEHICULOS_6_IN,
	PINTAR_VEHICULOS_5_IN,
	PINTAR_VEHICULOS_4_IN,
	PINTAR_VEHICULOS_3_IN,
	PINTAR_VEHICULOS_2_IN,
	PINTAR_VEHICULOS_1_IN,
	PINTAR_VEHICULOS_0_IN,
	
	PINTAR_MENU_PRINCIPAL_ESTADO_IN,
	PINTAR_CLOCK,
	PINTAR_RESET
);
//=======================================================
//  PARAMETER declarations
//=======================================================
	parameter DATAWIDTH_BUS = 8;
	parameter DATAWIDTH_SELECTOR=3;
	parameter DATAWIDTH_ESTADO=3;
// states declaration
	parameter Inicio = 3'b000;
	parameter GanarJuego = 3'b101;
	parameter PerderJuego = 3'b110;
	parameter Seleccion1 = 3'b001;
	parameter Seleccion2 = 3'b010;
	parameter Seleccion3= 3'b011;
	parameter Seleccion4 = 3'b100;
	parameter Juego = 3'b111;
	parameter Finalizar = 3'b000;
	
//=======================================================
//  PORT declarations
//=======================================================
	input [DATAWIDTH_BUS-1:0]  PINTAR_RANA_7_IN;
	input [DATAWIDTH_BUS-1:0]  PINTAR_RANA_6_IN;
	input [DATAWIDTH_BUS-1:0]  PINTAR_RANA_5_IN;
	input [DATAWIDTH_BUS-1:0]  PINTAR_RANA_4_IN;
	input [DATAWIDTH_BUS-1:0]  PINTAR_RANA_3_IN;
	input [DATAWIDTH_BUS-1:0]  PINTAR_RANA_2_IN;
	input [DATAWIDTH_BUS-1:0]  PINTAR_RANA_1_IN;
	input [DATAWIDTH_BUS-1:0]  PINTAR_RANA_0_IN;
	
	input [DATAWIDTH_BUS-1:0]  PINTAR_VEHICULOS_7_IN;
	input [DATAWIDTH_BUS-1:0]  PINTAR_VEHICULOS_6_IN;
	input [DATAWIDTH_BUS-1:0]  PINTAR_VEHICULOS_5_IN;
	input [DATAWIDTH_BUS-1:0]  PINTAR_VEHICULOS_4_IN;
	input [DATAWIDTH_BUS-1:0]  PINTAR_VEHICULOS_3_IN;
	input [DATAWIDTH_BUS-1:0]  PINTAR_VEHICULOS_2_IN;
	input [DATAWIDTH_BUS-1:0]  PINTAR_VEHICULOS_1_IN;
	input [DATAWIDTH_BUS-1:0]  PINTAR_VEHICULOS_0_IN;
	
	
	input [DATAWIDTH_ESTADO-1:0]  PINTAR_MENU_PRINCIPAL_ESTADO_IN;
	
	input	  PINTAR_CLOCK;
	input	  PINTAR_RESET;
	
	output [DATAWIDTH_BUS-1:0]  PINTAR_7_OUT;
	output [DATAWIDTH_BUS-1:0]  PINTAR_6_OUT;
	output [DATAWIDTH_BUS-1:0]  PINTAR_5_OUT;
	output [DATAWIDTH_BUS-1:0]  PINTAR_4_OUT;
	output [DATAWIDTH_BUS-1:0]  PINTAR_3_OUT;
	output [DATAWIDTH_BUS-1:0]  PINTAR_2_OUT;
	output [DATAWIDTH_BUS-1:0]  PINTAR_1_OUT;
	output [DATAWIDTH_BUS-1:0]  PINTAR_0_OUT;
	
//=======================================================
//  REG/WIRE declarations
//=======================================================
	wire [DATAWIDTH_BUS-1:0] PINTAR_DATA_7;
	wire [DATAWIDTH_BUS-1:0] PINTAR_DATA_6;
	wire [DATAWIDTH_BUS-1:0] PINTAR_DATA_5;
	wire [DATAWIDTH_BUS-1:0] PINTAR_DATA_4;
	wire [DATAWIDTH_BUS-1:0] PINTAR_DATA_3;
	wire [DATAWIDTH_BUS-1:0] PINTAR_DATA_2;
	wire [DATAWIDTH_BUS-1:0] PINTAR_DATA_1;
	wire [DATAWIDTH_BUS-1:0] PINTAR_DATA_0;
//=======================================================
//  Structural coding
//=======================================================

PINTAR_DATA_DEMUX 
PINTAR_DATA_DEMUX_u1
(
	.PINTAR_DATA_DEMUX_7_OUT(PINTAR_DATA_7),
	.PINTAR_DATA_DEMUX_6_OUT(PINTAR_DATA_6),
	.PINTAR_DATA_DEMUX_5_OUT(PINTAR_DATA_5),
	.PINTAR_DATA_DEMUX_4_OUT(PINTAR_DATA_4),
	.PINTAR_DATA_DEMUX_3_OUT(PINTAR_DATA_3),
	.PINTAR_DATA_DEMUX_2_OUT(PINTAR_DATA_2),
	.PINTAR_DATA_DEMUX_1_OUT(PINTAR_DATA_1),
	.PINTAR_DATA_DEMUX_0_OUT(PINTAR_DATA_0),
	.PINTAR_DATA_DEMUX_ESTADO_IN(PINTAR_MENU_PRINCIPAL_ESTADO_IN)
);

generate
genvar x;
  for (x=0; x<8; x=x+1) 
  begin : PosY7
   assign PINTAR_7_OUT[x]= (PINTAR_RANA_7_IN[x] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[0] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[1] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[2])
				| PINTAR_DATA_7[x];
  end
endgenerate

generate
  for (x=0; x<8; x=x+1) 
  begin : PosY6
   assign PINTAR_6_OUT[x]= ((PINTAR_VEHICULOS_6_IN[]|PINTAR_RANA_6_IN[x]) & PINTAR_MENU_PRINCIPAL_ESTADO_IN[0] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[1] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[2])
				| PINTAR_DATA_6[x];
  end
endgenerate

generate
  for (x=0; x<8; x=x+1) 
  begin : PosY5
   assign PINTAR_5_OUT[x]= ((PINTAR_VEHICULOS_5_IN[]|PINTAR_RANA_5_IN[x]) & PINTAR_MENU_PRINCIPAL_ESTADO_IN[0] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[1] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[2])
				| PINTAR_DATA_5[x];
  end
endgenerate

generate
  for (x=0; x<8; x=x+1) 
  begin : PosY4
   assign PINTAR_4_OUT[x]= ((PINTAR_VEHICULOS_4_IN[]|PINTAR_RANA_4_IN[x]) & PINTAR_MENU_PRINCIPAL_ESTADO_IN[0] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[1] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[2])
				| PINTAR_DATA_4[x];
  end
endgenerate

generate
  for (x=0; x<8; x=x+1) 
  begin : PosY3
     assign PINTAR_3_OUT[x]= ((PINTAR_VEHICULOS_3_IN[]|PINTAR_RANA_3_IN[x]) & PINTAR_MENU_PRINCIPAL_ESTADO_IN[0] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[1] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[2])
				| PINTAR_DATA_3[x];
  end
endgenerate

generate
  for (x=0; x<8; x=x+1) 
  begin : PosY2
   assign PINTAR_2_OUT[x]= ((PINTAR_VEHICULOS_2_IN[]|PINTAR_RANA_2_IN[x]) & PINTAR_MENU_PRINCIPAL_ESTADO_IN[0] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[1] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[2])
				| PINTAR_DATA_2[x];
  end
endgenerate

generate
  for (x=0; x<8; x=x+1) 
  begin : PosY1
   assign PINTAR_1_OUT[x]= ((PINTAR_VEHICULOS_1_IN[]|PINTAR_RANA_1_IN[x]) & PINTAR_MENU_PRINCIPAL_ESTADO_IN[0] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[1] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[2])
				| PINTAR_DATA_1[x];
  end
endgenerate

generate
  for (x=0; x<8; x=x+1) 
  begin : PosY0
   assign PINTAR_0_OUT[x]= (PINTAR_RANA_0_IN[x] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[0] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[1] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[2])
				| PINTAR_DATA_0[x];
  end
endgenerate
  
endmodule
