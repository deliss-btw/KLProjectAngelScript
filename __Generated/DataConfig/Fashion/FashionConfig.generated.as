namespace __FFashionConfigFunctions
{
UFUNCTION()
bool __FFashionConfig_GetbDefaultUnlock(const TDataObjectPtr<FFashionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bDefaultUnlock' from a null 'FFashionConfig' DataObject!");
        }
        FFashionConfig local_142;
        return local_142.bDefaultUnlock;
    }
    return DataObject.Get().bDefaultUnlock;
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
    return DataObject.Get().GetUnlockCondition();
}
UFUNCTION()
FText __FFashionConfig_GetUnlockDesOverride(const TDataObjectPtr<FFashionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UnlockDesOverride' from a null 'FFashionConfig' DataObject!");
        }
        FFashionConfig local_142;
        return local_142.UnlockDesOverride;
    }
    return DataObject.Get().UnlockDesOverride;
}
UFUNCTION()
EFashionSlotType __FFashionConfig_GetSlotType(const TDataObjectPtr<FFashionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SlotType' from a null 'FFashionConfig' DataObject!");
        }
        FFashionConfig local_142;
        return local_142.SlotType;
    }
    return DataObject.Get().SlotType;
}
UFUNCTION()
EBodyType __FFashionConfig_GetBodyType(const TDataObjectPtr<FFashionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BodyType' from a null 'FFashionConfig' DataObject!");
        }
        FFashionConfig local_142;
        return local_142.BodyType;
    }
    return DataObject.Get().BodyType;
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
    return DataObject.Get().GetAvatarTypes();
}
UFUNCTION()
FText __FFashionConfig_GetName(const TDataObjectPtr<FFashionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Name' from a null 'FFashionConfig' DataObject!");
        }
        FFashionConfig local_142;
        return local_142.Name;
    }
    return DataObject.Get().Name;
}
UFUNCTION()
FText __FFashionConfig_GetDes(const TDataObjectPtr<FFashionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Des' from a null 'FFashionConfig' DataObject!");
        }
        FFashionConfig local_142;
        return local_142.Des;
    }
    return DataObject.Get().Des;
}
UFUNCTION()
EFashionRarity __FFashionConfig_GetRarity(const TDataObjectPtr<FFashionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Rarity' from a null 'FFashionConfig' DataObject!");
        }
        FFashionConfig local_142;
        return local_142.Rarity;
    }
    return DataObject.Get().Rarity;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ShowType' from a null 'FFashionConfig' DataObject!");
        }
        FFashionConfig local_142;
        return local_142.ShowType;
    }
    return DataObject.Get().ShowType;
}
UFUNCTION()
TMap<EBodyType, TSoftObjectPtr<USkeletalMesh>> __FFashionConfig_GetMeshAssets(const TDataObjectPtr<FFashionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MeshAssets' from a null 'FFashionConfig' DataObject!");
        }
        FFashionConfig local_142;
        return local_142.MeshAssets;
    }
    return DataObject.Get().MeshAssets;
}
UFUNCTION()
TMap<EBodyType, TSoftClassPtr<UAnimInstance>> __FFashionConfig_GetAnimBlueprints(const TDataObjectPtr<FFashionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AnimBlueprints' from a null 'FFashionConfig' DataObject!");
        }
        FFashionConfig local_142;
        return local_142.AnimBlueprints;
    }
    return DataObject.Get().AnimBlueprints;
}
UFUNCTION()
TMap<EBodyType, FName> __FFashionConfig_GetDyeConfigs(const TDataObjectPtr<FFashionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DyeConfigs' from a null 'FFashionConfig' DataObject!");
        }
        FFashionConfig local_142;
        return local_142.DyeConfigs;
    }
    return DataObject.Get().DyeConfigs;
}
UFUNCTION()
TMap<EDisplayItemIconType, FFashionDisplayIconByBody> __FFashionConfig_GetDisplayIcons(const TDataObjectPtr<FFashionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayIcons' from a null 'FFashionConfig' DataObject!");
        }
        FFashionConfig local_142;
        return local_142.DisplayIcons;
    }
    return DataObject.Get().DisplayIcons;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ClothAssetOverride' from a null 'FClothFashionConfig' DataObject!");
        }
        FClothFashionConfig local_178;
        return local_178.ClothAssetOverride;
    }
    return DataObject.Get().ClothAssetOverride;
}
UFUNCTION()
TSoftObjectPtr<UObject> __FClothFashionConfig_GetKawaiiAssetOverride(const TDataObjectPtr<FClothFashionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'KawaiiAssetOverride' from a null 'FClothFashionConfig' DataObject!");
        }
        FClothFashionConfig local_178;
        return local_178.KawaiiAssetOverride;
    }
    return DataObject.Get().KawaiiAssetOverride;
}
UFUNCTION()
bool __FClothFashionConfig_GetbHideHair(const TDataObjectPtr<FClothFashionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bHideHair' from a null 'FClothFashionConfig' DataObject!");
        }
        FClothFashionConfig local_178;
        return local_178.bHideHair;
    }
    return DataObject.Get().bHideHair;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FootstepSoundOverride' from a null 'FClothFashionConfig' DataObject!");
        }
        FClothFashionConfig local_178;
        return local_178.FootstepSoundOverride;
    }
    return DataObject.Get().FootstepSoundOverride;
}
UFUNCTION()
EFashionSurfaceType __FClothFashionConfig_GetSurfaceMaterialType(const TDataObjectPtr<FClothFashionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SurfaceMaterialType' from a null 'FClothFashionConfig' DataObject!");
        }
        FClothFashionConfig local_178;
        return local_178.SurfaceMaterialType;
    }
    return DataObject.Get().SurfaceMaterialType;
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
    return DataObject.Get().GetAttachPoint();
}
UFUNCTION()
FFloat3 __FDecoFashionConfig_GetDefaultAttachOffset(const TDataObjectPtr<FDecoFashionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultAttachOffset' from a null 'FDecoFashionConfig' DataObject!");
        }
        FDecoFashionConfig local_176;
        return local_176.DefaultAttachOffset;
    }
    return DataObject.Get().DefaultAttachOffset;
}
UFUNCTION()
FFloat3 __FDecoFashionConfig_GetDefaultAttachRotation(const TDataObjectPtr<FDecoFashionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultAttachRotation' from a null 'FDecoFashionConfig' DataObject!");
        }
        FDecoFashionConfig local_176;
        return local_176.DefaultAttachRotation;
    }
    return DataObject.Get().DefaultAttachRotation;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bAllowedWithBathrobe' from a null 'FDecoFashionConfig' DataObject!");
        }
        FDecoFashionConfig local_176;
        return local_176.bAllowedWithBathrobe;
    }
    return DataObject.Get().bAllowedWithBathrobe;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SeatType' from a null 'FMountFashionConfig' DataObject!");
        }
        FMountFashionConfig local_164;
        return local_164.SeatType;
    }
    return DataObject.Get().SeatType;
}
UFUNCTION()
TSoftClassPtr<ACharacterPrefab> __FMountFashionConfig_GetMountPrefab(const TDataObjectPtr<FMountFashionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MountPrefab' from a null 'FMountFashionConfig' DataObject!");
        }
        FMountFashionConfig local_164;
        return local_164.MountPrefab;
    }
    return DataObject.Get().MountPrefab;
}
UFUNCTION()
TSoftClassPtr<AActor> __FMountFashionConfig_GetShowcaseActor(const TDataObjectPtr<FMountFashionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ShowcaseActor' from a null 'FMountFashionConfig' DataObject!");
        }
        FMountFashionConfig local_164;
        return local_164.ShowcaseActor;
    }
    return DataObject.Get().ShowcaseActor;
}
UFUNCTION()
FMountFashionConfig CastToFMountFashionConfig(const TDataObjectPtr<FMountFashionConfig> &inout DataObject)
{
    FMountFashionConfig __r;
    return __r;
}
}
