#!/usr/bin/env bash
cd tools

git clone --recursive -b v4.4.2 https://github.com/espressif/esp-idf

git clone --recursive https://github.com/espressif/esp-matter
cd esp-matter
git checkout e7c70721d5c426f8cb99abab126e52f41476ca7b
cd ..

git clone https://github.com/espressif/arduino-esp32
cd arduino-esp32
git checkout 2.0.5