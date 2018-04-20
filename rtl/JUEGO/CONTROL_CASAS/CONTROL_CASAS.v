/*
//=======================================================
//  MODULE Definition
//=======================================================
module CONTROL_CASAS(
//////////// OUTPUTS //////////
	CC_REG7_OUT,
//////////// INPUTS //////////
	CC_POSX_IN,
	CC_POSY_IN,
	CC_ESTADO_IN,
	CC_PERDIO_IN,
	CC_GANO_IN,
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
	parameter Inicial	= 2'b00;
	parameter Juego = 2'b01;
	parameter Casa3ON	= 2'b10;
	parameter Espera= 2'b11;
//=======================================================
//  PORT declarations
//=======================================================
  output reg[DATAWIDTH_BUS-1:0] CC_REG7_OUT;
  input [DATAWIDTH_POS-1:0] CC_POSX_IN;
  input [DATAWIDTH_POS-1:0] CC_POSY_IN;
  input [DATAWIDTH_ESTADO-1:0] CC_ESTADO_IN;
  input CC_PERDIO_IN;
  input CC_GANO_IN;
  input CC_CLOCK_50;
  input CC_RESET;
//=======================================================
//  REG/WIRE declarations
//=======================================================
   reg[1:0] St_Register;
   reg[1:0] St_Signal;
//=======================================================
//  Structural coding
//=======================================================
//-------INPUT LOGIC: COMBINATIONAL-----------------------------
// NEXT STATE LOGIC : COMBINATIONAL
	always @(*)
	case (St_Register)
		Inicial: if(CC_ESTADO_IN == 3'b111)
						St_Signal = Juego;
					else 	St_Signal = Inicial; //MANTIENE EL ESTADO.	
		Juego:	if(CC_POSX_IN == 3'b110& CC_POSY_IN == 3'b111)
						St_Signal = Espera;
					else 	St_Signal = Juego; //MANTIENE EL ESTADO.
		Espera: 	 	St_Signal = Casa3ON;		
		Casa3ON:  if(CC_PERDIO_IN == 1'b1|CC_GANO_IN == 1'b1)
						St_Signal = Inicial;
					else 	St_Signal = Casa3ON; //MANTIENE EL ESTADO.
	default : St_Signal =  Inicial;
	endcase		
//-------STATE REGISTER : SEQUENTIAL----------------------------
	always @ ( posedge CC_CLOCK_50 , posedge CC_RESET)
		if (CC_RESET==1)
			St_Register <= Inicial;
		else
			St_Register <= St_Signal;
//=======================================================
//  Outputs
//=======================================================
//-----------OUTPUT LOGIC : COMBINATIONAL -------------------------
	always @ (*)
		case (St_Register)
			Inicial :  
			begin  
			CC_REG7_OUT=8'b00000000;
			end 
			Juego:  
			begin 
			CC_REG7_OUT=8'b10110101;	
			end 
			Casa3ON:
			begin
			CC_REG7_OUT=8'b10110111;	
			end
			default: 
			begin 
			CC_REG7_OUT=8'b00000000;	
			end
		endcase  			
		
endmodule

*/
//=======================================================
//  MODULE Definition
//=======================================================
module CONTROL_CASAS(
//////////// OUTPUTS //////////
	CC_REG7_OUT,
//////////// INPUTS //////////
	CC_POSX_IN,
	CC_POSY_IN,
	CC_ESTADO_IN,
	CC_PERDIO_IN,
	CC_GANO_IN,
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
	parameter Inicial = 3'b000;
	parameter Espera1 = 3'b001;
 	parameter Espera2 = 3'b010;
	parameter Espera3 = 3'b011;
	parameter Casa1ON = 3'b100;
	parameter Casa2ON = 3'b101;
	parameter Casa3ON = 3'b110;	
//=======================================================
//  PORT declarations
//=======================================================
  output reg[DATAWIDTH_BUS-1:0] CC_REG7_OUT;
  input [DATAWIDTH_POS-1:0] CC_POSX_IN;
  input [DATAWIDTH_POS-1:0] CC_POSY_IN;
  input [DATAWIDTH_ESTADO-1:0] CC_ESTADO_IN;
  input CC_PERDIO_IN;
  input CC_GANO_IN;
  input CC_CLOCK_50;
  input CC_RESET;
//=======================================================
//  REG/WIRE declarations
//=======================================================
   reg[2:0] St_Register;
   reg[2:0] St_Signal;
//=======================================================
//  Structural coding
//=======================================================
//-------INPUT LOGIC: COMBINATIONAL-----------------------------
// NEXT STATE LOGIC : COMBINATIONAL
	always @(*)
	case (St_Register)
		Inicial: if(CC_ESTADO_IN == 3'b111)
						St_Signal = Espera1;
			else 	St_Signal = Inicial; //MANTIENE EL ESTADO.
		Espera1: St_Signal = Casa1ON;	
		Casa1ON: if(CC_ESTADO_IN == 3'b111 & (CC_POSX_IN == 3'b001& CC_POSY_IN == 3'b111) )
				    		St_Signal = Espera2;
			 else if(CC_PERDIO_IN == 1'b1|CC_GANO_IN == 1'b1)
						St_Signal = Inicial;
			 else 	St_Signal = Casa1ON; //MANTIENE EL ESTADO.
		Espera2: St_Signal = Casa2ON;
		Casa2ON: if(CC_ESTADO_IN == 3'b111 & (CC_POSX_IN == 3'b100& CC_POSY_IN == 3'b111) )
				    		St_Signal = Espera3;
			 else if(CC_PERDIO_IN == 1'b1|CC_GANO_IN == 1'b1)
						St_Signal = Inicial;
			 else 	St_Signal = Casa2ON; //MANTIENE EL ESTADO. 
		Espera3: St_Signal = Casa3ON;
		Casa3ON: if(CC_ESTADO_IN == 3'b111 & (CC_POSX_IN == 3'b110& CC_POSY_IN == 3'b111) )
				    		St_Signal = Inicial;
			 else if(CC_PERDIO_IN == 1'b1|CC_GANO_IN == 1'b1)
						St_Signal = Inicial;
			 else 	St_Signal = Casa3ON; //MANTIENE EL ESTADO.			
	default : St_Signal =  Inicial;
	endcase		
//-------STATE REGISTER : SEQUENTIAL----------------------------
	always @ ( posedge CC_CLOCK_50 , posedge CC_RESET)
		if (CC_RESET==1)
			St_Register <= Inicial;
		else
			St_Register <= St_Signal;
//=======================================================
//  Outputs
//=======================================================
//-----------OUTPUT LOGIC : COMBINATIONAL -------------------------
	always @ (*)
		case (St_Register)
			Inicial :  
			begin  
			CC_REG7_OUT=8'b00000000;
			end 
			Espera1:  
			begin 
			CC_REG7_OUT=8'b00000000;	
			end 
			Casa1ON:
			begin
			CC_REG7_OUT=8'b10111111;	
			end
			Espera2:
			begin 
			CC_REG7_OUT=8'b00000000;	
			end 
			Casa2ON:
			begin
			CC_REG7_OUT=8'b11110111;	
			end
			Espera3:
			begin 
			CC_REG7_OUT=8'b00000000;	
			end 
			Casa3ON:
			begin
			CC_REG7_OUT=8'b11111101;	
			end
			default: 
			begin 
			CC_REG7_OUT=8'b00000000;	
			end
		endcase  			
		
endmodule

