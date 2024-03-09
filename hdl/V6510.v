/*
   V6510 - Adapter to use 6502 in 6510-based system (C64)
   Original Design: Copyright (c) 2024 Vossi
	www.mos6502.net
	
   Permission is hereby granted, free of charge, to any person obtaining a copy
   of this software and associated documentation files (the "Software"), to deal
   in the Software without restriction, including without limitation the rights
   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
   copies of the Software, and to permit persons to whom the Software is
   furnished to do so, subject to the following conditions:

   The above copyright notice and this permission notice shall be included in all
   copies or substantial portions of the Software.

   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
   SOFTWARE.

   V6510.v: Implements 6bit I/O Port and Address Enable Control
	
	v.2 version:
	- switched to tqfp100 cpld
	- AB, DB and R/W are hiz if AEC is low
	- rd_0x0x with phi2_th for safe reading, because cpld-gates are much faster than real 6510
*/

module V6510(	input [15:0]address_6502,
				output [15:0]address_6510,
				inout [7:0]data_6502,
				inout [7:0]data_6510,
				inout [5:0]ioport,
				input r_w_6502,
				output r_w_6510,
				input phi1,
				input phi2,
				output phi2_cpld,		// for buffered phi2 option
				input aec,
//				input rdy,				// not used
				input _reset
            	);

reg [7:0]data_out;				// databus to port
reg [7:0]data_6502_out;			// databus to CPU
reg [5:0]port_in_latched;		// port input latches
wire [5:0]port_out;
wire [7:0]port_data;
reg [7:0]port_ddr_reg;			// register $0000
reg [7:0]port_data_reg;			// register $0001
wire io_select;
reg io_select_latched;
reg write1;						// latched W/_R
wire oe_data_in, oe_io_data, oe_d;
wire rd_0x00, rd_0x01, wr_0x00, wr_0x01;
wire phi2_th;
wire delay1, delay2, delay3, delay4, delay5, delay6;	// TH delay wires

assign address_6510 = 	(aec ? address_6502 : 16'bz);	// address only with AEC = high
assign r_w_6510 = 		(aec ? r_w_6502 : 1'bz);		// R/_W only with AEC = high
assign data_6502 = 		data_6502_out;					// data read output to 6502
assign data_6510 = 		data_out;						// data write output to board
assign ioport = 		port_out;						// output to io-port
assign phi2_cpld = 		phi2;							// bufferd phi2 (option)

always @(negedge phi1)			// latch signals at phi1 falling edge
begin
	write1 <= !r_w_6502;				// latched W/_R
	io_select_latched <= io_select;		// latch io_select
	port_in_latched <= ioport;			// sample port inputs
end

// phi2 delay for databus hold time ( about 30ns - each inverter needs 5ns )
(*S = "TRUE"*) inverter inv1(phi2, delay1);		//(prefix *S prevents removing in optimization)
(*S = "TRUE"*) inverter inv2(delay1, delay2);
(*S = "TRUE"*) inverter inv3(delay2, delay3);
(*S = "TRUE"*) inverter inv4(delay3, delay4);
(*S = "TRUE"*) inverter inv5(delay4, delay5);
(*S = "TRUE"*) inverter inv6(delay5, delay6);
assign phi2_th = phi2 | delay6;		// phi high 30ns extended (typical TH time mos 6510 datasheet)

assign oe_data_in = !io_select_latched & phi2_th; 					// data in enable
assign oe_io_data = io_select_latched & phi2_th; 					// io in enable
assign oe_d 		= write1 & !io_select_latched &aec & phi2_th;	// data out enable
assign io_select 	= address_6502[15:1] == 0;						// port $0000 or $0001 selected
assign rd_0x00 	= !write1 & io_select & phi2_th & !address_6502[0];	// read ddr register 0x00
assign rd_0x01 	= !write1 & io_select & phi2_th & address_6502[0];	// read data register 0x01
assign wr_0x00 	= write1 & io_select & !address_6502[0];			// write ddr register 0x00
assign wr_0x01 	= write1 & io_select & address_6502[0];				// write data register 0x01

always @(negedge phi2, negedge _reset)
begin
	if(!_reset) begin 					// reset all register
		port_ddr_reg <= 0;
		port_data_reg <= 0;
		end
	else if(wr_0x00)					// write ddr register
		port_ddr_reg <= data_6502;
	else if(wr_0x01)					// write data register
		port_data_reg <= data_6502;
end

assign port_data[0] = (port_ddr_reg[0] ? port_data_reg[0] : port_in_latched[0]);	// port read
assign port_data[1] = (port_ddr_reg[1] ? port_data_reg[1] : port_in_latched[1]);
assign port_data[2] = (port_ddr_reg[2] ? port_data_reg[2] : port_in_latched[2]);
assign port_data[3] = (port_ddr_reg[3] ? port_data_reg[3] : port_in_latched[3]);
assign port_data[4] = (port_ddr_reg[4] ? port_data_reg[4] : port_in_latched[4]);
assign port_data[5] = (port_ddr_reg[5] ? port_data_reg[5] : port_in_latched[5]);
assign port_data[6] = (port_ddr_reg[6] ? port_data_reg[6] : 0);		// no io pin
assign port_data[7] = (port_ddr_reg[7] ? port_data_reg[7] : 0);		// no io pin

assign port_out[0] = (port_ddr_reg[0] ? port_data_reg[0] : 1'bz);			// port outputs
assign port_out[1] = (port_ddr_reg[1] ? port_data_reg[1] : 1'bz);
assign port_out[2] = (port_ddr_reg[2] ? port_data_reg[2] : 1'bz);
assign port_out[3] = (port_ddr_reg[3] ? port_data_reg[3] : 1'bz);
assign port_out[4] = (port_ddr_reg[4] ? port_data_reg[4] : 1'bz);
assign port_out[5] = (port_ddr_reg[5] ? port_data_reg[5] : 1'bz);

always @(*)		// databus read/write
begin
	if(oe_d) begin	
		data_6502_out = 8'bz;			// outputs to CPU hiz
		data_out = data_6502;					// data out to board (only if not IO-register write)
		end
	else begin
		data_out = 8'bz;				// outputs to board hiz
		if(rd_0x00 & oe_io_data)				// read io-port ddr reg
			data_6502_out = port_ddr_reg;
		else if(rd_0x01 & oe_io_data)			// read io-port data reg
			data_6502_out = port_data;
		else if(oe_data_in)						// read data
			data_6502_out = data_6510;
		else 
		data_6502_out = 8'bz;			// outputs to CPU hiz
		end
	end
endmodule