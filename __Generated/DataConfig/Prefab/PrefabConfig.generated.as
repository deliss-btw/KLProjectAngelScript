namespace __FBasePrefabConfigFunctions
{
UFUNCTION()
FText __FBasePrefabConfig_GetDisplayName(const TDataObjectPtr<FBasePrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayName' from a null 'FBasePrefabConfig' DataObject!");
        }
        FBasePrefabConfig local_76;
        return local_76.DisplayName;
    }
    return DataObject.Get().DisplayName;
}
UFUNCTION()
FSoftBrush __FBasePrefabConfig_GetDisplayIcon(const TDataObjectPtr<FBasePrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayIcon' from a null 'FBasePrefabConfig' DataObject!");
        }
        FBasePrefabConfig local_76;
        return local_76.DisplayIcon;
    }
    return DataObject.Get().DisplayIcon;
}
UFUNCTION()
EPrefabSize __FBasePrefabConfig_GetSize(const TDataObjectPtr<FBasePrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Size' from a null 'FBasePrefabConfig' DataObject!");
        }
        FBasePrefabConfig local_76;
        return local_76.Size;
    }
    return DataObject.Get().Size;
}
UFUNCTION()
TSoftClassPtr<UEUIUserWidget> __FBasePrefabConfig_GetUI_CustomSkillInfo(const TDataObjectPtr<FBasePrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UI_CustomSkillInfo' from a null 'FBasePrefabConfig' DataObject!");
        }
        FBasePrefabConfig local_76;
        return local_76.UI_CustomSkillInfo;
    }
    return DataObject.Get().UI_CustomSkillInfo;
}
UFUNCTION()
FBasePrefabConfig CastToFBasePrefabConfig(const TDataObjectPtr<FBasePrefabConfig> &inout DataObject)
{
    FBasePrefabConfig __r;
    return __r;
}
}
