namespace AutoTest::CommissionRandomPolicyUtils
{
TArray<TDataObjectPtr<FDataObject>> GetAllRandomFactorConfigsByRandomFactorType(const ERandomFactorType RandomFactorType, const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig)
{
    TArray<TDataObjectPtr<FDataObject>> local_8;
    if (!(CommissionConfig) || !(CommissionConfig.opArrow().GetRandomSeedConfig()))
    {
        return local_8;
    }
    const FRandomSeedConfig& local_12 = CommissionConfig.opArrow().GetRandomSeedConfig().Get();
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
    TArray<TDataObjectPtr<FWorldAreaConfig>> local_8;
    if (!(CommissionConfig) || !(CommissionConfig.opArrow().GetRandomSeedConfig()))
    {
        return local_8;
    }
    const FRandomSeedConfig& local_12 = CommissionConfig.opArrow().GetRandomSeedConfig().Get();
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
            CastTo local_88;
            TDataObjectPtr<FSpawnAreaPoolConfig> local_112 = local_88.opCall();
            if (!(local_112.IsSet()))
            {
                continue;
            }
            for (auto& local_150 : local_112.Get().TargetRandomPool)
            {
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
    TArray<TDataObjectPtr<FObjectiveConfig>> local_8;
    if (!(CommissionConfig) || !(CommissionConfig.opArrow().GetRandomSeedConfig()))
    {
        return local_8;
    }
    const FRandomSeedConfig& local_12 = CommissionConfig.opArrow().GetRandomSeedConfig().Get();
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
            CastTo local_88;
            TDataObjectPtr<FCommissionSubTargetPoolConfig> local_112 = local_88.opCall();
            if (!(local_112.IsSet()))
            {
                continue;
            }
            for (auto& local_150 : local_112.Get().TargetRandomPool)
            {
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
    TArray<TDataObjectPtr<FCommissionTimeConfig>> local_8;
    if (!(CommissionConfig) || !(CommissionConfig.opArrow().GetRandomSeedConfig()))
    {
        return local_8;
    }
    const FRandomSeedConfig& local_12 = CommissionConfig.opArrow().GetRandomSeedConfig().Get();
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
            CastTo local_88;
            TDataObjectPtr<FCommissionTimePoolConfig> local_112 = local_88.opCall();
            if (!(local_112.IsSet()))
            {
                continue;
            }
            for (auto& local_150 : local_112.Get().TargetRandomPool)
            {
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
    TArray<TDataObjectPtr<FWeatherConfig>> local_8;
    if (!(CommissionConfig) || !(CommissionConfig.opArrow().GetRandomSeedConfig()))
    {
        return local_8;
    }
    const FRandomSeedConfig& local_12 = CommissionConfig.opArrow().GetRandomSeedConfig().Get();
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
            CastTo local_88;
            TDataObjectPtr<FCommissionWeatherPoolConfig> local_112 = local_88.opCall();
            if (!(local_112.IsSet()))
            {
                continue;
            }
            for (auto& local_150 : local_112.Get().WeatherRandomPool)
            {
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
    TArray<TDataObjectPtr<FWeatherAreaTemplateFactorConfig>> local_8;
    if (!(CommissionConfig) || !(CommissionConfig.opArrow().GetRandomSeedConfig()))
    {
        return local_8;
    }
    const FRandomSeedConfig& local_12 = CommissionConfig.opArrow().GetRandomSeedConfig().Get();
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
            CastTo local_88;
            TDataObjectPtr<FCommissionWeatherPoolConfig> local_112 = local_88.opCall();
            if (!(local_112.IsSet()))
            {
                continue;
            }
            for (auto& local_150 : local_112.Get().GetWeatherAreaTemplateFactors())
            {
                if (!(local_150.IsSet()))
                {
                    continue;
                }
                local_8.Add(TDataObjectPtr<FWeatherAreaTemplateFactorConfig>(local_150.Get()));
            }
        }
    }
    return local_8;
}
TArray<TDataObjectPtr<FWeatherGenerateTemplate>> GetAllWeatherTemplateConfigsByTemplateFactor(const TDataObjectPtr<FWeatherAreaTemplateFactorConfig> &inout WeatherAreaTemplateConfig)
{
    TArray<TDataObjectPtr<FWeatherGenerateTemplate>> local_8;
    if (!(WeatherAreaTemplateConfig))
    {
        return local_8;
    }
    for (auto& local_24 : WeatherAreaTemplateConfig.Get().WeatherTemplateTargetRandomPool)
    {
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
    TArray<TDataObjectPtr<FWeatherConfig>> local_8;
    if (!(WeatherTemplateConfig))
    {
        return local_8;
    }
    for (auto& local_24 : WeatherTemplateConfig.Get().WeatherChances)
    {
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
    TArray<TDataObjectPtr<FIntrusionPolicyConfig>> local_8;
    if (!(CommissionConfig) || !(CommissionConfig.opArrow().GetRandomSeedConfig()))
    {
        return local_8;
    }
    const FRandomSeedConfig& local_12 = CommissionConfig.opArrow().GetRandomSeedConfig().Get();
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
            CastTo local_88;
            TDataObjectPtr<FIntrusionPolicyPoolConfig> local_112 = local_88.opCall();
            if (!(local_112.IsSet()))
            {
                continue;
            }
            for (auto& local_150 : local_112.Get().TargetRandomPool)
            {
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
    TArray<TDataObjectPtr<FCommissionEntryRuleConfig>> local_8;
    if (!(CommissionConfig) || !(CommissionConfig.opArrow().GetRandomSeedConfig()))
    {
        return local_8;
    }
    const FRandomSeedConfig& local_12 = CommissionConfig.opArrow().GetRandomSeedConfig().Get();
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
            CastTo local_88;
            TDataObjectPtr<FCommissionEntryRulePoolConfig> local_112 = local_88.opCall();
            if (!(local_112.IsSet()))
            {
                continue;
            }
            for (auto& local_150 : local_112.Get().TargetRandomPool)
            {
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
