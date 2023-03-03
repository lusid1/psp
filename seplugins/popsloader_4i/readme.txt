Installation:
Add seplugins/popsloader/popsloader.prx to game.txt

----

Popsloader PRO/ME mod.

v3 (110721)
Derived from official v2.
Workaround for neur0n's sceKernelGetGameInfo()+0x44.
Using open(sceKernelGetGameInfo()+0x74,O_RDONLY,0777);

v3a (110721)
Fixed save_config().

v3b (110722)
Fixed "Original from flash" feature.

v3c (110722)
Fixed a bug in popsloader_patch_chain().
Removed debug line.

v4 (110723)
Integrated pops_bridge into popsloader.prx.
6.x pops are supported on ME.

v4a beta (110724)
All pops are supported on ME.
Instead, popcorn.prx now works in release/debug hybrid mode.

v4b alpha1 (110808)
1. Removed sceLoaderCore patch.
2. Changed remove timing of ms0:/__popcorn.txt. Now you should be able to see it.
(You need to paste it if you want to report bugs)
3. sctrlSetStartModuleExtra() (ME's original function) is now resolved via sctrlHENFindFunction(), rather than systemctrl.S.

v4b alpha2 (110817)
Integrated http://code.google.com/p/popsloader/source 2d9f6175ddde to support 6.60 pops.

v4b alpha2+1 (110817)
1. 5.00+ pops are working on 6.60ME. Unfortunately impose.prx (used in 4.01- pops) patch is incomplete.
2. Now that popscore.prx is compiled using DEBUG=1, you need to paste ms0:/core.txt to report bugs.

v4b alpha2+2 (110817)
1. Changed debug text name to ms0:/__popscore.txt. Also it is removed in every launching.
2. Fixed sceKernelGetModel NID for 6.60.
3. Fixed fatal bug that PSP-3000+ on 6.20PRO couldn't use 4.01- pops at all.

v4b alpha2+3 (110818)
Added impose.prx patch. Still 3 NIDs are missing though.
Anyway 4.01 pops seems to be working fully.

v4b alpha3 (110819)
Now that impose.prx patch is complete, popsloader supports all pops fully on 6.60ME.

v4b alpha4 (110821)
PSPgo will use pops_04g.prx on 6.00 (I don't know if this is correct)
Integrated http://code.google.com/p/procfw/source df2af4ebe25c. Popsloader should support 6.60PRO PSP-E1000 (when released).

v4c (110822)
Attached popsloader.md5sum (and popsloader_updater.md5sum).
Make sure your pops md5 is correct before reporting bugs.
Now popscore.prx / popcorn.prx is compiled in release mode (no longer emits debug log)
*** I don't know why this time popcorn.prx is working in release mode. Tested only on 6.60ME. Be careful. ***

v4d (110824)
Forgot to close EBOOT file handle when get_disc_id() failed.
Integrated http://code.google.com/p/popsloader/source 54abc82880ed. Now more stable.
(Actually some of NID wasn't resolved for 6.60.)

v4e (110827)
Recompiled all modules using -O2.
Suspend recover bug fixed for 3.7x if you use PRO (?)
94235f09107f wasn't merged because:
1. official v3 cannot get DISC ID yet, at least on PSP-2000[C].
2. changing load_config() timing will crash ME mode.

v4f (110903)
Integrated http://code.google.com/p/popsloader/source 6043b4ffdfed.

v4f1 (110912)
Popcorn patching in v4f was incomplete (lol).

v4g (120410)
Fixed analog stick bug on ME (thx neur0ner).

v4h (150202)
Supported 6.61 PRO/ME (thx qwikrazor87).
Dropped 6.61 pops, for it has the same compatibility with 6.60.

v4i (150218)
Integrated https://code.google.com/p/procfw/source 608f7aded65c.

