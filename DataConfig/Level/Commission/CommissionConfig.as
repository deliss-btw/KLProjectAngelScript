
enum ECommissionType
{
    None,
    NATIVE_MAX = 0,
    Normal,
    Hard,
    Mission,
    Extreme,
    Race,
    MaxCount,
}

enum ECommissionRefreshType
{
    None,
    Fix,
    Random,
}

enum ERaceMode
{
    None,
    Single,
    Multi,
    MaxCount,
}

enum ECommissionTier
{
    None,
    SPlusPlus,
    SPlus,
    S,
    A,
    B,
    C,
    D,
    MaxCount,
}

enum ECommissionLoadingDisplayMode
{
    Normal,
    MaskAsUnknown,
    Hidden,
}


struct FCommissionRegionWeatherTemplate
{
    UPROPERTY()
    TDataObjectPtr<FWorldAreaConfig> AreaConfig;
    UPROPERTY()
    TDataObjectPtr<FWeatherGenerateTemplate> WeatherTemplate;

    FCommissionRegionWeatherTemplate()
    {
        return;
    }
}

struct FCommissionMonsterDisplayInfo
{
    UPROPERTY()
    TDataObjectPtr<FMonsterMainConfig> MonsterConfig;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> DisplayWidget;

    FCommissionMonsterDisplayInfo()
    {
        return;
    }
}

struct FCommissionGroupConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FText Description;
    UPROPERTY()
    uint Count;
    UPROPERTY()
    bool CanRepeat = false;


}

