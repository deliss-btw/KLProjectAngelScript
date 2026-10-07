
enum EWeatherGameplayType
{
    Normal,
    Bad,
}


struct FGlobalEnvEffectWeatherConfig
{
    UPROPERTY()
    float32 MaxWeight = 1.0f;


}

struct FTODStageConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FText DisplayName;
    UPROPERTY()
    FSoftBrush DisplayIcon;
    UPROPERTY()
    FText DisplayHintText;

    FTODStageConfig()
    {
        return;
    }
}

struct FArtWeatherSingleParam
{
    UPROPERTY()
    FName ArtWeatherName;
    UPROPERTY()
    float32 BlendInTime;


}

struct FArtWeatherConfig
{
    UPROPERTY()
    TArray<FArtWeatherSingleParam> ArtWeathers;

    FArtWeatherConfig()
    {
        return;
    }
}

struct FArtWeatherRegionConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FArtWeatherConfig DefaultArtWeather;
    UPROPERTY()
    TMap<FDataObjectPtr, FArtWeatherConfig> m_ArtWeatherByRegion;

    FArtWeatherRegionConfig()
    {
        return;
    }
    void GetArtWeatherConfig(const TDataObjectPtr<FWorldAreaConfig> &inout WorldAreaConfig, FArtWeatherConfig &inout ArtWeatherConfig) const
    {
        if (WorldAreaConfig.IsSet() && this.GetArtWeatherByRegion().Contains(WorldAreaConfig))
        {
            return;
        }
        return;
    }
    const TMap<TDataObjectPtr<FWorldAreaConfig>, FArtWeatherConfig> GetArtWeatherByRegion() const property
    {
        const TMap<TDataObjectPtr<FWorldAreaConfig>, FArtWeatherConfig> __r;
        return __r;
    }
    void SetArtWeatherByRegion(const TMap<TDataObjectPtr<FWorldAreaConfig>, FArtWeatherConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<TMap<FDataObjectPtr, FArtWeatherConfig>, TMap<TDataObjectPtr<FWorldAreaConfig>, FArtWeatherConfig>> local_2;
        this.m_ArtWeatherByRegion = local_2;
        return;
    }
}

struct FBadWeatherDropItemRateUpRule : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    float32 ExtraDropRateUpPercentage;
    UPROPERTY()
    int ExtraDropRateCountUp;
    UPROPERTY()
    float32 BaseDropRateUpPercentage;
    UPROPERTY()
    TArray<FDataObjectPtr> m_BaseDropItems;


    const TArray<TDataObjectPtr<FItemConfig>> GetBaseDropItems() const property
    {
        const TArray<TDataObjectPtr<FItemConfig>> __r;
        return __r;
    }
    void SetBaseDropItems(const TArray<TDataObjectPtr<FItemConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FItemConfig>>> local_2;
        this.m_BaseDropItems = local_2;
        return;
    }
}

struct FWeatherConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    TSoftClassPtr<AECSPrefab> Prefab;
    UPROPERTY()
    TSoftClassPtr<UEASAbility> Ability;
    UPROPERTY()
    FBuffConfigRef BuffConfig;
    UPROPERTY()
    FDataObjectPtr m_BuffMessageHintConfig;
    UPROPERTY()
    float32 BuffConfigAddDelay = 5.0f;
    UPROPERTY()
    FText DisplayName;
    UPROPERTY()
    FSoftBrush DisplayIcon;
    UPROPERTY()
    FSoftBrush LargeIcon;
    UPROPERTY()
    FText DisplayHintContent;
    UPROPERTY()
    FText WeatherAbilityDescription;
    UPROPERTY()
    FText WeatherChangeText;
    UPROPERTY()
    bool bBadWeather = false;
    UPROPERTY()
    bool bCommissionRewardUp = false;
    UPROPERTY()
    FDataObjectPtr m_BadWeatherUpRule;
    UPROPERTY()
    TMap<EGlobalEnvEffectWeatherType, FGlobalEnvEffectWeatherConfig> WeatherEffect;
    UPROPERTY()
    FGameplayTagContainer WeatherElements;
    UPROPERTY()
    FDataObjectPtr m_ArtWeatherConfig;


    const TDataObjectPtr<FMessageHintConfig> GetBuffMessageHintConfig() const property
    {
        const TDataObjectPtr<FMessageHintConfig> __r;
        return __r;
    }
    void SetBuffMessageHintConfig(const TDataObjectPtr<FMessageHintConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FMessageHintConfig>> local_2;
        this.m_BuffMessageHintConfig = local_2;
        return;
    }
    const TDataObjectPtr<FBadWeatherDropItemRateUpRule> GetBadWeatherUpRule() const property
    {
        const TDataObjectPtr<FBadWeatherDropItemRateUpRule> __r;
        return __r;
    }
    void SetBadWeatherUpRule(const TDataObjectPtr<FBadWeatherDropItemRateUpRule> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FBadWeatherDropItemRateUpRule>> local_2;
        this.m_BadWeatherUpRule = local_2;
        return;
    }
    TDataObjectPtr<FArtWeatherRegionConfig> GetArtWeatherConfig() const property
    {
        TDataObjectPtr<FArtWeatherRegionConfig> __r;
        return __r;
    }
    void SetArtWeatherConfig(const TDataObjectPtr<FArtWeatherRegionConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FArtWeatherRegionConfig>> local_2;
        this.m_ArtWeatherConfig = local_2;
        return;
    }
}

