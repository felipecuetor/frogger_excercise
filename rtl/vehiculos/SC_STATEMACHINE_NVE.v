//=======================================================
//  MODULE Definition
//=======================================================
module SC_STATEMACHINE_NVE#(parameter DATAWIDTH_BUS=8,	parameter NV_1_REGD, 	parameter NV_2_REGD, 	parameter NV_3_REGD, 	parameter NV_4_REGD, parameter NV_1_REGI, 	parameter NV_2_REGI, 	parameter NV_3_REGI, 	parameter NV_4_REGI )(
//////////// OUTPUTS //////////
	SC_STATEMACHINE_NVE_LOAD_SHIFT_OUT,
	SC_STATEMACHINE_NVE_VEL_SELECT,
	SC_STATEMACHINE_NVE_HAB_VEL0_OUT,
	SC_STATEMACHINE_NVE_HAB_VEL1_OUT,
	SC_STATEMACHINE_NVE_HAB_VEL2_OUT,
	SC_STATEMACHINE_NVE_REGDNIVEL_OUT,
	SC_STATEMACHINE_NVE_REGINIVEL_OUT,
//////////// INPUTS //////////
	SC_STATEMACHINE_NVE_NVL_IN,
	SC_STATEMACHINE_NVE_CN_IN,
	SC_STATEMACHINE_NVE_CLOCK_50,
	SC_STATEMACHINE_NVE_RESET
);
//=======================================================
//  PARAMETER declarations
//=======================================================
	parameter DATAWIDTH_NIVEL=2;
// states declaration
	parameter Inicio = 4'b0000;
	parameter Espera = 4'b0001;
	parameter Nivel1Carga = 4'b0010;
	parameter Nivel1Espera = 4'b0011;
	parameter Nivel2Carga = 4'b0100;
	parameter Nivel2Espera = 4'b0101;
	parameter Nivel3Carga = 4'b0110;
	parameter Nivel3Espera = 4'b0111;
	parameter Nivel4Carga = 4'b1000;
	parameter Nivel4Espera = 4'b1001;
			
