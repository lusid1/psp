[DayViewer v7 by Total_Noob]
Release on www.pspgen.com


This plugin allows you to edit the clock string and add more features like weekday, monthname, year, battery percent, battery lifetimer, and more...


[Changelog v7]
- Now you have the full possibility to edit the clock string to your desire.
- Added battery lifetime.
- Fixed incompatibility with AutoStart PRX.
- Solved bug in unicode encoding: some character didn't show correctly.


[Instructions]
- Copy the 'seplugins' folder to your Memory Stick and add this line to 'vsh.txt': 'ms0:/seplugins/dayviewer.prx 1' (without the ').
- Now, take a look in 'dayviewer_config.txt'.
- Reboot your psp and enjoy:).


[Translation & Editing clock string]

The config file for the translation and the clock string is: 'dayviewer_config.txt'

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

Example: [SuperHero, %month-%day-%year %hour:%min:%sec %batpercent%%]
Example 2: \%weekday, %day. %monthname %year %hour12:%min:%sec %ampm\CFW 5.50GEN-D3

If you want to show the percent symbol you have to write '%%'.
To make a new line, write '\'.
If you make a new line, the clock string will slide up. To fix that, write '\' at the beginning of the string.

Note: Max. 100 characters for the clock string


[Donation]
If you want to thank me you can donate me 5 EUR:D:D:D: https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=8158859


[Thanks]
- Thanks to mom and dad:D.
- Thanks to MaGiXieN for all his support and betatesting
- Thanks to pspflashsystem for the battery percent and battery lifetime idea.
- Thanks to Jado & Malaky & nickxab for betatesting.