#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will work
# if Magisk changes it's mount point in the future


# Set PATH to where busybox may be from most to
# least likely

PATH=/sbin/.magisk/busybox:/sbin/.core/busybox:/system/xbin:/sbin:/system/bin

MODDIR=${0%/*}

BRIGHTNESS_FILE=/sys/class/backlight/panel0-backlight/brightness

BRIGHTHACK_EXEC=${MODDIR}/brighthack.sh

until [[ $(getprop sys.boot_completed) = 1 ]] && [[ $(getprop dev.bootcomplete) = 1 ]] && [[ $(getprop service.bootanim.exit) = 1 ]] && [[ $(getprop init.svc.bootanim) = stopped ]]; do

  sleep 5

done

while true; do
  BRIGHTNESS=$(cat ${BRIGHTNESS_FILE})

  # 明るさが8未満なら8に設定
  if [ "$BRIGHTNESS" -lt 12 ]; then
    echo 8 > ${BRIGHTNESS_FILE}
  fi


done

exit 0
