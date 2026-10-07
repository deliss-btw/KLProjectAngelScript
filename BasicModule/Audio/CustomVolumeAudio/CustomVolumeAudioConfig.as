
enum ECustomAreaType
{
    Default,
    NATIVE_MAX = 0,
    Forest,
    AirWall,
}

namespace FCustomVolumeAudioTypeMapping
{
UFUNCTION()
FName GetAreaTypeNameFromEnum(const ECustomAreaType AreaType)
{
    switch (int(AreaType))
    {
    case 0:
    {
        return n"Default";
    }
    case 1:
    {
        return n"Forest";
    }
    case 2:
    {
        return n"AirWall";
    }
    }
    return n"Default";
}
}
namespace FCustomVolumeAudioConfigUtils
{
UFUNCTION()
TArray<FCustomVolumeAudioConfig> GetAllConfigs()
{
    UDataTable local_8;
    TArray<FCustomVolumeAudioConfig> local_4;
    if (local_8 == nullptr)
    {
        XWarning(ELog(1), "CustomVolumeAudioConfig DataTable not found!");
        return local_4;
    }
    local_8.GetAllRows(local_4);
    return local_4;
}
UFUNCTION()
FCustomVolumeAudioConfig GetConfigByAreaTypeName(const FName &inout AreaTypeName)
{
    FCustomVolumeAudioConfig __r;
    TArray<FCustomVolumeAudioConfig> local_4 = FCustomVolumeAudioConfigUtils::GetAllConfigs();
    for (auto& local_24 : local_4)
    {
        if (local_24.AreaTypeName.IsEqual(AreaTypeName, true, true))
        {
            return __r;
        }
    }
    FCustomVolumeAudioConfig local_98;
    local_98.AreaTypeName = AreaTypeName;
    local_98.Description = FText::FromString("Default Configuration");
    local_98.DisplayName = FText::FromString("Default");
    return __r;
}
UFUNCTION()
bool ValidateConfigs()
{
    TArray<FCustomVolumeAudioConfig> local_4 = FCustomVolumeAudioConfigUtils::GetAllConfigs();
    bool local_9 = true;
    for (auto& local_24 : local_4)
    {
        if (local_24.AreaTypeName.IsNone())
        {
            XError(ELog(1), FString().Append("CustomVolumeAudioConfig: AreaTypeName is empty for config"));
            local_9 = false;
        }
    }
    return local_9;
}
UFUNCTION()
FSimpleAudioSet GetAudioSetByAreaTypeName(const FName &inout AreaTypeName)
{
    FSimpleAudioSet __r;
    FCustomVolumeAudioConfigUtils::GetConfigByAreaTypeName(AreaTypeName);
    return __r;
}
UFUNCTION()
FSimpleAudioSet GetAudioSetByAreaType(const ECustomAreaType AreaType)
{
    FSimpleAudioSet __r;
    FCustomVolumeAudioConfigUtils::GetAudioSetByAreaTypeName(FCustomVolumeAudioTypeMapping::GetAreaTypeNameFromEnum(ECustomAreaType(AreaType)));
    return __r;
}
}
