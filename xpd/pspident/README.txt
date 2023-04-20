PSPident 0.75

This is a 3.xx+ kernel app to display Tachyon, Baryon and Pommel version numbers of your PSP's motherboard.
It also displays the PSP model (TA-079, TA-081, etc.) and overall PSP version based on this data.

Just copy the PSPident folder to your GAME/GAME3XX folder and run it. If you want, it will also run in the 1.50 kernel.

NOTE: If your PSP is detected as a TA-085 v2/TA-088, it one of the newest Slim revisions which cannot write to the battery serial and therefore cannot be used to create a Pandora battery! 

Information about the numbers printed:
Kernel version - internal version of the current kernel you are running the app on (could be either 1.50 or 3.xx if you're using OE/M33)
Tachyon - this seems to be the version of the chip which contains the CPU, ME and GPU.
Baryon - this is the version number of your PSP's Syscon (system control) chip
Pommel - the PSP's GPIO/watchdog which handles system events and shuts down in the event of a crash
Kirk - the PSP's main decryption/verification chip
Spock - secondary decryption chip, only used to decrypt data from the UMD discs

Note: these are SCE names for these devices

0.74.2 -> 0.75
- Added new PSP-E1000 codename "Street"

0.74.1 -> 0.74.2
- Added new PSP-3000 with tachyon=820000 (shipped 6.35 / DATE CODE 1A)
-- Don't know what mobo they really has inside, so call they TA-095v2/Brite v4.1 for now
- "Brite" -> "Bright"

0.74 -> 0.74.1
- Fixed wrong english string (6.2x -> 6.3x)
-- Thx to soulburn for attention

0.73.2 -> 0.74
- Latest PSP models (TA-095) support
- Now you may see your g-spot... erm, g-eneration

0.73.1 -> 0.73.2
- After saving screenshot on PSPgo (into internal memory) PSPident says "ms0:/...", fixed
- Screenshot's name via plugin now same with old-style method
-- Scramble calculating on 6.xx HEN/CFW is broken :( So, disabled

0.73 -> 0.73.1
- Old-style screenshot saving fixed

0.72 -> 0.73
- On FWs >= 6.20 screenshot saving implemented via FuSa ScreenShot Plugin
-- FuSa ScreenShot Plugin (c) Andy_maN

0.71 -> 0.72
- Some cosmetic changes
- Accurate model shown (changed last number - region)

0.70 -> 0.71
- Some cosmetic changes
- Added scramble (or nand seed or id scramble)
-- Very big thx to raing3 - many of future changes done by him =)
- Screenshots now saved into "/PICTURE/PSPident/"
-- Please note that screenshot saving on 6.xx HENs still broken :(

0.60 -> 0.70
- PSPgo support
- PSP-3000 TA-093 (4g) support

0.53 -> 0.6/0.60)
- Changed kernel version string
- Added FuseID/FusaCFG version
-- Thx to skyend for ideas!
- Added UMD-ROM FW version (based on SilverSpring's code)
-- Reuploaded at 17:31 09.07.2010 - small eboot title update

0.521 -> 0.53
- Multilanguage version (rus & eng)

0.52 -> 0.521
- Some cosmetic changes, again

0.51 -> 0.52
- Some cosmetic changes

0.5 -> 0.51
- More info about PSP

0.4 -> 0.5
- Added detection for "TA-092" (Tachyon: 0x00600000, Baryon: 0x00285000)
-- http://lan.st/showthread.php?t=2747
- Added icon (huge change, really!)

0.3 -> 0.4
- Long overdue update. Congrats to all the PSP-3000 users who can finally use homebrew!
- Updated all the data with the latest available, so it now detects TA-088 v1/v2/v3, TA-090 v1 (final version of Slim) and TA-090 v2 (first version of PSP-3000 or "Brite")
- Due to a lack of info, TA-088 v1 and v2 are indistinguishable and will appear as such on the app.

0.2 -> 0.3
- Added detection for "TA-088" (Tachyon: 0x00500000, Baryon: 0x0024300) - this was incorrectly referred to as TA-085 v3 in 0.2
- Added "overall" PSP version, e.g. TA-079 v1 = Fat v1.0, TA-085 v2 = Slim v1.2
- Improved program flow, so will now display as much information as possible (e.g. motherboard type if model cannot be determined)
- Fixed KIRK/SPOCK version display by adding a thread delay, which should ensure the version is always displayed

0.1b -> 0.2
- Added detection for "TA-085 v3" (Tachyon: 0x00500000, Baryon: 0x0024300)
- Saves a screenshot to ms0:/pspident_xxx.bmp every time you run the app - this is extremely slow if using a Sony memory stick

0.1a -> 0.1b
- Added KIRK version
- Added SPOCK version
(KIRK and SPOCK only known versions are 0010 and 0050)

0.1 -> 0.1a
- Added detection for "TA-079 v3" (Tachyon: 0x00200000, Baryon: 0x00040600)

~jas0nuk
&Yoti (your may contact me via PM on pspx.ru/pspfaqs.ru/lan.st/wololo.net)
