#!/bin/bash

ANE=$"KidozAFlexSdkLib.ane"
SWC=$"KidozFlexSdkLib.swc"
LIB=$"libKidozSDK.a"

IOS=$"library.swf libKidozSDK.a Dosis-Bold.ttf KIDOZYTPlayerView-iframe-player_3_4.html KIDOZYTPlayerView-iframe-player.html cross_blue.png kidoz_banner2_parental_lock_button_open.png kidoz_banner2_parental_lock_button_locked.png  exit_icon.png divider.png pause_video_icon.png play_video_icon.png playerpos.png"
DEFAULT=$"library.swf"

AIRSDK=$"/Applications/Adobe Flash Builder 4.7/eclipse/plugins/com.adobe.flash.compiler_4.7.0.349722/AIRSDK/bin/adt"

clear

echo ""

DIR=$"$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ADT="$AIRSDK"
echo "Unpacking swc..."

cd "$DIR/"
unzip -q -o "$SWC"
rm $"catalog.xml"

echo "Compiling..."
"$ADT" -package -target ane $ANE extension.xml -swc $SWC -platform iPhone-ARM $IOS -platform default $DEFAULT -platform Android-ARM -platformoptions platform.xml  -C android .
echo "Finished!"