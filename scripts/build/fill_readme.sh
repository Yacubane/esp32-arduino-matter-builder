#!/usr/bin/env bash
README_PATH="exported_artifacts/esp32-arduino-matter/README.md"

get_tag_or_commit_hash() {
    tag=$(git -C $1 describe --tags 2>/dev/null)
    if [ $? -ne 0 ]; then
        hash=$(git -C $1 rev-parse --short HEAD)
        echo $hash
    else
        echo $tag
    fi
}

ESP_IDF_VERSION=$(get_tag_or_commit_hash "tools/esp-idf")
ESP_MATTER_VERSION=$(get_tag_or_commit_hash "tools/esp-matter")
MATTER_VERSION=$(get_tag_or_commit_hash "tools/esp-matter/connectedhomeip/connectedhomeip")
ARDUINO_ESP32_VERSION=$(get_tag_or_commit_hash "tools/arduino-esp32")

PLATFORMIO_ESPRESSIF_VERSION="v6.1.0"

perl -i -pe "s/\Q{{ ESP_IDF_VERSION }}/$ESP_IDF_VERSION/" $README_PATH
perl -i -pe "s/\Q{{ ESP_MATTER_VERSION }}/$ESP_MATTER_VERSION/" $README_PATH
perl -i -pe "s/\Q{{ MATTER_VERSION }}/$MATTER_VERSION/" $README_PATH
perl -i -pe "s/\Q{{ ARDUINO_ESP32_VERSION }}/$ARDUINO_ESP32_VERSION/" $README_PATH
perl -i -pe "s/\Q{{ PLATFORMIO_ESPRESSIF_VERSION }}/$PLATFORMIO_ESPRESSIF_VERSION/" $README_PATH

perl -i -pe "s/\Q{{ PLATFORMIO_ESPRESSIF_VERSION }}/$PLATFORMIO_ESPRESSIF_VERSION/" $README_PATH