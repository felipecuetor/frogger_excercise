//=======================================================
//  MODULE Definition
//=======================================================
module  RANA (
//////////// OUTPUTS //////////
    RANA_7_OUT,
	 RANA_6_OUT,
	 RANA_5_OUT,
	 RANA_4_OUT,
	 RANA_3_OUT,
	 RANA_2_OUT,
	 RANA_1_OUT,
	 RANA_0_OUT,
	 PXRANA_OUT,
	 PYRANA_OUT,
//////////// INPUTS //////////
	 RANA_CLOCK,
	 RANA_RESET,
	 RANA_INI,
	 RANA_LEFT,
	 RANA_RIGHT,
	 RANA_UP,
	 RANA_DOWN,
	 VEH7_IN,
	 VEH6_IN,
	 VEH5_IN,
	 VEH4_IN,
	 VEH3_IN,
	 VEH2_IN,
	 VEH1_IN
);
//=======================================================
//  PARAMETER declarations
//=======================================================
	parameter DATAWIDTH_BUS = 8;
	parameter DATAWIDTH_SELECTOR=3;
	
//=======================================================
//  PORT declarations
//=======================================================
	output [DATAWIDTH_BUS-1:0]  RANA_7_OUT;
	output [DATAWIDTH_BUS-1:0]  RANA_6_OUT;
	output [DATAWIDTH_BUS-1:0]  RANA_5_OUT;
	output [DATAWIDTH_BUS-1:0]  RANA_4_OUT;
	output [DATAWIDTH_BUS-1:0]  RANA_3_OUT;
	output [DATAWIDTH_BUS-1:0]  RANA_2_OUT;
	output [DATAWIDTH_BUS-1:0]  RANA_1_OUT;
	output [DATAWIDTH_BUS-1:0]  RANA_0_OUT;
	output [DATAWIDTH_SELECTOR-1:0]  PXRANA_OUT;
	output [DATAWIDTH_SELECTOR-1:0]  PYRANA_OUT;
	input	  RANA_CLOCK;
	input	  RANA_RESET;
	input   RANA_INI;
	input   RANA_LEFT;
	input   RANA_RIGHT;
	input   RANA_UP;
	input   RANA_DOWN;
	input [DATAWIDTH_BUS-1:0]  VEH7_IN;
	input [DATAWIDTH_BUS-1:0]  VEH6_IN;
	input [DATAWIDTH_BUS-1:0]  VEH5_IN;
	input [DATAWIDTH_BUS-1:0]  VEH4_IN;
	input [DATAWIDTH_BUS-1:0]  VEH3_IN;
	input [DATAWIDTH_BUS-1:0]  VEH2_IN;
	input [DATAWIDTH_BUS-1:0]  VEH1_IN;
	
//=======================================================
//  REG/WIRE declarations
//=======================================================
	wire [DATAWIDTH_BUS-1:0] RANA_DATAX;
	wire [DATAWIDTH_BUS-1:0] RANA_DATAY;
	wire [DATAWIDTH_SELECTOR-1:0] RANA_SELECTY;
	wire [DATAWIDTH_SELECTOR-1:0] RANA_SELECTX;
//=======================================================
//  Structural coding
//=======================================================
SC_STATEMACHINE_FROG_MOV
SC_STATEMACHINE_FROG_MOV_u0(
	.SC_STATEMACHINE_FROG_MOV( RANA_SELECTX),
	.SC_STATEMACHINE_FROG_MOV_AVANZAR(RANA_RIGHT),
	.SC_STATEMACHINE_FROG_MOV_RETROCEDER(RANA_LEFT),
	.SC_STATEMACHINE_FROG_MOV_INI(RANA_INI),
	.SC_STATEMACHINE_FROG_MOV_CLOCK_50( RANA_CLOCK),
	.SC_STATEMACHINE_FROG_MOV_RESET( RANA_RESET)

);

SC_STATEMACHINE_FROG_MOV
SC_STATEMACHINE_FROG_MOV_u1(
	.SC_STATEMACHINE_FROG_MOV( RANA_SELECTY),
	.SC_STATEMACHINE_FROG_MOV_AVANZAR( RANA_UP),
	.SC_STATEMACHINE_FROG_MOV_RETROCEDER( RANA_DOWN),
	.SC_STATEMACHINE_FROG_MOV_INI( RANA_INI),
	.SC_STATEMACHINE_FROG_MOV_CLOCK_50( RANA_CLOCK),
	.SC_STATEMACHINE_FROG_MOV_RESET( RANA_RESET)
);
 CODE38X CODE38X_u0(
	.CODE38X_Data_Out( RANA_DATAX),
	.CODE38X_Select_In( RANA_SELECTX)
);

CODE38Y CODE38Y_u0(
	.CODE38Y_Data_Out( RANA_DATAY),
	.CODE38Y_Select_In( RANA_SELECTY)
);


assign RANA_7_OUT=VEH7_IN;

generate
genvar x;
  for (x=0; x<8; x=x+1) 
  begin : PosY6
   assign RANA_6_OUT[x]= (RANA_DATAX[x]& RANA_DATAY[6])|(VEH6_IN[x]);
  end
endgenerate

generate
  for (x=0; x<8; x=x+1) 
  begin : PosY5
   assign RANA_5_OUT[x]= (RANA_DATAX[x]& RANA_DATAY[5])|(VEH5_IN[x]);
  end
endgenerate

generate
  for (x=0; x<8; x=x+1) 
  begin : PosY4
   assign RANA_4_OUT[x]= (RANA_DATAX[x]& RANA_DATAY[4])|(VEH4_IN[x]);
  end
endgenerate

generate
  for (x=0; x<8; x=x+1) 
  begin : PosY3
   assign RANA_3_OUT[x]= (RANA_DATAX[x]& RANA_DATAY[3])|(VEH3_IN[x]);
  end
endgenerate

generate
  for (x=0; x<8; x=x+1) 
  begin : PosY2
   assign RANA_2_OUT[x]= (RANA_DATAX[x]& RANA_DATAY[2])|(VEH2_IN[x]);
  end
endgenerate

generate
  for (x=0; x<8; x=x+1) 
  begin : PosY1
   assign RANA_1_OUT[x]= (RANA_DATAX[x]& RANA_DATAY[1])|(VEH1_IN[x]);
  end
endgenerate

generate
  for (x=0; x<8; x=x+1) 
  begin : PosY0
   assign RANA_0_OUT[x]= (RANA_DATAX[x]& RANA_DATAY[0]);
  end
endgenerate
  
  assign PXRANA_OUT = RANA_SELECTX;
  assign PYRANA_OUT = RANA_SELECTY;
  
endmodule
