PRXShot PNG MOD By LMAN <leecherman>

Installation:
Copy the prxshot_png_mod directory to the seplugins directory
and add the plugin to ( game.txt, vsh.txt, pops.txt ) file.

============================================================================

Changelog: <prxshot png mod>

[+]Added new ScreenshotKey option (Removed the old one) in the ini file that let you:
Choose which keys that you want to capture with it in [ XMB, GAME, POPS ] ( Combination key is also Available )
example:
ScreenshotKeyInXMB  = HOME + START
ScreenshotKeyInGAME = LTRIGGER + RTRIGGER + START
ScreenshotKeyInPOPS = RTRIGGER + START

[+]Added new option to enable\disable using GameID in the screenshot name:
example:
ScreenshotNameUseGameID = true 
Captured name will be: ULUS10336_2012-05-26_07;38;39.png

============================================================================

Changelog: <prxshot png mod fix>

[!]Fixed the duplicated name when capturing if "ScreenshotNameUseGameID" is enabled.

============================================================================

Changelog: <prxshot png mod v0.2>

[+]Added new option "SaveToPICTURE" to enable\disable saving the captured picture to xx0:/PICTURE without creating PSCM.DAT info file.
So you can delete the folder from the PSP without any problem :)

[+]Added new option "InvertedColor" to enable\disable displaying inverted color whilen taking a screenshot.

============================================================================

Changelog: <prxshot png mod v0.2 fix>

[!]Fixed a possible problem in (KeyTimeOut) that exists in the original source code of (PRXShot-PNG v1.1)

============================================================================

NOTE1: For more informations about using the PSP control keys see the config: "prxshot_png_mod.ini"
NOTE2: XMBClearCache will refresh your captured picture in XMB! Enable it ( set it to true ) if you want to use it.
NOTE3: If XMBClearCache is Enabled the XMB items will be refreshed! and your selected item ( song, picture etc... ) will be refreshed too.

Final Note: Use it at your own risk!

============================================================================