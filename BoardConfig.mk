# Common
DEVICE_PATH := device/samsung/a10s
COMMON_PATH := device/samsung/a10s
BOARD_VENDOR := samsung
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53
TARGET_USES_64_BIT_BINDER := true
ALLOW_MISSING_DEPENDENCIES := true

# Build
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Bootloader
BOARD_VENDOR := samsung
TARGET_SOC := mt6765
TARGET_BOOTLOADER_BOARD_NAME := S96116CA1
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_USES_UEFI := true


# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x11a88000 --second_offset 0x00e88000 --tags_offset 0x07808000
BOARD_KERNEL_IMAGE_NAME := Image.gz
TARGET_KERNEL_SOURCE := kernel/samsung/mt6765
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm
TARGET_KERNEL_CONFIG := a10s_defconfig
#TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
#KERNEL_TOOLCHAIN := $(BUILD_TOP)/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin
#BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_KERNEL_CLANG_COMPILE := true
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz
BOARD_BOOTIMG_HEADER_VERSION := 2

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3674210304
BOARD_CACHEIMAGE_PARTITION_SIZE := 419430400
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 2048)
BOARD_VENDORIMAGE_PARTITION_SIZE := 469762048
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Recovery
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/rootdir/etc/recovery.fstab
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(COMMON_PATH)/releasetools

# SELinux
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(COMMON_PATH)/sepolicy/private
BOARD_PLAT_PUBLIC_SEPOLICY_DIR += $(COMMON_PATH)/sepolicy/public

# Symbols
TARGET_LD_SHIM_LIBS := /system/lib/libshowlogo.so|libshim_showlogo.so

# Network Routing
TARGET_IGNORES_FTP_PPTP_CONNTRACK_FAILURE := true

# Ril
ENABLE_VENDOR_RIL_SERVICE := true

# Treble
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

# Security patch level
VENDOR_SECURITY_PATCH := 2020-03-05

# AUDIO
USE_XML_AUDIO_POLICY_CONF := 1

# Android Verified Boot
BOARD_AVB_ENABLE := false
BOARD_BUILD_DISABLED_VBMETAIMAGE := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_HAVE_SAMSUNG_BLUETOOTH := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# Samsung Audio Hal
TARGET_AUDIOHAL_VARIANT := samsung

# VNDK
BOARD_VNDK_VERSION := current

# Vendor
TARGET_COPY_OUT_VENDOR := vendor

# Lineage hardware
BOARD_HARDWARE_CLASS += \
    $(COMMON_PATH)/lineagehw

# DEX Pre-optimization
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    WITH_DEXPREOPT ?= true
    WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY ?= true
  endif
endif

# HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/android.hardware.gpu@1.0-service.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vendor.samsung.hardware.base@1.0-service.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/framework_compatibility_matrix.xml

# OTA Assert
TARGET_OTA_ASSERT_DEVICE := a10s

-include vendor/samsung/a10s/BoardConfigVendor.mk
