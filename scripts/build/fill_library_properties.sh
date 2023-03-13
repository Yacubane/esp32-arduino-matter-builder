#!/usr/bin/env bash
LIBRARY_PROPERTIES_PATH="exported_artifacts/esp32-arduino-matter/library.properties"

ESP32_ARDUINO_MATTER_VERSION="${1:-1.0.0-beta}"

perl -i -pe "s/\Q{{ ESP32_ARDUINO_MATTER_VERSION }}/$ESP32_ARDUINO_MATTER_VERSION/" $LIBRARY_PROPERTIES_PATH