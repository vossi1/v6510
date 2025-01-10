# V6510 - Replacement for a 6510 with a 6502  

**Copyright (c) 2024 Vossi - v.3**

**www.mos6502.net**

## License
This work is licensed under a Creative Commons Attribution-ShareAlike 4.0
International License. See [https://creativecommons.org/licenses/by-sa/4.0/](https://creativecommons.org/licenses/by-sa/4.0/).

:thumbsup: v.3 now without PHI2 selection, because the v6510 only works with buffered PHI2! :wink:

**[Schematic](https://github.com/vossi1/v6510/blob/master/v6510_v3.png)**

**[Parts](https://github.com/vossi1/v6510/blob/master/parts.txt)**

**CPLD-Firmware:** The .JED file can be uploaded with a JTAG-SMT2 Xilinx programmer (China) and [xc3sprog](https://xc3sprog.sourceforge.net/)

:exclamation: **BEWARE: I got good CPLD's from China, but there are some XC9572XL FAKES out there!**

I just got these 10ns cplds and they don't work - but I don't think 7ns is really necessary: 
![V6510 bottom-photo](https://github.com/vossi1/v6510/blob/master/xc9572xl_notgood.jpg)

V6510 in my 250407 test-board:
![V6510 photo](https://github.com/vossi1/v6510/blob/master/v6510_v2_photo.jpg)

**For a WDC 65C02 you have to cut the small trace in the other solder jumper.**

Bottom view with Xilinx CPLD:
![V6519 bottom-photo](https://github.com/vossi1/v6510/blob/master/v6510_v2_photo2.jpg)

:white_check_mark: **Tested successfully in a 250407 board with:**

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

:x: **Not working**

ROOS 80 Zeichenkarte = Zero 80 (Runs sometimes with a mos6502 CPU)

**Tested boards**

PAL: 250407 Rev. B, 250469 Rev. 4, KU-14194HB

**Tested CPU's**

mos 6502, mos 6502AD, mos 6502B, UM6502A, SY6502, R6502P

CMOS not working with REU, Magic Voice, ???: GTEµ G65SC02P-2, CMD G65SC02PI-2

My test-CPU's:
![test-cpus](https://github.com/vossi1/v6510/blob/master/test-cpus.jpg)
