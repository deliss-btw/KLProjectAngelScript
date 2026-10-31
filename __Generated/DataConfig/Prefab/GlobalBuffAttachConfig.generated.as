namespace __FBuffAttachListConfigFunctions
{
UFUNCTION()
TArray<FBuffConfigRef> __FBuffAttachListConfig_GetBuffs(const TDataObjectPtr<FBuffAttachListConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Buffs' from a null 'FBuffAttachListConfig' DataObject!");
        }
        FBuffAttachListConfig local_18;
        return local_18.Buffs;
    }
    return DataObject.Get().Buffs;
}
UFUNCTION()
FBuffAttachListConfig CastToFBuffAttachListConfig(const TDataObjectPtr<FBuffAttachListConfig> &inout DataObject)
{
    FBuffAttachListConfig __r;
    return __r;
}
}
namespace __FBuffAttachRuleConfigFunctions
{
UFUNCTION()
TArray<FBuffAttachLevelEventMapping> __FBuffAttachRuleConfig_GetLevelEventMappings(const TDataObjectPtr<FBuffAttachRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LevelEventMappings' from a null 'FBuffAttachRuleConfig' DataObject!");
        }
        FBuffAttachRuleConfig local_18;
        return local_18.LevelEventMappings;
    }
    return DataObject.Get().LevelEventMappings;
}
UFUNCTION()
FBuffAttachRuleConfig CastToFBuffAttachRuleConfig(const TDataObjectPtr<FBuffAttachRuleConfig> &inout DataObject)
{
    FBuffAttachRuleConfig __r;
    return __r;
}
}
