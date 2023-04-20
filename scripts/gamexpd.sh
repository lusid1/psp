#!/bin/bash


#run this from the directory containing the game sub-directories
# ./gamexpd.sh GAMEDIR
#xpd files will be placed in that directory
#current supports up to 8 files per game directory
#

#urlbase is the http path to the folder containing the game folders
urlbase="http://archive.org/download/PSPDemoArchive"

#xpdbase is the http path to the xpd files (used for multi-part xpd files)
xpdbase="http://archive.org/download/PSPDemoArchive/xpd"

curr=$PWD
titledb="$(dirname -- $( readlink -f -- $0; );)/titledb.txt"

cd "$1" &> /dev/null

dirname=$(basename $PWD)
FName=$(ls -1 | grep "EBOOT.PBP" )
if [ "$FName" == "EBOOT.PBP" ]; then
  #Get code from eboot
  code=$(strings -n9 EBOOT.PBP | sed -n '/^[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9]/p' | sed -n "1p")
  
  #look for title in the most common places
  code2=$(strings EBOOT.PBP | head -n20 | sed '1,/^TITLE$/d' | sed -n "1p")
  desc=$(strings EBOOT.PBP | head -n20 | sed '1,/^TITLE$/d' | sed -n "4p")
  if [ "$code2" == "USE_USB" ]; then
    desc=$(strings EBOOT.PBP | head -n20 | sed '1,/^TITLE$/d' | sed -n "6p")
  fi

  #Collect file names
  AName=$( ls -p -1 | sed '/\//d' | sed '/EBOOT.PBP/d' | sed '/.[xX][pP][dD]/d' | sed '/.[pP][nN][gG]/d' |sed -n "1p") 
  FName2=$(ls -p -1 | sed '/\//d' | sed '/EBOOT.PBP/d' | sed '/.[xX][pP][dD]/d' | sed '/.[pP][nN][gG]/d' |sed -n "2p")
  AName2=$(ls -p -1 | sed '/\//d' | sed '/EBOOT.PBP/d' | sed '/.[xX][pP][dD]/d' | sed '/.[pP][nN][gG]/d' |sed -n "3p")
  FName3=$(ls -p -1 | sed '/\//d' | sed '/EBOOT.PBP/d' | sed '/.[xX][pP][dD]/d' | sed '/.[pP][nN][gG]/d' |sed -n "4p")
  AName3=$(ls -p -1 | sed '/\//d' | sed '/EBOOT.PBP/d' | sed '/.[xX][pP][dD]/d' | sed '/.[pP][nN][gG]/d' |sed -n "5p")
  FName4=$(ls -p -1 | sed '/\//d' | sed '/EBOOT.PBP/d' | sed '/.[xX][pP][dD]/d' | sed '/.[pP][nN][gG]/d' |sed -n "6p")
  AName4=$(ls -p -1 | sed '/\//d' | sed '/EBOOT.PBP/d' | sed '/.[xX][pP][dD]/d' | sed '/.[pP][nN][gG]/d' |sed -n "7p")
else #No EBOOT.PBP found but generate xpd anyway - patch or dlc
  code="$dirname"
  desc="$dirname"
  FName=$( ls -p -1 | sed '/\//d' | sed '/EBOOT.PBP/d' | sed '/.[xX][pP][dD]/d' | sed '/.[pP][nN][gG]/d' |sed -n "1p")
  AName=$( ls -p -1 | sed '/\//d' | sed '/EBOOT.PBP/d' | sed '/.[xX][pP][dD]/d' | sed '/.[pP][nN][gG]/d' |sed -n "2p") 
  FName2=$(ls -p -1 | sed '/\//d' | sed '/EBOOT.PBP/d' | sed '/.[xX][pP][dD]/d' | sed '/.[pP][nN][gG]/d' |sed -n "3p")
  AName2=$(ls -p -1 | sed '/\//d' | sed '/EBOOT.PBP/d' | sed '/.[xX][pP][dD]/d' | sed '/.[pP][nN][gG]/d' |sed -n "4p")
  FName3=$(ls -p -1 | sed '/\//d' | sed '/EBOOT.PBP/d' | sed '/.[xX][pP][dD]/d' | sed '/.[pP][nN][gG]/d' |sed -n "5p")
  AName3=$(ls -p -1 | sed '/\//d' | sed '/EBOOT.PBP/d' | sed '/.[xX][pP][dD]/d' | sed '/.[pP][nN][gG]/d' |sed -n "6p")
  FName4=$(ls -p -1 | sed '/\//d' | sed '/EBOOT.PBP/d' | sed '/.[xX][pP][dD]/d' | sed '/.[pP][nN][gG]/d' |sed -n "7p")
  AName4=$(ls -p -1 | sed '/\//d' | sed '/EBOOT.PBP/d' | sed '/.[xX][pP][dD]/d' | sed '/.[pP][nN][gG]/d' |sed -n "8p")
fi

eid="gdp#"
#These install as an app - EID=adp#
if [ "$(echo $code | grep NPIA)" != "" ]; then eid="adp#";fi   # Sensme/ Music Unlimited
if [ "$(echo $code | grep NPEG00012)" != "" ]; then eid="adp#";fi # Digital Comics
if [ "$(echo $code | grep NPJW00001)" != "" ]; then eid="adp#";fi # Comics Reader (jp)
if [ "$(echo $code | grep NPJH00067)" != "" ]; then eid="adp#";fi # X-Radar (jp)
if [ "$(echo $code | grep ULES00856)" != "" ]; then eid="adp#";fi # Go Messenger
if [ "$(echo $code | grep NPHW00011)" != "" ]; then eid="adp#";fi # DVB-T Tuner App


