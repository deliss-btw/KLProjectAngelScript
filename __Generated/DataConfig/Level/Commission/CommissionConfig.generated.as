namespace __FCommissionGroupConfigFunctions
{
UFUNCTION()
FText __FCommissionGroupConfig_GetDescription(const TDataObjectPtr<FCommissionGroupConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FCommissionGroupConfig' DataObject!");
        }
        FCommissionGroupConfig local_22;
        return local_22.Description;
    }
    return DataObject.Get().Description;
}
UFUNCTION()
bool __FCommissionGroupConfig_GetCanRepeat(const TDataObjectPtr<FCommissionGroupConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CanRepeat' from a null 'FCommissionGroupConfig' DataObject!");
        }
        FCommissionGroupConfig local_22;
        return local_22.CanRepeat;
    }
    return DataObject.Get().CanRepeat;
}
UFUNCTION()
FCommissionGroupConfig CastToFCommissionGroupConfig(const TDataObjectPtr<FCommissionGroupConfig> &inout DataObject)
{
    FCommissionGroupConfig __r;
    return __r;
}
}
namespace __FCommissionConfigFunctions
{
UFUNCTION()
FText __FCommissionConfig_GetCommissionName(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionName' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.CommissionName;
    }
    return DataObject.Get().CommissionName;
}
UFUNCTION()
FText __FCommissionConfig_GetCommissionAimDesc(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionAimDesc' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.CommissionAimDesc;
    }
    return DataObject.Get().CommissionAimDesc;
}
UFUNCTION()
FText __FCommissionConfig_GetCommissionDetail(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionDetail' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.CommissionDetail;
    }
    return DataObject.Get().CommissionDetail;
}
UFUNCTION()
ECommissionType __FCommissionConfig_GetCommissionType(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionType' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.CommissionType;
    }
    return DataObject.Get().CommissionType;
}
UFUNCTION()
bool __FCommissionConfig_GetbDisableRecruitSend(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bDisableRecruitSend' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.bDisableRecruitSend;
    }
    return DataObject.Get().bDisableRecruitSend;
}
UFUNCTION()
bool __FCommissionConfig_GetbAllowMatchmakingEntry(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bAllowMatchmakingEntry' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.bAllowMatchmakingEntry;
    }
    return DataObject.Get().bAllowMatchmakingEntry;
}
UFUNCTION()
TDataObjectPtr<FPveCommissionMatchConfig> __FCommissionConfig_GetOverrideMatchConfig(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'OverrideMatchConfig' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.GetOverrideMatchConfig();
    }
    return DataObject.Get().GetOverrideMatchConfig();
}
UFUNCTION()
ECommissionLoadingDisplayMode __FCommissionConfig_GetObjectiveDisplayMode(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ObjectiveDisplayMode' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.ObjectiveDisplayMode;
    }
    return DataObject.Get().ObjectiveDisplayMode;
}
UFUNCTION()
ECommissionLoadingDisplayMode __FCommissionConfig_GetFailConditionDisplayMode(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FailConditionDisplayMode' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.FailConditionDisplayMode;
    }
    return DataObject.Get().FailConditionDisplayMode;
}
UFUNCTION()
FSoftBrush __FCommissionConfig_GetCommissionIcon(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionIcon' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.CommissionIcon;
    }
    return DataObject.Get().CommissionIcon;
}
UFUNCTION()
bool __FCommissionConfig_GetDefaultActive(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultActive' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.DefaultActive;
    }
    return DataObject.Get().DefaultActive;
}
UFUNCTION()
TDataObjectPtr<FServerConditionConfigBase> __FCommissionConfig_GetActiveCond(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ActiveCond' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.GetActiveCond();
    }
    return DataObject.Get().GetActiveCond();
}
UFUNCTION()
int __FCommissionConfig_GetCommissionStars(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionStars' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig defaultValue;
        return defaultValue.CommissionStars;
    }
    return DataObject.Get().CommissionStars;
}
UFUNCTION()
int __FCommissionConfig_GetRecommendedLevel(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RecommendedLevel' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig defaultValue;
        return defaultValue.RecommendedLevel;
    }
    return DataObject.Get().RecommendedLevel;
}
UFUNCTION()
int __FCommissionConfig_GetMaxDeathCount(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxDeathCount' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig defaultValue;
        return defaultValue.MaxDeathCount;
    }
    return DataObject.Get().MaxDeathCount;
}
UFUNCTION()
float32 __FCommissionConfig_GetCommissionTimeLimit(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionTimeLimit' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig defaultValue;
        return defaultValue.CommissionTimeLimit;
    }
    return DataObject.Get().CommissionTimeLimit;
}
UFUNCTION()
float32 __FCommissionConfig_GetCommissionDayTime(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionDayTime' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig defaultValue;
        return defaultValue.CommissionDayTime;
    }
    return DataObject.Get().CommissionDayTime;
}
UFUNCTION()
bool __FCommissionConfig_GetbLockDayTime(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bLockDayTime' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.bLockDayTime;
    }
    return DataObject.Get().bLockDayTime;
}
UFUNCTION()
TDataObjectPtr<FObjectiveConfig> __FCommissionConfig_GetCommissionTargetObjective(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionTargetObjective' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.GetCommissionTargetObjective();
    }
    return DataObject.Get().GetCommissionTargetObjective();
}
UFUNCTION()
TDataObjectPtr<FObjectiveConfig> __FCommissionConfig_GetCommissionSubTargetObjective(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionSubTargetObjective' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.GetCommissionSubTargetObjective();
    }
    return DataObject.Get().GetCommissionSubTargetObjective();
}
UFUNCTION()
TDataObjectPtr<FDropItemConfigBase> __FCommissionConfig_GetCommissionReward(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionReward' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.GetCommissionReward();
    }
    return DataObject.Get().GetCommissionReward();
}
UFUNCTION()
TArray<FCommissionMonsterDisplayInfo> __FCommissionConfig_GetDisplayMonsters(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayMonsters' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.DisplayMonsters;
    }
    return DataObject.Get().DisplayMonsters;
}
UFUNCTION()
TDataObjectPtr<FRewardConfig> __FCommissionConfig_GetSpecialRewardConfig(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SpecialRewardConfig' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.GetSpecialRewardConfig();
    }
    return DataObject.Get().GetSpecialRewardConfig();
}
UFUNCTION()
TDataObjectPtr<FRewardConfig> __FCommissionConfig_GetMedalRewardConfig(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MedalRewardConfig' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.GetMedalRewardConfig();
    }
    return DataObject.Get().GetMedalRewardConfig();
}
UFUNCTION()
TDataObjectPtr<FDropItemConfigBase> __FCommissionConfig_GetSPlusDropReward(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SPlusDropReward' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.GetSPlusDropReward();
    }
    return DataObject.Get().GetSPlusDropReward();
}
UFUNCTION()
TDataObjectPtr<FDropItemConfigBase> __FCommissionConfig_GetSPlusPlusDropReward(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SPlusPlusDropReward' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.GetSPlusPlusDropReward();
    }
    return DataObject.Get().GetSPlusPlusDropReward();
}
UFUNCTION()
TDataObjectPtr<FRandomSeedConfig> __FCommissionConfig_GetRandomSeedConfig(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RandomSeedConfig' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.GetRandomSeedConfig();
    }
    return DataObject.Get().GetRandomSeedConfig();
}
UFUNCTION()
TDataObjectPtr<FRandomPolicyBlacklistConfigBase> __FCommissionConfig_GetRandomPolicyBlacklistConfig(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RandomPolicyBlacklistConfig' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.GetRandomPolicyBlacklistConfig();
    }
    return DataObject.Get().GetRandomPolicyBlacklistConfig();
}
UFUNCTION()
TDataObjectPtr<FLevelInfoConfig> __FCommissionConfig_GetLevelInfoConfig(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LevelInfoConfig' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.GetLevelInfoConfig();
    }
    return DataObject.Get().GetLevelInfoConfig();
}
UFUNCTION()
FText __FCommissionConfig_GetDisplayLocationName(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayLocationName' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.DisplayLocationName;
    }
    return DataObject.Get().DisplayLocationName;
}
UFUNCTION()
int __FCommissionConfig_GetMaxRandomEventCount(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxRandomEventCount' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig defaultValue;
        return defaultValue.MaxRandomEventCount;
    }
    return DataObject.Get().MaxRandomEventCount;
}
UFUNCTION()
float32 __FCommissionConfig_GetRandomEventFilterDistance(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RandomEventFilterDistance' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig defaultValue;
        return defaultValue.RandomEventFilterDistance;
    }
    return DataObject.Get().RandomEventFilterDistance;
}
UFUNCTION()
TArray<FRandomEventDistanceTier> __FCommissionConfig_GetRandomEventDistanceTiers(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RandomEventDistanceTiers' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.RandomEventDistanceTiers;
    }
    return DataObject.Get().RandomEventDistanceTiers;
}
UFUNCTION()
TArray<TDataObjectPtr<FEcologyCreatureDefinitionRow>> __FCommissionConfig_GetRandomEventFilterTargetCreatures(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RandomEventFilterTargetCreatures' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.GetRandomEventFilterTargetCreatures();
    }
    return DataObject.Get().GetRandomEventFilterTargetCreatures();
}
UFUNCTION()
TArray<FRandomEventTypeCountLimit> __FCommissionConfig_GetRandomEventTypeCountLimits(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RandomEventTypeCountLimits' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.RandomEventTypeCountLimits;
    }
    return DataObject.Get().RandomEventTypeCountLimits;
}
UFUNCTION()
UDataTable __FCommissionConfig_GetDifficultyLevelConfig(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DifficultyLevelConfig' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.DifficultyLevelConfig;
    }
    UDataTable local_434;
    return local_434;
}
UFUNCTION()
TDataObjectPtr<FCommissionPropAttributeConfig> __FCommissionConfig_GetPropAttributeConfig(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PropAttributeConfig' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.GetPropAttributeConfig();
    }
    return DataObject.Get().GetPropAttributeConfig();
}
UFUNCTION()
TArray<FText> __FCommissionConfig_GetCommissionProgressTexts(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionProgressTexts' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.CommissionProgressTexts;
    }
    return DataObject.Get().CommissionProgressTexts;
}
UFUNCTION()
int __FCommissionConfig_GetMonsterBaseLevel(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MonsterBaseLevel' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig defaultValue;
        return defaultValue.MonsterBaseLevel;
    }
    return DataObject.Get().MonsterBaseLevel;
}
UFUNCTION()
bool __FCommissionConfig_GetbOverrideSetGuidingPathToTarget(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bOverrideSetGuidingPathToTarget' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.bOverrideSetGuidingPathToTarget;
    }
    return DataObject.Get().bOverrideSetGuidingPathToTarget;
}
UFUNCTION()
bool __FCommissionConfig_GetbSetGuidingPathToTarget(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bSetGuidingPathToTarget' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.bSetGuidingPathToTarget;
    }
    return DataObject.Get().bSetGuidingPathToTarget;
}
UFUNCTION()
FCommissionConfig CastToFCommissionConfig(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    FCommissionConfig __r;
    return __r;
}
}
namespace __FNormalCommissionConfigFunctions
{
UFUNCTION()
FNormalCommissionConfig CastToFNormalCommissionConfig(const TDataObjectPtr<FNormalCommissionConfig> &inout DataObject)
{
    FNormalCommissionConfig __r;
    return __r;
}
}
namespace __FHardCommissionConfigFunctions
{
UFUNCTION()
ECommissionRefreshType __FHardCommissionConfig_GetCommissionRefreshType(const TDataObjectPtr<FHardCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionRefreshType' from a null 'FHardCommissionConfig' DataObject!");
        }
        FHardCommissionConfig local_484;
        return local_484.CommissionRefreshType;
    }
    return DataObject.Get().CommissionRefreshType;
}
UFUNCTION()
TDataObjectPtr<FCommissionGroupConfig> __FHardCommissionConfig_GetCommissionGroupConfig(const TDataObjectPtr<FHardCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionGroupConfig' from a null 'FHardCommissionConfig' DataObject!");
        }
        FHardCommissionConfig local_484;
        return local_484.GetCommissionGroupConfig();
    }
    return DataObject.Get().GetCommissionGroupConfig();
}
UFUNCTION()
FCommissionRefreshConfig __FHardCommissionConfig_GetRefreshConfig(const TDataObjectPtr<FHardCommissionConfig> &inout DataObject)
{
    FCommissionRefreshConfig __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RefreshConfig' from a null 'FHardCommissionConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FHardCommissionConfig CastToFHardCommissionConfig(const TDataObjectPtr<FHardCommissionConfig> &inout DataObject)
{
    FHardCommissionConfig __r;
    return __r;
}
}
namespace __FExtremeCommissionConfigFunctions
{
UFUNCTION()
FCommissionRefreshConfig __FExtremeCommissionConfig_GetRefreshConfig(const TDataObjectPtr<FExtremeCommissionConfig> &inout DataObject)
{
    FCommissionRefreshConfig __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RefreshConfig' from a null 'FExtremeCommissionConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FExtremeCommissionConfig CastToFExtremeCommissionConfig(const TDataObjectPtr<FExtremeCommissionConfig> &inout DataObject)
{
    FExtremeCommissionConfig __r;
    return __r;
}
}
namespace __FMissionCommissionConfigFunctions
{
UFUNCTION()
FMissionCommissionConfig CastToFMissionCommissionConfig(const TDataObjectPtr<FMissionCommissionConfig> &inout DataObject)
{
    FMissionCommissionConfig __r;
    return __r;
}
}
namespace __FRaceCommissionConfigFunctions
{
UFUNCTION()
ERaceMode __FRaceCommissionConfig_GetRaceMode(const TDataObjectPtr<FRaceCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RaceMode' from a null 'FRaceCommissionConfig' DataObject!");
        }
        FRaceCommissionConfig local_440;
        return local_440.RaceMode;
    }
    return DataObject.Get().RaceMode;
}
UFUNCTION()
TArray<FRaceTierReward> __FRaceCommissionConfig_GetRaceTierRewards(const TDataObjectPtr<FRaceCommissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RaceTierRewards' from a null 'FRaceCommissionConfig' DataObject!");
        }
        FRaceCommissionConfig local_440;
        return local_440.RaceTierRewards;
    }
    return DataObject.Get().RaceTierRewards;
}
UFUNCTION()
FRaceCommissionConfig CastToFRaceCommissionConfig(const TDataObjectPtr<FRaceCommissionConfig> &inout DataObject)
{
    FRaceCommissionConfig __r;
    return __r;
}
}
namespace __FCommissionTypeConfigFunctions
{
UFUNCTION()
ECommissionType __FCommissionTypeConfig_GetCommissionType(const TDataObjectPtr<FCommissionTypeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionType' from a null 'FCommissionTypeConfig' DataObject!");
        }
        FCommissionTypeConfig local_96;
        return local_96.CommissionType;
    }
    return DataObject.Get().CommissionType;
}
UFUNCTION()
TDataObjectPtr<FRefreshRuleConfig> __FCommissionTypeConfig_GetRefreshRuleConfig(const TDataObjectPtr<FCommissionTypeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RefreshRuleConfig' from a null 'FCommissionTypeConfig' DataObject!");
        }
        FCommissionTypeConfig local_96;
        return local_96.GetRefreshRuleConfig();
    }
    return DataObject.Get().GetRefreshRuleConfig();
}
UFUNCTION()
FText __FCommissionTypeConfig_GetCommissionTypeName(const TDataObjectPtr<FCommissionTypeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionTypeName' from a null 'FCommissionTypeConfig' DataObject!");
        }
        FCommissionTypeConfig local_96;
        return local_96.CommissionTypeName;
    }
    return DataObject.Get().CommissionTypeName;
}
UFUNCTION()
FSoftBrush __FCommissionTypeConfig_GetCommissionTypeIcon(const TDataObjectPtr<FCommissionTypeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionTypeIcon' from a null 'FCommissionTypeConfig' DataObject!");
        }
        FCommissionTypeConfig local_96;
        return local_96.CommissionTypeIcon;
    }
    return DataObject.Get().CommissionTypeIcon;
}
UFUNCTION()
ESystemModule __FCommissionTypeConfig_GetSystemModule(const TDataObjectPtr<FCommissionTypeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SystemModule' from a null 'FCommissionTypeConfig' DataObject!");
        }
        FCommissionTypeConfig local_96;
        return local_96.SystemModule;
    }
    return DataObject.Get().SystemModule;
}
UFUNCTION()
FCommissionTypeConfig CastToFCommissionTypeConfig(const TDataObjectPtr<FCommissionTypeConfig> &inout DataObject)
{
    FCommissionTypeConfig __r;
    return __r;
}
}
namespace __FTempCommissionConfigFunctions
{
UFUNCTION()
FTempCommissionConfig CastToFTempCommissionConfig(const TDataObjectPtr<FTempCommissionConfig> &inout DataObject)
{
    FTempCommissionConfig __r;
    return __r;
}
}
