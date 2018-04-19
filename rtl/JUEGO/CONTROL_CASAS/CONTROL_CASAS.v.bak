//=======================================================
//  MODULE Definition
//=======================================================
module CONTROL_CASAS(
//////////// OUTPUTS //////////
	CC_NVE_REG7_OUT,
//////////// INPUTS //////////
	CC_POSX_IN,
	CC_POSY_IN,
	CC_PERDIO_IN,
	CC_ESTADO_IN,
	CC_CLOCK_50,
	CC_RESET
);
//=======================================================
//  PARAMETER declarations
//=======================================================
	parameter DATAWIDTH_ESTADO=3;
	parameter DATAWIDTH_POS=3;
	parameter DATAWIDTH_BUS=8;
// states declaration
	parameter Inicio = 3'b000;
//=======================================================
//  PORT declarations
//=======================================================
	output reg [DATAWIDTH_BUS-1:0] CC_NVE_REG7_OUT;	
	input [DATAWIDTH_POS-1:0]CC_POSX_IN;
	input [DATAWIDTH_POS -1:0]CC_POSY_IN;
	input CC_PERDIO_IN;
	input [DATAWIDTH_ESTADO-1:0] CC_ESTADO_IN;
	input CC_CLOCK_50;
	input CC_RESET;
		
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [2:0] St_Register;
reg [2:0] St_Signal;
//=======================================================
//  Structural coding
//=======================================================
//-------INPUT LOGIC: COMBINATIONAL-----------------------------
// NEXT STATE LOGIC : COMBINATIONAL
	always @(*)
		if(CC_ESTADO_IN == 3'b111 & CC_POSY_IN == 3'b111 & CC_POSX_IN == 3'b001)
			St_Signal[0]=1'b1;
		else if(CC_ESTADO_IN == 3'b111 & CC_POSY_IN == 3'b111 & CC_POSX_IN == 3'b100) 	
			St_Signal[1]=1'b1;
		else if(CC_ESTADO_IN == 3'b111 & CC_POSY_IN == 3'b111 & CC_POSX_IN == 3'b110)
			St_Signal[2]=1'b1;
		else
			St_Signal = St_Register;
		
		//-------STATE REGISTER : SEQUENTIAL----------------------------
	always @ ( posedge CC_CLOCK_50 , posedge CC_RESET)
		if (CC_RESET==1)
			St_Register <= Inicio;
		else if (CC_PERDIO_IN==1)
			St_Register <= Inicio;
		else
			St_Register <= St_Signal;
			
//=======================================================
//  Outputs
//=======================================================
//-----------OUTPUT LOGIC : COMBINATIONAL -------------------------
	always @ (*) 
		begin
			CC_NVE_REG7_OUT[7]=1'b1;
			CC_NVE_REG7_OUT[6]=St_Register[0];
			CC_NVE_REG7_OUT[5]=1'b1;
			CC_NVE_REG7_OUT[4]=1'b1;
			CC_NVE_REG7_OUT[3]=St_Register[1];
			CC_NVE_REG7_OUT[2]=1'b1;
			CC_NVE_REG7_OUT[1]=St_Register[2];
			CC_NVE_REG7_OUT[0]=1'b1;
		end 
endmodule