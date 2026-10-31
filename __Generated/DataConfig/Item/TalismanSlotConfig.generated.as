namespace __FTalismanSlotConfigFunctions
{
UFUNCTION()
TArray<TDataObjectPtr<FServerConditionConfigBase>> __FTalismanSlotConfig_GetUnlockCondition(const TDataObjectPtr<FTalismanSlotConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UnlockCondition' from a null 'FTalismanSlotConfig' DataObject!");
        }
        FTalismanSlotConfig local_20;
        return local_20.GetUnlockCondition();
    }
    return DataObject.Get().GetUnlockCondition();
}
UFUNCTION()
FTalismanSlotConfig CastToFTalismanSlotConfig(const TDataObjectPtr<FTalismanSlotConfig> &inout DataObject)
{
    FTalismanSlotConfig __r;
    return __r;
}
}
