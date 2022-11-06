target="${1:-esp32}"

cd stub_project

# Cleanup
rm -rf build
idf.py clean
rm sdkconfig
rm sdkconfig.defaults
cp sdkconfig.defaults.$target sdkconfig.defaults

# Build project
idf.py set-target $target
idf.py build