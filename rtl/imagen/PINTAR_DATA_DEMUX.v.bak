//=======================================================
//  MODULE Definition
//=======================================================
module DEMUX38 (
//////////// OUTPUT //////////
	DEMUX38_Data_Out,
//////////// INPUTS //////////
	DEMUX38_Select_In,
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
	output [DATAWIDTH_DATA-1:0] DEMUX38_Data_Out;
	input  [DATAWIDTH_SELECTOR-1:0] DEMUX38_Select_In;
	
//=======================================================
//  REG/WIRE declarations
//=======================================================
//=======================================================
//  Structural coding
//=======================================================
 
 assign DEMUX38_Data_Out=(DEMUX38_Select_In == 3'b000)?8'b00000001:
			 (DEMUX38_Select_In == 3'b001)?8'b00000010:
	       (DEMUX38_Select_In == 3'b010)?8'b00000100:
	       (DEMUX38_Select_In == 3'b011)?8'b00001000:
	       (DEMUX38_Select_In == 3'b100)?8'b00010000:
	       (DEMUX38_Select_In == 3'b101)?8'b00100000:
	       (DEMUX38_Select_In == 3'b110)?8'b01000000:
			 (DEMUX38_Select_In == 3'b111)?8'b10000000:
			 8'h00;
			 
			 
endmodule

