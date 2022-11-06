# ESP32 Arduino Matter Builder
This projects contains scripts used to build [ESP32 Arduino Matter](https://github.com/jakubdybczak/esp32-arduino-matter) library.

## How to build
1. Launch `./prepare.sh` to download and prepare all necessary dependencies
2. Launch `./build.sh` to build library. Library will be placed at `exported_artifacts/esp32-arduino-matter` directory

## Custom build
If there is need to change project setup, these things can be changed:
- branch of `esp-idf` at `tools/esp-idf`
- branch of `esp-matter` at `tools/esp-matter`
- branch of `arduino-esp32` at `tools/arduino-esp32`
- `scripts/download.sh` that downloads all dependencies
- `scripts/apply_patch.sh` that patches matter repository
- all `sdkconfig.defaults.*` for every ESP32 variant at `stub_project`