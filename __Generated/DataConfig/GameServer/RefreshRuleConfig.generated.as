namespace __FRefreshRuleConfigFunctions
{
UFUNCTION()
ERefreshRuleType __FRefreshRuleConfig_GetRuleType(const TDataObjectPtr<FRefreshRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RuleType' from a null 'FRefreshRuleConfig' DataObject!");
        }
        FRefreshRuleConfig local_32;
        return local_32.RuleType;
    }
    return DataObject.Get().RuleType;
}
UFUNCTION()
FText __FRefreshRuleConfig_GetDescription(const TDataObjectPtr<FRefreshRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FRefreshRuleConfig' DataObject!");
        }
        FRefreshRuleConfig local_32;
        return local_32.Description;
    }
    return DataObject.Get().Description;
}
UFUNCTION()
FString __FRefreshRuleConfig_GetDateParam(const TDataObjectPtr<FRefreshRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DateParam' from a null 'FRefreshRuleConfig' DataObject!");
        }
        FRefreshRuleConfig local_32;
        return local_32.DateParam;
    }
    return DataObject.Get().DateParam;
}
UFUNCTION()
FString __FRefreshRuleConfig_GetIntervalTime(const TDataObjectPtr<FRefreshRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IntervalTime' from a null 'FRefreshRuleConfig' DataObject!");
        }
        FRefreshRuleConfig local_32;
        return local_32.IntervalTime;
    }
    return DataObject.Get().IntervalTime;
}
UFUNCTION()
FRefreshRuleConfig CastToFRefreshRuleConfig(const TDataObjectPtr<FRefreshRuleConfig> &inout DataObject)
{
    FRefreshRuleConfig __r;
    return __r;
}
}
