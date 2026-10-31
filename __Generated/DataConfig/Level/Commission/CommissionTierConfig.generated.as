namespace __FCommissionTierConfigFunctions
{
UFUNCTION()
ECommissionTier __FCommissionTierConfig_GetTier(const TDataObjectPtr<FCommissionTierConfig> &inout DataObject)
{
    int local_25 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Tier' from a null 'FCommissionTierConfig' DataObject!");
        }
        FCommissionTierConfig local_24;
        local_25 = int(local_24.Tier);
        return ECommissionTier(local_25);
    }
    return ECommissionTier(local_25);
}
UFUNCTION()
FText __FCommissionTierConfig_GetTierName(const TDataObjectPtr<FCommissionTierConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TierName' from a null 'FCommissionTierConfig' DataObject!");
        }
        FCommissionTierConfig local_24;
        return local_24.TierName;
    }
    return __r;
}
UFUNCTION()
FLinearColor __FCommissionTierConfig_GetTierColor(const TDataObjectPtr<FCommissionTierConfig> &inout DataObject)
{
    FLinearColor __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TierColor' from a null 'FCommissionTierConfig' DataObject!");
        }
        FCommissionTierConfig local_24;
        return local_24.TierColor;
    }
    return __r;
}
UFUNCTION()
FCommissionTierConfig CastToFCommissionTierConfig(const TDataObjectPtr<FCommissionTierConfig> &inout DataObject)
{
    FCommissionTierConfig __r;
    return __r;
}
}
