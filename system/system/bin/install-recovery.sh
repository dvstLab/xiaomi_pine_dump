#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:c2dad1f991aa66d080cd8b2dfc6b97a5cea1f8e3 > /cache/recovery/last_install_recovery_status; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:33554432:9683fd19da8c45ae47f41639ff76d350a492b726 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:c2dad1f991aa66d080cd8b2dfc6b97a5cea1f8e3 >> /cache/recovery/last_install_recovery_status && \
      echo "Installing new recovery image: succeeded" >> /cache/recovery/last_install_recovery_status || \
      echo "Installing new recovery image: failed" >> /cache/recovery/last_install_recovery_status
else
  echo "Recovery image already installed" >> /cache/recovery/last_install_recovery_status
fi
