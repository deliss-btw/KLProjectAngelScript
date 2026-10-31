namespace __FOpenTimeRangeFunctions
{
UFUNCTION()
EOpenTimeRuleType __FOpenTimeRange_GetRuleType(const TDataObjectPtr<FOpenTimeRange> &inout DataObject)
{
    int local_27 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RuleType' from a null 'FOpenTimeRange' DataObject!");
        }
        FOpenTimeRange local_26;
        local_27 = int(local_26.RuleType);
        return EOpenTimeRuleType(local_27);
    }
    return EOpenTimeRuleType(local_27);
}
UFUNCTION()
FString __FOpenTimeRange_GetTime(const TDataObjectPtr<FOpenTimeRange> &inout DataObject)
{
    FString __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Time' from a null 'FOpenTimeRange' DataObject!");
        }
        FOpenTimeRange local_26;
        return local_26.Time;
    }
    return __r;
}
UFUNCTION()
FString __FOpenTimeRange_GetDateParam(const TDataObjectPtr<FOpenTimeRange> &inout DataObject)
{
    FString __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DateParam' from a null 'FOpenTimeRange' DataObject!");
        }
        FOpenTimeRange local_26;
        return local_26.DateParam;
    }
    return __r;
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
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bUseUtc0' from a null 'FOpenTimeRange' DataObject!");
        }
        FOpenTimeRange local_26;
        return local_26.bUseUtc0;
    }
    return local_1;
}
UFUNCTION()
FOpenTimeRange CastToFOpenTimeRange(const TDataObjectPtr<FOpenTimeRange> &inout DataObject)
{
    FOpenTimeRange __r;
    return __r;
}
}
