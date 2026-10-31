namespace __FConditionGroupConfigFunctions
{
UFUNCTION()
EConditionGroupOperator __FConditionGroupConfig_GetOperator(const TDataObjectPtr<FConditionGroupConfig> &inout DataObject)
{
    int local_25 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Operator' from a null 'FConditionGroupConfig' DataObject!");
        }
        FConditionGroupConfig local_24;
        local_25 = int(local_24.Operator);
        return EConditionGroupOperator(local_25);
    }
    return EConditionGroupOperator(local_25);
}
UFUNCTION()
TArray<FConditionSpec> __FConditionGroupConfig_GetConditionSpecs(const TDataObjectPtr<FConditionGroupConfig> &inout DataObject)
{
    TArray<FConditionSpec> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ConditionSpecs' from a null 'FConditionGroupConfig' DataObject!");
        }
        FConditionGroupConfig local_24;
        return local_24.ConditionSpecs;
    }
    return __r;
}
UFUNCTION()
FConditionGroupConfig CastToFConditionGroupConfig(const TDataObjectPtr<FConditionGroupConfig> &inout DataObject)
{
    FConditionGroupConfig __r;
    return __r;
}
}
