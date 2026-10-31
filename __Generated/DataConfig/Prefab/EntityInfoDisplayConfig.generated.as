namespace __FEntityInfoDisplayConfigFunctions
{
UFUNCTION()
FEntityInfoDisplayCondition __FEntityInfoDisplayConfig_GetDefault(const TDataObjectPtr<FEntityInfoDisplayConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Default' from a null 'FEntityInfoDisplayConfig' DataObject!");
        }
        FEntityInfoDisplayConfig local_36;
        return local_36.Default;
    }
    return DataObject.Get().Default;
}
UFUNCTION()
TMap<EFactionRelation, FEntityInfoDisplayCondition> __FEntityInfoDisplayConfig_GetOverrideByRelation(const TDataObjectPtr<FEntityInfoDisplayConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'OverrideByRelation' from a null 'FEntityInfoDisplayConfig' DataObject!");
        }
        FEntityInfoDisplayConfig local_36;
        return local_36.OverrideByRelation;
    }
    return DataObject.Get().OverrideByRelation;
}
UFUNCTION()
FEntityInfoDisplayConfig CastToFEntityInfoDisplayConfig(const TDataObjectPtr<FEntityInfoDisplayConfig> &inout DataObject)
{
    FEntityInfoDisplayConfig __r;
    return __r;
}
}
