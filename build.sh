#!/usr/bin/env bash

# Build image that contains all dependencies needed to build esp32-arduino-matter
# You can configure dependencies in scripts/download.sh file
# Note: this image takes around 32GB. Building image and running it may take few hours!
docker build -t esp32-arduino-matter-builder .

# Now as dependencies are downloaded, installed and cached,
# you can experiment with scripts/prepare/apply_patch.sh, stub_project,
# other files or just build esp32-arduino-matter with default settings.
# Final library will be placed at exported_artifacts/esp32-arduino-matter
docker run -v ${PWD}/lib_files:/root/lib_files \
    -v ${PWD}/stub_project:/root/stub_project \
    -v ${PWD}/scripts:/root/scripts \
    -v ${PWD}/build.sh:/root/build.sh \
    -v ${PWD}/exported_artifacts:/root/exported_artifacts \
    -v ${PWD}/.git:/root/.git \
    esp32-arduino-matter-builder 