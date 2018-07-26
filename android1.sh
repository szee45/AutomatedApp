tput setaf 2; echo "Please read Readme file before exicuting this program."; tput sgr0
adb devices
adb shell input keyevent KEYCODE_APP_SWITCH
adb shell input keyevent 20
adb shell input keyevent DEL
adb install -r pCloudy_Appium_Demo.apk
package=`aapt dump badging *.apk | grep package | awk '{print $2}' | sed s/name=//g | sed s/\'//g`
activity=`aapt dump badging *.apk | grep launchable-activity: | awk '{print $2}' | sed s/name=//g | sed s/\'//g`
adb shell am start -n $package/$activity
echo "Opening app.."
sleep 1
echo "Accepting terms.."
adb shell input keyevent 66
#adb shell input keyevent 66
#adb shell input keyevent 66
adb shell input keyevent 66
echo "Entering credentials.."
read -p "Enter the club number: " usr
read -p "Enter the password in numeric form: " pass
adb shell input text $usr
adb shell input keyevent 61
#read -p "Enter the pass key: " pass
adb shell input text $pass
adb shell input keyevent 61
adb shell input keyevent 66
echo "Selecting Destination.."
adb shell input keyevent 66
adb shell input keyevent 20
adb shell input keyevent 20
adb shell input keyevent 66
adb shell input keyevent 61
adb shell input keyevent 66
adb shell input swipe 100 1200 100 400 100
adb shell input tap 257 332
adb shell input keyevent 66
echo "Seleciting Seats.."
adb shell input keyevent 20
adb shell input keyevent 20
adb shell input keyevent 20
adb shell input keyevent 66
echo "Searching Flights.."
adb shell input keyevent 20
adb shell input keyevent 20
adb shell input keyevent 66
adb shell input keyevent 20
adb shell input keyevent 20
adb shell input keyevent 66
sleep 2
adb shell screencap -p /sdcard/mytrip.png
echo "Saving your travel.. "
tput setaf 1; echo "The trip information is saved in your gallery."
adb pull /sdcard/mytrip.png
sleep 1
adb shell input keyevent 4
echo " "
tput setaf 2; echo "Following is the device information."
adb shell getprop | grep "model\|version.sdk\|manufacturer\|hardware\|platform\|revision\|serialno\|product.name\|brand" $info
adb shell cat proc/cpuinfo
echo " "
echo "Flight Booked and saved in your gallery."
#echo $var | sed -e 's/\=*$//g'
#named=$(adb shell aapt dump badging . |grep package:\* dumpsy.txt)
#adb shell am start -n ""
