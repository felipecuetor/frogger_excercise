//=======================================================
//  MODULE Definition
//=======================================================
module SC_RECLOCK #(parameter CLOCK_DATAWITH)(
//////////// OUTPUTS //////////
	SC_RECLOCK_Out,
//////////// INPUTS //////////
	SC_RECLOCK_CLOCK_50,
	SC_RECLOCK_RESET,
	SC_RECLOCK_HAB_IN
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
	output	reg SC_RECLOCK_Out;
	input		SC_RECLOCK_CLOCK_50;
	input		SC_RECLOCK_RESET;
	input 	SC_RECLOCK_HAB_IN;
////=======================================================
//  REG/WIRE declarations
//=======================================================
	reg [CLOCK_DATAWITH-1:0] COUNTER_Register;
	reg [CLOCK_DATAWITH-1:0] COUNTER_Signal;
	reg [CLOCK_DATAWITH-1:0] COUNT=0;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
	always @ (*)	
	if (SC_RECLOCK_HAB_IN == 1'b0)	
		COUNTER_Signal=COUNT;	
	else 
		COUNTER_Signal = COUNTER_Register + 1'b1;
	
		// REGISTER : SEQUENTIAL
	always @ ( posedge SC_RECLOCK_CLOCK_50 , posedge SC_RECLOCK_RESET)
	if (SC_RECLOCK_RESET==1'b1)
		COUNTER_Register <= 1'b0;
	else
		COUNTER_Register <= COUNTER_Signal;
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL
	always @ (*)
		if (COUNTER_Register==~COUNT)
			SC_RECLOCK_Out = 1'b0;
		else
			SC_RECLOCK_Out = 1'b1;
endmodule


