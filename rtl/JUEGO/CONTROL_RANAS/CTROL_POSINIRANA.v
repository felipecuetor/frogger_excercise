//=======================================================
//  MODULE Definition
//=======================================================
module CTROL_POSINIRANA(
//////////// OUTPUTS //////////
	CIR_RANA_INI_OUT,
//////////// INPUTS //////////
	CIR_POSY_IN,
	CIR_PERDIO_IN,
	CIR_GANO_IN,
	CIR_ESTADO_IN,
	CIR_CLOCK_50,
	CIR_RESET
);
//=======================================================
//  PARAMETER declarations
//=======================================================
	parameter DATAWIDTH_ESTADO=3;
	parameter DATAWIDTH_POS=3;
// states declaration
	parameter Inicio = 2'b00;
	parameter Espera = 2'b01;
	parameter RanaIni = 2'b10;
//=======================================================
//  PORT declarations
//=======================================================	
	output reg CIR_RANA_INI_OUT;
	input [DATAWIDTH_POS-1:0]CIR_POSY_IN;
	input CIR_PERDIO_IN;
	input CIR_GANO_IN;
	input [DATAWIDTH_ESTADO-1:0] CIR_ESTADO_IN;
	input CIR_CLOCK_50;
	input CIR_RESET;
		
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [1:0] St_Register;
reg [1:0] St_Signal;
//=======================================================
//  Structural coding
//=======================================================
//-------INPUT LOGIC: COMBINATIONAL-----------------------------
// NEXT STATE LOGIC : COMBINATIONAL
	always @(*)
	case (St_Register)
		Inicio: 	if(CIR_ESTADO_IN == 3'b111)
						St_Signal = Espera;
					else 	St_Signal = Inicio; //MANTIENE EL ESTADO.
		Espera: if (CIR_POSY_IN == 3'b111) 
						St_Signal = RanaIni;
				  else if (CIR_PERDIO_IN == 1'b1|CIR_GANO_IN == 1'b1)
						St_Signal = Inicio;
				  else St_Signal = Espera; //MANTIENE EL ESTADO.		
		RanaIni: St_Signal = Espera;
	default : St_Signal =  Inicio;
	endcase

//-------STATE REGISTER : SEQUENTIAL----------------------------
	always @ ( posedge CIR_CLOCK_50 , posedge CIR_RESET)
		if (CIR_RESET==1)
			St_Register <= Inicio;
		else
			St_Register <= St_Signal;
			
//=======================================================
//  Outputs
//=======================================================
//-----------OUTPUT LOGIC : COMBINATIONAL -------------------------
	always @ (*)
		case (St_Register)
			Inicio :  
			begin  
			CIR_RANA_INI_OUT=1'b1;
			end 
			Espera:  
			begin 	
			CIR_RANA_INI_OUT=1'b0;
			end 
			RanaIni:  
			begin 
			CIR_RANA_INI_OUT=1'b1;
			end 
		endcase   
endmodule