#!/usr/bin/env bash
cd tools

# git clone --recursive -b v4.4.2 https://github.com/espressif/esp-idf

git clone --recursive https://github.com/espressif/esp-matter
cd esp-matter
git checkout a0f137865936aa4eac97855de07ca5f5786ffa45

cd connectedhomeip/connectedhomeip
git checkout 7c2353bb7af06303350796103867ed5aa9b4fd27
cd ../../.. 

# git clone https://github.com/espressif/arduino-esp32
# cd arduino-esp32
# git checkout 2.0.5