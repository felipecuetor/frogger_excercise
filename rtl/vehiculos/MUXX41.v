//##########################################################################
//######					G0B1T HDL EXAMPLES											####
//######	Fredy Enrique Segura-Quijano fsegura@uniandes.edu.co				####   
//######																						####   
//######				MODIFICADO: Agosto de 2017 - FES								####   
//##########################################################################
//# G0B1T
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
module MUXX41 #(parameter DATAWIDTH_SELECTOR=2)(
//////////// OUTPUTS //////////
	MUXX41_Z_BIT_OUT,
//////////// INPUTS //////////
	MUXX41_SELECT_BUS_IN,
	MUXX41_IN0,
	MUXX41_IN1,
	MUXX41_IN2,
	MUXX41_IN3
	
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
	output	reg MUXX41_Z_BIT_OUT;

	input		wire [DATAWIDTH_SELECTOR-1:0] MUXX41_SELECT_BUS_IN;
	input		wire  MUXX41_IN0;
	input		wire  MUXX41_IN1;
	input		wire  MUXX41_IN2;
	input		wire  MUXX41_IN3;
	
//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
always @(*)
begin
//=======================================================		
   if( MUXX41_SELECT_BUS_IN == 0)
      MUXX41_Z_BIT_OUT = MUXX41_IN0;
   else if( MUXX41_SELECT_BUS_IN == 1)
      MUXX41_Z_BIT_OUT = MUXX41_IN1;
   else if( MUXX41_SELECT_BUS_IN == 2)
      MUXX41_Z_BIT_OUT = MUXX41_IN2;
   else 
      MUXX41_Z_BIT_OUT = MUXX41_IN3;
//=======================================================				
end
endmodule

