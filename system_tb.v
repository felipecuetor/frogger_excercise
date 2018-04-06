//---------------------------------------------------------------------------
// SharkBoad/CondorBoard ExampleModule
// Fredy Segura Q. - fsegura@uniandes.edu.co
// Josnelihurt Rodriguez Barajas - j.rodriguez52@uniandes.edu.co
// Test Design for the Xilinx Spartan 3-100E Device
//---------------------------------------------------------------------------

/*#
# SharkBoad
# Copyright (C) 2012 Bogotá, Colombia
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, version 3 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#*/

`timescale 1 ns / 100 ps

module system_tb;

//----------------------------------------------------------------------------
// Parameter (may differ for physical synthesis)
//----------------------------------------------------------------------------

//----------------------------------------------------------------------------
// Parameter (may differ for physical synthesis)
//----------------------------------------------------------------------------
parameter tck              = 20;       // clock period in ns
parameter clk_freq = 1000000000 / tck; // Frequenzy in HZ

//----------------------------------------------------------------------------
// Variables
//----------------------------------------------------------------------------
reg        clk_tb;
reg        rst_tb;
reg        up_tb;
reg        down_tb;
reg        right_tb;
reg        left_tb;
//----------------------------------------------------------------------------
// Device Under Test 
//----------------------------------------------------------------------------
system
#(.clk_freq( clk_freq )) dut
(
	.Clk_System(clk_tb), .lowRst_System(rst_tb),.left_n(left_tb), .right_n(right_tb), .up_n(up_tb), .down_n(down_tb),
	.max7219_din(),.max7219_ncs(),.max7219_clk()
);

/* Clocking device */
// Remember this is only for simulation. It never will be syntetizable //
initial         clk_tb <= 0;
always #(tck/2) clk_tb <= ~clk_tb;

/* Simulation setup */
initial begin
	//set the file for loggin simulation data
	$dumpfile("system_tb.vcd"); 
	//$monitor("%b,%b,%b",clk_tb,rst_tb,led_tb);
	//export all signals in the simulation viewer
	$dumpvars(-1, dut);
	//$dumpvars(-1,clk_tb,rst_tb);
	#0 rst_tb <= 0;
	#50 rst_tb <= 1;up_tb <= 1;down_tb <= 1;right_tb <= 1;left_tb <= 1;
	#50 left_tb <= 0;
	#50 right_tb <= 0;
	#50 left_tb <= 1;
	#10 left_tb <= 0;
	#10 left_tb <= 1;
	#50 right_tb <= 1;
	#50 left_tb <= 0;
	#50 right_tb <= 0;
	#50000 left_tb <= 1;
	#(tck*50000) $finish;
end
endmodule
