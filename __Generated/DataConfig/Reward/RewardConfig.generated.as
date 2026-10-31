namespace __FRewardConfigFunctions
{
UFUNCTION()
ERewardSource __FRewardConfig_GetRewardSource(const TDataObjectPtr<FRewardConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RewardSource' from a null 'FRewardConfig' DataObject!");
        }
        FRewardConfig local_22;
        return local_22.RewardSource;
    }
    return DataObject.Get().RewardSource;
}
UFUNCTION()
TArray<FRewardEntry> __FRewardConfig_GetRewardItems(const TDataObjectPtr<FRewardConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RewardItems' from a null 'FRewardConfig' DataObject!");
        }
        FRewardConfig local_22;
        return local_22.RewardItems;
    }
    return DataObject.Get().RewardItems;
}
UFUNCTION()
bool __FRewardConfig_GetbIsPreviewable(const TDataObjectPtr<FRewardConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bIsPreviewable' from a null 'FRewardConfig' DataObject!");
        }
        FRewardConfig local_22;
        return local_22.bIsPreviewable;
    }
    return DataObject.Get().bIsPreviewable;
}
UFUNCTION()
ERewardClaimType __FRewardConfig_GetClaimType(const TDataObjectPtr<FRewardConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ClaimType' from a null 'FRewardConfig' DataObject!");
        }
        FRewardConfig local_22;
        return local_22.ClaimType;
    }
    return DataObject.Get().ClaimType;
}
UFUNCTION()
FRewardConfig CastToFRewardConfig(const TDataObjectPtr<FRewardConfig> &inout DataObject)
{
    FRewardConfig __r;
    return __r;
}
}