struct FCommissionConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FText CommissionName;
    UPROPERTY()
    FText CommissionAimDesc;
    UPROPERTY()
    FText CommissionDetail;
    UPROPERTY()
    ECommissionType CommissionType;
    UPROPERTY()
    bool bDisableRecruitSend = false;
    UPROPERTY()
    bool bAllowMatchmakingEntry = true;
    UPROPERTY()
    FDataObjectPtr m_OverrideMatchConfig;
    UPROPERTY()
    ECommissionLoadingDisplayMode ObjectiveDisplayMode = ECommissionLoadingDisplayMode(0);
    UPROPERTY()
    ECommissionLoadingDisplayMode FailConditionDisplayMode = ECommissionLoadingDisplayMode(0);
    UPROPERTY()
    FSoftBrush CommissionIcon;
    UPROPERTY()
    bool DefaultActive;
    UPROPERTY()
    FDataObjectPtr m_ActiveCond;
    UPROPERTY()
    int CommissionStars;
    UPROPERTY()
    int RecommendedLevel;
    UPROPERTY()
    int MaxDeathCount = -1;
    UPROPERTY()
    float32 CommissionTimeLimit;
    UPROPERTY()
    float32 CommissionDayTime;
    UPROPERTY()
    bool bLockDayTime = false;
    UPROPERTY()
    FDataObjectPtr m_CommissionTargetObjective;
    UPROPERTY()
    FDataObjectPtr m_CommissionSubTargetObjective;
    UPROPERTY()
    FDataObjectPtr m_CommissionReward;
    UPROPERTY()
    TArray<FCommissionMonsterDisplayInfo> DisplayMonsters;
    UPROPERTY()
    FDataObjectPtr m_SpecialRewardConfig;
    UPROPERTY()
    FDataObjectPtr m_MedalRewardConfig;
    UPROPERTY()
    FDataObjectPtr m_SPlusDropReward;
    UPROPERTY()
    FDataObjectPtr m_SPlusPlusDropReward;
    UPROPERTY()
    FDataObjectPtr m_RandomSeedConfig;
    UPROPERTY()
    FDataObjectPtr m_RandomPolicyBlacklistConfig;
    UPROPERTY()
    FDataObjectPtr m_LevelInfoConfig;
    UPROPERTY()
    FText DisplayLocationName;
    UPROPERTY()
    int MaxRandomEventCount;
    UPROPERTY()
    float32 RandomEventFilterDistance = 200.0f;
    UPROPERTY()
    TArray<FRandomEventDistanceTier> RandomEventDistanceTiers;
    UPROPERTY()
    TArray<FDataObjectPtr> m_RandomEventFilterTargetCreatures;
    UPROPERTY()
    TArray<FRandomEventTypeCountLimit> RandomEventTypeCountLimits;
    UPROPERTY()
    UDataTable DifficultyLevelConfig = nullptr;
    UPROPERTY()
    FDataObjectPtr m_PropAttributeConfig;
    UPROPERTY()
    TArray<FText> CommissionProgressTexts;
    UPROPERTY()
    int MonsterBaseLevel = 1;
    UPROPERTY()
    bool bOverrideSetGuidingPathToTarget = false;
    UPROPERTY()
    bool bSetGuidingPathToTarget = false;


    const TDataObjectPtr<FPveCommissionMatchConfig> GetOverrideMatchConfig() const property
    {
        const TDataObjectPtr<FPveCommissionMatchConfig> __r;
        return __r;
    }
    void SetOverrideMatchConfig(const TDataObjectPtr<FPveCommissionMatchConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FPveCommissionMatchConfig>> local_2;
        this.m_OverrideMatchConfig = local_2;
        return;
    }
    const TDataObjectPtr<FServerConditionConfigBase> GetActiveCond() const property
    {
        const TDataObjectPtr<FServerConditionConfigBase> __r;
        return __r;
    }
    void SetActiveCond(const TDataObjectPtr<FServerConditionConfigBase> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FServerConditionConfigBase>> local_2;
        this.m_ActiveCond = local_2;
        return;
    }
    const TDataObjectPtr<FObjectiveConfig> GetCommissionTargetObjective() const property
    {
        const TDataObjectPtr<FObjectiveConfig> __r;
        return __r;
    }
    void SetCommissionTargetObjective(const TDataObjectPtr<FObjectiveConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FObjectiveConfig>> local_2;
        this.m_CommissionTargetObjective = local_2;
        return;
    }
    const TDataObjectPtr<FObjectiveConfig> GetCommissionSubTargetObjective() const property
    {
        const TDataObjectPtr<FObjectiveConfig> __r;
        return __r;
    }
    void SetCommissionSubTargetObjective(const TDataObjectPtr<FObjectiveConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FObjectiveConfig>> local_2;
        this.m_CommissionSubTargetObjective = local_2;
        return;
    }
    const TDataObjectPtr<FDropItemConfigBase> GetCommissionReward() const property
    {
        const TDataObjectPtr<FDropItemConfigBase> __r;
        return __r;
    }
    void SetCommissionReward(const TDataObjectPtr<FDropItemConfigBase> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FDropItemConfigBase>> local_2;
        this.m_CommissionReward = local_2;
        return;
    }
    const TDataObjectPtr<FRewardConfig> GetSpecialRewardConfig() const property
    {
        const TDataObjectPtr<FRewardConfig> __r;
        return __r;
    }
    void SetSpecialRewardConfig(const TDataObjectPtr<FRewardConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FRewardConfig>> local_2;
        this.m_SpecialRewardConfig = local_2;
        return;
    }
    const TDataObjectPtr<FRewardConfig> GetMedalRewardConfig() const property
    {
        const TDataObjectPtr<FRewardConfig> __r;
        return __r;
    }
    void SetMedalRewardConfig(const TDataObjectPtr<FRewardConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FRewardConfig>> local_2;
        this.m_MedalRewardConfig = local_2;
        return;
    }
    const TDataObjectPtr<FDropItemConfigBase> GetSPlusDropReward() const property
    {
        const TDataObjectPtr<FDropItemConfigBase> __r;
        return __r;
    }
    void SetSPlusDropReward(const TDataObjectPtr<FDropItemConfigBase> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FDropItemConfigBase>> local_2;
        this.m_SPlusDropReward = local_2;
        return;
    }
    const TDataObjectPtr<FDropItemConfigBase> GetSPlusPlusDropReward() const property
    {
        const TDataObjectPtr<FDropItemConfigBase> __r;
        return __r;
    }
    void SetSPlusPlusDropReward(const TDataObjectPtr<FDropItemConfigBase> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FDropItemConfigBase>> local_2;
        this.m_SPlusPlusDropReward = local_2;
        return;
    }
    const TDataObjectPtr<FRandomSeedConfig> GetRandomSeedConfig() const property
    {
        const TDataObjectPtr<FRandomSeedConfig> __r;
        return __r;
    }
    void SetRandomSeedConfig(const TDataObjectPtr<FRandomSeedConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FRandomSeedConfig>> local_2;
        this.m_RandomSeedConfig = local_2;
        return;
    }
    const TDataObjectPtr<FRandomPolicyBlacklistConfigBase> GetRandomPolicyBlacklistConfig() const property
    {
        const TDataObjectPtr<FRandomPolicyBlacklistConfigBase> __r;
        return __r;
    }
    void SetRandomPolicyBlacklistConfig(const TDataObjectPtr<FRandomPolicyBlacklistConfigBase> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FRandomPolicyBlacklistConfigBase>> local_2;
        this.m_RandomPolicyBlacklistConfig = local_2;
        return;
    }
    const TDataObjectPtr<FLevelInfoConfig> GetLevelInfoConfig() const property
    {
        const TDataObjectPtr<FLevelInfoConfig> __r;
        return __r;
    }
    void SetLevelInfoConfig(const TDataObjectPtr<FLevelInfoConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FLevelInfoConfig>> local_2;
        this.m_LevelInfoConfig = local_2;
        return;
    }
    const TArray<TDataObjectPtr<FEcologyCreatureDefinitionRow>> GetRandomEventFilterTargetCreatures() const property
    {
        const TArray<TDataObjectPtr<FEcologyCreatureDefinitionRow>> __r;
        return __r;
    }
    void SetRandomEventFilterTargetCreatures(const TArray<TDataObjectPtr<FEcologyCreatureDefinitionRow>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FEcologyCreatureDefinitionRow>>> local_2;
        this.m_RandomEventFilterTargetCreatures = local_2;
        return;
    }
    const TDataObjectPtr<FCommissionPropAttributeConfig> GetPropAttributeConfig() const property
    {
        const TDataObjectPtr<FCommissionPropAttributeConfig> __r;
        return __r;
    }
    void SetPropAttributeConfig(const TDataObjectPtr<FCommissionPropAttributeConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FCommissionPropAttributeConfig>> local_2;
        this.m_PropAttributeConfig = local_2;
        return;
    }
}

