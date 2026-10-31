namespace __FMetaBuffConfigFunctions
{
UFUNCTION()
FBuffConfigRef __FMetaBuffConfig_GetBuffConfig(const TDataObjectPtr<FMetaBuffConfig> &inout DataObject)
{
    FBuffConfigRef __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BuffConfig' from a null 'FMetaBuffConfig' DataObject!");
        }
        FMetaBuffConfig local_42;
        return local_42.BuffConfig;
    }
    return __r;
}
UFUNCTION()
EMetaBuffSlot __FMetaBuffConfig_GetMetaBuffSlot(const TDataObjectPtr<FMetaBuffConfig> &inout DataObject)
{
    int local_43 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MetaBuffSlot' from a null 'FMetaBuffConfig' DataObject!");
        }
        FMetaBuffConfig local_42;
        local_43 = int(local_42.MetaBuffSlot);
        return EMetaBuffSlot(local_43);
    }
    return EMetaBuffSlot(local_43);
}
UFUNCTION()
int __FMetaBuffConfig_GetDuration(const TDataObjectPtr<FMetaBuffConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Duration' from a null 'FMetaBuffConfig' DataObject!");
        }
        FMetaBuffConfig defaultValue;
        return defaultValue.Duration;
    }
    return DataObject.Get().Duration;
}
UFUNCTION()
FMetaBuffConfig CastToFMetaBuffConfig(const TDataObjectPtr<FMetaBuffConfig> &inout DataObject)
{
    FMetaBuffConfig __r;
    return __r;
}
}
namespace __FMetaBuffCapabilityConfigFunctions
{
UFUNCTION()
TDataObjectPtr<FCapabilityConfig> __FMetaBuffCapabilityConfig_GetCapabilityConfig(const TDataObjectPtr<FMetaBuffCapabilityConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CapabilityConfig' from a null 'FMetaBuffCapabilityConfig' DataObject!");
        }
        FMetaBuffCapabilityConfig local_42;
        return local_42.GetCapabilityConfig();
    }
    return GetCapabilityConfig();
}
UFUNCTION()
int __FMetaBuffCapabilityConfig_GetLevel(const TDataObjectPtr<FMetaBuffCapabilityConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Level' from a null 'FMetaBuffCapabilityConfig' DataObject!");
        }
        FMetaBuffCapabilityConfig defaultValue;
        return defaultValue.Level;
    }
    return DataObject.Get().Level;
}
UFUNCTION()
FMetaBuffCapabilityConfig CastToFMetaBuffCapabilityConfig(const TDataObjectPtr<FMetaBuffCapabilityConfig> &inout DataObject)
{
    FMetaBuffCapabilityConfig __r;
    return __r;
}
}
