#!/usr/bin/env bash
cd tools

git clone --recursive -b v4.4.3 https://github.com/espressif/esp-idf

git clone --recursive https://github.com/espressif/esp-matter
cd esp-matter
git checkout 65e1ed11e2b474283148719aa835cf9cc43d9714

cd connectedhomeip/connectedhomeip
git checkout v1.0.0.2
cd ../../.. 

git clone https://github.com/espressif/arduino-esp32
cd arduino-esp32
git checkout 2.0.6