struct FWeatherChanceConfig
{
    UPROPERTY()
    TDataObjectPtr<FWeatherConfig> WeatherName;
    UPROPERTY()
    int Weight;
    UPROPERTY()
    float32 MinDuration;
    UPROPERTY()
    float32 MaxDuration;


}

struct FWeatherGenerateTemplate : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    TArray<FWeatherChanceConfig> WeatherChances;


    int GetWeatherChanceConfigIndex(const TDataObjectPtr<FWeatherConfig> &inout WeatherConfig) const
    {
        int local_1 = 0;
        for (; local_1 < this.WeatherChances.Num(); ++local_1)
        {
            if ((this.WeatherChances[local_1].WeatherName.GetDataName() == WeatherConfig.GetDataName()))
            {
                return local_1;
            }
        }
        return -1;
    }
}

struct FRuntimeWeatherInfo
{
    UPROPERTY()
    TDataObjectPtr<FWeatherConfig> m_WeatherConfig;
    UPROPERTY()
    int m_StartAtTimeInSeconds;


    TDataObjectPtr<FWeatherConfig> GetWeatherConfig() const property
    {
        TDataObjectPtr<FWeatherConfig> __r;
        return __r;
    }
    TDataObjectPtr<FWeatherConfig> GetWeatherConfig() property
    {
        TDataObjectPtr<FWeatherConfig> __r;
        return __r;
    }
    void SetWeatherConfig(const TDataObjectPtr<FWeatherConfig> &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    int GetStartAtTimeInSeconds() const property
    {
        return this.m_StartAtTimeInSeconds;
    }
    void SetStartAtTimeInSeconds(const int __Value) property
    {
        this.m_StartAtTimeInSeconds = __Value;
        return;
    }
}

struct FWeatherGenerateTemplateWrapper
{
    UPROPERTY()
    TDataObjectPtr<FWeatherGenerateTemplate> WeatherTemplate;

    FWeatherGenerateTemplateWrapper()
    {
        return;
    }
}

struct FAreaWeatherTemplateConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TMap<FDataObjectPtr, FWeatherGenerateTemplateWrapper> m_WeatherTemplateByRegion;

    FAreaWeatherTemplateConfig()
    {
        return;
    }
    const TMap<TDataObjectPtr<FWorldAreaConfig>, FWeatherGenerateTemplateWrapper> GetWeatherTemplateByRegion() const property
    {
        const TMap<TDataObjectPtr<FWorldAreaConfig>, FWeatherGenerateTemplateWrapper> __r;
        return __r;
    }
    void SetWeatherTemplateByRegion(const TMap<TDataObjectPtr<FWorldAreaConfig>, FWeatherGenerateTemplateWrapper> &inout __Value) property
    {
        _AsTDataObjectPtrView<TMap<FDataObjectPtr, FWeatherGenerateTemplateWrapper>, TMap<TDataObjectPtr<FWorldAreaConfig>, FWeatherGenerateTemplateWrapper>> local_2;
        this.m_WeatherTemplateByRegion = local_2;
        return;
    }
}

