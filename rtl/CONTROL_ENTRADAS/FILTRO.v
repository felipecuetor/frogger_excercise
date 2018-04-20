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
module FILTRO (
	F_CLOCK_50,
	F_RESET,
	F_OUT,
	F_IN
);

//=======================================================
//  PARAMETER declarations
//=======================================================
// states declaration
	//////////// TEMPORAL STATES TO TEST //////////
// SOLO CONTADOR	
	parameter St_Init   = 2'b00;
	parameter St_Wait	  = 2'b01;
	parameter St_Count1 = 2'b10;
	parameter St_Count2 = 2'b11;
	
//=======================================================
//  PORT declarations
//=======================================================
	input			F_CLOCK_50;
	input			F_RESET;
	input 		F_IN;
	output reg	F_OUT;

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
		St_Init: 	St_Signal = St_Wait;
		St_Wait: if (F_IN == 1'b1)
							St_Signal = St_Count1;
					  else St_Signal = St_Wait; //MANTIENE EL ESTADO
		St_Count1: 	St_Signal = St_Count2;
		St_Count2: if (F_IN == 1'b0) 
							St_Signal = St_Wait;
					  else St_Signal = St_Count2; //MANTIENE EL ESTADO
	default : St_Signal =  St_Init;
	endcase

//-------STATE REGISTER : SEQUENTIAL----------------------------
	always @ ( posedge F_CLOCK_50 , posedge F_RESET)
		if (F_RESET==1)
			St_Register <= St_Init;
		else
			St_Register <= St_Signal;

//=======================================================
//  Outputs
//=======================================================
//-----------OUTPUT LOGIC : COMBINATIONAL -------------------------
	always @ (*)
		case (St_Register)
			St_Init   :  F_OUT = 1'b0;   //
			St_Wait   :  F_OUT = 1'b0;   //
			St_Count1 :  F_OUT = 1'b1;   //
			St_Count2 :  F_OUT = 1'b0;   //
			default:  F_OUT = 1'b0; 
		endcase


endmodule