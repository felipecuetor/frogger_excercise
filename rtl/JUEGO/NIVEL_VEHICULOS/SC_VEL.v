//=======================================================
//  MODULE Definition
//=======================================================
module SC_VEL #(parameter VEL_DATAWITH)(
//////////// OUTPUTS //////////
	SC_VEL_OUT,
//////////// INPUTS //////////
	SC_VEL_CLOCK_50,
	SC_VEL_RESET,
	SC_VEL_HAB_IN
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
	output	reg SC_VEL_OUT;
	input		SC_VEL_CLOCK_50;
	input		SC_VEL_RESET;
	input 	SC_VEL_HAB_IN;
//=======================================================
//  REG/WIRE declarations
//=======================================================
	reg [VEL_DATAWITH-1:0] COUNTER_Register;
	reg [VEL_DATAWITH-1:0] COUNTER_Signal;
	reg [VEL_DATAWITH-1:0] COUNT=0;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
	always @ (*)	
	if (SC_VEL_HAB_IN == 1'b0)	
		COUNTER_Signal=COUNT;	
	else 
		COUNTER_Signal = COUNTER_Register + 1'b1;
	
		// REGISTER : SEQUENTIAL
	always @ ( posedge SC_VEL_CLOCK_50 , posedge SC_VEL_RESET)
	if (SC_VEL_RESET==1'b1)
		COUNTER_Register <= 1'b0;
	else
		COUNTER_Register <= COUNTER_Signal;
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL
	always @ (*)
		if (COUNTER_Register==~COUNT)
			SC_VEL_OUT = 1'b1;
		else
			SC_VEL_OUT = 1'b0;
endmodule


