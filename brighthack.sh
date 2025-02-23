#!/system/bin/sh

# This script checks the current brightness
# and offsets the values. It could surely 
# be made more robust. Currently un-tested 
# on Oxygen OS.

BRIGHTNESS_FILE=/sys/class/backlight/panel0-backlight/brightness

BRIGHTNESS=$(cat ${BRIGHTNESS_FILE})

#echo $BRIGHTNESS

# 明るさが8未満なら8に設定
if [ "$BRIGHTNESS" -lt 8 ]; then
  echo 8 > ${BRIGHTNESS_FILE}
fi

exit 0
