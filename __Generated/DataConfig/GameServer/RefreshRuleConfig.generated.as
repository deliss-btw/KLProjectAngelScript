namespace __FRefreshRuleConfigFunctions
{
UFUNCTION()
ERefreshRuleType __FRefreshRuleConfig_GetRuleType(const TDataObjectPtr<FRefreshRuleConfig> &inout DataObject)
{
    int local_33 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RuleType' from a null 'FRefreshRuleConfig' DataObject!");
        }
        FRefreshRuleConfig local_32;
        local_33 = int(local_32.RuleType);
        return ERefreshRuleType(local_33);
    }
    return ERefreshRuleType(local_33);
}
UFUNCTION()
FText __FRefreshRuleConfig_GetDescription(const TDataObjectPtr<FRefreshRuleConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FRefreshRuleConfig' DataObject!");
        }
        FRefreshRuleConfig local_32;
        return local_32.Description;
    }
    return __r;
}
UFUNCTION()
FString __FRefreshRuleConfig_GetDateParam(const TDataObjectPtr<FRefreshRuleConfig> &inout DataObject)
{
    FString __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DateParam' from a null 'FRefreshRuleConfig' DataObject!");
        }
        FRefreshRuleConfig local_32;
        return local_32.DateParam;
    }
    return __r;
}
UFUNCTION()
FString __FRefreshRuleConfig_GetIntervalTime(const TDataObjectPtr<FRefreshRuleConfig> &inout DataObject)
{
    FString __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IntervalTime' from a null 'FRefreshRuleConfig' DataObject!");
        }
        FRefreshRuleConfig local_32;
        return local_32.IntervalTime;
    }
    return __r;
}
UFUNCTION()
FRefreshRuleConfig CastToFRefreshRuleConfig(const TDataObjectPtr<FRefreshRuleConfig> &inout DataObject)
{
    FRefreshRuleConfig __r;
    return __r;
}
}
