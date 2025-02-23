#!/system/bin/sh

BRIGHTNESS_FILE=/sys/class/backlight/panel0-backlight/brightness

while true; do
  BRIGHTNESS=$(cat ${BRIGHTNESS_FILE})

  # 明るさが8未満なら8に設定
  if [ "$BRIGHTNESS" -lt 8 ]; then
    echo 8 > ${BRIGHTNESS_FILE}
  fi


done

exit 0

