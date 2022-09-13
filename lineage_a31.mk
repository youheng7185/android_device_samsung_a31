#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from a31 device
$(call inherit-product, device/samsung/a31/device.mk)

PRODUCT_DEVICE := a31
PRODUCT_NAME := lineage_a31
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A315G
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung-ss

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="a31nsxx-user 12 SP1A.210812.016 A315GXXU1DVG8 release-keys"

BUILD_FINGERPRINT := samsung/a31nsxx/a31:12/SP1A.210812.016/A315GXXU1DVG8:user/release-keys
