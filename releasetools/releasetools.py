import common
import re

def FullOTA_InstallEnd(info):
    info.script.AppendExtra('mount("ext4", "EMMC", "/dev/block/platform/bootdevice/by-name/system", "/system_root");')
    info.script.AppendExtra('run_program("/sbin/sed", "-i", "/fuseblk/d", "/system_root/system/etc/selinux/plat_sepolicy.cil");')
    info.script.AppendExtra('unmount("/system_root");')
    OTA_InstallEnd(info)

def IncrementalOTA_InstallEnd(info):
  OTA_InstallEnd(info)

def AddImage(info, basename, dest):
  name = basename
  path = "IMAGES/" + basename
  if path not in info.input_zip.namelist():
    return

  data = info.input_zip.read(path)
  common.ZipWriteStr(info.output_zip, name, data)
  info.script.AppendExtra('package_extract_file("%s", "%s");' % (name, dest))

def OTA_InstallEnd(info):
  PatchVendor(info)
  info.script.Print("Patching firmware images...")
  AddImage(info, "dtbo.img", "/dev/block/bootdevice/by-name/dtbo")
  AddImage(info, "vbmeta.img", "/dev/block/platform/bootdevice/by-name/vbmeta")

def PatchVendor(info):
  info.script.Print("Patching vendor init scripts...")
  info.script.AppendExtra('mount("ext4", "EMMC", "/dev/block/platform/bootdevice/by-name/vendor", "/vendor");')
  info.script.AppendExtra('run_program("/sbin/sed", "-i", "s/wait,check,quota/latemount,wait,check,quota/", "/vendor/etc/fstab.mt6765");')
  info.script.AppendExtra('run_program("/sbin/sed", "-i", "s/fstab.mt6765$/fstab.mt6765 --early\\n    mount_all \/vendor\/etc\/fstab.mt6765 --late/", "/vendor/etc/init/hw/init.mt6765.rc");')
  info.script.AppendExtra('unmount("/vendor");')
