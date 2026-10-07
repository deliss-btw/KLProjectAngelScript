
enum ELevelEventType
{
    RandomEvent,
    PublicEvent,
    DungeonEvent,
}

enum ELevelRandomEventType
{
    Normal,
    Hard,
}

const FLevelEventInfoConfigBase DefaultLevelEventInfoConfig = FLevelEventInfoConfigBase();

struct FLevelEventInfoConfigBase : FBasePrefabConfig
{
    FBasePrefabConfig _base_FBasePrefabConfig;
    UPROPERTY()
    ELevelEventType EventType;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FDataObjectPtr m_PresentationConfig;
    UPROPERTY()
    FText EventTargetTitle;
    UPROPERTY()
    FText EventDescription;
    UPROPERTY()
    TArray<FDataObjectPtr> m_LevelObjectives;
    UPROPERTY()
    FDataObjectPtr m_DropRewardView;


    TDataObjectPtr<FPresentationConfig> GetPresentationConfig() const property
    {
        TDataObjectPtr<FPresentationConfig> __r;
        return __r;
    }
    void SetPresentationConfig(const TDataObjectPtr<FPresentationConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FPresentationConfig>> local_2;
        this.m_PresentationConfig = local_2;
        return;
    }
    const TArray<TDataObjectPtr<FObjectiveConfig>> GetLevelObjectives() const property
    {
        const TArray<TDataObjectPtr<FObjectiveConfig>> __r;
        return __r;
    }
    void SetLevelObjectives(const TArray<TDataObjectPtr<FObjectiveConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FObjectiveConfig>>> local_2;
        this.m_LevelObjectives = local_2;
        return;
    }
    const TDataObjectPtr<FDropItemConfigBase> GetDropRewardView() const property
    {
        const TDataObjectPtr<FDropItemConfigBase> __r;
        return __r;
    }
    void SetDropRewardView(const TDataObjectPtr<FDropItemConfigBase> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FDropItemConfigBase>> local_2;
        this.m_DropRewardView = local_2;
        return;
    }
}

struct FRandomEventTypeCountLimit
{
    UPROPERTY()
    ELevelRandomEventType LevelRandomEventType;
    UPROPERTY()
    int MinCount = 0;
    UPROPERTY()
    int MaxCount = 99;


}

struct FRandomEventDistanceTier
{
    UPROPERTY()
    float32 MaxDistance = 0.0f;
    UPROPERTY()
    float32 Weight = 1.0f;


}

struct FLevelEventTypeAttribute
{
    UPROPERTY()
    ELevelRandomEventType EventType;
    UPROPERTY()
    float32 DivineSkillCDRecoverSeconds = 0.0f;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> PlayerFirstEnterMessageHint;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> AreaFirstEnterMessageHint;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> EventSuccessMessageHint;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> EventFailedMessageHint;
    UPROPERTY()
    TDataObjectPtr<FPresentationRuleConfig> PresentationRuleConfig;
    UPROPERTY()
    TArray<TDataObjectPtr<FDropItemConfig>> RewardDropConfigs;
    UPROPERTY()
    TArray<FBuffConfigRef> MonsterDifficultyBuffs;


}

class ULevelEventAttribute : UDataAsset
{
    UPROPERTY()
    TArray<FLevelEventTypeAttribute> TypeAttributes;

    ULevelEventAttribute()
    {
        return;
    }
    bool GetTypeAttribute(const ELevelRandomEventType Type, FLevelEventTypeAttribute &inout OutAttr) const
    {
        for (auto& local_16 : this.TypeAttributes)
        {
            if (int(local_16.EventType) == int(Type))
            {
                return true;
            }
        }
        return false;
    }
}

