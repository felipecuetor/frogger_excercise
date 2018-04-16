// D_v.v
//https://eewiki.net/pages/viewpage.action?pageId=13599139

//////////////////////// Button Der ///////////////////////////////////////
//***********************************************************************
// FileName: D_v.v
// FPGA: MachXO2 7000HE
// IDE: Diamond 2.0.1 
//
// HDL IS PROVIDED "AS IS." DIGI-KEY EXPRESSLY DISCLAIMS ANY
// WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
// PARTICULAR PURPOSE, OR NON-INFRINGEMENT. IN NO EVENT SHALL DIGI-KEY
// BE LIABLE FOR ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL
// DAMAGES, LOST PROFITS OR LOST DATA, HARM TO YOUR EQUIPMENT, COST OF
// PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS
// BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF),
// ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER SIMILAR COSTS.
// DIGI-KEY ALSO DISCLAIMS ANY LIABILITY FOR PATENT OR COPYRIGHT
// INFRINGEMENT.
//
// Version History
// Version 1.0 04/11/2013 Tony Storey
// Initial Public Release
// Small Footprint Button Dr
///////////////////////////////////////////////////////////////////////////
module  DeBounce
	(
		D_CLOCK_50, 
		D_Reset,
		D_Button_In,
		D_Button_Out
		
	);
//=======================================================
//  PORT declarations
//=======================================================

//---------------Input-----------------------------------	
	input 		D_CLOCK_50;
	input			D_Reset; 
	input			D_Button_In;			
//---------------Output-----------------------------------
	output reg 	D_Button_Out;		

//=======================================================
//  PARAMETER declarations
//=======================================================

//// ---------------- internal constants --------------
	parameter N = 11 ;		// (2^ (21-1) )/ 38 MHz =  ms D time
	
//=======================================================
//  REG/WIRE declarations
//=======================================================
	reg  [N-1 : 0]	q_reg;							// timing regs
	reg  [N-1 : 0]	q_next;
	reg DFF1, DFF2;									// input flip-flops
	wire q_add;											// control flags
	wire q_reset;
//// ------------------------------------------------------
//=======================================================
//  Assignaments
//=======================================================
////contenious assignment for counter control
	assign 	q_reset = (DFF1  ^ DFF2);		// xor input flip flops to look for level chage to reset counter
	assign  	q_add = ~(q_reg[N-1]);			// add to counter when q_reg msb is equal to 0
	
//=======================================================
//  Structural coding
//=======================================================

//// -----------------COMBINATIONAL----------------------------
//// combo counter to manage q_next	
	always @ ( q_reset, q_add, q_reg)
		begin
			case( {q_reset , q_add})
			
				2'b00 : q_next <= q_reg;						
				2'b01 : q_next <= q_reg + 1;
				default : q_next <= { N {1'b0} };
						
			endcase 	
		end
//// -----------------SEQUENTIAL----------------------------	
//// Flip flop inputs and q_reg update
	always @ ( posedge D_CLOCK_50 )
		begin
			if(D_Reset ==  1'b1)
				begin
					DFF1 <= 1'b0;
					DFF2 <= 1'b0;
					q_reg <= { N {1'b0} };
				end
			else
				begin
					DFF1 <= D_Button_In;
					DFF2 <= DFF1;
					q_reg <= q_next;
				end
		end
	
//// counter control
	always @ ( posedge D_CLOCK_50 )
		begin
			if(q_reg[N-1] == 1'b1)
					D_Button_Out <= DFF2;
			else
					D_Button_Out <= D_Button_Out;
		end

	endmodule