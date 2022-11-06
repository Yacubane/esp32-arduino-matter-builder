#!/usr/bin/env bash
# CONFIG_FEATURE_CACHE_TX_BUF_BIT takes a lot of RAM (causing OOM with Matter) and is enabled only when
# CONFIG_ESP32_SPIRAM_SUPPORT is enabled. SPIRAM is enabled with default Arduino sdkconfig, 
# so we have to manually remofe this flag.

FIND="cfg = WIFI_INIT_CONFIG_DEFAULT();"
REPLACE="${FIND}\n        cfg.feature_caps &= ~CONFIG_FEATURE_CACHE_TX_BUF_BIT;"
perl -i -pe "s/\Q$FIND/$REPLACE/" tools/esp-matter/connectedhomeip/connectedhomeip/src/platform/ESP32/PlatformManagerImpl.cpp
echo $?