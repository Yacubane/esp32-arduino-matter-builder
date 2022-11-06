#!/usr/bin/env bash

. ./scripts/setup_env.sh

target="esp32"

./scripts/create_library_stub.sh 

./scripts/build_project.sh $target
./scripts/export_includes.sh $target
./scripts/copy_includes.sh 
./scripts/export_static_libraries.sh $target
./scripts/copy_static_libs.sh $target

target="esp32c3"
./scripts/build_project.sh $target
./scripts/export_static_libraries.sh $target
./scripts/copy_static_libs.sh $target

target="esp32s3"
./scripts/build_project.sh $target
./scripts/export_static_libraries.sh $target
./scripts/copy_static_libs.sh $target

echo "architectures=esp32,esp32c3,esp32s3" >> exported_artifacts/esp32-arduino-matter/library.properties
./scripts/add_ldflags.sh esp32
