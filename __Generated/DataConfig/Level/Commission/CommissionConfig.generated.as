namespace __FCommissionGroupConfigFunctions
{
UFUNCTION()
FText __FCommissionGroupConfig_GetDescription(const TDataObjectPtr<FCommissionGroupConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FCommissionGroupConfig' DataObject!");
        }
        FCommissionGroupConfig local_22;
        return local_22.Description;
    }
    return __r;
}
UFUNCTION()
bool __FCommissionGroupConfig_GetCanRepeat(const TDataObjectPtr<FCommissionGroupConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CanRepeat' from a null 'FCommissionGroupConfig' DataObject!");
        }
        FCommissionGroupConfig local_22;
        return local_22.CanRepeat;
    }
    return local_1;
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
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionName' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.CommissionName;
    }
    return __r;
}
UFUNCTION()
FText __FCommissionConfig_GetCommissionAimDesc(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionAimDesc' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.CommissionAimDesc;
    }
    return __r;
}
UFUNCTION()
FText __FCommissionConfig_GetCommissionDetail(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionDetail' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.CommissionDetail;
    }
    return __r;
}
UFUNCTION()
ECommissionType __FCommissionConfig_GetCommissionType(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    int local_433 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionType' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        local_433 = int(local_432.CommissionType);
        return ECommissionType(local_433);
    }
    return ECommissionType(local_433);
}
UFUNCTION()
bool __FCommissionConfig_GetbDisableRecruitSend(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bDisableRecruitSend' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.bDisableRecruitSend;
    }
    return local_1;
}
UFUNCTION()
bool __FCommissionConfig_GetbAllowMatchmakingEntry(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bAllowMatchmakingEntry' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.bAllowMatchmakingEntry;
    }
    return local_1;
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
    return GetOverrideMatchConfig();
}
UFUNCTION()
ECommissionLoadingDisplayMode __FCommissionConfig_GetObjectiveDisplayMode(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    int local_433 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ObjectiveDisplayMode' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        local_433 = int(local_432.ObjectiveDisplayMode);
        return ECommissionLoadingDisplayMode(local_433);
    }
    return ECommissionLoadingDisplayMode(local_433);
}
UFUNCTION()
ECommissionLoadingDisplayMode __FCommissionConfig_GetFailConditionDisplayMode(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    int local_433 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FailConditionDisplayMode' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        local_433 = int(local_432.FailConditionDisplayMode);
        return ECommissionLoadingDisplayMode(local_433);
    }
    return ECommissionLoadingDisplayMode(local_433);
}
UFUNCTION()
FSoftBrush __FCommissionConfig_GetCommissionIcon(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionIcon' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.CommissionIcon;
    }
    return __r;
}
UFUNCTION()
bool __FCommissionConfig_GetDefaultActive(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultActive' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.DefaultActive;
    }
    return local_1;
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
    return GetActiveCond();
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
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bLockDayTime' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.bLockDayTime;
    }
    return local_1;
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
    return GetCommissionTargetObjective();
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
    return GetCommissionSubTargetObjective();
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
    return GetCommissionReward();
}
UFUNCTION()
TArray<FCommissionMonsterDisplayInfo> __FCommissionConfig_GetDisplayMonsters(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    TArray<FCommissionMonsterDisplayInfo> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayMonsters' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.DisplayMonsters;
    }
    return __r;
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
    return GetSpecialRewardConfig();
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
    return GetMedalRewardConfig();
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
    return GetSPlusDropReward();
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
    return GetSPlusPlusDropReward();
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
    return GetRandomSeedConfig();
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
    return GetRandomPolicyBlacklistConfig();
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
    return GetLevelInfoConfig();
}
UFUNCTION()
FText __FCommissionConfig_GetDisplayLocationName(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayLocationName' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.DisplayLocationName;
    }
    return __r;
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
    TArray<FRandomEventDistanceTier> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RandomEventDistanceTiers' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.RandomEventDistanceTiers;
    }
    return __r;
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
    return GetRandomEventFilterTargetCreatures();
}
UFUNCTION()
TArray<FRandomEventTypeCountLimit> __FCommissionConfig_GetRandomEventTypeCountLimits(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    TArray<FRandomEventTypeCountLimit> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RandomEventTypeCountLimits' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.RandomEventTypeCountLimits;
    }
    return __r;
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
    return GetPropAttributeConfig();
}
UFUNCTION()
TArray<FText> __FCommissionConfig_GetCommissionProgressTexts(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    TArray<FText> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionProgressTexts' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.CommissionProgressTexts;
    }
    return __r;
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
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bOverrideSetGuidingPathToTarget' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.bOverrideSetGuidingPathToTarget;
    }
    return local_1;
}
UFUNCTION()
bool __FCommissionConfig_GetbSetGuidingPathToTarget(const TDataObjectPtr<FCommissionConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bSetGuidingPathToTarget' from a null 'FCommissionConfig' DataObject!");
        }
        FCommissionConfig local_432;
        return local_432.bSetGuidingPathToTarget;
    }
    return local_1;
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
    int local_485 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionRefreshType' from a null 'FHardCommissionConfig' DataObject!");
        }
        FHardCommissionConfig local_484;
        local_485 = int(local_484.CommissionRefreshType);
        return ECommissionRefreshType(local_485);
    }
    return ECommissionRefreshType(local_485);
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
    return GetCommissionGroupConfig();
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
    int local_441 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RaceMode' from a null 'FRaceCommissionConfig' DataObject!");
        }
        FRaceCommissionConfig local_440;
        local_441 = int(local_440.RaceMode);
        return ERaceMode(local_441);
    }
    return ERaceMode(local_441);
}
UFUNCTION()
TArray<FRaceTierReward> __FRaceCommissionConfig_GetRaceTierRewards(const TDataObjectPtr<FRaceCommissionConfig> &inout DataObject)
{
    TArray<FRaceTierReward> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RaceTierRewards' from a null 'FRaceCommissionConfig' DataObject!");
        }
        FRaceCommissionConfig local_440;
        return local_440.RaceTierRewards;
    }
    return __r;
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
    int local_97 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionType' from a null 'FCommissionTypeConfig' DataObject!");
        }
        FCommissionTypeConfig local_96;
        local_97 = int(local_96.CommissionType);
        return ECommissionType(local_97);
    }
    return ECommissionType(local_97);
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
    return GetRefreshRuleConfig();
}
UFUNCTION()
FText __FCommissionTypeConfig_GetCommissionTypeName(const TDataObjectPtr<FCommissionTypeConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionTypeName' from a null 'FCommissionTypeConfig' DataObject!");
        }
        FCommissionTypeConfig local_96;
        return local_96.CommissionTypeName;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FCommissionTypeConfig_GetCommissionTypeIcon(const TDataObjectPtr<FCommissionTypeConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionTypeIcon' from a null 'FCommissionTypeConfig' DataObject!");
        }
        FCommissionTypeConfig local_96;
        return local_96.CommissionTypeIcon;
    }
    return __r;
}
UFUNCTION()
ESystemModule __FCommissionTypeConfig_GetSystemModule(const TDataObjectPtr<FCommissionTypeConfig> &inout DataObject)
{
    int local_97 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SystemModule' from a null 'FCommissionTypeConfig' DataObject!");
        }
        FCommissionTypeConfig local_96;
        local_97 = int(local_96.SystemModule);
        return ESystemModule(local_97);
    }
    return ESystemModule(local_97);
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
