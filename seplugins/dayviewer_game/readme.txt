[DayViewerForGame v7	by plum]

This plugin allows you to edit the clock string and add more features like weekday, monthname, year, battery percent, battery lifetimer, and more...

This plugin only ASCII characters can be displayed.

It can use by CFW of 6.XX.

[Changelog v7.1]
- System Firmware 6.61 is supported

[Changelog v7]
- The display of the character corrected the bug which was not performed normally.

[Changelog v6]
- When the character was displayed, the battery icon corrected the bug which is not displayed normally.

[Changelog v5]
- When a character string overflowed a screen, it was made to start a new line.
- It changed into [alignment] from [align_right].

[Changelog v4]
- The string corrected the problem which is not displayed correctly.
- When [set_standard_pos] was effective, the battery icon corrected the problem which was undisplayed. 

[Changelog v3]
- Fixed a newline bug(another).
- Fixed a [hide_battery_icon].
- Added a [hide_volume_bar] to the config file.

[Changelog v2]
- Fixed a newline bug.
- Added a [set_standard_pos] and [hide_battery_icon] to the config file.


[Instructions]
- Copy the 'seplugins' folder to your Memory Stick and add this line to 'game.txt': 'ms0:/seplugins/dayviewer_game.prx 1' (without the ').
- Now, take a look in 'dayviewer_game_conf.txt'.
- Reboot your psp and enjoy:).


[Editing clock string]

For the clock string, you can use these things:

%weekday
%day
%monthname
%month
%year
%hour12 (time format 12)
%hour
%min
%sec
%ampm
%batpercent
%batlifehour (battery life hour)
%batlifemin (battery life minutes)

If you want to show the percent symbol you have to write '%%'.
To make a new line, write '\'.


[Thanks]
- Thanks to Total_Noob.
- Thanks to Wildcard team.
- Thanks to junbo969 & estuibal & Bright_Net & mak1341 for betatesting.
