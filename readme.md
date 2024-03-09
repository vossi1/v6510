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

![V6510 photo](https://github.com/vossi1/v6510/blob/master/v6510_v2_photo.jpg)

**You have to connect 1-2 or 2-3 on the bottom side for phi2 direct or phi2 boost in the cpld (more power, but only 3V high level) - at the moment I don't know what's better ;) For a WDC 65C02 you have to cut the small trace in the other solder jumper.**

![V6519 bottom-photo](https://github.com/vossi1/v6510/blob/master/v6510_v2_photo2.jpg)

**Tested successfully in a 250407 board with:**

Cartridges:
REU1764 (Demo, Sonic), Magic Voice, IEEE-Interface, Sound Sampler, 
Formel 64, Final Cartridge 3, Dead Test, Diagnostic Test, 
Wizard of War / Gorf / ABeeCee with speech, 
Donkey Kong, Choplifter, Le Mans, Wizard of War Ultimax, Mini Basic, 
Magic Desk

Devices:
1541, 1581, Mouse 1351, Paddles, Joysticks, SwinSid Nano, Merlin PP64 (Promenade)

Software:
Geos 1.2, Geos 2.5, Super Mario, Last Ninja, Gianna Sisters

:x: **BEWARE: There are some XC9572XL FAKES out there**
