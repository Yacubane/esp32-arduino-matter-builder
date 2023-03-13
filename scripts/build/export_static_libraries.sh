#!/usr/bin/env bash

target="${1:-esp32}"

rm -rf exported_artifacts/static_non_arduino_libs
mkdir exported_artifacts/static_non_arduino_libs

rm -rf exported_artifacts/static_arduino_libs
mkdir exported_artifacts/static_arduino_libs

for file in `find 'stub_project/build/esp-idf' -name '*.a'`; do
    filename=$(basename $file)
    filename_without_extension=${filename%.*}
    # change name of libchip to libchip_ to prevent some problems on no case-sensitive filesystems
    # (there are libchip.a and libCHIP.a files)
    if [[ ${filename_without_extension} == "libchip" ]]; then
        filename_without_extension="libchip_"
    fi

    new_filename=${filename_without_extension}.a

    # add lib prefix is there isn't yet
    if [[ $filename != "lib"* ]]; then
        new_filename=lib${new_filename}
    fi

    if [[ ! -f  "tools/arduino-esp32/tools/sdk/$target/lib/$filename" ]] && [[ $filename != *"main"* ]]; then
        cp $file exported_artifacts/static_non_arduino_libs/${new_filename}
    elif [ -f  "tools/arduino-esp32/tools/sdk/$target/lib/$filename" ]; then
        cp $file exported_artifacts/static_arduino_libs/${new_filename}
    fi
done



