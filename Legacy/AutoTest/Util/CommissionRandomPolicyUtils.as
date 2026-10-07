
namespace AutoTest::CommissionRandomPolicyUtils
{
TArray<TDataObjectPtr<FDataObject>> GetAllRandomFactorConfigsByRandomFactorType(const ERandomFactorType RandomFactorType, const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig)
{
    const FRandomSeedConfig& local_12;
    TArray<TDataObjectPtr<FDataObject>> local_8;
    if (!(CommissionConfig) || !(CommissionConfig.opArrow().GetRandomSeedConfig()))
    {
        return local_8;
    }
    for (auto& local_26 : local_12.GetRandomPolicyConfig())
    {
        if (!(local_26))
        {
            continue;
        }
        FRandomPolicyConfig local_66 = __FRandomPolicyConfigFunctions::CastToFRandomPolicyConfig(local_26);
        for (auto& local_80 : local_66.RandomFactorConfig)
        {
            if (int(local_80.RandomFactorType) == int(RandomFactorType))
            {
                local_8.Add(local_80.RandomFactor);
            }
        }
    }
    return local_8;
}
TArray<TDataObjectPtr<FWorldAreaConfig>> GetAllSpawnAreaConfigsByCommissionConfig(const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig)
{
    const FRandomSeedConfig& local_12;
    TArrayConstIterator<FSpawnAreaRandomFactor> local_142;
    TArray<TDataObjectPtr<FWorldAreaConfig>> local_8;
    if (!(CommissionConfig) || !(CommissionConfig.opArrow().GetRandomSeedConfig()))
    {
        return local_8;
    }
    CastTo local_88;
    for (auto& local_26 : local_12.GetRandomPolicyConfig())
    {
        if (!(local_26))
        {
            continue;
        }
        FRandomPolicyConfig local_66 = __FRandomPolicyConfigFunctions::CastToFRandomPolicyConfig(local_26);
        for (auto& local_80 : local_66.RandomFactorConfig)
        {
            if (int(local_80.RandomFactorType) != 1)
            {
                continue;
            }
            if (!(local_88.opCall().IsSet()))
            {
                continue;
            }
            for (; local_142.CanProceed;)
            {
                const FSpawnAreaRandomFactor& local_150 = local_142.Proceed();
                if (!(local_150.Config.IsSet()))
                {
                    continue;
                }
                local_8.Add(local_150.Config);
            }
        }
    }
    return local_8;
}
TArray<TDataObjectPtr<FObjectiveConfig>> GetAllSubTargetConfigsByCommissionConfig(const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig)
{
    const FRandomSeedConfig& local_12;
    TArrayConstIterator<FCommissionSubTargetRandomFactor> local_142;
    TArray<TDataObjectPtr<FObjectiveConfig>> local_8;
    if (!(CommissionConfig) || !(CommissionConfig.opArrow().GetRandomSeedConfig()))
    {
        return local_8;
    }
    CastTo local_88;
    for (auto& local_26 : local_12.GetRandomPolicyConfig())
    {
        if (!(local_26))
        {
            continue;
        }
        FRandomPolicyConfig local_66 = __FRandomPolicyConfigFunctions::CastToFRandomPolicyConfig(local_26);
        for (auto& local_80 : local_66.RandomFactorConfig)
        {
            if (int(local_80.RandomFactorType) != 4)
            {
                continue;
            }
            if (!(local_88.opCall().IsSet()))
            {
                continue;
            }
            for (; local_142.CanProceed;)
            {
                const FCommissionSubTargetRandomFactor& local_150 = local_142.Proceed();
                if (!(local_150.Config.IsSet()))
                {
                    continue;
                }
                local_8.Add(local_150.Config);
            }
        }
    }
    return local_8;
}
TArray<TDataObjectPtr<FCommissionTimeConfig>> GetAllCommissionTimeConfigsByCommissionConfig(const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig)
{
    const FRandomSeedConfig& local_12;
    TArrayConstIterator<FCommissionTimeRandomFactor> local_142;
    TArray<TDataObjectPtr<FCommissionTimeConfig>> local_8;
    if (!(CommissionConfig) || !(CommissionConfig.opArrow().GetRandomSeedConfig()))
    {
        return local_8;
    }
    CastTo local_88;
    for (auto& local_26 : local_12.GetRandomPolicyConfig())
    {
        if (!(local_26))
        {
            continue;
        }
        FRandomPolicyConfig local_66 = __FRandomPolicyConfigFunctions::CastToFRandomPolicyConfig(local_26);
        for (auto& local_80 : local_66.RandomFactorConfig)
        {
            if (int(local_80.RandomFactorType) != 5)
            {
                continue;
            }
            if (!(local_88.opCall().IsSet()))
            {
                continue;
            }
            for (; local_142.CanProceed;)
            {
                const FCommissionTimeRandomFactor& local_150 = local_142.Proceed();
                if (!(local_150.Config.IsSet()))
                {
                    continue;
                }
                local_8.Add(local_150.Config);
            }
        }
    }
    return local_8;
}
TArray<TDataObjectPtr<FWeatherConfig>> GetAllWeatherConfigsByCommissionConfig(const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig)
{
    const FRandomSeedConfig& local_12;
    TArrayConstIterator<FWeatherRandomFactor> local_142;
    TArray<TDataObjectPtr<FWeatherConfig>> local_8;
    if (!(CommissionConfig) || !(CommissionConfig.opArrow().GetRandomSeedConfig()))
    {
        return local_8;
    }
    CastTo local_88;
    for (auto& local_26 : local_12.GetRandomPolicyConfig())
    {
        if (!(local_26))
        {
            continue;
        }
        FRandomPolicyConfig local_66 = __FRandomPolicyConfigFunctions::CastToFRandomPolicyConfig(local_26);
        for (auto& local_80 : local_66.RandomFactorConfig)
        {
            if (int(local_80.RandomFactorType) != 2)
            {
                continue;
            }
            if (!(local_88.opCall().IsSet()))
            {
                continue;
            }
            for (; local_142.CanProceed;)
            {
                const FWeatherRandomFactor& local_150 = local_142.Proceed();
                if (!(local_150.Config.IsSet()))
                {
                    continue;
                }
                local_8.Add(local_150.Config);
            }
        }
    }
    return local_8;
}
TArray<TDataObjectPtr<FWeatherAreaTemplateFactorConfig>> GetAllWeatherAreaTemplateConfigsByCommissionConfig(const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig)
{
    const FRandomSeedConfig& local_12;
    TArray<TDataObjectPtr<FWeatherAreaTemplateFactorConfig>> local_8;
    if (!(CommissionConfig) || !(CommissionConfig.opArrow().GetRandomSeedConfig()))
    {
        return local_8;
    }
    CastTo local_88;
    for (auto& local_26 : local_12.GetRandomPolicyConfig())
    {
        if (!(local_26))
        {
            continue;
        }
        FRandomPolicyConfig local_66 = __FRandomPolicyConfigFunctions::CastToFRandomPolicyConfig(local_26);
        for (auto& local_80 : local_66.RandomFactorConfig)
        {
            if (int(local_80.RandomFactorType) != 2)
            {
                continue;
            }
            if (!(local_88.opCall().IsSet()))
            {
                continue;
            }
            for (auto& local_150 : GetWeatherAreaTemplateFactors())
            {
                if (!(local_150.IsSet()))
                {
                    continue;
                }
                local_8.Add(TDataObjectPtr<FWeatherAreaTemplateFactorConfig>());
            }
        }
    }
    return local_8;
}
TArray<TDataObjectPtr<FWeatherGenerateTemplate>> GetAllWeatherTemplateConfigsByTemplateFactor(const TDataObjectPtr<FWeatherAreaTemplateFactorConfig> &inout WeatherAreaTemplateConfig)
{
    TArrayConstIterator<FWeatherTemplateRandomFactor> local_16;
    TArray<TDataObjectPtr<FWeatherGenerateTemplate>> local_8;
    if (!(WeatherAreaTemplateConfig))
    {
        return local_8;
    }
    for (; local_16.CanProceed;)
    {
        const FWeatherTemplateRandomFactor& local_24 = local_16.Proceed();
        if (!(local_24.Config.IsSet()))
        {
            continue;
        }
        local_8.Add(local_24.Config);
    }
    return local_8;
}
TArray<TDataObjectPtr<FWeatherConfig>> GetAllWeatherConfigsByWeatherTemplate(const TDataObjectPtr<FWeatherGenerateTemplate> &inout WeatherTemplateConfig)
{
    TArrayConstIterator<FWeatherChanceConfig> local_16;
    TArray<TDataObjectPtr<FWeatherConfig>> local_8;
    if (!(WeatherTemplateConfig))
    {
        return local_8;
    }
    for (; local_16.CanProceed;)
    {
        const FWeatherChanceConfig& local_24 = local_16.Proceed();
        if (!(local_24.WeatherName.IsSet()))
        {
            continue;
        }
        local_8.Add(local_24.WeatherName);
    }
    return local_8;
}
TArray<TDataObjectPtr<FIntrusionPolicyConfig>> GetAllIntrusionPolicyConfigsByCommissionConfig(const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig)
{
    const FRandomSeedConfig& local_12;
    TArrayConstIterator<FIntrusionPolicyRandomFactor> local_142;
    TArray<TDataObjectPtr<FIntrusionPolicyConfig>> local_8;
    if (!(CommissionConfig) || !(CommissionConfig.opArrow().GetRandomSeedConfig()))
    {
        return local_8;
    }
    CastTo local_88;
    for (auto& local_26 : local_12.GetRandomPolicyConfig())
    {
        if (!(local_26))
        {
            continue;
        }
        FRandomPolicyConfig local_66 = __FRandomPolicyConfigFunctions::CastToFRandomPolicyConfig(local_26);
        for (auto& local_80 : local_66.RandomFactorConfig)
        {
            if (int(local_80.RandomFactorType) != 3)
            {
                continue;
            }
            if (!(local_88.opCall().IsSet()))
            {
                continue;
            }
            for (; local_142.CanProceed;)
            {
                const FIntrusionPolicyRandomFactor& local_150 = local_142.Proceed();
                if (!(local_150.Config.IsSet()))
                {
                    continue;
                }
                local_8.Add(local_150.Config);
            }
        }
    }
    return local_8;
}
TArray<TDataObjectPtr<FCommissionEntryRuleConfig>> GetAllEntryRuleConfigsByCommissionConfig(const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig)
{
    const FRandomSeedConfig& local_12;
    TArrayConstIterator<FCommissionEntryRuleRandomFactor> local_142;
    TArray<TDataObjectPtr<FCommissionEntryRuleConfig>> local_8;
    if (!(CommissionConfig) || !(CommissionConfig.opArrow().GetRandomSeedConfig()))
    {
        return local_8;
    }
    CastTo local_88;
    for (auto& local_26 : local_12.GetRandomPolicyConfig())
    {
        if (!(local_26))
        {
            continue;
        }
        FRandomPolicyConfig local_66 = __FRandomPolicyConfigFunctions::CastToFRandomPolicyConfig(local_26);
        for (auto& local_80 : local_66.RandomFactorConfig)
        {
            if (int(local_80.RandomFactorType) != 6)
            {
                continue;
            }
            if (!(local_88.opCall().IsSet()))
            {
                continue;
            }
            for (; local_142.CanProceed;)
            {
                const FCommissionEntryRuleRandomFactor& local_150 = local_142.Proceed();
                if (!(local_150.Config.IsSet()))
                {
                    continue;
                }
                local_8.Add(local_150.Config);
            }
        }
    }
    return local_8;
}
}
