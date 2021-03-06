//=======================================================
//  MODULE Definition
//=======================================================
module CONTROL_RANAS(
//////////// OUTPUTS //////////
	CR_GANO_JC_OUT,
	CR_RANA_INI_OUT,
//////////// INPUTS //////////
	CR_POSY_IN,
	CR_PERDIO_IN,
	CR_ESTADO_IN,
	CR_CLOCK_50,
	CR_RESET
);
//=======================================================
//  PARAMETER declarations
//=======================================================
	parameter DATAWIDTH_ESTADO=3;
	parameter DATAWIDTH_POS=3;
//=======================================================
//  PORT declarations
//=======================================================
	output CR_GANO_JC_OUT;	
	output CR_RANA_INI_OUT;
	input [DATAWIDTH_POS-1:0] CR_POSY_IN;
	input CR_PERDIO_IN;
	input [DATAWIDTH_ESTADO-1:0] CR_ESTADO_IN;
	input CR_CLOCK_50;
	input CR_RESET;
		
//=======================================================
//  REG/WIRE declarations
//=======================================================
//=======================================================
//  Structural coding
//=======================================================
CTROL_POSINIRANA CTROL_POSINIRANA_u0(
	.CIR_RANA_INI_OUT(CR_RANA_INI_OUT),
	.CIR_POSY_IN(CR_POSY_IN),
	.CIR_PERDIO_IN(CR_PERDIO_IN),
	.CIR_GANO_IN(CR_GANO_JC_OUT),
	.CIR_ESTADO_IN(CR_ESTADO_IN),
	.CIR_CLOCK_50(CR_CLOCK_50),
	.CIR_RESET(CR_RESET)
);

SC_CSCOUNT SC_CSCOUNT_u0(
	.SC_GANO_OUT(CR_GANO_JC_OUT),
	.SC_CSCOUNT_ESTADO_IN(CR_ESTADO_IN),
	.SC_CSCOUNT_RANAINI_IN(CR_RANA_INI_OUT),
	.SC_CSCOUNT_PERDIO_IN(CR_PERDIO_IN),
	.SC_CSCOUNT_CLOCK_50(CR_CLOCK_50),
	.SC_CSCOUNT_RESET(CR_RESET)
);

endmodule