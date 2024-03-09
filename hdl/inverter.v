`timescale 1ns / 1ps
// Inverter module
// Copyright (c) 2024 Vossi, www.mos6502.net, part of V6510

`ifndef _inverter
`define _inverter
module inverter(in, out);

input in;
output out;

	not n1 (out, in);

endmodule

`endif
