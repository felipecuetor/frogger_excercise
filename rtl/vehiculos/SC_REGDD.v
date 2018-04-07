//=======================================================
//  MODULE Definition
//=======================================================
module SC_REGDD #(parameter DATAWIDTH_BUS=8)(
//////////// OUTPUTS //////////
	SC_REGDD_DATAPARALLEL_BUS_OUT,
//////////// INPUTS //////////	
	SC_REGDD_CLOCK,
	SC_REGDD_RESET,
	SC_REGDD_VEL,
	SC_REGDD_LOAD_SHIFT,
	SC_REGDD_DATAPARALLEL_BUS_IN
);
//=======================================================
//  PARAMETER declarations
//=======================================================
//  PORT declarations
//=======================================================
	output reg	[DATAWIDTH_BUS-1:0] SC_REGDD_DATAPARALLEL_BUS_OUT;
	input		SC_REGDD_CLOCK;
	input		SC_REGDD_VEL;
	input 	SC_REGDD_RESET;
	input		SC_REGDD_LOAD_SHIFT;
	input		[DATAWIDTH_BUS-1:0] SC_REGDD_DATAPARALLEL_BUS_IN;
//=======================================================
//  REG/WIRE declarations
//=======================================================
	reg [DATAWIDTH_BUS-1:0] REGDD_Register;
	reg [DATAWIDTH_BUS-1:0] REGDD_Signal;
	reg [DATAWIDTH_BUS-1:0] REGDD_Shift;
	reg SC_REGDD_BitMEP;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
	always @ (*)
	if (SC_REGDD_LOAD_SHIFT == 1'b0 & SC_REGDD_VEL == 1'b1)	
		REGDD_Signal = {SC_REGDD_BitMEP, REGDD_Shift[DATAWIDTH_BUS-1:1]};
	else if(SC_REGDD_LOAD_SHIFT == 1'b1)	
		REGDD_Signal = SC_REGDD_DATAPARALLEL_BUS_IN;
	else	
		REGDD_Signal = REGDD_Shift;
// REGISTER : SEQUENTIAL
	always @ ( posedge SC_REGDD_CLOCK , posedge SC_REGDD_RESET)
	if (SC_REGDD_RESET==1'b1)
		REGDD_Register <= 8'b00000000;
	else
		REGDD_Register <= REGDD_Signal;
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL
	always @ (*)
	SC_REGDD_DATAPARALLEL_BUS_OUT= REGDD_Register;
	always @ (*)
	SC_REGDD_BitMEP = REGDD_Register[0]; 
	always @ (*)
	REGDD_Shift = SC_REGDD_DATAPARALLEL_BUS_OUT;
		
endmodule

