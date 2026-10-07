
enum ERandomFactorType
{
    None,
    SpawnArea,
    Weather,
    IntrusionPolicy,
    SubTarget,
    CommissionTime,
    CommissionEntryRule,
}


struct FSpawnAreaRandomFactor
{
    UPROPERTY()
    TDataObjectPtr<FWorldAreaConfig> Config;
    UPROPERTY()
    uint Weight;


}

struct FSpawnAreaPoolConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FText Description;
    UPROPERTY()
    TArray<FSpawnAreaRandomFactor> TargetRandomPool;


}

struct FWeatherRandomFactor
{
    UPROPERTY()
    TDataObjectPtr<FWeatherConfig> Config;
    UPROPERTY()
    uint Weight;


}

struct FWeatherTemplateRandomFactor
{
    UPROPERTY()
    TDataObjectPtr<FWeatherGenerateTemplate> Config;
    UPROPERTY()
    uint Weight;


}

struct FWeatherAreaTemplateFactorConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FDataObjectPtr m_AreaConfig;
    UPROPERTY()
    TArray<FWeatherTemplateRandomFactor> WeatherTemplateTargetRandomPool;


    const TDataObjectPtr<FWorldAreaConfig> GetAreaConfig() const property
    {
        const TDataObjectPtr<FWorldAreaConfig> __r;
        return __r;
    }
    void SetAreaConfig(const TDataObjectPtr<FWorldAreaConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FWorldAreaConfig>> local_2;
        this.m_AreaConfig = local_2;
        return;
    }
}

struct FCommissionWeatherPoolConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FText Description;
    UPROPERTY()
    TArray<FWeatherRandomFactor> WeatherRandomPool;
    UPROPERTY()
    TArray<FDataObjectPtr> m_WeatherAreaTemplateFactors;


    const TArray<TDataObjectPtr<FWeatherAreaTemplateFactorConfig>> GetWeatherAreaTemplateFactors() const property
    {
        const TArray<TDataObjectPtr<FWeatherAreaTemplateFactorConfig>> __r;
        return __r;
    }
    void SetWeatherAreaTemplateFactors(const TArray<TDataObjectPtr<FWeatherAreaTemplateFactorConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FWeatherAreaTemplateFactorConfig>>> local_2;
        this.m_WeatherAreaTemplateFactors = local_2;
        return;
    }
}

struct FIntrusionPolicyRandomFactor
{
    UPROPERTY()
    TDataObjectPtr<FIntrusionPolicyConfig> Config;
    UPROPERTY()
    uint Weight;


}

struct FIntrusionPolicyPoolConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FText Description;
    UPROPERTY()
    TArray<FIntrusionPolicyRandomFactor> TargetRandomPool;


}

struct FCommissionSubTargetRandomFactor
{
    UPROPERTY()
    TDataObjectPtr<FObjectiveConfig> Config;
    UPROPERTY()
    uint Weight;


}

struct FCommissionSubTargetPoolConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FText Description;
    UPROPERTY()
    TArray<FCommissionSubTargetRandomFactor> TargetRandomPool;


}

struct FCommissionTimeRandomFactor
{
    UPROPERTY()
    TDataObjectPtr<FCommissionTimeConfig> Config;
    UPROPERTY()
    uint Weight;


}

struct FCommissionTimePoolConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FText Description;
    UPROPERTY()
    TArray<FCommissionTimeRandomFactor> TargetRandomPool;


}

struct FCommissionEntryRuleRandomFactor
{
    UPROPERTY()
    TDataObjectPtr<FCommissionEntryRuleConfig> Config;
    UPROPERTY()
    uint Weight;


}

struct FCommissionEntryRulePoolConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FText Description;
    UPROPERTY()
    TArray<FCommissionEntryRuleRandomFactor> TargetRandomPool;


}

struct FRandomFactorConfig
{
    UPROPERTY()
    ERandomFactorType RandomFactorType;
    UPROPERTY()
    TDataObjectPtr<FDataObject> RandomFactor;


    UScriptStruct GetRandomFactorType() const
    {
        UScriptStruct local_6;
        switch (int(this.RandomFactorType))
        {
        case 1:
        {
            return FSpawnAreaPoolConfig;
        }
        case 2:
        {
            return FCommissionWeatherPoolConfig;
        }
        case 3:
        {
            return FIntrusionPolicyPoolConfig;
        }
        case 4:
        {
            return FCommissionSubTargetPoolConfig;
        }
        case 5:
        {
            return FCommissionTimePoolConfig;
        }
        case 6:
        {
            return FCommissionEntryRulePoolConfig;
        }
        default:
        {
            local_6 = FDataObject;
        }
        }
        return local_6;
    }
}