struct FNormalCommissionConfig : FCommissionConfig
{
    FCommissionConfig _base_FCommissionConfig;

    default CommissionType = ECommissionType(1);

    FNormalCommissionConfig()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

struct FCommissionRefreshConfig
{
    UPROPERTY()
    ECommissionRefreshType CommissionRefreshType = ECommissionRefreshType(1);
    UPROPERTY()
    TDataObjectPtr<FCommissionGroupConfig> CommissionGroupConfig;


}

struct FHardCommissionConfig : FCommissionConfig
{
    FCommissionConfig _base_FCommissionConfig;
    UPROPERTY()
    ECommissionRefreshType CommissionRefreshType;
    UPROPERTY()
    FDataObjectPtr m_CommissionGroupConfig;
    UPROPERTY()
    FCommissionRefreshConfig RefreshConfig;

    default CommissionType = ECommissionType(2);

    FHardCommissionConfig()
    {
        super();
        this.CommissionRefreshType = ECommissionRefreshType(1);
        this.__InitDefaults();
        return;
    }
    const TDataObjectPtr<FCommissionGroupConfig> GetCommissionGroupConfig() const property
    {
        const TDataObjectPtr<FCommissionGroupConfig> __r;
        return __r;
    }
    void SetCommissionGroupConfig(const TDataObjectPtr<FCommissionGroupConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FCommissionGroupConfig>> local_2;
        this.m_CommissionGroupConfig = local_2;
        return;
    }
}

struct FExtremeCommissionConfig : FCommissionConfig
{
    FCommissionConfig _base_FCommissionConfig;
    UPROPERTY()
    FCommissionRefreshConfig RefreshConfig;

    default CommissionType = ECommissionType(4);

    FExtremeCommissionConfig()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

struct FMissionCommissionConfig : FCommissionConfig
{
    FCommissionConfig _base_FCommissionConfig;

    default CommissionType = ECommissionType(3);

    FMissionCommissionConfig()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

struct FRaceTierReward
{
    UPROPERTY()
    ECommissionTier Tier;
    UPROPERTY()
    FString Time;
    UPROPERTY()
    int TimeSec;
    UPROPERTY()
    TDataObjectPtr<FRewardConfig> Reward;


}

struct FRaceCommissionConfig : FCommissionConfig
{
    FCommissionConfig _base_FCommissionConfig;
    UPROPERTY()
    ERaceMode RaceMode;
    UPROPERTY()
    TArray<FRaceTierReward> RaceTierRewards;

    default CommissionType = ECommissionType(5);

    FRaceCommissionConfig()
    {
        super();
        this.RaceMode = ERaceMode(0);
        this.__InitDefaults();
        return;
    }
}

struct FCommissionTypeConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    ECommissionType CommissionType;
    UPROPERTY()
    FDataObjectPtr m_RefreshRuleConfig;
    UPROPERTY()
    FText CommissionTypeName;
    UPROPERTY()
    FSoftBrush CommissionTypeIcon;
    UPROPERTY()
    ESystemModule SystemModule;


    TDataObjectPtr<FRefreshRuleConfig> GetRefreshRuleConfig() const property
    {
        TDataObjectPtr<FRefreshRuleConfig> __r;
        return __r;
    }
    void SetRefreshRuleConfig(const TDataObjectPtr<FRefreshRuleConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FRefreshRuleConfig>> local_2;
        this.m_RefreshRuleConfig = local_2;
        return;
    }
}

struct FTempCommissionConfig : FCommissionConfig
{
    FCommissionConfig _base_FCommissionConfig;

    FTempCommissionConfig()
    {
        super();
        return;
    }
}

