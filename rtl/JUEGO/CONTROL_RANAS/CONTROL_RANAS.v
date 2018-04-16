//=======================================================
//  MODULE Definition
//=======================================================
module CONTROL_RANAS(
//////////// OUTPUTS //////////
	CR_GANO_JC_OUT,
	CR_RANA_INI_OUT,
	//CR_NVE_REG7,
//////////// INPUTS //////////
	//CR_GANO,
	CR_POSX,
	CR_POSY,
	CR_PERDIO,
	CR_ESTADO,
	CR_CLOCK_50,
	CR_RESET
);
//=======================================================
//  PARAMETER declarations
//=======================================================
	parameter DATAWIDTH_ESTADO=3;
	parameter DATAWIDTH_POS=3;
// states declaration
	parameter Inicio = 3'b000;
	parameter Ini1Rana = 3'b001;
	parameter UnaRana = 3'b010;
	parameter Ini2Rana = 3'b011;
	parameter DosRana = 3'b100;
	parameter Ini3Rana = 3'b101;
	parameter TresRana = 3'b110;
	parameter Gano= 3'b111;
//=======================================================
//  PORT declarations
//=======================================================
	output reg CR_GANO_JC_OUT;	
	output reg CR_RANA_INI_OUT;
	input [DATAWIDTH_POS-1:0]CR_POSX;
	input [DATAWIDTH_POS -1:0]CR_POSY;
	input CR_PERDIO;
	input [DATAWIDTH_ESTADO-1:0] CR_ESTADO;
	input CR_CLOCK_50;
	input CR_RESET;
		
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
	case (St_Register)
	
		Inicio: 	if(CR_ESTADO == 3'b111)
						St_Signal = Ini1Rana;
					else 	St_Signal = Inicio; //MANTIENE EL ESTADO.
		Ini1Rana: St_Signal = UnaRana;
		UnaRana: if (CR_POSY == 3'b111& (CR_POSX == 3'b001|CR_POSX == 3'b110|CR_POSX == 3'b100)) 
						St_Signal = Ini2Rana;
					else if (CR_PERDIO == 1'b1)
						St_Signal = Inicio;
					else St_Signal = UnaRana; //MANTIENE EL ESTADO.
		Ini2Rana: St_Signal = DosRana;
		DosRana: if (CR_POSY == 3'b111 & (CR_POSX == 3'b001|CR_POSX == 3'b110|CR_POSX == 3'b100)) 
						St_Signal = Ini3Rana;
					else if (CR_PERDIO == 1'b1)
						St_Signal = Inicio;
					else St_Signal = DosRana; //MANTIENE EL ESTADO.
		Ini3Rana: St_Signal = TresRana;
		TresRana: if (CR_POSY == 3'b111 & (CR_POSX == 3'b001|CR_POSX == 3'b110|CR_POSX == 3'b100)) 
						St_Signal = Gano;
					else if (CR_PERDIO == 1'b1)
						St_Signal = Inicio;
					else St_Signal = TresRana; //MANTIENE EL ESTADO.			
		Gano: St_Signal = Inicio;		
	default : St_Signal =  Inicio;
	endcase

//-------STATE REGISTER : SEQUENTIAL----------------------------
	always @ ( posedge CR_CLOCK_50 , posedge CR_RESET)
		if (CR_RESET==1)
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
			CR_GANO_JC_OUT=1'b0;
			CR_RANA_INI_OUT=1'b1;
			end 
			Ini1Rana:  
			begin 
			CR_GANO_JC_OUT=1'b0;	
			CR_RANA_INI_OUT=1'b1;
			end 
			UnaRana:  
			begin 
			CR_GANO_JC_OUT=1'b0;
			CR_RANA_INI_OUT=1'b0;
			end 
			Ini2Rana:  
			begin 
			CR_GANO_JC_OUT=1'b0;
			CR_RANA_INI_OUT=1'b1;
			end 
			DosRana:
			begin 
			CR_GANO_JC_OUT=1'b0;	
			CR_RANA_INI_OUT=1'b0;
			end 
			Ini3Rana:  
			begin 
			CR_GANO_JC_OUT=1'b0;	
			CR_RANA_INI_OUT=1'b1;
			end 
			TresRana:
			begin 
			CR_GANO_JC_OUT=1'b0;	
			CR_RANA_INI_OUT=1'b0;
			end
			Gano:  
			begin 
			CR_GANO_JC_OUT=1'b1;	
			CR_RANA_INI_OUT=1'b0;
			end 
			default: 
			begin 
			CR_GANO_JC_OUT=1'b0;	
			CR_RANA_INI_OUT=1'b1;
			end
		endcase   
endmodule