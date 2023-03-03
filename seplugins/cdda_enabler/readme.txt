[CDDA Enabler v2]
by Total_Noob

[Donation]
All my works are voluntary and non-profit. But if you want to support me you can donate me a small amount of money. I'll take it with great pleasure:
https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=8158859

[Changelog v2]
- Added compatibility for all firmwares > 4.01. Now you can use this plugin and POPSLOADER at the same time.

[Introduction]
PSP is still one of the best devices to play PS1 games on a handheld. Thanks to the built-in POPS emulator, you can create your own EBOOT.PBP files
and play them with your PSP.
Every PSP firmware has a built-in POPS emulator and compatibility of PS1 games change with every version of POPS. Generally later versions have more
customization options and deliver a better experience overall.
PS1 games generally have 2 kinds of streaming audio, XA and CDDA. CDDA is uncompressed redbook audio while XA is 1/4 lossy compressed. So CDDA audio 
delivers a much better audio quality in the games it was used. Unfortunately any POPS version bundled above 4.01 PSP firmware has actively disabled
CDDA audio for homemade PS1 EBOOT.PBP files. You hear silence instead of CDDA audio if you boot these games. That is not valid for PSN released
PS1 games as Sony uses a property compression algorithm for CDDA audio on these games.
To overcome this limitation, you can use POPSLOADER plugin to load a POPS version equal or prior to 4.01. This will cost you 2 things. 1)Less customization
options of POPS 2) Bad compatility with PSP3000 and PSPgo series. Especially if you have a PSPgo, every POPS version supporting CDDA audio with 
POPSLOADER will either blackscreen or output audio only from headphones.
Now with CDDA Enabler, you can enable CDDA audio on PSP firmwares > 4.01 without enabling POPSLOADER or having compatibility problems with your homemade
EBOOTs. It just works.

[Instructions]
- Copy 'cdda_enabler.prx' to the 'seplugins' directory of your Memory Stick or Internal Storage of PSPgo.
- Add "ms0:/seplugins/cdda_enabler.prx 1" (or "ef0:/seplugins/cdda_enabler.prx 1" if you are using internal storage of PSPgo) line to the end of 'pops.txt' 
  in 'seplugins' folder.

Also here is a simple tutorial to create CDDA supporting PS1 EBOOT.PBP files:
- Rip your game via using .ccd .img .sub format, unfortunately that is the only format supported for cdda. .bin, .cue will not work. Alcohol 120% and 
  other rippers support this CloneCD format.
- To test the cd image before converting, mount it with daemon tools or some loader like that and be sure your pc detects extra audio tracks and play
  them just as it would play an audio cd.
- Use the latest PSX2PSP (1.4.2). Some other converters do this too, but they need a modified exe or some other stuff etc. Use 1 or low compression 
  like 2-3. Do not use 0 compression.
- Transfer the resulting file to your PSP and load it from XMB with CDDA Enabler plugin enabled.
- Enjoy your CDDA audio.

[Source code]
In firmwares above 4.01, the POPS module takes the wrong index length of the EBOOT.PBP, which caused incompatibility with custom CDDA audio.
This small plugin dynamically searches the offsets of the index file and patches them to the right length. The small size of the plugin says nothing about its difficulty, because
the few magic lines have been written after 10h of reversing, testing and understanding the POPS module.
Remember, it is a bug that not even Dark_AleX could figure out and fix it.
The source code is licenced under GPLv3, respect it.

[Credits]
- Dark_AleX
- reprep