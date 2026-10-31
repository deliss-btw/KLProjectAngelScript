namespace __FIndicatorConfigFunctions
{
UFUNCTION()
FPresentationDisplayRule __FIndicatorConfig_GetDisplayRule(const TDataObjectPtr<FIndicatorConfig> &inout DataObject)
{
    FPresentationDisplayRule __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayRule' from a null 'FIndicatorConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FPresentationIcon __FIndicatorConfig_GetIcon(const TDataObjectPtr<FIndicatorConfig> &inout DataObject)
{
    FPresentationIcon __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Icon' from a null 'FIndicatorConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FPresentationDisplayRule __FIndicatorConfig_GetDistanceTextDisplayRule(const TDataObjectPtr<FIndicatorConfig> &inout DataObject)
{
    FPresentationDisplayRule __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DistanceTextDisplayRule' from a null 'FIndicatorConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FLinearColor __FIndicatorConfig_GetArrowColor(const TDataObjectPtr<FIndicatorConfig> &inout DataObject)
{
    FLinearColor __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ArrowColor' from a null 'FIndicatorConfig' DataObject!");
        }
        FIndicatorConfig local_92;
        return local_92.ArrowColor;
    }
    return __r;
}
UFUNCTION()
FIndicatorConfig CastToFIndicatorConfig(const TDataObjectPtr<FIndicatorConfig> &inout DataObject)
{
    FIndicatorConfig __r;
    return __r;
}
}
