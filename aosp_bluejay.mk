#
# Copyright 2021 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, device/google/gs101/aosp_common.mk)
$(call inherit-product, device/google/bluejay/device-bluejay.mk)

# Inherit some common pb stuff.
$(call inherit-product, vendor/pb/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/google/gs101/aosp_common.mk)
$(call inherit-product, device/google/bluejay/device-custom.mk)

PRODUCT_NAME := aosp_bluejay
PRODUCT_DEVICE := bluejay
PRODUCT_MODEL := Pixel 6a
PRODUCT_BRAND := google
PRODUCT_MANUFACTURER := Google

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Keep the VNDK APEX in /system partition for REL branches as these branches are
# expected to have stable API/ABI surfaces.
ifneq (REL,$(PLATFORM_VERSION_CODENAME))
  PRODUCT_PACKAGES += com.android.vndk.current.on_vendor
endif

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_PRODUCT=bluejay

$(call inherit-product, vendor/google/bluejay/bluejay-vendor.mk)
