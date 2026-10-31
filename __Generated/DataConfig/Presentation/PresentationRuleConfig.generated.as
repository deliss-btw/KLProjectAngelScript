namespace __FPresentationRuleConfigFunctions
{
UFUNCTION()
bool __FPresentationRuleConfig_GetbShowMinimapIcon(const TDataObjectPtr<FPresentationRuleConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShowMinimapIcon' from a null 'FPresentationRuleConfig' DataObject!");
        }
        FPresentationRuleConfig local_118;
        return local_118.bShowMinimapIcon;
    }
    return local_1;
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
    return GetMinimapIconSettings();
}
UFUNCTION()
bool __FPresentationRuleConfig_GetbShowIndicator(const TDataObjectPtr<FPresentationRuleConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShowIndicator' from a null 'FPresentationRuleConfig' DataObject!");
        }
        FPresentationRuleConfig local_118;
        return local_118.bShowIndicator;
    }
    return local_1;
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
    return GetIndicatorConfig();
}
UFUNCTION()
bool __FPresentationRuleConfig_GetbShowNavigationBarIcon(const TDataObjectPtr<FPresentationRuleConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShowNavigationBarIcon' from a null 'FPresentationRuleConfig' DataObject!");
        }
        FPresentationRuleConfig local_118;
        return local_118.bShowNavigationBarIcon;
    }
    return local_1;
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
    return GetNavigationBarIconConfig();
}
UFUNCTION()
bool __FPresentationRuleConfig_GetbShowHeadsUpDisplay(const TDataObjectPtr<FPresentationRuleConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShowHeadsUpDisplay' from a null 'FPresentationRuleConfig' DataObject!");
        }
        FPresentationRuleConfig local_118;
        return local_118.bShowHeadsUpDisplay;
    }
    return local_1;
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
    return GetHeadsUpDisplayConfig();
}
UFUNCTION()
FPresentationRuleConfig CastToFPresentationRuleConfig(const TDataObjectPtr<FPresentationRuleConfig> &inout DataObject)
{
    FPresentationRuleConfig __r;
    return __r;
}
}
