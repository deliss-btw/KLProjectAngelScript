namespace __FOpenTimeRangeFunctions
{
UFUNCTION()
EOpenTimeRuleType __FOpenTimeRange_GetRuleType(const TDataObjectPtr<FOpenTimeRange> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RuleType' from a null 'FOpenTimeRange' DataObject!");
        }
        FOpenTimeRange local_26;
        return local_26.RuleType;
    }
    return DataObject.Get().RuleType;
}
UFUNCTION()
FString __FOpenTimeRange_GetTime(const TDataObjectPtr<FOpenTimeRange> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Time' from a null 'FOpenTimeRange' DataObject!");
        }
        FOpenTimeRange local_26;
        return local_26.Time;
    }
    return DataObject.Get().Time;
}
UFUNCTION()
FString __FOpenTimeRange_GetDateParam(const TDataObjectPtr<FOpenTimeRange> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DateParam' from a null 'FOpenTimeRange' DataObject!");
        }
        FOpenTimeRange local_26;
        return local_26.DateParam;
    }
    return DataObject.Get().DateParam;
}
UFUNCTION()
int __FOpenTimeRange_GetDurationSeconds(const TDataObjectPtr<FOpenTimeRange> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DurationSeconds' from a null 'FOpenTimeRange' DataObject!");
        }
        FOpenTimeRange defaultValue;
        return defaultValue.DurationSeconds;
    }
    return DataObject.Get().DurationSeconds;
}
UFUNCTION()
bool __FOpenTimeRange_GetbUseUtc0(const TDataObjectPtr<FOpenTimeRange> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bUseUtc0' from a null 'FOpenTimeRange' DataObject!");
        }
        FOpenTimeRange local_26;
        return local_26.bUseUtc0;
    }
    return DataObject.Get().bUseUtc0;
}
UFUNCTION()
FOpenTimeRange CastToFOpenTimeRange(const TDataObjectPtr<FOpenTimeRange> &inout DataObject)
{
    FOpenTimeRange __r;
    return __r;
}
}
