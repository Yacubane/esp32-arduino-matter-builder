#!/usr/bin/env bash

ESP32_ARDUINO_MATTER_VERSION="1.0.0-beta.2"

. ./scripts/build/setup_env.sh

target="esp32"

./scripts/build/create_library_stub.sh 

./scripts/build/build_project.sh $target
./scripts/build/export_includes.sh $target
./scripts/build/copy_includes.sh 
./scripts/build/export_static_libraries.sh $target
./scripts/build/copy_static_libs.sh $target

target="esp32c3"
./scripts/build/build_project.sh $target
./scripts/build/export_static_libraries.sh $target
./scripts/build/copy_static_libs.sh $target

target="esp32s3"
./scripts/build/build_project.sh $target
./scripts/build/export_static_libraries.sh $target
./scripts/build/copy_static_libs.sh $target

echo "architectures=esp32,esp32c3,esp32s3" >> exported_artifacts/esp32-arduino-matter/library.properties
./scripts/build/add_ldflags.sh esp32

./scripts/fill_version_info.sh