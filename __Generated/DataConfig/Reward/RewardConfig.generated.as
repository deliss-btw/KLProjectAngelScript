namespace __FRewardConfigFunctions
{
UFUNCTION()
ERewardSource __FRewardConfig_GetRewardSource(const TDataObjectPtr<FRewardConfig> &inout DataObject)
{
    int local_23 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RewardSource' from a null 'FRewardConfig' DataObject!");
        }
        FRewardConfig local_22;
        local_23 = int(local_22.RewardSource);
        return ERewardSource(local_23);
    }
    return ERewardSource(local_23);
}
UFUNCTION()
TArray<FRewardEntry> __FRewardConfig_GetRewardItems(const TDataObjectPtr<FRewardConfig> &inout DataObject)
{
    TArray<FRewardEntry> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RewardItems' from a null 'FRewardConfig' DataObject!");
        }
        FRewardConfig local_22;
        return local_22.RewardItems;
    }
    return __r;
}
UFUNCTION()
bool __FRewardConfig_GetbIsPreviewable(const TDataObjectPtr<FRewardConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bIsPreviewable' from a null 'FRewardConfig' DataObject!");
        }
        FRewardConfig local_22;
        return local_22.bIsPreviewable;
    }
    return local_1;
}
UFUNCTION()
ERewardClaimType __FRewardConfig_GetClaimType(const TDataObjectPtr<FRewardConfig> &inout DataObject)
{
    int local_23 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ClaimType' from a null 'FRewardConfig' DataObject!");
        }
        FRewardConfig local_22;
        local_23 = int(local_22.ClaimType);
        return ERewardClaimType(local_23);
    }
    return ERewardClaimType(local_23);
}
UFUNCTION()
FRewardConfig CastToFRewardConfig(const TDataObjectPtr<FRewardConfig> &inout DataObject)
{
    FRewardConfig __r;
    return __r;
}
}
