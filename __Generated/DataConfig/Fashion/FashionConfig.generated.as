namespace __FFashionConfigFunctions
{
UFUNCTION()
bool __FFashionConfig_GetbDefaultUnlock(const TDataObjectPtr<FFashionConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bDefaultUnlock' from a null 'FFashionConfig' DataObject!");
        }
        FFashionConfig local_142;
        return local_142.bDefaultUnlock;
    }
    return local_1;
}
UFUNCTION()
TDataObjectPtr<FServerConditionConfigBase> __FFashionConfig_GetUnlockCondition(const TDataObjectPtr<FFashionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UnlockCondition' from a null 'FFashionConfig' DataObject!");
        }
        FFashionConfig local_142;
        return local_142.GetUnlockCondition();
    }
    return GetUnlockCondition();
}
UFUNCTION()
FText __FFashionConfig_GetUnlockDesOverride(const TDataObjectPtr<FFashionConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UnlockDesOverride' from a null 'FFashionConfig' DataObject!");
        }
        FFashionConfig local_142;
        return local_142.UnlockDesOverride;
    }
    return __r;
}
UFUNCTION()
EFashionSlotType __FFashionConfig_GetSlotType(const TDataObjectPtr<FFashionConfig> &inout DataObject)
{
    int local_143 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SlotType' from a null 'FFashionConfig' DataObject!");
        }
        FFashionConfig local_142;
        local_143 = int(local_142.SlotType);
        return EFashionSlotType(local_143);
    }
    return EFashionSlotType(local_143);
}
UFUNCTION()
EBodyType __FFashionConfig_GetBodyType(const TDataObjectPtr<FFashionConfig> &inout DataObject)
{
    int local_143 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BodyType' from a null 'FFashionConfig' DataObject!");
        }
        FFashionConfig local_142;
        local_143 = int(local_142.BodyType);
        return EBodyType(local_143);
    }
    return EBodyType(local_143);
}
UFUNCTION()
TArray<TDataObjectPtr<FAvatarPrefabConfig>> __FFashionConfig_GetAvatarTypes(const TDataObjectPtr<FFashionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AvatarTypes' from a null 'FFashionConfig' DataObject!");
        }
        FFashionConfig local_142;
        return local_142.GetAvatarTypes();
    }
    return GetAvatarTypes();
}
UFUNCTION()
FText __FFashionConfig_GetName(const TDataObjectPtr<FFashionConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Name' from a null 'FFashionConfig' DataObject!");
        }
        FFashionConfig local_142;
        return local_142.Name;
    }
    return __r;
}
UFUNCTION()
FText __FFashionConfig_GetDes(const TDataObjectPtr<FFashionConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Des' from a null 'FFashionConfig' DataObject!");
        }
        FFashionConfig local_142;
        return local_142.Des;
    }
    return __r;
}
UFUNCTION()
EFashionRarity __FFashionConfig_GetRarity(const TDataObjectPtr<FFashionConfig> &inout DataObject)
{
    int local_143 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Rarity' from a null 'FFashionConfig' DataObject!");
        }
        FFashionConfig local_142;
        local_143 = int(local_142.Rarity);
        return EFashionRarity(local_143);
    }
    return EFashionRarity(local_143);
}
UFUNCTION()
int __FFashionConfig_GetPriority(const TDataObjectPtr<FFashionConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Priority' from a null 'FFashionConfig' DataObject!");
        }
        FFashionConfig defaultValue;
        return defaultValue.Priority;
    }
    return DataObject.Get().Priority;
}
UFUNCTION()
EFashionShowType __FFashionConfig_GetShowType(const TDataObjectPtr<FFashionConfig> &inout DataObject)
{
    int local_143 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ShowType' from a null 'FFashionConfig' DataObject!");
        }
        FFashionConfig local_142;
        local_143 = int(local_142.ShowType);
        return EFashionShowType(local_143);
    }
    return EFashionShowType(local_143);
}
UFUNCTION()
TMap<EBodyType, TSoftObjectPtr<USkeletalMesh>> __FFashionConfig_GetMeshAssets(const TDataObjectPtr<FFashionConfig> &inout DataObject)
{
    TMap<EBodyType, TSoftObjectPtr<USkeletalMesh>> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MeshAssets' from a null 'FFashionConfig' DataObject!");
        }
        FFashionConfig local_142;
        return local_142.MeshAssets;
    }
    return __r;
}
UFUNCTION()
TMap<EBodyType, TSoftClassPtr<UAnimInstance>> __FFashionConfig_GetAnimBlueprints(const TDataObjectPtr<FFashionConfig> &inout DataObject)
{
    TMap<EBodyType, TSoftClassPtr<UAnimInstance>> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AnimBlueprints' from a null 'FFashionConfig' DataObject!");
        }
        FFashionConfig local_142;
        return local_142.AnimBlueprints;
    }
    return __r;
}
UFUNCTION()
TMap<EBodyType, FName> __FFashionConfig_GetDyeConfigs(const TDataObjectPtr<FFashionConfig> &inout DataObject)
{
    TMap<EBodyType, FName> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DyeConfigs' from a null 'FFashionConfig' DataObject!");
        }
        FFashionConfig local_142;
        return local_142.DyeConfigs;
    }
    return __r;
}
UFUNCTION()
TMap<EDisplayItemIconType, FFashionDisplayIconByBody> __FFashionConfig_GetDisplayIcons(const TDataObjectPtr<FFashionConfig> &inout DataObject)
{
    TMap<EDisplayItemIconType, FFashionDisplayIconByBody> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayIcons' from a null 'FFashionConfig' DataObject!");
        }
        FFashionConfig local_142;
        return local_142.DisplayIcons;
    }
    return __r;
}
UFUNCTION()
FFashionConfig CastToFFashionConfig(const TDataObjectPtr<FFashionConfig> &inout DataObject)
{
    FFashionConfig __r;
    return __r;
}
}
namespace __FClothFashionConfigFunctions
{
UFUNCTION()
float32 __FClothFashionConfig_GetHeelHeight(const TDataObjectPtr<FClothFashionConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HeelHeight' from a null 'FClothFashionConfig' DataObject!");
        }
        FClothFashionConfig defaultValue;
        return defaultValue.HeelHeight;
    }
    return DataObject.Get().HeelHeight;
}
UFUNCTION()
float32 __FClothFashionConfig_GetGroundOffset(const TDataObjectPtr<FClothFashionConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GroundOffset' from a null 'FClothFashionConfig' DataObject!");
        }
        FClothFashionConfig defaultValue;
        return defaultValue.GroundOffset;
    }
    return DataObject.Get().GroundOffset;
}
UFUNCTION()
TSoftObjectPtr<UObject> __FClothFashionConfig_GetClothAssetOverride(const TDataObjectPtr<FClothFashionConfig> &inout DataObject)
{
    TSoftObjectPtr<UObject> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ClothAssetOverride' from a null 'FClothFashionConfig' DataObject!");
        }
        FClothFashionConfig local_178;
        return local_178.ClothAssetOverride;
    }
    return __r;
}
UFUNCTION()
TSoftObjectPtr<UObject> __FClothFashionConfig_GetKawaiiAssetOverride(const TDataObjectPtr<FClothFashionConfig> &inout DataObject)
{
    TSoftObjectPtr<UObject> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'KawaiiAssetOverride' from a null 'FClothFashionConfig' DataObject!");
        }
        FClothFashionConfig local_178;
        return local_178.KawaiiAssetOverride;
    }
    return __r;
}
UFUNCTION()
bool __FClothFashionConfig_GetbHideHair(const TDataObjectPtr<FClothFashionConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bHideHair' from a null 'FClothFashionConfig' DataObject!");
        }
        FClothFashionConfig local_178;
        return local_178.bHideHair;
    }
    return local_1;
}
UFUNCTION()
float32 __FClothFashionConfig_GetLocomotionStrideScale(const TDataObjectPtr<FClothFashionConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LocomotionStrideScale' from a null 'FClothFashionConfig' DataObject!");
        }
        FClothFashionConfig defaultValue;
        return defaultValue.LocomotionStrideScale;
    }
    return DataObject.Get().LocomotionStrideScale;
}
UFUNCTION()
TSoftObjectPtr<UObject> __FClothFashionConfig_GetFootstepSoundOverride(const TDataObjectPtr<FClothFashionConfig> &inout DataObject)
{
    TSoftObjectPtr<UObject> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FootstepSoundOverride' from a null 'FClothFashionConfig' DataObject!");
        }
        FClothFashionConfig local_178;
        return local_178.FootstepSoundOverride;
    }
    return __r;
}
UFUNCTION()
EFashionSurfaceType __FClothFashionConfig_GetSurfaceMaterialType(const TDataObjectPtr<FClothFashionConfig> &inout DataObject)
{
    int local_179 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SurfaceMaterialType' from a null 'FClothFashionConfig' DataObject!");
        }
        FClothFashionConfig local_178;
        local_179 = int(local_178.SurfaceMaterialType);
        return EFashionSurfaceType(local_179);
    }
    return EFashionSurfaceType(local_179);
}
UFUNCTION()
FClothFashionConfig CastToFClothFashionConfig(const TDataObjectPtr<FClothFashionConfig> &inout DataObject)
{
    FClothFashionConfig __r;
    return __r;
}
}
namespace __FDecoFashionConfigFunctions
{
UFUNCTION()
TDataObjectPtr<FAttachPointConfig> __FDecoFashionConfig_GetAttachPoint(const TDataObjectPtr<FDecoFashionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AttachPoint' from a null 'FDecoFashionConfig' DataObject!");
        }
        FDecoFashionConfig local_176;
        return local_176.GetAttachPoint();
    }
    return GetAttachPoint();
}
UFUNCTION()
FFloat3 __FDecoFashionConfig_GetDefaultAttachOffset(const TDataObjectPtr<FDecoFashionConfig> &inout DataObject)
{
    FFloat3 __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultAttachOffset' from a null 'FDecoFashionConfig' DataObject!");
        }
        FDecoFashionConfig local_176;
        return local_176.DefaultAttachOffset;
    }
    return __r;
}
UFUNCTION()
FFloat3 __FDecoFashionConfig_GetDefaultAttachRotation(const TDataObjectPtr<FDecoFashionConfig> &inout DataObject)
{
    FFloat3 __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultAttachRotation' from a null 'FDecoFashionConfig' DataObject!");
        }
        FDecoFashionConfig local_176;
        return local_176.DefaultAttachRotation;
    }
    return __r;
}
UFUNCTION()
float32 __FDecoFashionConfig_GetDefaultAttachScale(const TDataObjectPtr<FDecoFashionConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultAttachScale' from a null 'FDecoFashionConfig' DataObject!");
        }
        FDecoFashionConfig defaultValue;
        return defaultValue.DefaultAttachScale;
    }
    return DataObject.Get().DefaultAttachScale;
}
UFUNCTION()
bool __FDecoFashionConfig_GetbAllowedWithBathrobe(const TDataObjectPtr<FDecoFashionConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bAllowedWithBathrobe' from a null 'FDecoFashionConfig' DataObject!");
        }
        FDecoFashionConfig local_176;
        return local_176.bAllowedWithBathrobe;
    }
    return local_1;
}
UFUNCTION()
FDecoFashionConfig CastToFDecoFashionConfig(const TDataObjectPtr<FDecoFashionConfig> &inout DataObject)
{
    FDecoFashionConfig __r;
    return __r;
}
}
namespace __FMountFashionConfigFunctions
{
UFUNCTION()
EMountSeatType __FMountFashionConfig_GetSeatType(const TDataObjectPtr<FMountFashionConfig> &inout DataObject)
{
    int local_165 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SeatType' from a null 'FMountFashionConfig' DataObject!");
        }
        FMountFashionConfig local_164;
        local_165 = int(local_164.SeatType);
        return EMountSeatType(local_165);
    }
    return EMountSeatType(local_165);
}
UFUNCTION()
TSoftClassPtr<ACharacterPrefab> __FMountFashionConfig_GetMountPrefab(const TDataObjectPtr<FMountFashionConfig> &inout DataObject)
{
    TSoftClassPtr<ACharacterPrefab> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MountPrefab' from a null 'FMountFashionConfig' DataObject!");
        }
        FMountFashionConfig local_164;
        return local_164.MountPrefab;
    }
    return __r;
}
UFUNCTION()
TSoftClassPtr<AActor> __FMountFashionConfig_GetShowcaseActor(const TDataObjectPtr<FMountFashionConfig> &inout DataObject)
{
    TSoftClassPtr<AActor> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ShowcaseActor' from a null 'FMountFashionConfig' DataObject!");
        }
        FMountFashionConfig local_164;
        return local_164.ShowcaseActor;
    }
    return __r;
}
UFUNCTION()
FMountFashionConfig CastToFMountFashionConfig(const TDataObjectPtr<FMountFashionConfig> &inout DataObject)
{
    FMountFashionConfig __r;
    return __r;
}
}
