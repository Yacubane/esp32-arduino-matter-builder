#pragma once

#define CHIP_HAVE_CONFIG_H true
#define CHIP_ADDRESS_RESOLVE_IMPL_INCLUDE_HEADER <lib/address_resolve/AddressResolve_DefaultImpl.h>

// undef ESP32 while importing Matter
// ESP32 define makes some defines in Matter headers not working
#undef ESP32
// import sdkconfig from exported Matter project
#include "sdkconfig_matter.h"
#include "esp_matter.h"
#include "esp_matter_console.h"
#include "esp_matter_ota.h"
#include "esp_matter_providers.h"

#include "esp32-arduino-matter_patches_matter.h"
#define ESP32
#include "esp32-arduino-matter_patches_arduino.h"
