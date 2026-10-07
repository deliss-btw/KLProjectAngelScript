
namespace FPIECommissionRandomPolicy
{
TDataObjectPtr<FRandomPolicyConfig> GetRandomPolicyByRandomSeedConfig(const TDataObjectPtr<FRandomSeedConfig> &inout RandomSeedConfig)
{
    int local_66 = 0;
    if (!(RandomSeedConfig.IsSet()))
    {
        return TDataObjectPtr<FRandomPolicyConfig>(nullptr);
    }
    TArray<TDataObjectPtr<FRandomPolicyConfig>> local_54 = GetRandomPolicyConfig();
    TArray<TDataObjectPtr<FRandomPolicyConfig>> local_58;
    TArray<uint> local_62;
    int local_63 = -1;
    int local_65 = 0;
    for (auto& local_80 : local_54)
    {
        if (!(local_80.IsSet()))
        {
            continue;
        }
        if (local_66 == 0)
        {
            continue;
        }
        local_58.Add(local_80);
        local_65 = local_65 + 0;
    }
    if (local_58.Num() == 0 || (local_65 == 0))
    {
        return TDataObjectPtr<FRandomPolicyConfig>(nullptr);
    }
    int local_64 = FMath::RandRange(1, local_65);
    int local_85 = 0;
    int local_86 = 0;
    for (; local_86 < local_58.Num(); ++local_86)
    {
        local_85 = local_85 + local_62[local_86];
        if (local_64 <= local_85)
        {
            local_63 = local_86;
            break;
        }
    }
    if (local_63 < 0 || (local_63 >= local_58.Num()))
    {
        return TDataObjectPtr<FRandomPolicyConfig>(nullptr);
    }
    return local_58[local_63];
}
TDataObjectPtr<FWorldAreaConfig> GetRandomSpwanAreaBySpawnAreaPoolConfig(const TDataObjectPtr<FSpawnAreaPoolConfig> &inout SpawnAreaPoolConfig)
{
    if (!(SpawnAreaPoolConfig.IsSet()))
    {
        return TDataObjectPtr<FWorldAreaConfig>(nullptr);
    }
    TArray<FSpawnAreaRandomFactor> local_54;
    TArray<TDataObjectPtr<FWorldAreaConfig>> local_58;
    TArray<uint> local_62;
    int local_63 = -1;
    int local_65 = 0;
    for (auto& local_80 : local_54)
    {
        if (!(local_80.Config.IsSet()))
        {
            continue;
        }
        if (int(local_80.Weight) == 0)
        {
            continue;
        }
        local_62.Add(local_58.Add(local_80.Config));
        local_65 = local_65 + int(local_80.Weight);
    }
    if (local_58.Num() == 0 || (local_65 == 0))
    {
        return TDataObjectPtr<FWorldAreaConfig>(nullptr);
    }
    int local_64 = FMath::RandRange(1, local_65);
    int local_85 = 0;
    int local_86 = 0;
    for (; local_86 < local_58.Num(); ++local_86)
    {
        local_85 = local_85 + local_62[local_86];
        if (local_64 <= local_85)
        {
            local_63 = local_86;
            break;
        }
    }
    if (local_63 < 0 || (local_63 >= local_58.Num()))
    {
        return TDataObjectPtr<FWorldAreaConfig>(nullptr);
    }
    return local_58[local_63];
}
TDataObjectPtr<FWeatherConfig> GetRandomWeatherByWeatherPoolConfig(const TDataObjectPtr<FCommissionWeatherPoolConfig> &inout WeatherPoolConfig)
{
    if (!(WeatherPoolConfig.IsSet()))
    {
        return TDataObjectPtr<FWeatherConfig>(nullptr);
    }
    TArray<FWeatherRandomFactor> local_54;
    TArray<TDataObjectPtr<FWeatherConfig>> local_58;
    TArray<uint> local_62;
    int local_63 = -1;
    int local_65 = 0;
    for (auto& local_80 : local_54)
    {
        if (!(local_80.Config.IsSet()))
        {
            continue;
        }
        if (int(local_80.Weight) == 0)
        {
            continue;
        }
        local_62.Add(local_58.Add(local_80.Config));
        local_65 = local_65 + int(local_80.Weight);
    }
    if (local_58.Num() == 0 || (local_65 == 0))
    {
        return TDataObjectPtr<FWeatherConfig>(nullptr);
    }
    int local_64 = FMath::RandRange(1, local_65);
    int local_85 = 0;
    int local_86 = 0;
    for (; local_86 < local_58.Num(); ++local_86)
    {
        local_85 = local_85 + local_62[local_86];
        if (local_64 <= local_85)
        {
            local_63 = local_86;
            break;
        }
    }
    if (local_63 < 0 || (local_63 >= local_58.Num()))
    {
        return TDataObjectPtr<FWeatherConfig>(nullptr);
    }
    return local_58[local_63];
}
TDataObjectPtr<FCommissionTimeConfig> GetRandomCommissionTimeByCommissionTimePoolConfig(const TDataObjectPtr<FCommissionTimePoolConfig> &inout CommissionTimePoolConfig)
{
    if (!(CommissionTimePoolConfig.IsSet()))
    {
        return TDataObjectPtr<FCommissionTimeConfig>(nullptr);
    }
    TArray<FCommissionTimeRandomFactor> local_54;
    TArray<TDataObjectPtr<FCommissionTimeConfig>> local_58;
    TArray<uint> local_62;
    int local_63 = -1;
    int local_65 = 0;
    for (auto& local_80 : local_54)
    {
        if (!(local_80.Config.IsSet()))
        {
            continue;
        }
        if (int(local_80.Weight) == 0)
        {
            continue;
        }
        local_62.Add(local_58.Add(local_80.Config));
        local_65 = local_65 + int(local_80.Weight);
    }
    if (local_58.Num() == 0 || (local_65 == 0))
    {
        return TDataObjectPtr<FCommissionTimeConfig>(nullptr);
    }
    int local_64 = FMath::RandRange(1, local_65);
    int local_85 = 0;
    int local_86 = 0;
    for (; local_86 < local_58.Num(); ++local_86)
    {
        local_85 = local_85 + local_62[local_86];
        if (local_64 <= local_85)
        {
            local_63 = local_86;
            break;
        }
    }
    if (local_63 < 0 || (local_63 >= local_58.Num()))
    {
        return TDataObjectPtr<FCommissionTimeConfig>(nullptr);
    }
    return local_58[local_63];
}
TDataObjectPtr<FObjectiveConfig> GetRandomSubTargetBySubTargetPoolConfig(const TDataObjectPtr<FCommissionSubTargetPoolConfig> &inout SubTargetPoolConfig)
{
    if (!(SubTargetPoolConfig.IsSet()))
    {
        return TDataObjectPtr<FObjectiveConfig>(nullptr);
    }
    TArray<FCommissionSubTargetRandomFactor> local_54;
    TArray<TDataObjectPtr<FObjectiveConfig>> local_58;
    TArray<uint> local_62;
    int local_63 = -1;
    int local_65 = 0;
    for (auto& local_80 : local_54)
    {
        if (!(local_80.Config.IsSet()))
        {
            continue;
        }
        if (int(local_80.Weight) == 0)
        {
            continue;
        }
        local_62.Add(local_58.Add(local_80.Config));
        local_65 = local_65 + int(local_80.Weight);
    }
    if (local_58.Num() == 0 || (local_65 == 0))
    {
        return TDataObjectPtr<FObjectiveConfig>(nullptr);
    }
    int local_64 = FMath::RandRange(1, local_65);
    int local_85 = 0;
    int local_86 = 0;
    for (; local_86 < local_58.Num(); ++local_86)
    {
        local_85 = local_85 + local_62[local_86];
        if (local_64 <= local_85)
        {
            local_63 = local_86;
            break;
        }
    }
    if (local_63 < 0 || (local_63 >= local_58.Num()))
    {
        return TDataObjectPtr<FObjectiveConfig>(nullptr);
    }
    return local_58[local_63];
}
TDataObjectPtr<FIntrusionPolicyConfig> GetRandomIntrusionPolicyByIntrusionPolicyPoolConfig(const TDataObjectPtr<FIntrusionPolicyPoolConfig> &inout IntrusionPolicyPoolConfig)
{
    if (!(IntrusionPolicyPoolConfig.IsSet()))
    {
        return TDataObjectPtr<FIntrusionPolicyConfig>(nullptr);
    }
    TArray<FIntrusionPolicyRandomFactor> local_54;
    TArray<TDataObjectPtr<FIntrusionPolicyConfig>> local_58;
    TArray<uint> local_62;
    int local_63 = -1;
    int local_65 = 0;
    for (auto& local_80 : local_54)
    {
        if (int(local_80.Weight) == 0)
        {
            continue;
        }
        local_62.Add(local_58.Add(local_80.Config));
        local_65 = local_65 + int(local_80.Weight);
    }
    if (local_58.Num() == 0 || (local_65 == 0))
    {
        return TDataObjectPtr<FIntrusionPolicyConfig>(nullptr);
    }
    int local_64 = FMath::RandRange(1, local_65);
    int local_85 = 0;
    int local_86 = 0;
    for (; local_86 < local_58.Num(); ++local_86)
    {
        local_85 = local_85 + local_62[local_86];
        if (local_64 <= local_85)
        {
            local_63 = local_86;
            break;
        }
    }
    if (local_63 < 0 || (local_63 >= local_58.Num()))
    {
        return TDataObjectPtr<FIntrusionPolicyConfig>(nullptr);
    }
    return local_58[local_63];
}
TDataObjectPtr<FWeatherGenerateTemplate> GetRandomWeatherTemplateByWeatherAreaTemplateFactorConfig(const TDataObjectPtr<FWeatherAreaTemplateFactorConfig> &inout WeatherAreaTemplateFactorConfig)
{
    if (!(WeatherAreaTemplateFactorConfig.IsSet()))
    {
        return TDataObjectPtr<FWeatherGenerateTemplate>(nullptr);
    }
    TArray<FWeatherTemplateRandomFactor> local_54;
    TArray<TDataObjectPtr<FWeatherGenerateTemplate>> local_58;
    TArray<uint> local_62;
    int local_63 = -1;
    int local_65 = 0;
    for (auto& local_80 : local_54)
    {
        if (!(local_80.Config.IsSet()))
        {
            continue;
        }
        if (int(local_80.Weight) == 0)
        {
            continue;
        }
        local_62.Add(local_58.Add(local_80.Config));
        local_65 = local_65 + int(local_80.Weight);
    }
    if (local_58.Num() == 0 || (local_65 == 0))
    {
        return TDataObjectPtr<FWeatherGenerateTemplate>(nullptr);
    }
    int local_64 = FMath::RandRange(1, local_65);
    int local_85 = 0;
    int local_86 = 0;
    for (; local_86 < local_58.Num(); ++local_86)
    {
        local_85 = local_85 + local_62[local_86];
        if (local_64 <= local_85)
        {
            local_63 = local_86;
            break;
        }
    }
    if (local_63 < 0 || (local_63 >= local_58.Num()))
    {
        return TDataObjectPtr<FWeatherGenerateTemplate>(nullptr);
    }
    return local_58[local_63];
}
bool TryRandomWeatherAndTemplateByWeatherPoolConfig(const TDataObjectPtr<FCommissionWeatherPoolConfig> &inout WeatherPoolConfig, const TDataObjectPtr<FWorldAreaConfig> &inout SpawnAreaConfig, TDataObjectPtr<FWeatherConfig> &inout OutWeatherConfig, TMap<TDataObjectPtr<FWorldAreaConfig>, TDataObjectPtr<FWeatherGenerateTemplate>> &inout OutWeatherTemplateMap)
{
    TArrayConstIterator<FWeatherRandomFactor> local_108;
    if (!(WeatherPoolConfig.IsSet()))
    {
        return false;
    }
    if (!(SpawnAreaConfig.IsSet()))
    {
        return false;
    }
    TDataObjectPtr<FWeatherAreaTemplateFactorConfig> local_26 = TDataObjectPtr<FWeatherAreaTemplateFactorConfig>(nullptr);
    for (auto& local_88 : GetWeatherAreaTemplateFactors())
    {
        if (!(local_88.IsSet()))
        {
            continue;
        }
        if (!(GetAreaConfig().IsSet()))
        {
            continue;
        }
        if ((GetAreaConfig().GetDataName() == SpawnAreaConfig.GetDataName()))
        {
            local_26 = local_88;
            break;
        }
    }
    TArray<TDataObjectPtr<FWeatherConfig>> local_96;
    TArray<uint> local_100;
    int local_101 = 0;
    for (; local_108.CanProceed;)
    {
        const FWeatherRandomFactor& local_116 = local_108.Proceed();
        if (!(local_116.Config.IsSet()))
        {
            continue;
        }
        if (int(local_116.Weight) == 0)
        {
            continue;
        }
        if (local_26.IsSet())
        {
            TArrayConstIterator<FWeatherTemplateRandomFactor> local_124;
            bool local_118;
            local_118 = false;
            for (; local_124.CanProceed;)
            {
                const FWeatherTemplateRandomFactor& local_132 = local_124.Proceed();
                if (!(local_132.Config.IsSet()))
                {
                    continue;
                }
                if (int(local_132.Weight) == 0)
                {
                    continue;
                }
                if (local_116.Config.GetWeatherChanceConfigIndex() >= 0)
                {
                    local_118 = true;
                    break;
                }
            }
            if (!(local_118))
            {
                continue;
            }
        }
        local_100.Add(local_96.Add(local_116.Config));
        local_101 = local_101 + int(local_116.Weight);
    }
    if (local_96.Num() == 0 || (local_101 == 0))
    {
        XError(ELog(22), FString().Append("TryRandomWeatherAndTemplateByWeatherPoolConfig: No valid weather found for SpawnAreaConfig=").Append(SpawnAreaConfig.GetDataName().ToString()).Append(" WeatherPoolConfig=").Append(WeatherPoolConfig.GetDataName().ToString()));
        return false;
    }
    int local_134 = FMath::RandRange(1, local_101);
    int local_151 = 0;
    int local_152 = -1;
    int local_153 = 0;
    for (; local_153 < local_96.Num(); ++local_153)
    {
        local_151 = local_151 + local_100[local_153];
        if (local_134 <= local_151)
        {
            local_152 = local_153;
            break;
        }
    }
    if (local_152 < 0 || (local_152 >= local_96.Num()))
    {
        return false;
    }
    OutWeatherConfig = local_96[local_152];
    for (auto& local_88 : GetWeatherAreaTemplateFactors())
    {
        if (!(local_88.IsSet()))
        {
            continue;
        }
        TDataObjectPtr<FWorldAreaConfig> local_202 = GetAreaConfig();
        if (!(local_202.IsSet()))
        {
            continue;
        }
        TDataObjectPtr<FWeatherGenerateTemplate> local_250;
        if ((local_202.GetDataName() == SpawnAreaConfig.GetDataName()))
        {
            TArrayConstIterator<FWeatherTemplateRandomFactor> local_130;
            TArray<TDataObjectPtr<FWeatherGenerateTemplate>> local_254;
            TArray<uint> local_258;
            int local_259 = 0;
            for (; local_130.CanProceed;)
            {
                const FWeatherTemplateRandomFactor& local_132_2 = local_130.Proceed();
                if (!(local_132_2.Config.IsSet()))
                {
                    continue;
                }
                if (int(local_132_2.Weight) == 0)
                {
                    continue;
                }
                if (OutWeatherConfig.GetWeatherChanceConfigIndex() >= 0)
                {
                    local_258.Add(local_254.Add(local_132_2.Config));
                    local_259 = local_259 + int(local_132_2.Weight);
                }
            }
            if (local_254.Num() == 0 || (local_259 == 0))
            {
                XError(ELog(22), FString().Append("TryRandomWeatherAndTemplateByWeatherPoolConfig: No valid template for SpawnArea=").Append(SpawnAreaConfig.GetDataName().ToString()).Append(" Weather=").Append(OutWeatherConfig.GetDataName().ToString()));
                return false;
            }
            int local_150 = FMath::RandRange(1, local_259);
            int local_151_2 = 0;
            int local_260 = 0;
            for (; local_260 < local_254.Num(); ++local_260)
            {
                local_151_2 = local_151_2 + local_258[local_260];
                if (local_150 <= local_151_2)
                {
                    local_250 = local_254[local_260];
                    break;
                }
            }
        }
        else
        {
            local_250 = FPIECommissionRandomPolicy::GetRandomWeatherTemplateByWeatherAreaTemplateFactorConfig(local_88);
        }
        if (!(local_250.IsSet()))
        {
            XError(ELog(22), FString().Append("TryRandomWeatherAndTemplateByWeatherPoolConfig: WeatherTemplate is not set for AreaConfig=").Append(local_202.GetDataName().ToString()));
            continue;
        }
        OutWeatherTemplateMap.Add(local_202, local_250);
    }
    return true;
}
}
