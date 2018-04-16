//=======================================================
//  MODULE Definition
//=======================================================
module CODE38Y (
//////////// OUTPUT //////////
	CODE38Y_Data_Out,
//////////// INPUTS //////////
	CODE38Y_Select_In,
);
//=======================================================
//  PARAMETER declarations
//=======================================================
parameter DATAWIDTH_SELECTOR=3;
parameter DATAWIDTH_DATA=8;
//[3] BIT_MACHINE
//=======================================================
//  PORT declarations
//=======================================================
	output [DATAWIDTH_DATA-1:0] CODE38Y_Data_Out;
	input  [DATAWIDTH_SELECTOR-1:0] CODE38Y_Select_In;
	
//=======================================================
//  REG/WIRE declarations
//=======================================================
//=======================================================
//  Structural coding
//=======================================================
 
 assign CODE38Y_Data_Out=(CODE38Y_Select_In == 3'b000)?8'b00000001:
			 (CODE38Y_Select_In == 3'b001)?8'b00000010:
	       (CODE38Y_Select_In == 3'b010)?8'b00000100:
	       (CODE38Y_Select_In == 3'b011)?8'b00001000:
	       (CODE38Y_Select_In == 3'b100)?8'b00010000:
	       (CODE38Y_Select_In == 3'b101)?8'b00100000:
	       (CODE38Y_Select_In == 3'b110)?8'b01000000:
			 (CODE38Y_Select_In == 3'b111)?8'b10000000:
			 8'h00;
			 
			 
endmodule