//=======================================================
//  PORT declarations
//=======================================================
	output reg SC_STATEMACHINE_NVE_LOAD_SHIFT_OUT;
	output reg SC_STATEMACHINE_NVE_HAB_VEL0_OUT;
	output reg SC_STATEMACHINE_NVE_HAB_VEL1_OUT;
	output reg SC_STATEMACHINE_NVE_HAB_VEL2_OUT;
	output reg [DATAWIDTH_BUS-1:0] SC_STATEMACHINE_NVE_REGDNIVEL_OUT;
	output reg [DATAWIDTH_BUS-1:0] SC_STATEMACHINE_NVE_REGINIVEL_OUT;
	output reg [1:0] SC_STATEMACHINE_NVE_VEL_SELECT;
	input [DATAWIDTH_NIVEL-1:0] SC_STATEMACHINE_NVE_NVL_IN;
	input	SC_STATEMACHINE_NVE_CN_IN;
	input SC_STATEMACHINE_NVE_CLOCK_50;
	input	SC_STATEMACHINE_NVE_RESET;
	
	
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [3:0] St_Register;
reg [3:0] St_Signal;
//=======================================================
//  Structural coding
//=======================================================
//-------INPUT LOGIC: COMBINATIONAL----------------------
// NEXT STATE LOGIC : COMBINATIONAL
	always @(*)
	case (St_Register)
		Inicio:	if(SC_STATEMACHINE_NVE_CN_IN == 1'b0)
					St_Signal = Espera;
					else St_Signal = Inicio;
		Espera: 	if(SC_STATEMACHINE_NVE_NVL_IN == 2'b00&SC_STATEMACHINE_NVE_CN_IN == 1'b1)
							St_Signal = Nivel1Carga;
					else if(SC_STATEMACHINE_NVE_NVL_IN == 2'b01&SC_STATEMACHINE_NVE_CN_IN == 1'b1)
							St_Signal = Nivel2Carga;
					else if(SC_STATEMACHINE_NVE_NVL_IN == 2'b10&SC_STATEMACHINE_NVE_CN_IN == 1'b1)	
							St_Signal = Nivel3Carga;
					else if(SC_STATEMACHINE_NVE_NVL_IN == 2'b11&SC_STATEMACHINE_NVE_CN_IN == 1'b1)
							St_Signal = Nivel4Carga;
					else 	St_Signal = Espera; //MANTIENE EL ESTADO.
					
		Nivel1Carga: St_Signal = Nivel1Espera;
		
		Nivel1Espera: if (SC_STATEMACHINE_NVE_CN_IN == 1'b1) 
							St_Signal = Espera;
						else St_Signal = Nivel1Espera; //MANTIENE EL ESTADO.
						
		Nivel2Carga: St_Signal = Nivel2Espera;
	
		Nivel2Espera: if (SC_STATEMACHINE_NVE_CN_IN == 1'b1) 
							St_Signal = Espera;
						else St_Signal = Nivel2Espera; //MANTIENE EL ESTADO.

		Nivel3Carga: St_Signal = Nivel3Espera;

		Nivel3Espera: if (SC_STATEMACHINE_NVE_CN_IN == 1'b1) 
							St_Signal = Espera;
						else St_Signal = Nivel3Espera; //MANTIENE EL ESTADO.
						
		Nivel4Carga: St_Signal = Nivel4Espera;
		
		Nivel4Espera: if (SC_STATEMACHINE_NVE_CN_IN == 1'b1) 
							St_Signal = Espera;	
						else St_Signal = Nivel4Espera; //MANTIENE EL ESTADO.				
	default : St_Signal =  Inicio;
	endcase

//-------STATE REGISTER : SEQUENTIAL----------------------------
	always @ ( posedge SC_STATEMACHINE_NVE_CLOCK_50 , posedge SC_STATEMACHINE_NVE_RESET)
		if (SC_STATEMACHINE_NVE_RESET==1)
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
			SC_STATEMACHINE_NVE_LOAD_SHIFT_OUT = 1'b1; 
			SC_STATEMACHINE_NVE_REGDNIVEL_OUT=8'b00000000;
			SC_STATEMACHINE_NVE_REGINIVEL_OUT=8'b00000000;	
			SC_STATEMACHINE_NVE_VEL_SELECT =2'b00; 
			SC_STATEMACHINE_NVE_HAB_VEL0_OUT = 1'b0; 
			SC_STATEMACHINE_NVE_HAB_VEL1_OUT = 1'b0; 
			SC_STATEMACHINE_NVE_HAB_VEL2_OUT = 1'b0; 
			end 
			Espera:  
			begin  
			SC_STATEMACHINE_NVE_LOAD_SHIFT_OUT = 1'b1; 
			SC_STATEMACHINE_NVE_REGDNIVEL_OUT=8'b00000000;
			SC_STATEMACHINE_NVE_REGINIVEL_OUT=8'b00000000;	
			SC_STATEMACHINE_NVE_VEL_SELECT =2'b00; 
			SC_STATEMACHINE_NVE_HAB_VEL0_OUT = 1'b0; 
			SC_STATEMACHINE_NVE_HAB_VEL1_OUT = 1'b0; 
			SC_STATEMACHINE_NVE_HAB_VEL2_OUT = 1'b0; 
			end
			Nivel1Carga :  
			begin 
			SC_STATEMACHINE_NVE_LOAD_SHIFT_OUT = 1'b1; 
			SC_STATEMACHINE_NVE_REGDNIVEL_OUT= NV_1_REGD;
			SC_STATEMACHINE_NVE_REGINIVEL_OUT= NV_1_REGI;
			SC_STATEMACHINE_NVE_VEL_SELECT =2'b00; 
			SC_STATEMACHINE_NVE_HAB_VEL0_OUT = 1'b0;
			SC_STATEMACHINE_NVE_HAB_VEL1_OUT = 1'b0;
			SC_STATEMACHINE_NVE_HAB_VEL2_OUT = 1'b0; 
			end  
			Nivel1Espera : 
			begin
			SC_STATEMACHINE_NVE_LOAD_SHIFT_OUT = 1'b0;
			SC_STATEMACHINE_NVE_REGDNIVEL_OUT=8'b00000000; 
			SC_STATEMACHINE_NVE_REGINIVEL_OUT=8'b00000000;		
			SC_STATEMACHINE_NVE_VEL_SELECT =2'b01;
			SC_STATEMACHINE_NVE_HAB_VEL0_OUT = 1'b0;
			SC_STATEMACHINE_NVE_HAB_VEL1_OUT = 1'b0; 
			SC_STATEMACHINE_NVE_HAB_VEL2_OUT = 1'b1; 
			end  
			Nivel2Carga : 
			begin 
			SC_STATEMACHINE_NVE_LOAD_SHIFT_OUT = 1'b1;
			SC_STATEMACHINE_NVE_REGDNIVEL_OUT= NV_2_REGD;
			SC_STATEMACHINE_NVE_REGINIVEL_OUT= NV_2_REGI;
			SC_STATEMACHINE_NVE_VEL_SELECT =2'b00;
			SC_STATEMACHINE_NVE_HAB_VEL0_OUT = 1'b0;
			SC_STATEMACHINE_NVE_HAB_VEL1_OUT = 1'b0;
			SC_STATEMACHINE_NVE_HAB_VEL2_OUT = 1'b0; 
			end 
			Nivel2Espera:  
			begin 
			SC_STATEMACHINE_NVE_LOAD_SHIFT_OUT = 1'b0;
			SC_STATEMACHINE_NVE_REGDNIVEL_OUT=8'b00000000;
			SC_STATEMACHINE_NVE_REGINIVEL_OUT=8'b00000000;
			SC_STATEMACHINE_NVE_VEL_SELECT =2'b10;
			SC_STATEMACHINE_NVE_HAB_VEL0_OUT = 1'b0;
			SC_STATEMACHINE_NVE_HAB_VEL1_OUT = 1'b1; 
			SC_STATEMACHINE_NVE_HAB_VEL2_OUT = 1'b0; 
			end 
			Nivel3Carga : 
			begin 
			SC_STATEMACHINE_NVE_LOAD_SHIFT_OUT = 1'b1; 
			SC_STATEMACHINE_NVE_REGDNIVEL_OUT= NV_3_REGD;
			SC_STATEMACHINE_NVE_REGINIVEL_OUT= NV_3_REGI;
			SC_STATEMACHINE_NVE_VEL_SELECT =2'b00;
			SC_STATEMACHINE_NVE_HAB_VEL0_OUT = 1'b0; 
			SC_STATEMACHINE_NVE_HAB_VEL1_OUT = 1'b0; 
			SC_STATEMACHINE_NVE_HAB_VEL2_OUT = 1'b0; 
			end 
			Nivel3Espera: 
			begin 
			SC_STATEMACHINE_NVE_LOAD_SHIFT_OUT = 1'b0; 
			SC_STATEMACHINE_NVE_REGDNIVEL_OUT=8'b00000000;
			SC_STATEMACHINE_NVE_REGINIVEL_OUT=8'b00000000;
			SC_STATEMACHINE_NVE_VEL_SELECT =2'b11; 
			SC_STATEMACHINE_NVE_HAB_VEL0_OUT = 1'b1;
			SC_STATEMACHINE_NVE_HAB_VEL1_OUT = 1'b0;
			SC_STATEMACHINE_NVE_HAB_VEL2_OUT = 1'b0; 
			end 
			Nivel4Carga :  
			begin 
			SC_STATEMACHINE_NVE_LOAD_SHIFT_OUT = 1'b1;
			SC_STATEMACHINE_NVE_REGDNIVEL_OUT= NV_4_REGD;
			SC_STATEMACHINE_NVE_REGINIVEL_OUT= NV_4_REGI;
			SC_STATEMACHINE_NVE_VEL_SELECT = 2'b00;
			SC_STATEMACHINE_NVE_HAB_VEL0_OUT = 1'b0;
			SC_STATEMACHINE_NVE_HAB_VEL1_OUT = 1'b0; 
			SC_STATEMACHINE_NVE_HAB_VEL2_OUT = 1'b0;
			end 
			Nivel4Espera:  
			begin 
			SC_STATEMACHINE_NVE_LOAD_SHIFT_OUT = 1'b0; 
			SC_STATEMACHINE_NVE_REGDNIVEL_OUT=8'b00000000;
			SC_STATEMACHINE_NVE_REGINIVEL_OUT=8'b00000000;
			SC_STATEMACHINE_NVE_VEL_SELECT =2'b11; 
			SC_STATEMACHINE_NVE_HAB_VEL0_OUT = 1'b1;
			SC_STATEMACHINE_NVE_HAB_VEL1_OUT = 1'b0;
			SC_STATEMACHINE_NVE_HAB_VEL2_OUT = 1'b0;
			end 
			default: 
			begin  
			SC_STATEMACHINE_NVE_LOAD_SHIFT_OUT = 1'b1; 
			SC_STATEMACHINE_NVE_REGDNIVEL_OUT=8'b00000000;
		   SC_STATEMACHINE_NVE_REGINIVEL_OUT=8'b00000000;	
			SC_STATEMACHINE_NVE_VEL_SELECT =2'b00; 
			SC_STATEMACHINE_NVE_HAB_VEL0_OUT = 1'b0; 
			SC_STATEMACHINE_NVE_HAB_VEL1_OUT = 1'b0; 
			SC_STATEMACHINE_NVE_HAB_VEL2_OUT = 1'b0; 
			end 
		endcase

endmodule