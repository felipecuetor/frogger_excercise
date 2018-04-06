//=======================================================
//  MODULE Definition
//=======================================================
module SC_REGDI #(parameter DATAWIDTH_BUS=8)(
//////////// OUTPUTS //////////
	SC_REGDI_DATAPARALLEL_BUS_OUT,
	SC_REGDI_LOADED,
//////////// INPUTS //////////
	SC_REGDI_CLOCK,
	SC_REGDI_RESET,
	SC_REGDI_LOAD,
	SC_REGDI_SHIFT,
	SC_REGDI_DATAPARALLEL_BUS_IN
);
//=======================================================
//  PARAMETER declarations
//=======================================================
//  PORT declarations
//=======================================================
	output reg	[DATAWIDTH_BUS-1:0] SC_REGDI_DATAPARALLEL_BUS_OUT;
	output 	SC_REGDI_LOADED;
	input		SC_REGDI_CLOCK;
	input 	SC_REGDI_RESET;
	input		SC_REGDI_SHIFT;
	input		SC_REGDI_LOAD;
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
	if (SC_REGDI_SHIFT == 1'b1)	
		REGDI_Signal = {REGDI_Shift[DATAWIDTH_BUS-2:0],SC_REGDI_BitMAP};
	else if(SC_REGDI_LOAD ==1'b1)	
		REGDI_Signal = SC_REGDI_DATAPARALLEL_BUS_IN;
	else	
		REGDI_Signal = 8'b00000000;
		
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
	assign SC_REGDI_LOADED=(REGDI_Register == SC_REGDI_DATAPARALLEL_BUS_IN);
		
endmodule

