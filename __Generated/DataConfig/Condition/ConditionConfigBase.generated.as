namespace __FConditionConfigBaseFunctions
{
UFUNCTION()
EConditionConfigType __FConditionConfigBase_GetConfigType(const TDataObjectPtr<FConditionConfigBase> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ConfigType' from a null 'FConditionConfigBase' DataObject!");
        }
        FConditionConfigBase local_16;
        return local_16.ConfigType;
    }
    return DataObject.Get().ConfigType;
}
UFUNCTION()
FConditionConfigBase CastToFConditionConfigBase(const TDataObjectPtr<FConditionConfigBase> &inout DataObject)
{
    FConditionConfigBase __r;
    return __r;
}
}
namespace __FServerConditionConfigBaseFunctions
{
UFUNCTION()
FText __FServerConditionConfigBase_GetConditionTips(const TDataObjectPtr<FServerConditionConfigBase> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ConditionTips' from a null 'FServerConditionConfigBase' DataObject!");
        }
        FServerConditionConfigBase local_20;
        return local_20.ConditionTips;
    }
    return DataObject.Get().ConditionTips;
}
UFUNCTION()
FServerConditionConfigBase CastToFServerConditionConfigBase(const TDataObjectPtr<FServerConditionConfigBase> &inout DataObject)
{
    FServerConditionConfigBase __r;
    return __r;
}
}
