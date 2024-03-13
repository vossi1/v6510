# V6510 - Replacement for a 6510 with a 6502  

**Copyright (c) 2024 Vossi - v.2**

**www.mos6502.net**

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

**[Schematic](https://github.com/vossi1/v6510/blob/master/v6510_v2.png)**

**[Parts](https://github.com/vossi1/v6510/blob/master/parts.txt)**

:x: **BEWARE: I got good CPLD's from China, but there are XC9572XL FAKES out there!**

V6510 in my 250407 test-board:
![V6510 photo](https://github.com/vossi1/v6510/blob/master/v6510_v2_photo.jpg)

**You have to connect 2-3 for buffered phi2 !**

**For a WDC 65C02 you have to cut the small trace in the other solder jumper.**

Bottom view with Xilinx CPLD:
![V6519 bottom-photo](https://github.com/vossi1/v6510/blob/master/v6510_v2_photo2.jpg)

**Tested successfully in a 250407 board with:**

Cartridges:
REU1764 (Demo, Sonic), Magic Voice, IEEE-Interface, Sound Sampler, 
Formel 64, Final Cartridge 3, Dead Test, Diagnostic Test, 
Wizard of War / Gorf / ABeeCee with speech, 
Donkey Kong, Choplifter, Le Mans, Wizard of War Ultimax, Mini Basic, 
Magic Desk, Archon-Cart

Devices:
1541, 1581, Mouse 1351, Paddles, Joysticks, SwinSid Nano, Merlin PP64 (Promenade)

Software:
Geos 1.2, Geos 2.5, Super Mario, Last Ninja, Giana Sisters

**Not working**

ROOS 80 Zeichenkarte = Zero 80 (Runs sometimes with a mos6502 CPU)

**Tested boards**

PAL: 250707 Rev. B, 250469 Rev. 4, KU-14194HB

**Tested CPU's**

mos 6502, mos 6502AD, mos 6502B, UM6502A, SY6502, R6502P

CMOS not working with REU, Magic Voice, ???: GTEµ G65SC02P-2, CMD G65SC02PI-2

My test-CPU's:
![test-cpus](https://github.com/vossi1/v6510/blob/master/test-cpus.jpg)
