namespace __FGuidePresentationConfigFunctions
{
UFUNCTION()
TDataObjectPtr<FPresentationConfig> __FGuidePresentationConfig_GetPresentationConfig(const TDataObjectPtr<FGuidePresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PresentationConfig' from a null 'FGuidePresentationConfig' DataObject!");
        }
        FGuidePresentationConfig local_68;
        return local_68.GetPresentationConfig();
    }
    return GetPresentationConfig();
}
UFUNCTION()
TDataObjectPtr<FPresentationRuleConfig> __FGuidePresentationConfig_GetPresentationRule(const TDataObjectPtr<FGuidePresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PresentationRule' from a null 'FGuidePresentationConfig' DataObject!");
        }
        FGuidePresentationConfig local_68;
        return local_68.GetPresentationRule();
    }
    return GetPresentationRule();
}
UFUNCTION()
FLinearColor __FGuidePresentationConfig_GetGuideColor(const TDataObjectPtr<FGuidePresentationConfig> &inout DataObject)
{
    FLinearColor __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GuideColor' from a null 'FGuidePresentationConfig' DataObject!");
        }
        FGuidePresentationConfig local_68;
        return local_68.GuideColor;
    }
    return __r;
}
UFUNCTION()
EGuideRegionStyleType __FGuidePresentationConfig_GetRegionStyleType(const TDataObjectPtr<FGuidePresentationConfig> &inout DataObject)
{
    int local_69 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RegionStyleType' from a null 'FGuidePresentationConfig' DataObject!");
        }
        FGuidePresentationConfig local_68;
        local_69 = int(local_68.RegionStyleType);
        return EGuideRegionStyleType(local_69);
    }
    return EGuideRegionStyleType(local_69);
}
UFUNCTION()
FGuidePresentationConfig CastToFGuidePresentationConfig(const TDataObjectPtr<FGuidePresentationConfig> &inout DataObject)
{
    FGuidePresentationConfig __r;
    return __r;
}
}
