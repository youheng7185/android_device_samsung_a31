DEVICE_PATH := device/samsung/a10s
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

# Bootloader
BOARD_VENDOR := samsung
TARGET_SOC := mt6765
TARGET_BOOTLOADER_BOARD_NAME := S96116CA1
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Image
BOARD_KERNEL_IMAGE_NAME := Image
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm
TARGET_KERNEL_SOURCE := kernel/samsung/mt6765
TARGET_KERNEL_CONFIG := a10s_defconfig
#TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
#KERNEL_TOOLCHAIN := $(BUILD_TOP)/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_KERNEL_CLANG_COMPILE := true

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

# DEX Pre-optimization
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    WITH_DEXPREOPT ?= true
    WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY ?= true
  endif
endif

# HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/android.hardware.cas@1.1-service.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/android.hardware.gpu@1.0-service.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vendor.samsung.hardware.base@1.0-service.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/framework_compatibility_matrix.xml

# OTA Assert
TARGET_OTA_ASSERT_DEVICE := a10s

-include vendor/samsung/a10s/BoardConfigVendor.mk
