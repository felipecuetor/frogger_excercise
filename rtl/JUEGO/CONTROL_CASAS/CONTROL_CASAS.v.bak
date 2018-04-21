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
	parameter Inicio = 4'b0000;
	parameter Juego = 4'b0001;
	parameter C1Casa1 = 4'b0010;
	parameter C1Casa2p = 4'b0011;
	parameter C1Casa3p = 4'b0100;
	parameter C2Casa2 = 4'b0101;
	parameter C2Casa1p = 4'b0110;
	parameter C2Casa3p = 4'b0111;
	parameter C3Casa3 = 4'b1000;
	parameter C3Casa2p = 4'b1001;
	parameter C3Casa1p = 4'b1010;
	parameter TCasas = 4'b1011;
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
reg [3:0] St_Register;
reg [3:0] St_Signal;
//=======================================================
//  Structural coding
//=======================================================
//-------INPUT LOGIC: COMBINATIONAL-----------------------------
// NEXT STATE LOGIC : COMBINATIONAL
	always @(*)
	case (St_Register)
		Inicio: if(CC_ESTADO_IN == 3'b111)
						St_Signal = Juego;
					else St_Signal = Inicio;
		Juego: 	if(CC_ESTADO_IN == 3'b111 & CC_POSY_IN == 3'b111 & CC_POSX_IN == 3'b001)
						St_Signal = C1Casa1;
					else if(CC_ESTADO_IN == 3'b111 & CC_POSY_IN == 3'b111 & CC_POSX_IN == 3'b110) 	
						St_Signal = C2Casa2;
					else if(CC_ESTADO_IN == 3'b111 & CC_POSY_IN == 3'b111 & CC_POSX_IN == 3'b100)
						St_Signal = C3Casa3;
					else St_Signal = Juego; //MANTIENE EL ESTADO.
		C1Casa1: if(CC_ESTADO_IN == 3'b111 & CC_POSY_IN == 3'b111 & CC_POSX_IN == 3'b110)
						St_Signal = C1Casa2p;
					else if(CC_ESTADO_IN == 3'b111 & CC_POSY_IN == 3'b111 & CC_POSX_IN == 3'b100) 	
						St_Signal = C1Casa3p;
					else if(CC_PERDIO_IN == 1'b1)
						St_Signal = Juego;
					else St_Signal = C1Casa1; //MANTIENE EL ESTADO.
		C1Casa2p:if(CC_ESTADO_IN == 3'b111 & CC_POSY_IN == 3'b111 & CC_POSX_IN == 3'b100)
						St_Signal = TCasas;
					else if(CC_PERDIO_IN == 1'b1)
						St_Signal = Juego;
					else St_Signal = C1Casa2p; //MANTIENE EL ESTADO. 
		C1Casa3p:if(CC_ESTADO_IN == 3'b111 & CC_POSY_IN == 3'b111 & CC_POSX_IN == 3'b110)
						St_Signal = TCasas;
					else if(CC_PERDIO_IN == 1'b1)
						St_Signal = Juego;
					else St_Signal = C1Casa3p; //MANTIENE EL ESTADO.
		C2Casa2: if(CC_ESTADO_IN == 3'b111 & CC_POSY_IN == 3'b111 & CC_POSX_IN == 3'b001)
						St_Signal = C2Casa1p;
					else if(CC_ESTADO_IN == 3'b111 & CC_POSY_IN == 3'b111 & CC_POSX_IN == 3'b100) 	
						St_Signal = C2Casa3p;
					else if(CC_PERDIO_IN == 1'b1)
						St_Signal = Juego;
					else St_Signal = C2Casa2; //MANTIENE EL ESTADO.
		C2Casa1p:if(CC_ESTADO_IN == 3'b111 & CC_POSY_IN == 3'b111 & CC_POSX_IN == 3'b100)
						St_Signal = TCasas;
					else if(CC_PERDIO_IN == 1'b1)
						St_Signal = Juego;
					else St_Signal = C2Casa1p; //MANTIENE EL ESTADO. 
		C2Casa3p:if(CC_ESTADO_IN == 3'b111 & CC_POSY_IN == 3'b111 & CC_POSX_IN == 3'b001)
						St_Signal = TCasas;
					else if(CC_PERDIO_IN == 1'b1)
						St_Signal = Juego;
					else St_Signal = C2Casa3p; //MANTIENE EL ESTADO.

		C3Casa3: if(CC_ESTADO_IN == 3'b111 & CC_POSY_IN == 3'b111 & CC_POSX_IN == 3'b001)
						St_Signal = C3Casa1p;
					else if(CC_ESTADO_IN == 3'b111 & CC_POSY_IN == 3'b111 & CC_POSX_IN == 3'b110) 	
						St_Signal = C3Casa2p;
					else if(CC_PERDIO_IN == 1'b1)
						St_Signal = Juego;
					else St_Signal = C3Casa3; //MANTIENE EL ESTADO.
		C3Casa1p:if(CC_ESTADO_IN == 3'b111 & CC_POSY_IN == 3'b111 & CC_POSX_IN == 3'b110)
						St_Signal = TCasas;
					else if(CC_PERDIO_IN == 1'b1)
						St_Signal = Juego;
					else St_Signal = C3Casa1p; //MANTIENE EL ESTADO. 
		C3Casa2p:if(CC_ESTADO_IN == 3'b111 & CC_POSY_IN == 3'b111 & CC_POSX_IN == 3'b001)
						St_Signal = TCasas;
					else if(CC_PERDIO_IN == 1'b1)
						St_Signal = Juego;
					else St_Signal = C3Casa2p; //MANTIENE EL ESTADO.					
		TCasas: St_Signal = Inicio;		
	default : St_Signal =  Inicio;
	endcase

//-------STATE REGISTER : SEQUENTIAL----------------------------
	always @ ( posedge CC_CLOCK_50 , posedge CC_RESET)
		if (CC_RESET==1)
			St_Register <= Inicio;
		else
			St_Register <= St_Signal;
			
//=======================================================
//  Outputs
//=======================================================
//-----------OUTPUT LOGIC : COMBINATIONAL -------------------------
	always @ (*)
		case (St_Register)
			Inicio:  
			begin  
			CC_NVE_REG7_OUT=8'b00000000;
			end 
			Juego :  
			begin  
			CC_NVE_REG7_OUT=8'b10110101;
			end 
			C1Casa1:  
			begin 
			CC_NVE_REG7_OUT=8'b11110101;	
			end 
			C1Casa2p:  
			begin 
			CC_NVE_REG7_OUT=8'b11111101;
			end 
			C1Casa3p:  
			begin 
			CC_NVE_REG7_OUT=8'b11110111;
			end 
			C2Casa2:
			begin 
			CC_NVE_REG7_OUT=8'b10111101;
			end 
			C2Casa1p:  
			begin 
			CC_NVE_REG7_OUT=8'b11111101;
			end 
			C2Casa3p:
			begin 
			CC_NVE_REG7_OUT=8'b10111111;
			end
			C3Casa3:
			begin 
			CC_NVE_REG7_OUT=8'b10110111;
			end 
			C3Casa2p:  
			begin 
			CC_NVE_REG7_OUT=8'b10111111;
			end 
			C3Casa1p:
			begin 
			CC_NVE_REG7_OUT=8'b11110111;
			end 
			TCasas:
			begin 
			CC_NVE_REG7_OUT=8'b11111111;
			end 
			default: 
			begin 
			CC_NVE_REG7_OUT=8'b00000000;
			end
		endcase		
endmodule