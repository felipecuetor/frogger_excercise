//##########################################################################
//######					TTDE-SD HDL EXAMPLES											####
//######	Fredy Enrique Segura-Quijano fsegura@uniandes.edu.co				####   
//######																						####   
//######				MODIFICADO: Agosto de 2016 - FES								####
//######				MODIFICADO: Febrero 16 de 2018 -ZVP							####   
//##########################################################################
//# TTDE-SD
//# Copyright (C) 2014 Bogotá, Colombia
//# 
//# This program is free software: you can redistribute it and/or modify
//# it under the terms of the GNU General Public License as published by
//# the Free Software Foundation, version 3 of the License.
//#
//# This program is distributed in the hope that it will be useful,
//# but WITHOUT ANY WARRANTY; without even the implied warranty of
//# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//# GNU General Public License for more details.
//#
//# You should have received a copy of the GNU General Public License
//# along with this program.  If not, see <http://www.gnu.org/licenses/>.
//#/
//###########################################################################

//=======================================================
//  MODULE Definition
//=======================================================
module Counter_B (
	C_CLOCK_50,
	C_Reset,
	C_DataCounter_Out,
	C_Counter_Out,
	C_Enable,
);

//=======================================================
//  PARAMETER declarations
//=======================================================
// states declaration
	//////////// TEMPORAL STATES TO TEST //////////
// SOLO CONTADOR	
	parameter St_Count0 = 2'b00;
	parameter St_Count1 = 2'b01;
	parameter St_Count2 = 2'b10;
	parameter St_Count3 = 2'b11;
	
//=======================================================
//  PORT declarations
//=======================================================
	input			C_CLOCK_50;
	input			C_Reset;
	input			C_Enable;
	
	output 	[1:0] C_DataCounter_Out;
	output reg		C_Counter_Out;

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
		St_Count0: if (C_Enable == 1'b1)
							St_Signal = St_Count1;
					  else St_Signal = St_Count0; //MANTIENE EL ESTADO
		St_Count1: if (C_Enable == 1'b1)
							St_Signal = St_Count2;
					  else St_Signal = St_Count1; //MANTIENE EL ESTADO
		St_Count2: if (C_Enable == 1'b1) 
							St_Signal = St_Count3;
					  else St_Signal = St_Count2; //MANTIENE EL ESTADO
		St_Count3: if (C_Enable == 1'b1) 
							St_Signal = St_Count0;
					  else St_Signal = St_Count3; //MANTIENE EL ESTADO
	default : St_Signal =  St_Count0;
	endcase

//-------STATE REGISTER : SEQUENTIAL----------------------------
	always @ ( posedge C_CLOCK_50 , posedge C_Reset)
		if (C_Reset==1)
			St_Register <= St_Count0;
		else
			St_Register <= St_Signal;

//=======================================================
//  Outputs
//=======================================================
//-----------OUTPUT LOGIC : COMBINATIONAL -------------------------
	always @ (*)
		case (St_Register)
			St_Count0 :  C_Counter_Out = 1'b0;   //
			St_Count1 :  C_Counter_Out = 1'b0;   //
			St_Count2 :  C_Counter_Out = 1'b0;   //
			St_Count3 :  C_Counter_Out = 1'b1;   //
			default:  C_Counter_Out = 1'b0; 
		endcase


assign C_DataCounter_Out[1] = St_Register[1];
assign C_DataCounter_Out[0] = St_Register[0];


endmodule