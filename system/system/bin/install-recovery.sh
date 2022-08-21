#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:0cdd74551b8669b20f0a13a06fbc7e65ff299fec; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:7d9317e0acd7e413ad72bf7d97d95d0d0ecd64ad \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:0cdd74551b8669b20f0a13a06fbc7e65ff299fec && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
