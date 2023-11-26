#!/usr/bin/env bash
cd tools

ESP_IDF_VERSION="v4.4.6"
MATTER_VERSION="c49852a"
ESP_MATTER_VERSION="dd4f34e"
ARDUINO_ESP32_VERSION="2.0.14"

git clone --recursive https://github.com/espressif/esp-idf
git -C esp-idf checkout $ESP_IDF_VERSION
git -C esp-idf submodule update --init --recursive

git clone --recursive https://github.com/espressif/esp-matter
git -C esp-matter checkout $ESP_MATTER_VERSION
git -C esp-matter submodule update --init --recursive

git -C esp-matter/connectedhomeip/connectedhomeip checkout $MATTER_VERSION

git clone https://github.com/espressif/arduino-esp32
git -C arduino-esp32 checkout $ARDUINO_ESP32_VERSION
git -C arduino-esp32 submodule update --init --recursive