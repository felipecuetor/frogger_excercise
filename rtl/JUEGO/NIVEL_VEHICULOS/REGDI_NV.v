//=======================================================
//  MODULE Definition
//=======================================================
module REGDI_NV#(parameter NV_1_REG, 	parameter NV_2_REG, 	parameter NV_3_REG, 	parameter NV_4_REG ) 
(
//////////// OUTPUTS //////////
   REGDI_NV_DATAPARALLEL_OUT,
//////////// INPUTS //////////
	REGDI_NV_CLOCK,
	REGDI_NV_RESET,
	REGDI_NV_ESTADO_IN,
	REGDI_NV_NVL_IN,
	REGDI_NV_CN_IN
);
//=======================================================
//  PARAMETER declarations
//=======================================================
	parameter DATAWIDTH_BUS = 8;
	parameter VEL0_DATAWITH= 25; //RAPIDO
	parameter VEL1_DATAWITH= 1; //LENTO
	parameter DATAWIDTH_NVL=2;
	parameter DATAWIDTH_ESTADO=3;
//=======================================================
//  PORT declarations
//=======================================================
	output [DATAWIDTH_BUS-1:0] REGDI_NV_DATAPARALLEL_OUT;
	input	REGDI_NV_CLOCK;
	input REGDI_NV_RESET;
	input [DATAWIDTH_ESTADO-1:0] REGDI_NV_ESTADO_IN;
	input [DATAWIDTH_NVL-1:0] REGDI_NV_NVL_IN;
	input REGDI_NV_CN_IN;
//=======================================================
//  REG/WIRE declarations
//=======================================================
	wire REGDI_NV_LOAD_SHIFT;
	wire [DATAWIDTH_BUS-1:0] REGDI_NV_DATAPARALLEL_BUS;
	wire REGDI_NV_VEL0;
	wire REGDI_NV_VEL1;
	wire REGDI_NV_VEL_SELECT;
	wire REGDI_NV_VEL_SELECTED;
	wire REGDI_NV_VEL_HAB;
	
//=======================================================
//  Structural coding
//=======================================================
	
	SC_REGDI #(.DATAWIDTH_BUS(DATAWIDTH_BUS)) 
	SC_REGDI_u0 (
	.SC_REGDI_DATAPARALLEL_BUS_OUT(REGDI_NV_DATAPARALLEL_OUT),
	.SC_REGDI_CLOCK(REGDI_NV_CLOCK),
	.SC_REGDI_RESET(REGDI_NV_RESET),
	.SC_REGDI_VEL(REGDI_NV_VEL_SELECTED),
	.SC_REGDI_LOAD_SHIFT(REGDI_NV_LOAD_SHIFT),
	.SC_REGDI_DATAPARALLEL_BUS_IN(REGDI_NV_DATAPARALLEL_BUS)
);

	SC_VEL #(.VEL_DATAWITH(VEL0_DATAWITH))
	SC_VEL_u0(
	.SC_VEL_OUT(REGDI_NV_VEL0),
	.SC_VEL_CLOCK_50(REGDI_NV_CLOCK),
	.SC_VEL_RESET(REGDI_NV_RESET),
	.SC_VEL_HAB_IN(REGDI_NV_VEL0_HAB)
);	

	SC_VEL #(.VEL_DATAWITH(VEL1_DATAWITH))
	SC_VEL_u1(
	.SC_VEL_OUT(REGDI_NV_VEL1),
	.SC_VEL_CLOCK_50(REGDI_NV_CLOCK),
	.SC_VEL_RESET(REGDI_NV_RESET),
	.SC_VEL_HAB_IN(REGDI_NV_VEL0)
);


MUXX21  MUXX21_u0(
	.MUXX21_BIT_OUT(REGDI_NV_VEL_SELECTED),
	.MUXX21_SELECT_IN(REGDI_NV_VEL_SELECT),
	.MUXX21_IN0(REGDI_NV_VEL0),
	.MUXX21_IN1(REGDI_NV_VEL1)
);	
	SC_STATEMACHINE_NVE #(.DATAWIDTH_BUS(DATAWIDTH_BUS), .NV_1_REG(NV_1_REG), .NV_2_REG(NV_2_REG), .NV_3_REG(NV_3_REG), .NV_4_REG(NV_4_REG))
	SC_STATEMACHINE_NVE_u0(
	.SC_STATEMACHINE_NVE_LOAD_SHIFT_OUT(REGDI_NV_LOAD_SHIFT),
	.SC_STATEMACHINE_NVE_VEL_SELECT(REGDI_NV_VEL_SELECT),
	.SC_STATEMACHINE_NVE_HAB_VEL_OUT(REGDI_NV_VEL0_HAB),
	.SC_STATEMACHINE_NVE_REGNIVEL_OUT(REGDI_NV_DATAPARALLEL_BUS),
	.SC_STATEMACHINE_NVE_ESTADO_IN(REGDI_NV_ESTADO_IN),
	.SC_STATEMACHINE_NVE_NVL_IN(REGDI_NV_NVL_IN),
	.SC_STATEMACHINE_NVE_CN_IN(REGDI_NV_CN_IN),
	.SC_STATEMACHINE_NVE_CLOCK_50(REGDI_NV_CLOCK),
	.SC_STATEMACHINE_NVE_RESET(REGDI_NV_RESET)
);	
  
endmodule
