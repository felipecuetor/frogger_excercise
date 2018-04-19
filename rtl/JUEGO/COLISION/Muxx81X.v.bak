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
module Muxx81X (
//////////// OUTPUT //////////
	Muxx81_Z_Bit_Out,
//////////// INPUTS //////////
	Muxx81_Select_Bus_In,
	Muxx81_Data_Bus_In
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
	input		wire [DATAWIDTH_DATA-1:0] Muxx81_Data_Bus_In;
//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
always @(Muxx81_Data_Bus_In or Muxx81_Select_Bus_In)
begin
   case( Muxx81_Select_Bus_In )
       0 : Muxx81_Z_Bit_Out = Muxx81_Data_Bus_In[0];
       1 : Muxx81_Z_Bit_Out = Muxx81_Data_Bus_In[1];
       2 : Muxx81_Z_Bit_Out = Muxx81_Data_Bus_In[2];
       3 : Muxx81_Z_Bit_Out = Muxx81_Data_Bus_In[3];
		 4 : Muxx81_Z_Bit_Out = Muxx81_Data_Bus_In[4];
		 5 : Muxx81_Z_Bit_Out = Muxx81_Data_Bus_In[5];
		 6 : Muxx81_Z_Bit_Out = Muxx81_Data_Bus_In[6];
		 7 : Muxx81_Z_Bit_Out = Muxx81_Data_Bus_In[7];
       default : Muxx81_Z_Bit_Out = 1'b0;       
   endcase		
end
endmodule
