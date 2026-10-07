
namespace CloudBoxConfig
{
    const FString LibraryAssetPath = FString();
    const FName DefaultConfigId = n"Default";
    const FString DefaultConfigDisplayName = FString();
    const FString BaseParentMaterialPrefix = FString();
    const FString BaseParentFolder = FString();
    const int NumTypes = 2;

}
struct FCloudBoxConfigEntry
{
    UPROPERTY()
    FName ConfigId;
    UPROPERTY()
    FLinearColor CloudAlbedo = FLinearColor(1.0f, 1.0f, 1.0f, 1.0f);
    UPROPERTY()
    UMaterialInstanceConstant Type0 = nullptr;
    UPROPERTY()
    UMaterialInstanceConstant Type1 = nullptr;

    FCloudBoxConfigEntry()
    {
        return;
    }
}

class UCloudBoxConfigLibrary : UDataAsset
{
    UPROPERTY()
    TArray<FCloudBoxConfigEntry> Configs;

    UCloudBoxConfigLibrary()
    {
        return;
    }
}

namespace CloudBoxConfigUtils
{
UCloudBoxConfigLibrary LoadLibrary()
{
    return Cast<UCloudBoxConfigLibrary>(LoadObject(nullptr, CloudBoxConfig::LibraryAssetPath));
}
int FindConfigIndex(const UCloudBoxConfigLibrary Library, const FName &inout ConfigId)
{
    if (Library == nullptr)
    {
        return -1;
    }
    int local_5 = 0;
    for (; local_5 < Library.Configs.Num(); ++local_5)
    {
        if ((FName(Library.Configs[local_5].ConfigId) == ConfigId))
        {
            return local_5;
        }
    }
    return -1;
}
UMaterialInstanceConstant GetMaterialForConfig(const FName &inout ConfigId, const int TypeIndex)
{
    if ((ConfigId == CloudBoxConfig::DefaultConfigId) || ConfigId.IsNone())
    {
        return nullptr;
    }
    UCloudBoxConfigLibrary local_6 = CloudBoxConfigUtils::LoadLibrary();
    if (local_6 == nullptr)
    {
        return nullptr;
    }
    int local_10 = CloudBoxConfigUtils::FindConfigIndex(local_6, ConfigId);
    if (local_10 < 0)
    {
        return nullptr;
    }
    FCloudBoxConfigEntry local_20;
    local_20 = local_6.Configs[local_10];
    if (TypeIndex == 0)
    {
        return local_20.Type0;
    }
    if (TypeIndex == 1)
    {
        return local_20.Type1;
    }
    return nullptr;
}
}
