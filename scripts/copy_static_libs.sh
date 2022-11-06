#!/usr/bin/env bash

target="${1:-esp32}"

workdir=exported_artifacts/esp32-arduino-matter/src
mkdir $workdir/$target

# copy non arduino libs
#cp -r exported_artifacts/static_non_arduino_libs/* $workdir/$target
cp -r exported_artifacts/static_non_arduino_libs/libCHIP.a $workdir/$target/libCHIP.a
cp exported_artifacts/static_non_arduino_libs/libesp_matter* $workdir/$target
cp -r exported_artifacts/static_non_arduino_libs/libroute_hook.a $workdir/$target/libroute_hook.a
cp -r exported_artifacts/static_non_arduino_libs/libesp32_mbedtls.a $workdir/$target/libesp32_mbedtls.a

# copy all bluetooth-related libs (to support NimBLE)
# also there is need to change name in order to Arduino IDE take this into account when linking
# (because there is already libbt in arduino-esp32)
cp -r exported_artifacts/static_arduino_libs/libbt.a $workdir/$target/libbt_nimble.a
# copy mbed libs which are for some reason needed to link Matter
# and those shipped with arduino-esp32 aren't fully working 
cp -r exported_artifacts/static_arduino_libs/libmbedcrypto.a $workdir/$target/libmbedcrypto_matter.a

rm -rf $workdir/$target/*test*
rm -rf $workdir/$target/*Test*
