//=======================================================
//  MODULE Definition
//=======================================================
module MUXX21(
//////////// OUTPUTS //////////
	MUXX21_BIT_OUT,
//////////// INPUTS //////////
	MUXX21_SELECT_IN,
	MUXX21_IN0,
	MUXX21_IN1
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
	output	reg MUXX21_BIT_OUT;
	input		wire MUXX21_SELECT_IN;
	input		wire  MUXX21_IN0;
	input		wire  MUXX21_IN1;
	
//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
always @(*)
begin
//=======================================================		
   if( MUXX21_SELECT_IN == 1'b0)
      MUXX21_BIT_OUT = MUXX21_IN0;
   else 
      MUXX21_BIT_OUT = MUXX21_IN1;
//=======================================================				
end
endmodule

