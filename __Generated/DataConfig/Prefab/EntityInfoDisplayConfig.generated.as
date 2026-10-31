namespace __FEntityInfoDisplayConfigFunctions
{
UFUNCTION()
FEntityInfoDisplayCondition __FEntityInfoDisplayConfig_GetDefault(const TDataObjectPtr<FEntityInfoDisplayConfig> &inout DataObject)
{
    FEntityInfoDisplayCondition __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Default' from a null 'FEntityInfoDisplayConfig' DataObject!");
        }
        FEntityInfoDisplayConfig local_36;
        return local_36.Default;
    }
    return __r;
}
UFUNCTION()
TMap<EFactionRelation, FEntityInfoDisplayCondition> __FEntityInfoDisplayConfig_GetOverrideByRelation(const TDataObjectPtr<FEntityInfoDisplayConfig> &inout DataObject)
{
    TMap<EFactionRelation, FEntityInfoDisplayCondition> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'OverrideByRelation' from a null 'FEntityInfoDisplayConfig' DataObject!");
        }
        FEntityInfoDisplayConfig local_36;
        return local_36.OverrideByRelation;
    }
    return __r;
}
UFUNCTION()
FEntityInfoDisplayConfig CastToFEntityInfoDisplayConfig(const TDataObjectPtr<FEntityInfoDisplayConfig> &inout DataObject)
{
    FEntityInfoDisplayConfig __r;
    return __r;
}
}
