//=======================================================
//  MODULE Definition
//=======================================================
module NIVEL_VEHICULOS (
//////////// OUTPUTS //////////
	NVE_REG_5_OUT,
	NVE_REG_4_OUT,
	NVE_REG_3_OUT,
	NVE_REG_2_OUT,
	NVE_REG_1_OUT,
	NVE_REG_0_OUT,
//////////// INPUTS //////////
	NVE_CLOCK,
	NVE_RESET,
	NVE_ESTADO_IN,
	NVE_NV_IN,
	NVE_CN_IN
);
//=======================================================
//  PARAMETER declarations
//=======================================================
	//Niveles
 	parameter NV_1_REGD1 =   8'b00000011;
	parameter NV_1_REGD3 =   8'b00110000;
	parameter NV_1_REGD5 =   8'b00001100;
	
	parameter NV_1_REGI0 =   8'b00000000;
	parameter NV_1_REGI2 =   8'b00000000;
	parameter NV_1_REGI4 =   8'b00000000;
	
	parameter NV_2_REGD1 =   8'b00111000;
	parameter NV_2_REGD3 =   8'b00000000;
	parameter NV_2_REGD5 =   8'b11100000;
	
	parameter NV_2_REGI0 =   8'b00000000;
	parameter NV_2_REGI2 =   8'b00000000;
	parameter NV_2_REGI4 =   8'b01110000;

	parameter NV_3_REGD1 =   8'b00110011;
	parameter NV_3_REGD3 =   8'b00000000;
	parameter NV_3_REGD5 =   8'b01000100;
	
	parameter NV_3_REGI0 =   8'b00000000;
	parameter NV_3_REGI2 =   8'b10000001;
	parameter NV_3_REGI4 =   8'b00001110;
	
	parameter NV_4_REGD1 =   8'b10011001;
	parameter NV_4_REGD3 =   8'b11100000;
	parameter NV_4_REGD5 =   8'b00000011;
	
	parameter NV_4_REGI0 =   8'b00110000;
	parameter NV_4_REGI2 =   8'b00110000;
	parameter NV_4_REGI4 =   8'b11011000;
	
	parameter DATAWIDTH_BUS = 8;
	parameter DATAWIDTH_NVL=2;
	parameter DATAWIDTH_ESTADO=3;
//=======================================================
//  PORT declarations
//=======================================================
	output [DATAWIDTH_BUS-1:0] NVE_REG_5_OUT;
	output [DATAWIDTH_BUS-1:0] NVE_REG_4_OUT;
	output [DATAWIDTH_BUS-1:0] NVE_REG_3_OUT;
	output [DATAWIDTH_BUS-1:0] NVE_REG_2_OUT;
	output [DATAWIDTH_BUS-1:0] NVE_REG_1_OUT;
	output [DATAWIDTH_BUS-1:0] NVE_REG_0_OUT;
	input	NVE_CLOCK;
	input NVE_RESET;
	input [DATAWIDTH_ESTADO-1:0] NVE_ESTADO_IN;
	input [DATAWIDTH_NVL-1:0] NVE_NV_IN;
	input NVE_CN_IN;
//=======================================================
//  REG/WIRE declarations
//=======================================================
//=======================================================
//  Structural coding
//=======================================================
	
	REGDD_NV #(.NV_1_REG(NV_1_REGD1), .NV_2_REG(NV_2_REGD1), .NV_3_REG(NV_3_REGD1), .NV_4_REG(NV_4_REGD1)) 
	REGDD_NV_u0 
(
	.REGDD_NV_DATAPARALLEL_OUT(NVE_REG_1_OUT),
	.REGDD_NV_CLOCK(NVE_CLOCK),
	.REGDD_NV_RESET(NVE_RESET),
	.REGDD_NV_ESTADO_IN(NVE_ESTADO_IN),
	.REGDD_NV_NVL_IN(NVE_NV_IN),	
	.REGDD_NV_CN_IN(NVE_CN_IN)
);

	REGDD_NV #(.NV_1_REG(NV_1_REGD3), .NV_2_REG(NV_2_REGD3), .NV_3_REG(NV_3_REGD3), .NV_4_REG(NV_4_REGD3)) 
	REGDD_NV_u1 
(
	.REGDD_NV_DATAPARALLEL_OUT(NVE_REG_3_OUT),
	.REGDD_NV_CLOCK(NVE_CLOCK),
	.REGDD_NV_RESET(NVE_RESET),
	.REGDD_NV_ESTADO_IN(NVE_ESTADO_IN),
	.REGDD_NV_NVL_IN(NVE_NV_IN),		
	.REGDD_NV_CN_IN(NVE_CN_IN)
);

	REGDD_NV #(.NV_1_REG(NV_1_REGD5), .NV_2_REG(NV_2_REGD5), .NV_3_REG(NV_3_REGD5), .NV_4_REG(NV_4_REGD5)) 
	REGDD_NV_u2 
(
	.REGDD_NV_DATAPARALLEL_OUT(NVE_REG_5_OUT),
	.REGDD_NV_CLOCK(NVE_CLOCK),
	.REGDD_NV_RESET(NVE_RESET),
	.REGDD_NV_ESTADO_IN(NVE_ESTADO_IN),
	.REGDD_NV_NVL_IN(NVE_NV_IN),		
	.REGDD_NV_CN_IN(NVE_CN_IN)
);

	REGDI_NV #(.NV_1_REG(NV_1_REGI0), .NV_2_REG(NV_2_REGI0), .NV_3_REG(NV_3_REGI0), .NV_4_REG(NV_4_REGI0)) 
	REGDI_NV_u0 
(
	.REGDI_NV_DATAPARALLEL_OUT(NVE_REG_0_OUT),
	.REGDI_NV_CLOCK(NVE_CLOCK),
	.REGDI_NV_RESET(NVE_RESET),
	.REGDI_NV_ESTADO_IN(NVE_ESTADO_IN),
	.REGDI_NV_NVL_IN(NVE_NV_IN),		
	.REGDI_NV_CN_IN(NVE_CN_IN)
);

	REGDI_NV #(.NV_1_REG(NV_1_REGI2), .NV_2_REG(NV_2_REGI2), .NV_3_REG(NV_3_REGI2), .NV_4_REG(NV_4_REGI2)) 
	REGDI_NV_u1 
(
	.REGDI_NV_DATAPARALLEL_OUT(NVE_REG_2_OUT),
	.REGDI_NV_CLOCK(NVE_CLOCK),
	.REGDI_NV_RESET(NVE_RESET),
	.REGDI_NV_ESTADO_IN(NVE_ESTADO_IN),
	.REGDI_NV_NVL_IN(NVE_NV_IN),	
	.REGDI_NV_CN_IN(NVE_CN_IN)
);

	REGDI_NV #(.NV_1_REG(NV_1_REGI4), .NV_2_REG(NV_2_REGI4), .NV_3_REG(NV_3_REGI4), .NV_4_REG(NV_4_REGI4)) 
	REGDI_NV_u2 
(
	.REGDI_NV_DATAPARALLEL_OUT(NVE_REG_4_OUT),
	.REGDI_NV_CLOCK(NVE_CLOCK),
	.REGDI_NV_RESET(NVE_RESET),
	.REGDI_NV_ESTADO_IN(NVE_ESTADO_IN),
	.REGDI_NV_NVL_IN(NVE_NV_IN),		
	.REGDI_NV_CN_IN(NVE_CN_IN)
);


endmodule
