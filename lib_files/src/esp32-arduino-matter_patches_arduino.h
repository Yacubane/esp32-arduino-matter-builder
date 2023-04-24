#pragma once

// use some method from esp32-hal-bt.c to force linking it
// and so that it will override btInUse method in esp32-hal-misc.c 
// to disable releasing BT memory, that can't be later re-allocated
#include "esp32-hal-bt.h"
namespace MatterUnused {
    bool _ = btStarted();
}
