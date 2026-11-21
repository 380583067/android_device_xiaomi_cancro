#!/vendor/bin/sh

# WCNSS still has to load its firmware and bring up the SMD channel during boot.
fwpath=/sys/module/wlan/parameters/fwpath
attempt=0
while [ "$attempt" -lt 60 ]; do
    if [ ! -e "$fwpath" ]; then
        /vendor/bin/insmod /vendor/lib/modules/wlan.ko 2>/dev/null
    fi
    if [ -e "$fwpath" ] && /vendor/bin/chown wifi:wifi "$fwpath"; then
        exit 0
    fi
    attempt=$((attempt + 1))
    /vendor/bin/sleep 1
done
/vendor/bin/log -p e -t cancro-wlan "WLAN module or fwpath permissions did not become ready"
exit 1
