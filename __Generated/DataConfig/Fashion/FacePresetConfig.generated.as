namespace __FFacePresetConfigFunctions
{
UFUNCTION()
FText __FFacePresetConfig_GetName(const TDataObjectPtr<FFacePresetConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Name' from a null 'FFacePresetConfig' DataObject!");
        }
        FFacePresetConfig local_80;
        return local_80.Name;
    }
    return __r;
}
UFUNCTION()
TSoftObjectPtr<USkeletalMesh> __FFacePresetConfig_GetMaleFace(const TDataObjectPtr<FFacePresetConfig> &inout DataObject)
{
    TSoftObjectPtr<USkeletalMesh> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaleFace' from a null 'FFacePresetConfig' DataObject!");
        }
        FFacePresetConfig local_80;
        return local_80.MaleFace;
    }
    return __r;
}
UFUNCTION()
TSoftObjectPtr<UMaterialInterface> __FFacePresetConfig_GetMaleBodyMaterial(const TDataObjectPtr<FFacePresetConfig> &inout DataObject)
{
    TSoftObjectPtr<UMaterialInterface> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaleBodyMaterial' from a null 'FFacePresetConfig' DataObject!");
        }
        FFacePresetConfig local_80;
        return local_80.MaleBodyMaterial;
    }
    return __r;
}
UFUNCTION()
TSoftObjectPtr<USkeletalMesh> __FFacePresetConfig_GetFemaleFace(const TDataObjectPtr<FFacePresetConfig> &inout DataObject)
{
    TSoftObjectPtr<USkeletalMesh> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FemaleFace' from a null 'FFacePresetConfig' DataObject!");
        }
        FFacePresetConfig local_80;
        return local_80.FemaleFace;
    }
    return __r;
}
UFUNCTION()
TSoftObjectPtr<UMaterialInterface> __FFacePresetConfig_GetFemaleBodyMaterial(const TDataObjectPtr<FFacePresetConfig> &inout DataObject)
{
    TSoftObjectPtr<UMaterialInterface> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FemaleBodyMaterial' from a null 'FFacePresetConfig' DataObject!");
        }
        FFacePresetConfig local_80;
        return local_80.FemaleBodyMaterial;
    }
    return __r;
}
UFUNCTION()
TMap<EDisplayItemIconType, FFashionDisplayIconByBody> __FFacePresetConfig_GetDisplayIcons(const TDataObjectPtr<FFacePresetConfig> &inout DataObject)
{
    TMap<EDisplayItemIconType, FFashionDisplayIconByBody> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayIcons' from a null 'FFacePresetConfig' DataObject!");
        }
        FFacePresetConfig local_80;
        return local_80.DisplayIcons;
    }
    return __r;
}
UFUNCTION()
FFacePresetConfig CastToFFacePresetConfig(const TDataObjectPtr<FFacePresetConfig> &inout DataObject)
{
    FFacePresetConfig __r;
    return __r;
}
}
