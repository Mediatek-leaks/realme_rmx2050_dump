#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:100663296:b0d328f51558e76aa0404a3a629d509f261320c1; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:cdb1775267c861ac196d91b11f3f2287f40c6d21 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:100663296:b0d328f51558e76aa0404a3a629d509f261320c1 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