if [ "X$FName" != "X" ]; then Fsize=$(ls -l $FName | tr -s ' ' | cut -d' ' -f5); else Fsize=0;fi
if [ "X$AName" != "X" ]; then Asize=$(ls -l $AName | tr -s ' ' | cut -d' ' -f5); else Asize=0;fi
size=$(($Fsize+$Asize))
size=$(($size/1024))

# Done information gathering so back to the old $PWD
cd "$curr"

#If CODE is found in descriptions.txt override the sfo description with the translated one
desceng=$(cat "$titledb" | grep "$code" | cut -d' ' -f2- | sed -n "1p"| tr -d '\n' | tr -d '\r')
if [ "X$desceng" != "X" ]; then desc="$desceng"; fi

#If dirname is found in descriptions.txt override the sfo description with the translated one
#This is for when multiple demos were released under the same content ID
desceng=$(cat "$titledb" | grep "$dirname" | cut -d' ' -f2- | sed -n "1p"| tr -d '\n' | tr -d '\r')
if [ "X$desceng" != "X" ]; then desc="$desceng"; fi

y=1
if [ "X$FName" == "X" ]; then exit;fi
if [ "X$FName2" != "X" ]; then y=2;fi
if [ "X$FName3" != "X" ]; then y=3;fi
if [ "X$FName4" != "X" ]; then y=4;fi

#make xpd
xpd="$dirname.xpd"
if [ "X$FName2" != "X" ]; then 
  xpd2="$dirname""-2.xpd"
  xofy="(1 of $y)"
else 
  xpd2=""
fi

echo "[Info]" > "$xpd"
echo "EID=$eid" >> "$xpd"
echo "Desc=$desc $xofy" >> "$xpd"
echo "Size=$size" >> "$xpd"
echo "Code=$code" >> "$xpd"
echo "FName=$FName" >> "$xpd"
if [ "X$AName" != "X" ]; then echo "AName=$AName" >> "$xpd";fi
if [ "X$xpd2" != "X" ]; then echo "NPage=$xpdbase/$xpd2" >>"$xpd"; fi
echo >> "$xpd"
echo "[File]" >> "$xpd"
echo "C=$urlbase/$dirname/EBOOT.PBP" >> "$xpd"
if [ "X$AName" != "X" ]; then echo "A=$urlbase/$dirname/$AName" >> "$xpd";fi
echo >> "$xpd"

if [ "X$FName2" == "X" ]; then exit; fi

#make part 2
xpd="$xpd2"
xofy="(2 of $y)"
FName="$FName2"
AName="$AName2"
if [ "X$FName3" != "X" ]; then 
  xpd2="$dirname""-3.xpd"
  xofy="(2 of $y)"
else 
  xpd2=""
fi
echo "[Info]" > "$xpd"     
echo "EID=$eid" >> "$xpd"  
echo "Desc=$desc $xofy" >> "$xpd"
echo "Size=$size" >> "$xpd"
echo "Code=$code" >> "$xpd"
echo "FName=$FName" >> "$xpd"
if [ "X$AName" != "X" ]; then echo "AName=$AName" >> "$xpd";fi
if [ "X$xpd2" != "X" ]; then echo "NPage=$xpdbase/$xpd2" >>"$xpd"; fi
echo >> "$xpd"
echo "[File]" >> "$xpd"
echo "C=$urlbase/$dirname/$FName" >> "$xpd"
if [ "X$AName" != "X" ]; then echo "A=$urlbase/$dirname/$AName" >> "$xpd";fi
echo >> "$xpd"

if [ "X$FName3" == "X" ]; then exit; fi

#make part 3
xpd="$xpd2"
xofy="(3 of $y)"
FName="$FName3"
AName="$AName3"
if [ "X$FName4" != "X" ]; then 
  xpd2="$dirname""-4.xpd"
  xofy="(3 of $y)"
else 
  xpd2=""
fi
echo "[Info]" > "$xpd"     
echo "EID=$eid" >> "$xpd"  
echo "Desc=$desc $xofy" >> "$xpd"
echo "Size=$size" >> "$xpd"
echo "Code=$code" >> "$xpd"
echo "FName=$FName" >> "$xpd"
if [ "X$AName" != "X" ]; then echo "AName=$AName" >> "$xpd";fi
if [ "X$xpd2" != "X" ]; then echo "NPage=$xpdbase/$xpd2" >>"$xpd"; fi
echo >> "$xpd"
echo "[File]" >> "$xpd"
echo "C=$urlbase/$dirname/$FName" >> "$xpd"
if [ "X$AName" != "X" ]; then echo "A=$urlbase/$dirname/$AName" >> "$xpd";fi
echo >> "$xpd"

if [ "X$FName4" == "X" ]; then exit; fi

#make part 4
xpd="$xpd2"
xofy="(4 of $y)"
FName="$FName3"
AName="$AName3"
if [ "X$FName6" != "X" ]; then 
  xpd2="$dirname""-5.xpd"
  xofy="(4 of $y)"
else 
  xpd2=""
fi
echo "[Info]" > "$xpd"     
echo "EID=$eid" >> "$xpd"  
echo "Desc=$desc $xofy" >> "$xpd"
echo "Size=$size" >> "$xpd"
echo "Code=$code" >> "$xpd"
echo "FName=$FName" >> "$xpd"
if [ "X$AName" != "X" ]; then echo "AName=$AName" >> "$xpd";fi
if [ "X$xpd2" != "X" ]; then echo "NPage=$xpdbase/$xpd2" >>"$xpd"; fi
echo >> "$xpd"
echo "[File]" >> "$xpd"
echo "C=$urlbase/$dirname/$FName" >> "$xpd"
if [ "X$AName" != "X" ]; then echo "A=$urlbase/$dirname/$AName" >> "$xpd";fi
echo >> "$xpd"

