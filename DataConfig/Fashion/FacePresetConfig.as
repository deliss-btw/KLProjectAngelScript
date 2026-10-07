

struct FFacePresetConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FText Name;
    UPROPERTY()
    TSoftObjectPtr<USkeletalMesh> MaleFace;
    UPROPERTY()
    TSoftObjectPtr<UMaterialInterface> MaleBodyMaterial;
    UPROPERTY()
    TSoftObjectPtr<USkeletalMesh> FemaleFace;
    UPROPERTY()
    TSoftObjectPtr<UMaterialInterface> FemaleBodyMaterial;
    UPROPERTY()
    TMap<EDisplayItemIconType, FFashionDisplayIconByBody> DisplayIcons;


}

namespace FFacePresetConfig
{
TDataObjectPtr<FFacePresetConfig> GetByDataId(const uint DataId)
{
    return TDataObjectPtr<FFacePresetConfig>();
}
}
