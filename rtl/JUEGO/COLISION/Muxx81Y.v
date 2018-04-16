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
module Muxx81Y (
//////////// OUTPUT //////////
	Muxx81_Z_Bit_Out,
//////////// INPUTS //////////
	Muxx81_Select_Bus_In,
	Muxx81_In7,
	Muxx81_In6,
	Muxx81_In5,
	Muxx81_In4,
	Muxx81_In3,
	Muxx81_In2,
	Muxx81_In1
);
//=======================================================
//  PARAMETER declarations
//=======================================================
 parameter DATAWIDTH_SELECTOR=3;
 parameter DATAWIDTH_DATA=8;
//=======================================================
//  PORT declarations
//=======================================================
	output	reg Muxx81_Z_Bit_Out;
	input		wire [DATAWIDTH_SELECTOR-1:0] Muxx81_Select_Bus_In;
	input		wire  Muxx81_In7;
	input		wire  Muxx81_In6;
	input		wire  Muxx81_In5;
	input		wire  Muxx81_In4;
	input		wire  Muxx81_In3;
	input		wire  Muxx81_In2;
	input		wire  Muxx81_In1;
//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
always @(Muxx81_Select_Bus_In or Muxx81_In1 or Muxx81_In2 or Muxx81_In3 or Muxx81_In4 or Muxx81_In5 or Muxx81_In6 or Muxx81_In7 )
begin
   case( Muxx81_Select_Bus_In )
       0 : Muxx81_Z_Bit_Out = 1'b0;
       1 : Muxx81_Z_Bit_Out = Muxx81_In1;
       2 : Muxx81_Z_Bit_Out = Muxx81_In2;
       3 : Muxx81_Z_Bit_Out = Muxx81_In3;
		 4 : Muxx81_Z_Bit_Out = Muxx81_In4;
		 5 : Muxx81_Z_Bit_Out = Muxx81_In5;
		 6 : Muxx81_Z_Bit_Out = Muxx81_In6;
		 7 : Muxx81_Z_Bit_Out = Muxx81_In7;
       default : Muxx81_Z_Bit_Out = 1'b0;       
   endcase		
end
endmodule
