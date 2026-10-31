namespace __FBasePrefabConfigFunctions
{
UFUNCTION()
FText __FBasePrefabConfig_GetDisplayName(const TDataObjectPtr<FBasePrefabConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayName' from a null 'FBasePrefabConfig' DataObject!");
        }
        FBasePrefabConfig local_76;
        return local_76.DisplayName;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FBasePrefabConfig_GetDisplayIcon(const TDataObjectPtr<FBasePrefabConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayIcon' from a null 'FBasePrefabConfig' DataObject!");
        }
        FBasePrefabConfig local_76;
        return local_76.DisplayIcon;
    }
    return __r;
}
UFUNCTION()
EPrefabSize __FBasePrefabConfig_GetSize(const TDataObjectPtr<FBasePrefabConfig> &inout DataObject)
{
    int local_77 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Size' from a null 'FBasePrefabConfig' DataObject!");
        }
        FBasePrefabConfig local_76;
        local_77 = int(local_76.Size);
        return EPrefabSize(local_77);
    }
    return EPrefabSize(local_77);
}
UFUNCTION()
TSoftClassPtr<UEUIUserWidget> __FBasePrefabConfig_GetUI_CustomSkillInfo(const TDataObjectPtr<FBasePrefabConfig> &inout DataObject)
{
    TSoftClassPtr<UEUIUserWidget> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UI_CustomSkillInfo' from a null 'FBasePrefabConfig' DataObject!");
        }
        FBasePrefabConfig local_76;
        return local_76.UI_CustomSkillInfo;
    }
    return __r;
}
UFUNCTION()
FBasePrefabConfig CastToFBasePrefabConfig(const TDataObjectPtr<FBasePrefabConfig> &inout DataObject)
{
    FBasePrefabConfig __r;
    return __r;
}
}
