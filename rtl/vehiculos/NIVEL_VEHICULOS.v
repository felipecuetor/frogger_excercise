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
wire [DATAWIDTH_BUS-1:0] NVE_REGD_WIRE;
wire [DATAWIDTH_BUS-1:0] NVE_REGI_WIRE;
//=======================================================
//  Structural coding
//=======================================================
REG_NV REG_NV_u0
(

   .REGDD_NV_DATAPARALLEL_OUT(NVE_REGD_WIRE),
	.REGDI_NV_DATAPARALLEL_OUT(NVE_REGI_WIRE),
	.REG_NV_CLOCK(NVE_CLOCK),
	.REG_NV_RESET(NVE_RESET),
	.REG_NV_NVL_IN(NVE_NV_IN),
	.REG_NV_CN_IN(NVE_CN_IN)
);

assign NVE_REG_5_OUT=NVE_REGD_WIRE;
assign NVE_REG_4_OUT=NVE_REGI_WIRE;
assign NVE_REG_3_OUT=NVE_REGD_WIRE;
assign NVE_REG_2_OUT=NVE_REGI_WIRE;
assign NVE_REG_1_OUT=NVE_REGD_WIRE;
assign NVE_REG_0_OUT=NVE_REGI_WIRE;


endmodule

