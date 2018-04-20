//=======================================================
//  MODULE Definition
//=======================================================
module SC_STATEMACHINE_FROG_MOV (
//////////// OUTPUTS //////////
	SC_STATEMACHINE_FROG_MOV,
//////////// INPUTS //////////
	SC_STATEMACHINE_FROG_MOV_AVANZAR,
	SC_STATEMACHINE_FROG_MOV_RETROCEDER,
	SC_STATEMACHINE_FROG_MOV_INI,
	SC_STATEMACHINE_FROG_MOV_CLOCK_50,
	SC_STATEMACHINE_FROG_MOV_RESET
);
//=======================================================
//  PARAMETER declarations
//=======================================================
// states declaration
	parameter Posicion0 = 3'b000;
	parameter Posicion1 = 3'b001;
	parameter Posicion2 = 3'b010;
	parameter Posicion3 = 3'b011;
	parameter Posicion4 = 3'b100;
	parameter Posicion5 = 3'b101;
	parameter Posicion6 = 3'b110;
	parameter Posicion7 = 3'b111;
	
	parameter DATAWIDTH_POS=3;
	
//=======================================================
//  PORT declarations
//=======================================================
	output reg [DATAWIDTH_POS-1:0] SC_STATEMACHINE_FROG_MOV;
	input SC_STATEMACHINE_FROG_MOV_AVANZAR;
	input SC_STATEMACHINE_FROG_MOV_RETROCEDER;
	input SC_STATEMACHINE_FROG_MOV_INI;
	input SC_STATEMACHINE_FROG_MOV_CLOCK_50;
	input	SC_STATEMACHINE_FROG_MOV_RESET;
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
		Posicion0: if(SC_STATEMACHINE_FROG_MOV_AVANZAR == 1'b1)
						  St_Signal =  Posicion1;
					  else St_Signal = Posicion0; //MANTIENE EL ESTADO.
		Posicion1: if (SC_STATEMACHINE_FROG_MOV_INI == 1'b1)
						  St_Signal =  Posicion0;
					  else if(SC_STATEMACHINE_FROG_MOV_AVANZAR == 1'b1)
						  St_Signal =  Posicion2;
					  else if(SC_STATEMACHINE_FROG_MOV_RETROCEDER == 1'b1)
						  St_Signal =  Posicion0;
					  else St_Signal = Posicion1; //MANTIENE EL ESTADO.
		Posicion2: if (SC_STATEMACHINE_FROG_MOV_INI == 1'b1)
						  St_Signal =  Posicion0;
					  else if(SC_STATEMACHINE_FROG_MOV_AVANZAR == 1'b1)
						  St_Signal =  Posicion3;
					  else if(SC_STATEMACHINE_FROG_MOV_RETROCEDER == 1'b1)
						  St_Signal =  Posicion1;
					  else St_Signal = Posicion2; //MANTIENE EL ESTADO. 
		Posicion3: if (SC_STATEMACHINE_FROG_MOV_INI == 1'b1)
						  St_Signal =  Posicion0;
					  else if(SC_STATEMACHINE_FROG_MOV_AVANZAR == 1'b1)
						  St_Signal =  Posicion4;
					  else if(SC_STATEMACHINE_FROG_MOV_RETROCEDER == 1'b1)
						  St_Signal =  Posicion2;
					  else St_Signal = Posicion3; //MANTIENE EL ESTADO.
		Posicion4: if (SC_STATEMACHINE_FROG_MOV_INI == 1'b1)
						  St_Signal =  Posicion0;
					  else if(SC_STATEMACHINE_FROG_MOV_AVANZAR == 1'b1)
						  St_Signal =  Posicion5;
					  else if(SC_STATEMACHINE_FROG_MOV_RETROCEDER == 1'b1)
						  St_Signal =  Posicion3;
					  else St_Signal = Posicion4; //MANTIENE EL ESTADO.;
		Posicion5: if (SC_STATEMACHINE_FROG_MOV_INI == 1'b1)
						  St_Signal =  Posicion0;
					  else if(SC_STATEMACHINE_FROG_MOV_AVANZAR == 1'b1)
						  St_Signal =  Posicion6;
					  else if(SC_STATEMACHINE_FROG_MOV_RETROCEDER == 1'b1)
						  St_Signal =  Posicion4;
					  else St_Signal = Posicion5; //MANTIENE EL ESTADO.
		Posicion6: if (SC_STATEMACHINE_FROG_MOV_INI == 1'b1)
						  St_Signal =  Posicion0;
					  else if(SC_STATEMACHINE_FROG_MOV_AVANZAR == 1'b1)
						  St_Signal =  Posicion7;
					  else if(SC_STATEMACHINE_FROG_MOV_RETROCEDER == 1'b1)
						  St_Signal =  Posicion5;
					  else St_Signal = Posicion6; //MANTIENE EL ESTADO.
		Posicion7: if (SC_STATEMACHINE_FROG_MOV_INI == 1'b1)
						  St_Signal =  Posicion0;
					  else if(SC_STATEMACHINE_FROG_MOV_RETROCEDER == 1'b1)
						  St_Signal =  Posicion6;
					  else St_Signal = Posicion7; //MANTIENE EL ESTADO.		  
	default : St_Signal =  Posicion0;
	endcase

//-------STATE REGISTER : SEQUENTIAL----------------------------
	always @ ( posedge SC_STATEMACHINE_FROG_MOV_CLOCK_50 , posedge SC_STATEMACHINE_FROG_MOV_RESET)
		if (SC_STATEMACHINE_FROG_MOV_RESET==1)
			St_Register <= Posicion0;
		else
			St_Register <= St_Signal;

//=======================================================
//  Outputs
//=======================================================
//-----------OUTPUT LOGIC : COMBINATIONAL -------------------------
	always @ (*)
	SC_STATEMACHINE_FROG_MOV=St_Register;


endmodule