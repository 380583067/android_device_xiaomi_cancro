#
# Copyright (C) 2015 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
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
-include device/xiaomi/msm8974-common/BoardConfigCommon.mk

TARGET_KERNEL_SOURCE := kernel/xiaomi/cancro
TARGET_KERNEL_CONFIG := cyanogen_cancro_defconfig

DEVICE_PATH := device/xiaomi/cancro

# Audio
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true

# FM Radio
BOARD_HAVE_QCOM_FM := true
TARGET_FM_LEGACY_PATCHLOADER := true

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Media
TARGET_QCOM_VENC_REQUEST_AVC_SEQUENCE_HEADER := true

# Partitions
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_F2FS_LEGACY_FORMAT := true
# Match the device partition table and reserve userdata's 16 KiB footer.
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11659595264
BOARD_CACHEIMAGE_PARTITION_SIZE := 500002816

# ReleaseTools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)/releasetools

# SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/system_ext/private

# Vendor Init
TARGET_INIT_VENDOR_LIB      := libinit_cancro
TARGET_LIBINIT_DEFINES_FILE := $(DEVICE_PATH)/init/init_cancro.cpp

-include vendor/xiaomi/cancro/BoardConfigVendor.mk

# 固定 ROM 编译日期的显示时区，无需在终端 export TZ
BUILD_DATE_TIMEZONE := Asia/Shanghai

TARGET_KERNEL_ADDITIONAL_FLAGS += \
    KBUILD_BUILD_TIMESTAMP="Sat Oct 10 10:10:10 CST 2026" \
    KBUILD_BUILD_VERSION=1
