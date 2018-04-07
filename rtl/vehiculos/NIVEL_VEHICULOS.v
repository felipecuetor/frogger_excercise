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
	NVE_NV_IN,
	NVE_CN_IN
);
//=======================================================
//  PARAMETER declarations
//=======================================================
	//Niveles
 	parameter NV_1_REGD =   8'b11000000;
	parameter NV_2_REGD =	8'b11100000;
	parameter NV_3_REGD =	8'b11110000;
	parameter NV_4_REGD =	8'b11111000;
	parameter NV_1_REGI =	8'b00000000;
	parameter NV_2_REGI =	8'b00000011;
	parameter NV_3_REGI =	8'b00000111;
	parameter NV_4_REGI =	8'b00001111;
	parameter DATAWIDTH_BUS = 8;
	parameter DATAWIDTH_NVL=2;
	
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
	input [DATAWIDTH_NVL-1:0] NVE_NV_IN;
	input NVE_CN_IN;
//=======================================================
//  REG/WIRE declarations
//=======================================================
//=======================================================
//  Structural coding
//=======================================================
	
	REGDD_NV #(.NV_1_REG(NV_1_REGD), .NV_2_REG(NV_2_REGD), .NV_3_REG(NV_3_REGD), .NV_4_REG(NV_4_REGD)) 
	REGDD_NV_u0 
(
	.REGDD_NV_DATAPARALLEL_OUT(NVE_REG_1_OUT),
	.REGDD_NV_CLOCK(NVE_CLOCK),
	.REGDD_NV_RESET(NVE_RESET),
	.REGDD_NV_NVL_IN(NVE_NV_IN),	
	.REGDD_NV_CN_IN(NVE_CN_IN)
);

	REGDD_NV #(.NV_1_REG(NV_1_REGD), .NV_2_REG(NV_2_REGD), .NV_3_REG(NV_3_REGD), .NV_4_REG(NV_4_REGD)) 
	REGDD_NV_u1 
(
	.REGDD_NV_DATAPARALLEL_OUT(NVE_REG_3_OUT),
	.REGDD_NV_CLOCK(NVE_CLOCK),
	.REGDD_NV_RESET(NVE_RESET),
	.REGDD_NV_NVL_IN(NVE_NV_IN),		
	.REGDD_NV_CN_IN(NVE_CN_IN)
);

	REGDD_NV #(.NV_1_REG(NV_1_REGD), .NV_2_REG(NV_2_REGD), .NV_3_REG(NV_3_REGD), .NV_4_REG(NV_4_REGD)) 
	REGDD_NV_u2 
(
	.REGDD_NV_DATAPARALLEL_OUT(NVE_REG_5_OUT),
	.REGDD_NV_CLOCK(NVE_CLOCK),
	.REGDD_NV_RESET(NVE_RESET),
	.REGDD_NV_NVL_IN(NVE_NV_IN),		
	.REGDD_NV_CN_IN(NVE_CN_IN)
);

	REGDI_NV #(.NV_1_REG(NV_1_REGI), .NV_2_REG(NV_2_REGI), .NV_3_REG(NV_3_REGI), .NV_4_REG(NV_4_REGI)) 
	REGDI_NV_u0 
(
	.REGDI_NV_DATAPARALLEL_OUT(NVE_REG_0_OUT),
	.REGDI_NV_CLOCK(NVE_CLOCK),
	.REGDI_NV_RESET(NVE_RESET),
	.REGDI_NV_NVL_IN(NVE_NV_IN),		
	.REGDI_NV_CN_IN(NVE_CN_IN)
);

	REGDI_NV #(.NV_1_REG(NV_1_REGI), .NV_2_REG(NV_2_REGI), .NV_3_REG(NV_3_REGI), .NV_4_REG(NV_4_REGI)) 
	REGDI_NV_u1 
(
	.REGDI_NV_DATAPARALLEL_OUT(NVE_REG_2_OUT),
	.REGDI_NV_CLOCK(NVE_CLOCK),
	.REGDI_NV_RESET(NVE_RESET),
	.REGDI_NV_NVL_IN(NVE_NV_IN),	
	.REGDI_NV_CN_IN(NVE_CN_IN)
);

	REGDI_NV #(.NV_1_REG(NV_1_REGI), .NV_2_REG(NV_2_REGI), .NV_3_REG(NV_3_REGI), .NV_4_REG(NV_4_REGI)) 
	REGDI_NV_u2 
(
	.REGDI_NV_DATAPARALLEL_OUT(NVE_REG_4_OUT),
	.REGDI_NV_CLOCK(NVE_CLOCK),
	.REGDI_NV_RESET(NVE_RESET),
	.REGDI_NV_NVL_IN(NVE_NV_IN),		
	.REGDI_NV_CN_IN(NVE_CN_IN)
);


endmodule

