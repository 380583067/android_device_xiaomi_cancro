PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=9

PRODUCT_PROPERTY_OVERRIDES += \
    ro.fm.transmitter=false

PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.video=false \
    persist.vendor.audio.fluence.speaker=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=400

# Avoid preserved EGL back buffers on the legacy Adreno 330 driver.
PRODUCT_SYSTEM_PROPERTIES += debug.hwui.use_partial_updates=false
