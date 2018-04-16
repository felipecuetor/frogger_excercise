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
	PINTAR_J7_IN,
	PINTAR_J6_IN,
	PINTAR_J5_IN,
	PINTAR_J4_IN,
	PINTAR_J3_IN,
	PINTAR_J2_IN,
	PINTAR_J1_IN,
	PINTAR_J0_IN,
	PINTAR_MENU_PRINCIPAL_ESTADO_IN,
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
	input [DATAWIDTH_BUS-1:0]  PINTAR_J7_IN;
	input [DATAWIDTH_BUS-1:0]  PINTAR_J6_IN;
	input [DATAWIDTH_BUS-1:0]  PINTAR_J5_IN;
	input [DATAWIDTH_BUS-1:0]  PINTAR_J4_IN;
	input [DATAWIDTH_BUS-1:0]  PINTAR_J3_IN;
	input [DATAWIDTH_BUS-1:0]  PINTAR_J2_IN;
	input [DATAWIDTH_BUS-1:0]  PINTAR_J1_IN;
	input [DATAWIDTH_BUS-1:0]  PINTAR_J0_IN;
	
	input [DATAWIDTH_ESTADO-1:0]  PINTAR_MENU_PRINCIPAL_ESTADO_IN;
	
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
genvar i;
  for (i=0; i<8; i=i+1) 
  begin : PosY7
   assign PINTAR_7_OUT[i]= (PINTAR_J7_IN[i] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[0] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[1] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[2])
				| PINTAR_DATA_7[i];
  end
endgenerate

generate
  for (i=0; i<8; i=i+1) 
  begin : PosY6
   assign PINTAR_6_OUT[i]= (PINTAR_J6_IN[i] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[0] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[1] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[2])
				| PINTAR_DATA_6[i];
  end
endgenerate

generate
  for (i=0; i<8; i=i+1) 
  begin : PosY5
   assign PINTAR_5_OUT[i]= (PINTAR_J5_IN[i] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[0] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[1] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[2])
				| PINTAR_DATA_5[i];
  end
endgenerate

generate
  for (i=0; i<8; i=i+1) 
  begin : PosY4
   assign PINTAR_4_OUT[i]= (PINTAR_J4_IN[i] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[0] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[1] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[2])
				| PINTAR_DATA_4[i];
  end
endgenerate

generate
  for (i=0; i<8; i=i+1) 
  begin : PosY3
   assign PINTAR_3_OUT[i]= (PINTAR_J3_IN[i] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[0] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[1] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[2])
				| PINTAR_DATA_3[i];
  end
endgenerate

generate
  for (i=0; i<8; i=i+1) 
  begin : PosY2
   assign PINTAR_2_OUT[i]= (PINTAR_J2_IN[i] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[0] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[1] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[2])
				| PINTAR_DATA_2[i];
  end
endgenerate

generate
  for (i=0; i<8; i=i+1) 
  begin : PosY1
   assign PINTAR_1_OUT[i]= (PINTAR_J1_IN[i] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[0] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[1] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[2])
				| PINTAR_DATA_1[i];
  end
endgenerate

generate
  for (i=0; i<8; i=i+1) 
  begin : PosY0
   assign PINTAR_0_OUT[i]= (PINTAR_J0_IN[i] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[0] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[1] & PINTAR_MENU_PRINCIPAL_ESTADO_IN[2])
				| PINTAR_DATA_0[i];
  end
endgenerate

  
endmodule
