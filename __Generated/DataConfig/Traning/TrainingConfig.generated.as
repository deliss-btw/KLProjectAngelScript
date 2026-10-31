namespace __FTrainingInfoConfigFunctions
{
UFUNCTION()
TArray<TDataObjectPtr<FAvatarBuildOverrideConfig>> __FTrainingInfoConfig_GetTrainingAvatarConfigs(const TDataObjectPtr<FTrainingInfoConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TrainingAvatarConfigs' from a null 'FTrainingInfoConfig' DataObject!");
        }
        FTrainingInfoConfig local_86;
        return local_86.GetTrainingAvatarConfigs();
    }
    return GetTrainingAvatarConfigs();
}
UFUNCTION()
TDataObjectPtr<FLevelInfoConfig> __FTrainingInfoConfig_GetLevelInfoConfig(const TDataObjectPtr<FTrainingInfoConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LevelInfoConfig' from a null 'FTrainingInfoConfig' DataObject!");
        }
        FTrainingInfoConfig local_86;
        return local_86.GetLevelInfoConfig();
    }
    return GetLevelInfoConfig();
}
UFUNCTION()
TSoftClassPtr<AKLLevelScriptActor> __FTrainingInfoConfig_GetLBPClass(const TDataObjectPtr<FTrainingInfoConfig> &inout DataObject)
{
    TSoftClassPtr<AKLLevelScriptActor> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LBPClass' from a null 'FTrainingInfoConfig' DataObject!");
        }
        FTrainingInfoConfig local_86;
        return local_86.LBPClass;
    }
    return __r;
}
UFUNCTION()
FText __FTrainingInfoConfig_GetTrainingName(const TDataObjectPtr<FTrainingInfoConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TrainingName' from a null 'FTrainingInfoConfig' DataObject!");
        }
        FTrainingInfoConfig local_86;
        return local_86.TrainingName;
    }
    return __r;
}
UFUNCTION()
TArray<TDataObjectPtr<FServerConditionConfigBase>> __FTrainingInfoConfig_GetUnlockCondition(const TDataObjectPtr<FTrainingInfoConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UnlockCondition' from a null 'FTrainingInfoConfig' DataObject!");
        }
        FTrainingInfoConfig local_86;
        return local_86.GetUnlockCondition();
    }
    return GetUnlockCondition();
}
UFUNCTION()
TDataObjectPtr<FRewardConfig> __FTrainingInfoConfig_GetFinishReward(const TDataObjectPtr<FTrainingInfoConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FinishReward' from a null 'FTrainingInfoConfig' DataObject!");
        }
        FTrainingInfoConfig local_86;
        return local_86.GetFinishReward();
    }
    return GetFinishReward();
}
UFUNCTION()
FTrainingInfoConfig CastToFTrainingInfoConfig(const TDataObjectPtr<FTrainingInfoConfig> &inout DataObject)
{
    FTrainingInfoConfig __r;
    return __r;
}
}
