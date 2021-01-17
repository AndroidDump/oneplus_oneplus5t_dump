#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:34645292:dea77d9b0429256d6dcb9b3baac96403c26b3b92; then
  applypatch --bonus /system/etc/recovery-resource.dat \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:22340904:c2c6752bc01213bb30355a29630e200caa9260f2 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:34645292:dea77d9b0429256d6dcb9b3baac96403c26b3b92 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
