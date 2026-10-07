
namespace EcologyLoadPolicyUtils
{
const FEcologyLoadPolicy GetCurrentPolicy()
{
    const FEcologyLoadPolicy __r;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    return __r;
}
bool IsGroupShouldLoad(const FEcologyLoadPolicy &inout Policy, const FLevelGroupConfig &inout GroupConfig)
{
    if (!(Policy.bEnabled))
    {
        return true;
    }
    return EcologyLoadPolicyUtils::IsGroupAllowed(Policy.GroupPolicy, GroupConfig);
}
bool IsMonsterShouldLoad(const FEcologyLoadPolicy &inout Policy, const FCreatureConfigProxy &inout CreatureProxy)
{
    if (!(Policy.bEnabled))
    {
        return true;
    }
    return EcologyLoadPolicyUtils::IsRankAllowed(Policy.ClassicSpawnerRankPolicy, CreatureProxy);
}
bool IsGroupAllowed(const FEcologyGroupPolicy &inout GP, const FLevelGroupConfig &inout GroupConfig)
{
    bool local_7;
    if (int(GP.Mode) == 0)
    {
        return true;
    }
    bool local_4 = EcologyLoadPolicyUtils::IsGroupSelected(GP, GroupConfig);
    if (int(GP.Mode) == 1)
    {
        local_7 = local_4;
    }
    else
    {
        local_7 = !(local_4);
    }
    return local_7;
}
bool IsGroupSelected(const FEcologyGroupPolicy &inout GP, const FLevelGroupConfig &inout GroupConfig)
{
    TArray<bool> local_4;
    if (GP.LoadPassFilter.Num() > 0)
    {
        local_4.Add(EcologyLoadPolicyUtils::MatchLoadPass(GP.LoadPassFilter, GroupConfig));
    }
    if (GP.FilterTagFilter.Num() > 0)
    {
        local_4.Add(EcologyLoadPolicyUtils::MatchFilterTag(GP.FilterTagFilter, GroupConfig));
    }
    if (GP.NamePatterns.Num() > 0)
    {
        local_4.Add(EcologyLoadPolicyUtils::MatchName(GP.NamePatterns, GroupConfig));
    }
    if (GP.ParentNamePatterns.Num() > 0)
    {
        local_4.Add(EcologyLoadPolicyUtils::MatchParentName(GP.ParentNamePatterns, GroupConfig));
    }
    if (local_4.Num() == 0)
    {
        return false;
    }
    else
    {
        if (int(GP.Combination) == 0)
        {
            for (auto local_21 : local_4)
            {
                if (local_21)
                {
                    return true;
                }
            }
            return false;
        }
        else
        {
            for (auto local_21 : local_4)
            {
                if (!(local_21))
                {
                    return false;
                }
            }
            return true;
        }
    }
}
bool IsRankAllowed(const FEcologyRankPolicy &inout RankPolicy, const FCreatureConfigProxy &inout CreatureProxy)
{
    bool local_9;
    if (int(RankPolicy.Mode) == 0)
    {
        return true;
    }
    bool local_4 = RankPolicy.Ranks.Contains(CreatureProxy.GetMonsterRank());
    if (int(RankPolicy.Mode) == 1)
    {
        local_9 = local_4;
    }
    else
    {
        local_9 = !(local_4);
    }
    return local_9;
}
bool MatchLoadPass(const TArray<FName> &inout Filter, const FLevelGroupConfig &inout Config)
{
    return Filter.Contains(Config.LoadingPass);
}
bool MatchFilterTag(const TArray<EKLDataLayerFilterTags> &inout Filter, const FLevelGroupConfig &inout Config)
{
    for (auto local_14 : Filter)
    {
        if (Config.LoadFilterTags.Contains(local_14))
        {
            return true;
        }
    }
    return false;
}
bool MatchName(const TArray<FString> &inout Patterns, const FLevelGroupConfig &inout Config)
{
    FString local_8 = Config.GroupName.ToString();
    for (auto& local_24 : Patterns)
    {
        if (local_8.MatchesWildcard(local_24, ESearchCase(1)))
        {
            return true;
        }
    }
    return false;
}
bool MatchParentName(const TArray<FString> &inout Patterns, const FLevelGroupConfig &inout Config)
{
    return EcologyLoadPolicyUtils::MatchParentNameRecursive(Patterns, Config, 0);
}
bool MatchParentNameRecursive(const TArray<FString> &inout Patterns, const FLevelGroupConfig &inout Config, const int Depth)
{
    if (Depth > 16)
    {
        return false;
    }
    FString local_10 = Config.GroupName.ToString();
    for (auto& local_24 : Patterns)
    {
        if (local_10.MatchesWildcard(local_24, ESearchCase(1)))
        {
            return true;
        }
    }
    if (Config.bIsSubGroup && Config.ParentGroupRef.IsValid())
    {
        const FLevelGroupConfig& local_28 = LevelConfig::FindLevelGroupConfig(Config.ParentGroupRef);
        if (local_28.IsValid())
        {
            return EcologyLoadPolicyUtils::MatchParentNameRecursive(Patterns, local_28, Depth + 1);
        }
    }
    return false;
}
bool IsCollectableShouldLoad(const FEcologyLoadPolicy &inout Policy)
{
    if (!(Policy.bEnabled))
    {
        return true;
    }
    return Policy.PrefabFilterPolicy.bCollectablePrefabs;
}
bool IsPropShouldLoad(const FEcologyLoadPolicy &inout Policy, const FName &inout PropFilterType)
{
    if (!(Policy.bEnabled))
    {
        return true;
    }
    if (Policy.PrefabFilterPolicy.PropFilterTypes.Num() == 0)
    {
        return true;
    }
    return !(Policy.PrefabFilterPolicy.PropFilterTypes.Contains(PropFilterType));
}
bool ShouldSkipNonCommissionBoss(const FEcologyLoadPolicy &inout Policy, const TDataObjectPtr<FMonsterMainConfig> &inout BossMonsterConfig)
{
    int local_10 = 0;
    if (!(Policy.bEnabled) || !(Policy.bOnlyCommissionTargetBoss))
    {
        return false;
    }
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    if (!(local_10) || !(local_10.CommissionConfig))
    {
        return false;
    }
    TArray<TDataObjectPtr<FMonsterMainConfig>> local_14 = FLevelUtils::GetTargetMonsterConfigsFromCommission(local_10.CommissionConfig);
    if (local_14.Num() == 0)
    {
        return false;
    }
    bool local_21 = false;
    for (auto& local_36 : local_14)
    {
        local_36;
        if (GetCombatConfig() && (0 == 2))
        {
            local_21 = true;
            break;
        }
    }
    if (!(local_21))
    {
        return false;
    }
    for (auto& local_36 : local_14)
    {
        if ((local_36 == BossMonsterConfig.opImplConv()))
        {
            return false;
        }
    }
    return true;
}
}
