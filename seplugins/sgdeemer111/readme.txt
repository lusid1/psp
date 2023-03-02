***********************************************
**                                           **
**   Savegame Deemer                         **
**                                           **
**   Save and Load of UNENCRYPTED Savedata   **
**                                           **
***********************************************

          by ---==> HELLCAT <==---


OK, so what?
===============

This is a small CFW plugin that will make the PSP to save any savedata in
unencrypted form as well as the usual way.

The unencrypted savedata can then be directely edited with whatever tools
you use for tasks like that (mostly a hexeditor, I'd guess ;-) ) and on
the next load those (edited) unencrypted data is loaded and off you go :-)

There's also a feature to patch/overwrite the SFO data (the stuff displayed
in the save/load dialogs and the savegame manager of the XMB) with the
edited SDINFO.BIN that gets saved alongside the unencrypted savedata.
So you can also manipulate those info bits when resaving a tweaked gamesave
in "official" format :-D


How? What? Where?
===================

When saving from a game, the savedata is saved as usual.
In addition to this, there will be another set of savedata created inside
/PSP/SAVEPLAIN on your memstick.
The folders will be named much like what they are named in /PSP/SAVEDATA,
consisting mostly of the game ID.

In the folders carrying the unencrypted savedata you'll find three file:

- <gameid>.BIN
One file will have the same name as the folder (gameid) plus the .BIN suffix.
This file will be usefull for devs only in most cases, it contains a dump
of the params structure that has been passed from the game to the syscall
used for savedata access.
This also contains the unique gamekey!!! ;-D

- SDINFO.BIN
This contains the descriptive texts that are shown in the XMB and the
save/load dialogs and is usually stored inside the PARAMS.SFO on the
original savedata.

- SDDATA.BIN
THIS IS WHAT YOU ARE LOOKING FOR! :-)))
This file contains the actual savedata, in it's pure, unencrypted form!
Edit it to all your needs, on the next load THIS will be loaded instead
of the original (encrypted) savedata.


The following "rules" apply while this plugin is active:

- If unencrypted savedata for the current load is present it will be loaded
  INSTEAD of the normal/encrypted one.

- When saving, thre's always the unencrypted version saved alongside.

- If no unencrypted data exists for the current load, the normal/encrypted
  one is loaded as if nothing ever happened.

So, if you want to use your normal savedata again, either disable this plugin
or delete the unencrypted version from /PSP/SAVEPLAIN.


Overwriting the SFO information
---------------------------------
As mentioned above, you can overwrite the SFO information that get shown
in the load/save dialogs and the savegame manager of the XMB with the
data from an (edited) SDINFO.BIN.

Doing so is pretty easy: Edit the SDINFO.BIN to your likings, fire up
the game and load your tweaked save.
When the game is then saving the next time, hold the "L" trigger button
JUST BEFORE the game starts the saving process, and keep it pressed till
it fnished.
This will make Savegame-Deemer to load the edited SDINFO.BIN and
overwrite the data the game supplies with it's contents.

You now have a nice, customized savegame :-D

The SDINFO.BIN will not be updated when using this function, so can
use the edited data on the next saves.
However, when the game saves and you do NOT hold the "L" trigger during
the save, the SDINFO.BIN will be updated again with the data the game
supplies for saving - loosing your edits!
So, you might want to keep a copy under a different filename of it :-)


*NOTES* *IMPORTANT* (more or less....)

In theory this shouldn't have any negative sideeffect beside slowing the
load/save down a bit due to some intentional delays for preventing
conflicts with other threads.

However, if you do not intent to use the unencrypted data, you should
disable the plugin in the recovery menu - just to be save :-)


Installation
==============

Easy:
Copy the /seplugins folder from this archive to your memstick.
If you have no plugins yet, just rename the "game.txt.new" to
"game.txt".
If you already have plugins, edit your existing "game.txt" and add
this line:

ms0:/seplugins/deemerh.prx

Go to recovery and enable the "deemerh.prx" plugin.

Set, and ready for liftoff :-)


To look out for?
===================

While editing the savedata you should keep in mind that most games
include some own checksums, additional encryption or sanity checks.
So, even if the savedata is loaded correctly from the technical
point of view, the game might complain about corrupted data.

In that case, you'll have to figure out the games additional checks.

Another thing, when the savedata in question is saved/loaded via
the save game dialog (where you can choose what savegame to load
or save):
Usually the folder for the unencrypted savedata consists of
the game ID AND the save ID.
For the dialog to show up, the game does not pass a fixed save ID,
so in this case the folder will only be named of the game ID.
Keep that in mind if you think the wrong data is loaded/saved.

Example:
Wipeout-Pulse, savedata caused by autosave will be in a folder
like this:
UCES00465P0001
If you save (or load) a profile using the load/save dialog the
folder will look like this:
UCES00465

I guess this will cause some confusion.

And yes, at the very end of the function call the PSP stores the
selected savename in the struct, but there are situations where
the program would need to know it at the START of the function
call.... so i left it for the time beeing like it is....


The End
=========

Well, I think this should be it....
If there's anymore to be said, I'll add in the next realeases readme.

HAPPY SAVEGAME CHEATING! :-)))




Dev Stuff
===========

For those knowing what's going on:
I initially tried to load/save the savedata using the original function
the games use as well: sceUtilitySavedataInitStart()
Without luck so far, there's more initialisations to be done or additional
checks by the PSP I have yet to figure out....
(yes, I do have the gamekey, that one is no problem....;-) )

So I came up with this which was originally intended to get the gameskey from
the games and which is so damn simple....
All this does is dumping the databuffer when sceUtilitySavedataInitStart()
is called or overwrite it with the unencrypted data when
sceUtilitySavedataGetStatus() returns 3.... BOOM :-p


The source to this is available, it's no big secret, if you want it,
just ask me, I'll give you the current link.
(I keep loosing / dropping / deleting it, so the URL keeps changing,
 hence no longer including it here, just ask and you'll get it :-) )

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Please note that with downloading the source you agree to it beeing
published under the GPL - so, in short, you're allowed
to make own stuff based on this, but your new app MUST be released
including the source and must be under the GPL as well.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

