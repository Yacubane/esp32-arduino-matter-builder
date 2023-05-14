#pragma once

// emberAfLevelControlClusterMoveToClosestFrequencyCallback does not have implementation
// but is referenced by esp-matter. Even if there is not real usage of this method in project for
// some reason after setting CONFIG_COMPILER_CXX_EXCEPTIONS=y in sdkconfig it does not compile
// and will result with unknown reference. CONFIG_COMPILER_CXX_EXCEPTIONS=y is set for 
// arduino-esp32 builds so there is no option to change it. As a workaround this method
// will be compiled with empty body.
bool emberAfLevelControlClusterMoveToClosestFrequencyCallback(
    chip::app::CommandHandler * commandObj, const chip::app::ConcreteCommandPath & commandPath,
    const chip::app::Clusters::LevelControl::Commands::MoveToClosestFrequency::DecodableType & commandData
) {
    return false;
}
