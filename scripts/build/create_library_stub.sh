#!/usr/bin/env bash

rm -rf exported_artifacts/esp32-arduino-matter
mkdir exported_artifacts/esp32-arduino-matter
mkdir exported_artifacts/esp32-arduino-matter/src
cp -r lib_files/* exported_artifacts/esp32-arduino-matter
cp stub_project/main/esp32-arduino-matter_patches_matter.h exported_artifacts/esp32-arduino-matter/src