#!/usr/bin/env bash
cd tools

ESP_IDF_VERSION="v4.4.4"
MATTER_VERSION="v1.0.0.2"
ESP_MATTER_VERSION="80a22dc"
ARDUINO_ESP32_VERSION="2.0.7"

git clone --recursive -b $ESP_IDF_VERSION https://github.com/espressif/esp-idf
git clone --recursive https://github.com/espressif/esp-matter
git -C esp-matter checkout $ESP_MATTER_VERSION
git -C esp-matter/connectedhomeip/connectedhomeip checkout $MATTER_VERSION
git clone https://github.com/espressif/arduino-esp32
git -C arduino-esp32 checkout $ARDUINO_ESP32_VERSION