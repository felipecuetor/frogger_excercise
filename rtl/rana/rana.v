   
//##########################################################################
//# TTDE-SD
//# Copyright (C) 2018 Bogotá, Colombia
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
	Rana_CLOCK_50,
	Rana_Reset,
	Rana_Up,
	Rana_Down,
	Rana_Left,
	Rana_Right,
	Rana_Led_Map_Bus_0,
	Rana_Led_Map_Bus_1,
	Rana_Led_Map_Bus_2,
	Rana_Led_Map_Bus_3,
	Rana_Led_Map_Bus_4,
	Rana_Led_Map_Bus_5,
	Rana_Led_Map_Bus_6,
	Rana_Led_Map_Bus_7
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
	input			Rana_CLOCK_50;
	input			Rana_Reset;
	input			Rana_Up;
	input			Rana_Down;
	input			Rana_Left;
	input			Rana_Right;
	
	output 	[7:0] Rana_Led_Map_Bus_0;
	output 	[7:0] Rana_Led_Map_Bus_1;
	output 	[7:0] Rana_Led_Map_Bus_2;
	output 	[7:0] Rana_Led_Map_Bus_3;
	output 	[7:0] Rana_Led_Map_Bus_4;
	output 	[7:0] Rana_Led_Map_Bus_5;
	output 	[7:0] Rana_Led_Map_Bus_6;
	output 	[7:0] Rana_Led_Map_Bus_7;

//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================

//=======================================================
//  Outputs
//=======================================================


endmodule