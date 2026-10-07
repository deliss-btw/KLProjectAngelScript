
enum ELevelType
{
    Default,
    NATIVE_MAX = 0,
    City,
    BigWorld,
    Commission,
    Dungeon,
    PVX,
    Training,
}

enum ESpawnPointSelectionRule
{
    TeamMatchedRandom,
    SameSpotPerTeam,
    RandomPerPlayer,
    TeamMatchedBalanced,
}

enum EInitWeatherPolicy
{
    None,
    Commission,
    Override,
}


struct FLevelInfoConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    ELevelType LevelType;
    UPROPERTY()
    FString BaseLevelName;
    UPROPERTY()
    uint CityLevelId;
    UPROPERTY()
    FText LevelDisplayName;
    UPROPERTY()
    FDataObjectPtr m_MapConfig;
    UPROPERTY()
    TSoftClassPtr<UAS_GameModeSettings> GameSettings;
    UPROPERTY()
    TSet<EKLDataLayerFilterTags> LoadFilterTags;
    UPROPERTY()
    TSet<TSoftClassPtr<AKLLevelScriptActor>> ExtraLoadDatalayerClasses;
    UPROPERTY()
    FKLGameplayTagQuery LoadTagQuery;
    UPROPERTY()
    ESpawnPointSelectionRule SpawnPointRule;
    UPROPERTY()
    FDataObjectPtr m_ReviveRule;
    UPROPERTY()
    FDataObjectPtr m_GameRuleConfig;
    UPROPERTY()
    FDataObjectPtr m_MinimapDisplayConfigOverride;
    UPROPERTY()
    bool bShowAllTeleporters;
    UPROPERTY()
    bool bIsDevLevel;
    UPROPERTY()
    bool bIsCommonLevel;
    UPROPERTY()
    EInitWeatherPolicy InitWeatherPolicy;
    UPROPERTY()
    FDataObjectPtr m_WeatherAreaTemplateOverride;


    const TDataObjectPtr<FMapConfig> GetMapConfig() const property
    {
        const TDataObjectPtr<FMapConfig> __r;
        return __r;
    }
    void SetMapConfig(const TDataObjectPtr<FMapConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FMapConfig>> local_2;
        this.m_MapConfig = local_2;
        return;
    }
    const TDataObjectPtr<FReviveData> GetReviveRule() const property
    {
        const TDataObjectPtr<FReviveData> __r;
        return __r;
    }
    void SetReviveRule(const TDataObjectPtr<FReviveData> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FReviveData>> local_2;
        this.m_ReviveRule = local_2;
        return;
    }
    const TDataObjectPtr<FGameRuleConfig> GetGameRuleConfig() const property
    {
        const TDataObjectPtr<FGameRuleConfig> __r;
        return __r;
    }
    void SetGameRuleConfig(const TDataObjectPtr<FGameRuleConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FGameRuleConfig>> local_2;
        this.m_GameRuleConfig = local_2;
        return;
    }
    const TDataObjectPtr<FMinimapDisplayConfig> GetMinimapDisplayConfigOverride() const property
    {
        const TDataObjectPtr<FMinimapDisplayConfig> __r;
        return __r;
    }
    void SetMinimapDisplayConfigOverride(const TDataObjectPtr<FMinimapDisplayConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FMinimapDisplayConfig>> local_2;
        this.m_MinimapDisplayConfigOverride = local_2;
        return;
    }
    const TDataObjectPtr<FAreaWeatherTemplateConfig> GetWeatherAreaTemplateOverride() const property
    {
        const TDataObjectPtr<FAreaWeatherTemplateConfig> __r;
        return __r;
    }
    void SetWeatherAreaTemplateOverride(const TDataObjectPtr<FAreaWeatherTemplateConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FAreaWeatherTemplateConfig>> local_2;
        this.m_WeatherAreaTemplateOverride = local_2;
        return;
    }
}

struct FLevelTypeConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FDataObjectPtr m_LevelInfoConfig;


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
}

namespace FLevelInfoConfig
{
TDataObjectPtr<FLevelInfoConfig> GetByDataId(const uint DataId)
{
    return TDataObjectPtr<FLevelInfoConfig>();
}
}
