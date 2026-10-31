namespace __FHeadsUpDisplayConfigFunctions
{
UFUNCTION()
FPresentationDisplayRule __FHeadsUpDisplayConfig_GetDisplayRule(const TDataObjectPtr<FHeadsUpDisplayConfig> &inout DataObject)
{
    FPresentationDisplayRule __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayRule' from a null 'FHeadsUpDisplayConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FPresentationIcon __FHeadsUpDisplayConfig_GetIcon(const TDataObjectPtr<FHeadsUpDisplayConfig> &inout DataObject)
{
    FPresentationIcon __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Icon' from a null 'FHeadsUpDisplayConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
EHeadsUpDisplayType __FHeadsUpDisplayConfig_GetDisplayType(const TDataObjectPtr<FHeadsUpDisplayConfig> &inout DataObject)
{
    int local_141 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayType' from a null 'FHeadsUpDisplayConfig' DataObject!");
        }
        FHeadsUpDisplayConfig local_140;
        local_141 = int(local_140.DisplayType);
        return EHeadsUpDisplayType(local_141);
    }
    return EHeadsUpDisplayType(local_141);
}
UFUNCTION()
FPresentationDisplayRule __FHeadsUpDisplayConfig_GetNameDisplayRule(const TDataObjectPtr<FHeadsUpDisplayConfig> &inout DataObject)
{
    FPresentationDisplayRule __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'NameDisplayRule' from a null 'FHeadsUpDisplayConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
bool __FHeadsUpDisplayConfig_GetbOnlyShowNameWhenSocialInteraction(const TDataObjectPtr<FHeadsUpDisplayConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bOnlyShowNameWhenSocialInteraction' from a null 'FHeadsUpDisplayConfig' DataObject!");
        }
        FHeadsUpDisplayConfig local_140;
        return local_140.bOnlyShowNameWhenSocialInteraction;
    }
    return local_1;
}
UFUNCTION()
FPresentationDisplayRule __FHeadsUpDisplayConfig_GetAlwaysShowIconRule(const TDataObjectPtr<FHeadsUpDisplayConfig> &inout DataObject)
{
    FPresentationDisplayRule __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AlwaysShowIconRule' from a null 'FHeadsUpDisplayConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
EHeadsUpDisplayRelationType __FHeadsUpDisplayConfig_GetRelationType(const TDataObjectPtr<FHeadsUpDisplayConfig> &inout DataObject)
{
    int local_141 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RelationType' from a null 'FHeadsUpDisplayConfig' DataObject!");
        }
        FHeadsUpDisplayConfig local_140;
        local_141 = int(local_140.RelationType);
        return EHeadsUpDisplayRelationType(local_141);
    }
    return EHeadsUpDisplayRelationType(local_141);
}
UFUNCTION()
FPresentationDisplayRule __FHeadsUpDisplayConfig_GetEnergyDisplayRule(const TDataObjectPtr<FHeadsUpDisplayConfig> &inout DataObject)
{
    FPresentationDisplayRule __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EnergyDisplayRule' from a null 'FHeadsUpDisplayConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FGameAttributeRef __FHeadsUpDisplayConfig_GetEnergyDisplayRuleAttribute(const TDataObjectPtr<FHeadsUpDisplayConfig> &inout DataObject)
{
    FGameAttributeRef __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EnergyDisplayRuleAttribute' from a null 'FHeadsUpDisplayConfig' DataObject!");
        }
        FHeadsUpDisplayConfig local_140;
        return local_140.EnergyDisplayRuleAttribute;
    }
    return __r;
}
UFUNCTION()
FGameAttributeRef __FHeadsUpDisplayConfig_GetEnergyDisplayRuleAttributeMax(const TDataObjectPtr<FHeadsUpDisplayConfig> &inout DataObject)
{
    FGameAttributeRef __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EnergyDisplayRuleAttributeMax' from a null 'FHeadsUpDisplayConfig' DataObject!");
        }
        FHeadsUpDisplayConfig local_140;
        return local_140.EnergyDisplayRuleAttributeMax;
    }
    return __r;
}
UFUNCTION()
FHeadsUpDisplayConfig CastToFHeadsUpDisplayConfig(const TDataObjectPtr<FHeadsUpDisplayConfig> &inout DataObject)
{
    FHeadsUpDisplayConfig __r;
    return __r;
}
}
