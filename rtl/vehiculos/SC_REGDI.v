//=======================================================
//  MODULE Definition
//=======================================================
module SC_REGDI #(parameter DATAWIDTH_BUS=8)(
//////////// OUTPUTS //////////
	SC_REGDI_DATAPARALLEL_BUS_OUT,
//////////// INPUTS //////////	
	SC_REGDI_CLOCK,
	SC_REGDI_RESET,
	SC_REGDI_VEL,
	SC_REGDI_LOAD_SHIFT,
	SC_REGDI_DATAPARALLEL_BUS_IN
);
//=======================================================
//  PARAMETER declarations
//=======================================================
//  PORT declarations
//=======================================================
	output reg	[DATAWIDTH_BUS-1:0] SC_REGDI_DATAPARALLEL_BUS_OUT;
	input		SC_REGDI_CLOCK;
	input		SC_REGDI_VEL;
	input 	SC_REGDI_RESET;
	input		SC_REGDI_LOAD_SHIFT;
	input		[DATAWIDTH_BUS-1:0] SC_REGDI_DATAPARALLEL_BUS_IN;
//=======================================================
//  REG/WIRE declarations
//=======================================================
	reg [DATAWIDTH_BUS-1:0] REGDI_Register;
	reg [DATAWIDTH_BUS-1:0] REGDI_Signal;
	reg [DATAWIDTH_BUS-1:0] REGDI_Shift;
	reg SC_REGDI_BitMAP;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
	always @ (*)
	if (SC_REGDI_LOAD_SHIFT == 1'b0 & SC_REGDI_VEL == 1'b1)	
		REGDI_Signal = {REGDI_Shift[DATAWIDTH_BUS-2:0],SC_REGDI_BitMAP};
	else if(SC_REGDI_LOAD_SHIFT == 1'b1)	
		REGDI_Signal = SC_REGDI_DATAPARALLEL_BUS_IN;
	else	
		REGDI_Signal = REGDI_Shift;
// REGISTER : SEQUENTIAL
	always @ ( posedge SC_REGDI_CLOCK , posedge SC_REGDI_RESET)
	if (SC_REGDI_RESET==1'b1)
		REGDI_Register <= 8'b00000000;
	else
		REGDI_Register <= REGDI_Signal;
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL
	always @ (*)
	SC_REGDI_DATAPARALLEL_BUS_OUT= REGDI_Register;
	always @ (*)
	SC_REGDI_BitMAP = REGDI_Register[7]; 
	always @ (*)
	REGDI_Shift = SC_REGDI_DATAPARALLEL_BUS_OUT;
		
endmodule
