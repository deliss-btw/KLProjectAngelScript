namespace __FConditionGroupConfigFunctions
{
UFUNCTION()
EConditionGroupOperator __FConditionGroupConfig_GetOperator(const TDataObjectPtr<FConditionGroupConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Operator' from a null 'FConditionGroupConfig' DataObject!");
        }
        FConditionGroupConfig local_24;
        return local_24.Operator;
    }
    return DataObject.Get().Operator;
}
UFUNCTION()
TArray<FConditionSpec> __FConditionGroupConfig_GetConditionSpecs(const TDataObjectPtr<FConditionGroupConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ConditionSpecs' from a null 'FConditionGroupConfig' DataObject!");
        }
        FConditionGroupConfig local_24;
        return local_24.ConditionSpecs;
    }
    return DataObject.Get().ConditionSpecs;
}
UFUNCTION()
FConditionGroupConfig CastToFConditionGroupConfig(const TDataObjectPtr<FConditionGroupConfig> &inout DataObject)
{
    FConditionGroupConfig __r;
    return __r;
}
}
