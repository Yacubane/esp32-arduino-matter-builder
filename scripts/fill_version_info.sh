#!/usr/bin/env bash

ESP32_ARDUINO_MATTER_VERSION="1.0.0-beta.7"

./scripts/build/fill_readme.sh
./scripts/build/fill_library_properties.sh $ESP32_ARDUINO_MATTER_VERSION
