# ESP32 Arduino Matter Builder
This projects contains scripts used to build [ESP32 Arduino Matter](https://github.com/jakubdybczak/esp32-arduino-matter) library.

## How to build
Launch `build.sh`

## How does it work?
`build.sh` builds Docker image that contains all Matter dependencies. Then this script launches image to build example Matter application, exports all the precompiled data, headers and packs it to Arduino library. Keep in mind that those dependencies are large and whole process can take even hours, depending on your network speed and processing speed.

## Typical updating process
Change dependency versions in `scripts/download.sh` and library version at `scripts/fill_version_info.sh`.

When upgrading ESP-IDF check if `sdkconfig.defaults.esp32*` shouldn't be changed.

After those changes just run `build.sh`.

## Customized build
If there is need to change project setup, these things can be changed:
- `scripts/download.sh` that downloads all dependencies
- `scripts/prepare/apply_patch.sh` that patches project before build
- all `sdkconfig.defaults.*` for every ESP32 variant at `stub_project`