struct FRandomPolicyConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    TArray<FRandomFactorConfig> RandomFactorConfig;
    UPROPERTY()
    uint Weight;


}

struct FRandomSeedConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FText RandomSeedName;
    UPROPERTY()
    TArray<FDataObjectPtr> m_RandomPolicyConfig;


    const TArray<TDataObjectPtr<FRandomPolicyConfig>> GetRandomPolicyConfig() const property
    {
        const TArray<TDataObjectPtr<FRandomPolicyConfig>> __r;
        return __r;
    }
    void SetRandomPolicyConfig(const TArray<TDataObjectPtr<FRandomPolicyConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FRandomPolicyConfig>>> local_2;
        this.m_RandomPolicyConfig = local_2;
        return;
    }
}

struct FRandomFactorBlacklistConfig
{
    UPROPERTY()
    ERandomFactorType RandomFactorType;
    UPROPERTY()
    TDataObjectPtr<FDataObject> RandomFactor;


    UScriptStruct GetRandomFactorType() const
    {
        UScriptStruct local_6;
        switch (int(this.RandomFactorType))
        {
        case 1:
        {
            return FWorldAreaConfig;
        }
        case 2:
        {
            return FWeatherConfig;
        }
        case 3:
        {
            return FIntrusionPolicyConfig;
        }
        case 4:
        {
            return FObjectiveConfig;
        }
        case 5:
        {
            return FCommissionTimeConfig;
        }
        case 6:
        {
            return FCommissionEntryRuleConfig;
        }
        default:
        {
            local_6 = FDataObject;
        }
        }
        return local_6;
    }
}

struct FRandomPolicyBlacklistConfigBase : FDataObject
{
    FDataObject _base_FDataObject;

    FRandomPolicyBlacklistConfigBase()
    {
        return;
    }
}

struct FRandomPolicyBlacklistSingleConfig : FRandomPolicyBlacklistConfigBase
{
    FRandomPolicyBlacklistConfigBase _base_FRandomPolicyBlacklistConfigBase;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    TArray<FRandomFactorBlacklistConfig> RandomFactorBlacklistConfig;


}

struct FRandomPolicyBlacklistGroupConfig : FRandomPolicyBlacklistConfigBase
{
    FRandomPolicyBlacklistConfigBase _base_FRandomPolicyBlacklistConfigBase;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    TArray<FDataObjectPtr> m_BlacklistSingleConfigs;


    const TArray<TDataObjectPtr<FRandomPolicyBlacklistSingleConfig>> GetBlacklistSingleConfigs() const property
    {
        const TArray<TDataObjectPtr<FRandomPolicyBlacklistSingleConfig>> __r;
        return __r;
    }
    void SetBlacklistSingleConfigs(const TArray<TDataObjectPtr<FRandomPolicyBlacklistSingleConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FRandomPolicyBlacklistSingleConfig>>> local_2;
        this.m_BlacklistSingleConfigs = local_2;
        return;
    }
}

struct FRandomConstraintConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    ECommissionType CommissionType;
    UPROPERTY()
    ERandomFactorType RandomFactorType;
    UPROPERTY()
    TArray<FDataObjectPtr> m_RandomFactor;
    UPROPERTY()
    uint MaxTotalRatio;


    UScriptStruct GetRandomFactorType() const
    {
        UScriptStruct local_6;
        switch (int(this.RandomFactorType))
        {
        case 1:
        {
            return FWorldAreaConfig;
        }
        case 2:
        {
            return FWeatherConfig;
        }
        case 3:
        {
            return FIntrusionPolicyConfig;
        }
        case 4:
        {
            return FObjectiveConfig;
        }
        case 5:
        {
            return FCommissionTimeConfig;
        }
        case 6:
        {
            return FCommissionEntryRuleConfig;
        }
        default:
        {
            local_6 = FDataObject;
        }
        }
        return local_6;
    }
    const TArray<TDataObjectPtr<FDataObject>> GetRandomFactor() const property
    {
        const TArray<TDataObjectPtr<FDataObject>> __r;
        return __r;
    }
    void SetRandomFactor(const TArray<TDataObjectPtr<FDataObject>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FDataObject>>> local_2;
        this.m_RandomFactor = local_2;
        return;
    }
}

struct FRandomConstraintHardConfig : FRandomConstraintConfig
{
    FRandomConstraintConfig _base_FRandomConstraintConfig;

    default CommissionType = ECommissionType(2);

    FRandomConstraintHardConfig()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

struct FRandomConstraintExtremeConfig : FRandomConstraintConfig
{
    FRandomConstraintConfig _base_FRandomConstraintConfig;

    default CommissionType = ECommissionType(4);

    FRandomConstraintExtremeConfig()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

