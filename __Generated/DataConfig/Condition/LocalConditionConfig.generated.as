namespace __FLocalConditionConfigBaseFunctions
{
UFUNCTION()
ELocalConditionConfigType __FLocalConditionConfigBase_GetLocalConditionType(const TDataObjectPtr<FLocalConditionConfigBase> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LocalConditionType' from a null 'FLocalConditionConfigBase' DataObject!");
        }
        FLocalConditionConfigBase local_18;
        return local_18.LocalConditionType;
    }
    return DataObject.Get().LocalConditionType;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ConditionTypeDefineConfig' from a null 'FLocalConditionConfig' DataObject!");
        }
        FLocalConditionConfig local_24;
        return local_24.ConditionTypeDefineConfig;
    }
    return DataObject.Get().ConditionTypeDefineConfig;
}
UFUNCTION()
ECondCmpType __FLocalConditionConfig_GetCompareType(const TDataObjectPtr<FLocalConditionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CompareType' from a null 'FLocalConditionConfig' DataObject!");
        }
        FLocalConditionConfig local_24;
        return local_24.CompareType;
    }
    return DataObject.Get().CompareType;
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
