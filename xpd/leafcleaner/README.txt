# Leaf Cleaner

###### previously called Key Cleaner by Chilly Willy


## Setup
* Copy/Merge `PSP` folder from zip to root of the memory stick
* Run
    * analyze the leaves to check if they are correct
    * Dump leaves to `ms0:/leaves`, if that directory exisit it will rename older leaves directory to leave_0001 etc...


## Credits
* `Chilly Willy`, for creating and providing the src to Key Cleaner
* `Acid_Snake` for LibPSPExploit to allow kernel calls on OFW
* `Davee` for the psptools signing to make this in boot on OFW
* `Wally` for adding the original src to PSP-Archive so I didn't have to dig around for it. ;-)



## Known issues
* Not all Motherboards are selectable right now, it is still very much limited to 1K's and 2K's. I will be working on adding more.
* Exit sometimes locks up the PSP and does a hard shutdown. Usually having all the kernel stuff in another thread helps that, but something is still off I bit I will try to fix that soon.
