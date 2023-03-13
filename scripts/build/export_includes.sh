#!/usr/bin/env bash

# This file is heavily inspired by this script:
# https://github.com/espressif/esp32-arduino-lib-builder/blob/master/tools/copy-libs.sh
# This script exports all used headers to correct paths

cd stub_project

function get_actual_path(){
	p="$PWD"; cd "$1"; r="$PWD"; cd "$p"; echo "$r";
}

INCLUDES=""
str=`cat build/compile_commands.json | grep app_main.cpp | grep command | cut -d':' -f2 | cut -d',' -f1`
str="${str:2:${#str}-1}" #remove leading space and quotes
str=`printf '%b' "$str"` #unescape the string
set -- $str
for item in "${@:2:${#@}-5}"; do
	prefix="${item:0:2}"
	if [ "$prefix" = "-I" ]; then
		item="${item:2}"
		if [ "${item:0:1}" = "/" ]; then
			item=`get_actual_path $item`
			INCLUDES+="$item "
		else
            echo "ERROR!"
            exit 1
		fi
    fi
done

cd ..
out="exported_artifacts/includes/"
rm -rf $out
mkdir $out

set -- $INCLUDES
for item; do
    # Don't export headers from esp-idf 
    # and in root of Matter dir (compile commands has included main Matter folder with all headers,
    # including huge third_party folder, which takes ages to copy all headers)
    if [[ $item != *"$PWD/tools/esp-idf/"* ]] && [[ $item != *"$PWD/tools/esp-matter/connectedhomeip/connectedhomeip" ]]; then
        for f in `find "$item" -name '*.h'`; do
            rel_f=${f#*$item}
            rel_p=${rel_f%/*}
            mkdir -p "$out$rel_p"
            cp -n $f "$out$rel_p/"
        done
        for f in `find "$item" -name '*.hpp'`; do
            rel_f=${f#*$item}
            rel_p=${rel_f%/*}
            mkdir -p "$out$rel_p"
            cp -n $f "$out$rel_p/"
        done
    fi
done

cd exported_artifacts/includes

# change name of sdkconfig because of conflict with new project sdkconfig
mv sdkconfig.h sdkconfig_matter.h
# remove every other duplicated sdkconfig
find . -name '*sdkconfig.h*' -type f -delete