struct FEventScoreModifierConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FName Name;
    UPROPERTY()
    TMap<FDataObjectPtr, float32> m_WeatherModifier;
    UPROPERTY()
    TMap<FDataObjectPtr, float32> m_CommissionBossModifier;
    UPROPERTY()
    TMap<FDataObjectPtr, float32> m_CommissionNPCModifier;
    UPROPERTY()
    TMap<FDataObjectPtr, float32> m_CommissionTimeModifier;

    FEventScoreModifierConfig()
    {
        return;
    }
    const TMap<TDataObjectPtr<FWeatherConfig>, float32> GetWeatherModifier() const property
    {
        const TMap<TDataObjectPtr<FWeatherConfig>, float32> __r;
        return __r;
    }
    void SetWeatherModifier(const TMap<TDataObjectPtr<FWeatherConfig>, float32> &inout __Value) property
    {
        _AsTDataObjectPtrView<TMap<FDataObjectPtr, float32>, TMap<TDataObjectPtr<FWeatherConfig>, float32>> local_2;
        this.m_WeatherModifier = local_2;
        return;
    }
    const TMap<TDataObjectPtr<FMonsterMainConfig>, float32> GetCommissionBossModifier() const property
    {
        const TMap<TDataObjectPtr<FMonsterMainConfig>, float32> __r;
        return __r;
    }
    void SetCommissionBossModifier(const TMap<TDataObjectPtr<FMonsterMainConfig>, float32> &inout __Value) property
    {
        _AsTDataObjectPtrView<TMap<FDataObjectPtr, float32>, TMap<TDataObjectPtr<FMonsterMainConfig>, float32>> local_2;
        this.m_CommissionBossModifier = local_2;
        return;
    }
    const TMap<TDataObjectPtr<FNPCMainConfig>, float32> GetCommissionNPCModifier() const property
    {
        const TMap<TDataObjectPtr<FNPCMainConfig>, float32> __r;
        return __r;
    }
    void SetCommissionNPCModifier(const TMap<TDataObjectPtr<FNPCMainConfig>, float32> &inout __Value) property
    {
        _AsTDataObjectPtrView<TMap<FDataObjectPtr, float32>, TMap<TDataObjectPtr<FNPCMainConfig>, float32>> local_2;
        this.m_CommissionNPCModifier = local_2;
        return;
    }
    const TMap<TDataObjectPtr<FCommissionTimeConfig>, float32> GetCommissionTimeModifier() const property
    {
        const TMap<TDataObjectPtr<FCommissionTimeConfig>, float32> __r;
        return __r;
    }
    void SetCommissionTimeModifier(const TMap<TDataObjectPtr<FCommissionTimeConfig>, float32> &inout __Value) property
    {
        _AsTDataObjectPtrView<TMap<FDataObjectPtr, float32>, TMap<TDataObjectPtr<FCommissionTimeConfig>, float32>> local_2;
        this.m_CommissionTimeModifier = local_2;
        return;
    }
}

struct FLevelRandomEventInfoConfig : FLevelEventInfoConfigBase
{
    FLevelEventInfoConfigBase _base_FLevelEventInfoConfigBase;
    UPROPERTY()
    ELevelRandomEventType LevelRandomEventType;
    UPROPERTY()
    FGameplayTag EventFamilyTag;
    UPROPERTY()
    float32 BaseScore;
    UPROPERTY()
    FDataObjectPtr m_ScoreModifierConfig;
    UPROPERTY()
    FText EventRewardBuffDesc;
    UPROPERTY()
    FText EventRewardBriefDesc;
    UPROPERTY()
    TSoftObjectPtr<ULevelEventAttribute> LevelEventAttribute;

    default EventType = ELevelEventType(0);
    default LevelEventAttribute = TSoftObjectPtr<ULevelEventAttribute>(FSoftObjectPath("/Game/MoleRes/Dev/Data/Setting/DA_LevelEventAttribute_Default.DA_LevelEventAttribute_Default"));

    FLevelRandomEventInfoConfig()
    {
        super();
        this.LevelRandomEventType = ELevelRandomEventType(0);
        this.BaseScore = 100.0f;
        this.__InitDefaults();
        return;
    }
    const TDataObjectPtr<FEventScoreModifierConfig> GetScoreModifierConfig() const property
    {
        const TDataObjectPtr<FEventScoreModifierConfig> __r;
        return __r;
    }
    void SetScoreModifierConfig(const TDataObjectPtr<FEventScoreModifierConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FEventScoreModifierConfig>> local_2;
        this.m_ScoreModifierConfig = local_2;
        return;
    }
}

struct FLevelPublicEventInfoConfig : FLevelEventInfoConfigBase
{
    FLevelEventInfoConfigBase _base_FLevelEventInfoConfigBase;
    UPROPERTY()
    float32 PrepareToInteractDuration;
    UPROPERTY()
    float32 InteractableKeepDuration;
    UPROPERTY()
    float32 InProgressDuration;
    UPROPERTY()
    float32 SuccessUnloadDuration;
    UPROPERTY()
    float32 FailedUnloadDuration;
    UPROPERTY()
    float32 MaxDistanceToGetReward;
    UPROPERTY()
    float32 CoolDownDuration;
    UPROPERTY()
    int Priority;
    UPROPERTY()
    FText EventRewardBuffDesc;

    default EventType = ELevelEventType(1);

    FLevelPublicEventInfoConfig()
    {
        super();
        this.PrepareToInteractDuration = 300.0f;
        this.InteractableKeepDuration = 120.0f;
        this.InProgressDuration = 300.0f;
        this.SuccessUnloadDuration = 60.0f;
        this.FailedUnloadDuration = 5.0f;
        this.MaxDistanceToGetReward = 10000.0f;
        this.CoolDownDuration = 300.0f;
        this.Priority = 0;
        this.__InitDefaults();
        return;
    }
}

UFUNCTION()
TDataObjectPtr<FLevelEventInfoConfigBase> GetLevelEventInfoConfig(const FECSEntity &inout Entity)
{
    return TDataObjectPtr<FLevelEventInfoConfigBase>(GetPrefabConfigPtr(Entity).CastTo(FLevelEventInfoConfigBase));
}
const FLevelEventInfoConfigBase GetDefaultedLevelEventInfoConfig(const FECSEntity &inout Entity)
{
    const FLevelEventInfoConfigBase __r;
    if (GetLevelEventInfoConfig(Entity))
    {
    }
    else
    {
    }
    return __r;
}
