//=======================================================
//  MODULE Definition
//=======================================================
module MENU_PRINCIPAL(
//////////// OUTPUTS //////////
	MP_ESTADO_OUT,
	MP_NVL_OUT,
	MP_CN_OUT,
//////////// INPUTS //////////
	MP_GANO,
	MP_PERDIO,
	MP_DOWN,
	MP_UP,
	MP_START,
	MP_CLOCK_50,
	MP_RESET
);
//=======================================================
//  PARAMETER declarations
//=======================================================
	parameter DATAWIDTH_ESTADO=3;
	parameter DATAWIDTH_NIVEL=2;
// states declaration
	parameter Inicio = 4'b0000;
	parameter GanarJuego = 4'b0001;
	parameter PerderJuego = 4'b0010;
	parameter Seleccion1 = 4'b0011;
	parameter Nivel1 = 4'b0100;
	parameter Seleccion2 = 4'b0101;
	parameter Nivel2 = 4'b0110;
	parameter Seleccion3= 4'b0111;
	parameter Nivel3 = 4'b1000;
	parameter Seleccion4 = 4'b1001;
	parameter Nivel4 = 4'b1010;
	parameter Juego = 4'b1011;
	parameter Finalizar = 4'b1100;
//=======================================================
//  PORT declarations
//=======================================================
	output reg [DATAWIDTH_ESTADO-1:0]MP_ESTADO_OUT;
	output reg [DATAWIDTH_NIVEL-1:0] MP_NVL_OUT;
	output reg MP_CN_OUT;
	input MP_GANO;
	input MP_PERDIO;
	input MP_DOWN;
	input MP_UP;
	input MP_START;
	input MP_CLOCK_50;
	input MP_RESET;
		
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
	
		Inicio: 	if(MP_START == 1'b1)
							St_Signal = Seleccion1 ;
					else 	St_Signal = Inicio; //MANTIENE EL ESTADO.
		GanarJuego: if (MP_START == 1'b1)
								St_Signal = Finalizar;
						else St_Signal = GanarJuego; //MANTIENE EL ESTADO.
		PerderJuego: if (MP_START == 1'b1) 
							St_Signal = Finalizar;
						else St_Signal = PerderJuego; //MANTIENE EL ESTADO.
		Seleccion1: if (MP_START == 1'b1)
								St_Signal = Nivel1;
						else if (MP_DOWN == 1'b1)
								St_Signal = Seleccion2;
						else if(MP_UP == 1'b1)
								St_Signal = Seleccion4;
						else	St_Signal = Seleccion1; //MANTIENE EL ESTADO
		Nivel1:    St_Signal = Juego;
		Seleccion2: if (MP_START == 1'b1)
								St_Signal = Nivel2;
						else if (MP_DOWN == 1'b1)
								St_Signal = Seleccion3;
						else if(MP_UP == 1'b1)
								St_Signal = Seleccion1;
						else	St_Signal = Seleccion2; //MANTIENE EL ESTADO
		Nivel2:    St_Signal = Juego;
		Seleccion3: if (MP_START == 1'b1)
								St_Signal = Nivel3;
						else if (MP_DOWN == 1'b1)
								St_Signal = Seleccion4;
						else if(MP_UP == 1'b1)
								St_Signal = Seleccion2;
						else	St_Signal = Seleccion3; //MANTIENE EL ESTADO
		Nivel3:    St_Signal = Juego;	
		Seleccion4: if (MP_START == 1'b1)
								St_Signal = Nivel4;
						else if (MP_DOWN == 1'b1)
								St_Signal = Seleccion1;
						else if(MP_UP == 1'b1)
								St_Signal = Seleccion3;
						else	St_Signal = Seleccion4; //MANTIENE EL ESTADO
		Nivel4:  	St_Signal = Juego;	
		Juego: if (MP_GANO == 1'b1 ) 
							St_Signal = GanarJuego;	
					else if (MP_PERDIO == 1'b1) 
							St_Signal = PerderJuego;		
					else St_Signal = Juego; //MANTIENE EL ESTADO.
		Finalizar: St_Signal = Inicio;	
	default : St_Signal =  Inicio;
	endcase

//-------STATE REGISTER : SEQUENTIAL----------------------------
	always @ ( posedge MP_CLOCK_50 , posedge MP_RESET)
		if (MP_RESET==1)
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
			MP_ESTADO_OUT=3'b000;
			MP_NVL_OUT=2'b00;
			MP_CN_OUT=1'b0;
			end 
			GanarJuego:  
			begin 
			MP_ESTADO_OUT=3'b101;
			MP_NVL_OUT=2'b00;
			MP_CN_OUT=1'b0;
			end 
			PerderJuego:  
			begin 
			MP_ESTADO_OUT=3'b110;
			MP_NVL_OUT=2'b00;
			MP_CN_OUT=1'b0;
			end 
			Seleccion1:  
			begin 
			MP_ESTADO_OUT=3'b001;
			MP_NVL_OUT=2'b00;
			MP_CN_OUT=1'b0;
			end 
			Nivel1:
			begin 
			MP_ESTADO_OUT=3'b001;
			MP_NVL_OUT=2'b00;
			MP_CN_OUT=1'b1;
			end 
			Seleccion2:  
			begin 
			MP_ESTADO_OUT=3'b010;
			MP_NVL_OUT=2'b00;
			MP_CN_OUT=1'b0;
			end 
			Nivel2:
			begin 
			MP_ESTADO_OUT=3'b010;
			MP_NVL_OUT=2'b01;
			MP_CN_OUT=1'b1;
			end
			Seleccion3:  
			begin 
			MP_ESTADO_OUT=3'b011;
			MP_NVL_OUT=2'b00;
			MP_CN_OUT=1'b0;
			end 
			Nivel3:
			begin 
			MP_ESTADO_OUT=3'b011;
			MP_NVL_OUT=2'b10;
			MP_CN_OUT=1'b1;
			end
			Seleccion4:  
			begin 
			MP_ESTADO_OUT=3'b100;
			MP_NVL_OUT=2'b00;
			MP_CN_OUT=1'b0;
			end 
			Nivel4:
			begin 
			MP_ESTADO_OUT=3'b100;
			MP_NVL_OUT=2'b11;
			MP_CN_OUT=1'b1;
			end
			Juego:  
			begin 
			MP_ESTADO_OUT=3'b111;
			MP_NVL_OUT=2'b00;
			MP_CN_OUT=1'b0;
			end 
			Finalizar:
			begin 
			MP_ESTADO_OUT=3'b000;
			MP_NVL_OUT=2'b00;
			MP_CN_OUT=1'b1;
			end
			default: 
			begin 
			MP_ESTADO_OUT=3'b000;
			MP_NVL_OUT=2'b00;
			MP_CN_OUT=1'b0;
			end
		endcase

endmodule