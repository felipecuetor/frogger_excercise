//=======================================================
//  MODULE Definition
//=======================================================
module SC_CSCOUNT(
//////////// OUTPUTS //////////
	SC_GANO_OUT,
//////////// INPUTS //////////
	SC_CSCOUNT_ESTADO_IN,
	SC_CSCOUNT_RANAINI_IN,
	SC_CSCOUNT_PERDIO_IN,
	SC_CSCOUNT_CLOCK_50,
	SC_CSCOUNT_RESET
);
//=======================================================
//  PARAMETER declarations
//=======================================================
	parameter DATAWIDTH_ESTADO=3;
//=======================================================
//  PORT declarations
//=======================================================
	output	reg SC_GANO_OUT;
	input [DATAWIDTH_ESTADO-1:0] SC_CSCOUNT_ESTADO_IN;
	input SC_CSCOUNT_RANAINI_IN;
	input SC_CSCOUNT_PERDIO_IN;
	input	SC_CSCOUNT_CLOCK_50;
	input	SC_CSCOUNT_RESET;	
//=======================================================
//  REG/WIRE declarations
//=======================================================
	reg [2:0] COUNTER_Register;
	reg [2:0] COUNTER_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
	always @ (*)	
	if ( SC_CSCOUNT_ESTADO_IN == 3'b111 & SC_CSCOUNT_RANAINI_IN == 1'b1)	
		COUNTER_Signal= COUNTER_Register + 1'b1;	
	else if(SC_CSCOUNT_PERDIO_IN == 1'b1 | SC_GANO_OUT == 1'b1)
		COUNTER_Signal = 3'b000;
	else if(SC_CSCOUNT_ESTADO_IN == 3'b111)
		COUNTER_Signal= COUNTER_Register;	
	else COUNTER_Signal = 3'b000;	
		// REGISTER : SEQUENTIAL
	always @ ( posedge SC_CSCOUNT_CLOCK_50 , posedge SC_CSCOUNT_RESET)
	if (SC_CSCOUNT_RESET==1'b1)
		COUNTER_Register <= 3'b000;
	else
		COUNTER_Register <= COUNTER_Signal;
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL
	always @ (*)
		if (COUNTER_Register==3'b100)
			SC_GANO_OUT = 1'b1;
		else
			SC_GANO_OUT = 1'b0;
endmodule


