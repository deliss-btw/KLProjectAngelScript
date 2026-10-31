namespace __FPresentationRuleConfigFunctions
{
UFUNCTION()
bool __FPresentationRuleConfig_GetbShowMinimapIcon(const TDataObjectPtr<FPresentationRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShowMinimapIcon' from a null 'FPresentationRuleConfig' DataObject!");
        }
        FPresentationRuleConfig local_118;
        return local_118.bShowMinimapIcon;
    }
    return DataObject.Get().bShowMinimapIcon;
}
UFUNCTION()
TDataObjectPtr<FMinimapIconConfig> __FPresentationRuleConfig_GetMinimapIconSettings(const TDataObjectPtr<FPresentationRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MinimapIconSettings' from a null 'FPresentationRuleConfig' DataObject!");
        }
        FPresentationRuleConfig local_118;
        return local_118.GetMinimapIconSettings();
    }
    return DataObject.Get().GetMinimapIconSettings();
}
UFUNCTION()
bool __FPresentationRuleConfig_GetbShowIndicator(const TDataObjectPtr<FPresentationRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShowIndicator' from a null 'FPresentationRuleConfig' DataObject!");
        }
        FPresentationRuleConfig local_118;
        return local_118.bShowIndicator;
    }
    return DataObject.Get().bShowIndicator;
}
UFUNCTION()
TDataObjectPtr<FIndicatorConfig> __FPresentationRuleConfig_GetIndicatorConfig(const TDataObjectPtr<FPresentationRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IndicatorConfig' from a null 'FPresentationRuleConfig' DataObject!");
        }
        FPresentationRuleConfig local_118;
        return local_118.GetIndicatorConfig();
    }
    return DataObject.Get().GetIndicatorConfig();
}
UFUNCTION()
bool __FPresentationRuleConfig_GetbShowNavigationBarIcon(const TDataObjectPtr<FPresentationRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShowNavigationBarIcon' from a null 'FPresentationRuleConfig' DataObject!");
        }
        FPresentationRuleConfig local_118;
        return local_118.bShowNavigationBarIcon;
    }
    return DataObject.Get().bShowNavigationBarIcon;
}
UFUNCTION()
TDataObjectPtr<FNavigationBarIconConfig> __FPresentationRuleConfig_GetNavigationBarIconConfig(const TDataObjectPtr<FPresentationRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'NavigationBarIconConfig' from a null 'FPresentationRuleConfig' DataObject!");
        }
        FPresentationRuleConfig local_118;
        return local_118.GetNavigationBarIconConfig();
    }
    return DataObject.Get().GetNavigationBarIconConfig();
}
UFUNCTION()
bool __FPresentationRuleConfig_GetbShowHeadsUpDisplay(const TDataObjectPtr<FPresentationRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShowHeadsUpDisplay' from a null 'FPresentationRuleConfig' DataObject!");
        }
        FPresentationRuleConfig local_118;
        return local_118.bShowHeadsUpDisplay;
    }
    return DataObject.Get().bShowHeadsUpDisplay;
}
UFUNCTION()
TDataObjectPtr<FHeadsUpDisplayConfig> __FPresentationRuleConfig_GetHeadsUpDisplayConfig(const TDataObjectPtr<FPresentationRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HeadsUpDisplayConfig' from a null 'FPresentationRuleConfig' DataObject!");
        }
        FPresentationRuleConfig local_118;
        return local_118.GetHeadsUpDisplayConfig();
    }
    return DataObject.Get().GetHeadsUpDisplayConfig();
}
UFUNCTION()
FPresentationRuleConfig CastToFPresentationRuleConfig(const TDataObjectPtr<FPresentationRuleConfig> &inout DataObject)
{
    FPresentationRuleConfig __r;
    return __r;
}
}
