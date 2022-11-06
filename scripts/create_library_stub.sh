#!/usr/bin/env bash

rm -rf exported_artifacts/esp32-arduino-matter
mkdir exported_artifacts/esp32-arduino-matter
mkdir exported_artifacts/esp32-arduino-matter/src
cp -r lib_files/* exported_artifacts/esp32-arduino-matter