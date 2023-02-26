# Updates the ark installer data.zip
# run from the parent of the psp repo directory
# ./psp/scripts/arkupdate.sh
#
mv ARK4.zip ARK4.zip.old
wget https://github.com/PSP-Archive/ARK-4/releases/latest/download/ARK4.zip
if ! (cmp ARK4.zip ARK4.zip.old); then 
  rm -rf ark4
  rm ARK4.zip.1
  rm -rf PSP
  rm data.zip
  unzip ARK4.zip -d ark4
  mkdir -p PSP/GAME/ARK_Live
  mkdir -p PSP/SAVEDATA/ARK_01234
  cp ark4/ARK_Live/* PSP/GAME/ARK_Live
  cp ark4/ARK_01234/* PSP/SAVEDATA/ARK_01234
  zip -r data.zip PSP
  git clone https://github.com/lusid1/psp
  cp data.zip psp/cfw/ark4-latest/
  cp ark4/AdvancedVSH/VSHMENU.PRX psp/cfw/ark4-latest/
  cd psp
  git add psp/cfw/ark-latest/data.zip
  git add psp/cfw/ark-latest/VSHMENU.PRX
  git commit -m "Ark4 update automation"
  git push
  cd ..
fi


