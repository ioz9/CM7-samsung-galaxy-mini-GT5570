# Copyright (C) 2011 The Android Open Source Project
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

DEVICE_PACKAGE_OVERLAYS += device/samsung/tass/overlay

PRODUCT_PACKAGES += \
    copybit.tass \
    gps.tass \
    gralloc.tass \
    libOmxCore \
    lights.msm7k \
    rzscontrol \
    screencap \
    setup_fs

# Recovery tools
PRODUCT_PACKAGES += \
    dump_image \
    e2fsck \
    erase_image \
    flash_image \
    make_ext4fs

# Service Mode Secret Code
PRODUCT_PACKAGES += \
    SamsungServiceMode

# MADTeam modifications
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/bin/madconfig:system/bin/madconfig

# Hardware properties
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Kernel modules
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/modules/ar6000.ko:system/wifi/ar6000.ko \
    device/samsung/tass/prebuilt/modules/fsr.ko:root/lib/modules/fsr.ko \
    device/samsung/tass/prebuilt/modules/fsr_stl.ko:root/lib/modules/fsr_stl.ko \
    device/samsung/tass/prebuilt/modules/rfs_fat.ko:root/lib/modules/rfs_fat.ko \
    device/samsung/tass/prebuilt/modules/rfs_glue.ko:root/lib/modules/rfs_glue.ko \
    device/samsung/tass/prebuilt/modules/sec_param.ko:root/lib/modules/sec_param.ko

# Board-specific init & scripts
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/init.gt-s5570.rc:root/init.gt-s5570.rc \
    device/samsung/tass/prebuilt/TASS.rle:root/TASS.rle \
    device/samsung/tass/prebuilt/ueventd.gt-s5570.rc:root/ueventd.gt-s5570.rc

# Workaround for wifi & bluetooth mac addresses
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/bin/get_macaddrs:system/bin/get_macaddrs

# Wifi
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/etc/dhcpd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/samsung/tass/prebuilt/etc/wifi/hostapd.conf:system/etc/wifi/hostapd.conf \
    device/samsung/tass/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Bluetooth
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/etc/bluetooth/audio.conf:system/etc/bluetooth/audio.conf

# VOLD configuration
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/etc/vold.fstab:system/etc/vold.fstab

# Media profiles
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/etc/media_profiles.xml:/system/etc/media_profiles.xml

# Audio
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/samsung/tass/prebuilt/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

# memory twaks
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/bin/lowmemvalue:system/bin/lowmemvalue \
    device/samsung/tass/prebuilt/bin/toggleshutter:system/bin/toggleshutter \
    device/samsung/tass/prebuilt/99mebitweaks:system/etc/init.d/99mebitweaks 

# Enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
     ro.com.google.locationfeatures=1 \
     ro.com.google.networklocation=1

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

# RIL properties
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libargs=-d/dev/smd0 \
    rild.libpath=/system/lib/libsec-ril.so \
    ro.telephony.ril_class=samsung \
    ro.telephony.sends_barcount=1

# Keymap properties
#PRODUCT_PROPERTY_OVERRIDES += \
#    android.keychar.europa_keypad0=/system/usr/keychars/europa_keypad0.kcm.bin \
#    android.keylayout.europa_headset=/system/usr/keylayout/europa_headset.kl \
#    android.keylayout.europa_keypad0=/system/usr/keylayout/europa_keypad0.kl \
#    hw.keyboards.0.devname=europa_keypad0 \
#    hw.keyboards.65538.devname=europa_headset

# Networking properties
PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=pdp0,wlan0,gprs,ppp0 \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=90

# Performance & graphics properties
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=24m \
    persist.sys.purgeable_assets=1 \
    persist.sys.use_dithering=0 \
    ro.media.dec.jpeg.memcap=20000000 \
    ro.opengles.version=131072 

# Compcache properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.compcache.default=0

ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/samsung/tass/prebuilt/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product-if-exists, vendor/samsung/tass/tass-vendor.mk)

$(call inherit-product, build/target/product/full_base.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# LDPI assets
PRODUCT_LOCALES += ldpi mdpi

PRODUCT_NAME := samsung_tass
PRODUCT_DEVICE := tass
PRODUCT_MODEL := GalaxyMini
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
