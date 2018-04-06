//=======================================================
//  MODULE Definition
//=======================================================
module SC_REGDD #(parameter DATAWIDTH_BUS=8)(
//////////// OUTPUTS //////////
	SC_REGDD_DATAPARALLEL_BUS_OUT,
	SC_REGDD_LOADED,
//////////// INPUTS //////////
	SC_REGDD_CLOCK,
	SC_REGDD_RESET,
	SC_REGDD_LOAD,
	SC_REGDD_SHIFT,
	SC_REGDD_DATAPARALLEL_BUS_IN
);
//=======================================================
//  PARAMETER declarations
//=======================================================
//  PORT declarations
//=======================================================
	output reg	[DATAWIDTH_BUS-1:0] SC_REGDD_DATAPARALLEL_BUS_OUT;
	output 	SC_REGDD_LOADED;
	input		SC_REGDD_CLOCK;
	input 	SC_REGDD_RESET;
	input		SC_REGDD_SHIFT;
	input		SC_REGDD_LOAD;
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
	if (SC_REGDD_SHIFT == 1'b1)	
		REGDD_Signal = {SC_REGDD_BitMEP, REGDD_Shift[DATAWIDTH_BUS-1:1]};
	else if(SC_REGDD_LOAD ==1'b1)	
		REGDD_Signal = SC_REGDD_DATAPARALLEL_BUS_IN;
	else	
		REGDD_Signal = 8'b00000000;
		
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
	assign SC_REGDD_LOADED=(REGDD_Register == SC_REGDD_DATAPARALLEL_BUS_IN);
		
endmodule

