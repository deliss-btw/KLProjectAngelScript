namespace __FLocalConditionConfigBaseFunctions
{
UFUNCTION()
ELocalConditionConfigType __FLocalConditionConfigBase_GetLocalConditionType(const TDataObjectPtr<FLocalConditionConfigBase> &inout DataObject)
{
    int local_19 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LocalConditionType' from a null 'FLocalConditionConfigBase' DataObject!");
        }
        FLocalConditionConfigBase local_18;
        local_19 = int(local_18.LocalConditionType);
        return ELocalConditionConfigType(local_19);
    }
    return ELocalConditionConfigType(local_19);
}
UFUNCTION()
FLocalConditionConfigBase CastToFLocalConditionConfigBase(const TDataObjectPtr<FLocalConditionConfigBase> &inout DataObject)
{
    FLocalConditionConfigBase __r;
    return __r;
}
}
namespace __FLocalConditionConfigFunctions
{
UFUNCTION()
FInstancedStruct __FLocalConditionConfig_GetConditionTypeDefineConfig(const TDataObjectPtr<FLocalConditionConfig> &inout DataObject)
{
    FInstancedStruct __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ConditionTypeDefineConfig' from a null 'FLocalConditionConfig' DataObject!");
        }
        FLocalConditionConfig local_24;
        return local_24.ConditionTypeDefineConfig;
    }
    return __r;
}
UFUNCTION()
ECondCmpType __FLocalConditionConfig_GetCompareType(const TDataObjectPtr<FLocalConditionConfig> &inout DataObject)
{
    int local_25 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CompareType' from a null 'FLocalConditionConfig' DataObject!");
        }
        FLocalConditionConfig local_24;
        local_25 = int(local_24.CompareType);
        return ECondCmpType(local_25);
    }
    return ECondCmpType(local_25);
}
UFUNCTION()
int __FLocalConditionConfig_GetTargetValue(const TDataObjectPtr<FLocalConditionConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TargetValue' from a null 'FLocalConditionConfig' DataObject!");
        }
        FLocalConditionConfig defaultValue;
        return defaultValue.TargetValue;
    }
    return DataObject.Get().TargetValue;
}
UFUNCTION()
FLocalConditionConfig CastToFLocalConditionConfig(const TDataObjectPtr<FLocalConditionConfig> &inout DataObject)
{
    FLocalConditionConfig __r;
    return __r;
}
}
