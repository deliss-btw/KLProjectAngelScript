namespace __FCommissionTierConfigFunctions
{
UFUNCTION()
ECommissionTier __FCommissionTierConfig_GetTier(const TDataObjectPtr<FCommissionTierConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Tier' from a null 'FCommissionTierConfig' DataObject!");
        }
        FCommissionTierConfig local_24;
        return local_24.Tier;
    }
    return DataObject.Get().Tier;
}
UFUNCTION()
FText __FCommissionTierConfig_GetTierName(const TDataObjectPtr<FCommissionTierConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TierName' from a null 'FCommissionTierConfig' DataObject!");
        }
        FCommissionTierConfig local_24;
        return local_24.TierName;
    }
    return DataObject.Get().TierName;
}
UFUNCTION()
FLinearColor __FCommissionTierConfig_GetTierColor(const TDataObjectPtr<FCommissionTierConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TierColor' from a null 'FCommissionTierConfig' DataObject!");
        }
        FCommissionTierConfig local_24;
        return local_24.TierColor;
    }
    return DataObject.Get().TierColor;
}
UFUNCTION()
FCommissionTierConfig CastToFCommissionTierConfig(const TDataObjectPtr<FCommissionTierConfig> &inout DataObject)
{
    FCommissionTierConfig __r;
    return __r;
}
}
