LD="ldflags="
for f in `find 'exported_artifacts/esp32-arduino-matter/src/esp32' -name '*.a'  | sort`; do
    filename=$(basename $f)
    withoutExt=${filename%.*}
    LD+=-l${withoutExt:3}" "
done
echo $LD >> exported_artifacts/esp32-arduino-matter/library.properties