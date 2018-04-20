//=======================================================
//  MODULE Definition
//=======================================================
module COLISION(
//////////// OUTPUTS //////////
	CO_PERDIO_OUT,
//////////// INPUTS //////////
	CO_POSX_IN,
	CO_POSY_IN,
	CO_VEH7_IN,
	CO_VEH6_IN,
	CO_VEH5_IN,
	CO_VEH4_IN,
	CO_VEH3_IN,
	CO_VEH2_IN,
	CO_VEH1_IN
);

//=======================================================
//  PARAMETER declarations
//=======================================================
	parameter DATAWIDTH_BUS = 8;
	parameter DATAWIDTH_POS=3;
	
//=======================================================
//  PORT declarations
//=======================================================
	output CO_PERDIO_OUT;
	input	[DATAWIDTH_POS-1:0]   CO_POSX_IN;
	input	[DATAWIDTH_POS-1:0]   CO_POSY_IN;
	input [DATAWIDTH_BUS-1:0]   CO_VEH7_IN;
	input [DATAWIDTH_BUS-1:0]   CO_VEH6_IN;
	input [DATAWIDTH_BUS-1:0]   CO_VEH5_IN;
	input [DATAWIDTH_BUS-1:0]   CO_VEH4_IN;
	input [DATAWIDTH_BUS-1:0]   CO_VEH3_IN;
	input [DATAWIDTH_BUS-1:0]   CO_VEH2_IN;
	input [DATAWIDTH_BUS-1:0]   CO_VEH1_IN;
	
//=======================================================
//  REG/WIRE declarations
//=======================================================
 //wire CO_SEL0;
 wire CO_SEL1;
 wire CO_SEL2;
 wire CO_SEL3;
 wire CO_SEL4;
 wire CO_SEL5;
 wire CO_SEL6;
 wire CO_SEL7;
//=======================================================
//  Structural coding
//=======================================================
Muxx81X Muxx81X_u0 (
	.Muxx81_Z_Bit_Out(CO_SEL1),
	.Muxx81_Select_Bus_In(CO_POSX_IN),
	.Muxx81_Data_Bus_In(CO_VEH1_IN)
);

Muxx81X Muxx81X_u1 (
	.Muxx81_Z_Bit_Out(CO_SEL2),
	.Muxx81_Select_Bus_In(CO_POSX_IN),
	.Muxx81_Data_Bus_In(CO_VEH2_IN)
);

Muxx81X Muxx81X_u2 (
	.Muxx81_Z_Bit_Out(CO_SEL3),
	.Muxx81_Select_Bus_In(CO_POSX_IN),
	.Muxx81_Data_Bus_In(CO_VEH3_IN)
);

Muxx81X Muxx81X_u3 (
	.Muxx81_Z_Bit_Out(CO_SEL4),
	.Muxx81_Select_Bus_In(CO_POSX_IN),
	.Muxx81_Data_Bus_In(CO_VEH4_IN)
);

Muxx81X Muxx81X_u4 (
	.Muxx81_Z_Bit_Out(CO_SEL5),
	.Muxx81_Select_Bus_In(CO_POSX_IN),
	.Muxx81_Data_Bus_In(CO_VEH5_IN)
);

Muxx81X Muxx81X_u5 (
	.Muxx81_Z_Bit_Out(CO_SEL6),
	.Muxx81_Select_Bus_In(CO_POSX_IN),
	.Muxx81_Data_Bus_In(CO_VEH6_IN)
);

Muxx81X Muxx81X_u6 (
	.Muxx81_Z_Bit_Out(CO_SEL7),
	.Muxx81_Select_Bus_In(CO_POSX_IN),
	.Muxx81_Data_Bus_In(CO_VEH7_IN)
);

Muxx81Y Muxx81Y_u0 (
	.Muxx81_Z_Bit_Out(CO_PERDIO_OUT),
	.Muxx81_Select_Bus_In(CO_POSY_IN),
	.Muxx81_In7(CO_SEL7),
	.Muxx81_In6(CO_SEL6),
	.Muxx81_In5(CO_SEL5),
	.Muxx81_In4(CO_SEL4),
	.Muxx81_In3(CO_SEL3),
	.Muxx81_In2(CO_SEL2),
	.Muxx81_In1(CO_SEL1)
);
		
endmodule