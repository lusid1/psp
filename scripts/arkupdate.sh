# Updates the ark installer data.zip
# run from the parent of the psp repo directory
# ./psp/scripts/arkupdate.sh
#
mv ARK4.zip ARK4.zip.old
wget -O ARK4.zip https://github.com/PSP-Archive/ARK-4/releases/latest/download/ARK.zip
wget -O ARK4.zip https://github.com/PSP-Archive/ARK-4/releases/latest/download/ARK4.zip
if ! (cmp ARK4.zip ARK4.zip.old); then 
  rm -rf ark4
  rm -rf PSP
  rm data.zip
  unzip ARK4.zip -d ark4
  mkdir -p PSP/GAME/ARK_Loader
  mkdir -p PSP/SAVEDATA/ARK_01234
  cp ark4/ARK_Loader/* PSP/GAME/ARK_Loader
  cp ark4/ARK_01234/* PSP/SAVEDATA/ARK_01234
  zip -r data.zip PSP
  cp data.zip psp/cfw/ark4-latest/
  cp ark4/PSP/ARK_cIPL/* psp/cfw/ark_cipl/
  cd psp
    git pull
    git add cfw/ark4-latest/data.zip
    git add cfw/ark_cipl/EBOOT.PBP
    git add cfw/ark_cipl/ipl_update.prx
    git add cfw/ark_cipl/kbooti_update.prx
    git add cfw/ark_cipl/kpspident.prx
    git commit -m "Ark4 update automation"
    git push
  cd ..
fi


