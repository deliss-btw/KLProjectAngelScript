
namespace FAIVisibilityUtils
{
    const FName VISUALLOG_VISIBILITY = n"AIVisibility";
    const float32 TRACE_HEIGHT_JITTER_MAX = 20f;
    const int BUDGET_LOG_INTERVAL_FRAMES = 30;

int CalcVisibilityPriority(const FECSEntity &inout Target, const FAIVisibilityPriorityConfig &inout Config)
{
    int local_17;
    int local_2 = 6;
    int local_1 = local_2;
    Has local_6;
    bool local_7 = local_6.opCall();
    if (local_7)
    {
        int local_2_2 = 0;
        local_1 = local_2_2;
    }
    else
    {
        Has local_12;
        bool local_7_2 = local_12.opCall();
        if (local_7_2)
        {
            int local_2_3 = 1;
            local_1 = local_2_3;
        }
        else
        {
            switch (int(FASCommonUtils::GetMonsterRank(Target)))
            {
            case 2:
            {
                int local_2_4 = 2;
                local_1 = local_2_4;
                break;
            }
            case 1:
            {
                int local_2_5 = 3;
                local_1 = local_2_5;
                break;
            }
            case 0:
            {
                int local_2_6 = 4;
                local_1 = local_2_6;
                break;
            }
            case 3:
            {
                int local_2_7 = 5;
                local_1 = local_2_7;
                break;
            }
            }
        }
    }
    if (!(Config.PriorityWeights.Find(EVisibilityPriorityBase(local_1), local_17)))
    {
        local_17 = 100;
    }
    Has local_22;
    if (!(local_22.opCall()))
    {
        local_17 = local_17 + Config.NonCombatOffset;
    }
    return local_17;
}
EVisibilityTier GetVisibilityTier(const FECSEntity &inout Target, const EVisibilityTier SourceLODTier)
{
    Has local_4;
    bool local_5 = local_4.opCall();
    if (local_5)
    {
        return EVisibilityTier(0);
    }
    EMonsterRank local_8 = FASCommonUtils::GetMonsterRank(Target);
    if (int(local_8) == 3)
    {
        return EVisibilityTier(3);
    }
    if (int(SourceLODTier) >= 3)
    {
        return EVisibilityTier(3);
    }
    Has local_14;
    local_5 = local_14.opCall();
    if (local_5)
    {
        return EVisibilityTier(1);
    }
    if ((int(local_8) == 2 || (int(local_8) == 1)))
    {
        return EVisibilityTier(1);
    }
    return EVisibilityTier(2);
}
float32 GetCacheValidDuration(const FECSEntity &inout Target, const FAIVisibilityCacheConfig &inout Config)
{
    EMonsterRank local_3;
    if (Config.CacheDurations.Find(FASCommonUtils::GetMonsterRank(Target), local_3))
    {
        return local_3;
    }
    return Config.DefaultCacheDuration;
}
float32 GetCachePositionThreshold(const FECSEntity &inout Target, const FAIVisibilityCacheConfig &inout Config)
{
    EMonsterRank local_3;
    if (Config.CachePositionThresholds.Find(FASCommonUtils::GetMonsterRank(Target), local_3))
    {
        return local_3;
    }
    return Config.DefaultCachePositionThreshold;
}
bool TryGetCachedVisibility(FC_AIVisibilityCache &inout VisCache, const FTargetEntity &inout TargetKey, const FVector &inout SourcePos, const FVector &inout TargetPos, const FFPTime &inout Now, const FECSEntity &inout Target, bool &inout OutVisible, const FAIVisibilityCacheConfig &inout CacheConfig, const EVisibilityTier CurrentTier)
{
    if (!(VisCache.Contains(TargetKey)))
    {
        return false;
    }
    FCachedVisibility& local_4 = VisCache[TargetKey];
    if (int(local_4.CachedAtTier) != int(CurrentTier))
    {
        return false;
    }
    if (float32(((Now - local_4.LastCheckTime).ToSeconds())) > FAIVisibilityUtils::GetCacheValidDuration(Target, CacheConfig))
    {
        return false;
    }
    float32 local_14 = FAIVisibilityUtils::GetCachePositionThreshold(Target, CacheConfig);
    if ((float32(SourcePos.Distance(local_4.LastSourcePos)) > local_14 || (float32(TargetPos.Distance(local_4.LastTargetPos)) > local_14)))
    {
        return false;
    }
    OutVisible = local_4.bVisible;
    return true;
}
void UpdateVisibilityCache(FC_AIVisibilityCache &inout VisCache, const FTargetEntity &inout TargetKey, const bool bVisible, const FVector &inout SourcePos, const FVector &inout TargetPos, const FFPTime &inout Now, const EVisibilityTier Tier)
{
    FCachedVisibility& local_2 = VisCache.FindOrAdd(TargetKey);
    local_2.bVisible = bVisible;
    local_2.LastCheckTime = Now;
    local_2.LastSourcePos = SourcePos;
    local_2.LastTargetPos = TargetPos;
    local_2.CachedAtTier = Tier;
    local_2.PendingCycles = 0;
    return;
}
void InvalidateVisibilityCache(FC_AIVisibilityCache &inout VisCache, const FTargetEntity &inout TargetKey)
{
    return;
}
bool DoVisibilityLineTrace(const FECSEntity &inout Source, const FVector &inout SourcePos, const FVector &inout TargetPos, const uint TargetEntityId)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    bool __r; return __r;
}
bool ResolveVisibility(const FECSEntity &inout Source, const FECSEntity &inout Target, const FVector &inout SourcePos, const FVector &inout TargetPos, const EVisibilityTier SourceLODTier, const FFPTime &inout Now, FC_AIVisibilityCache &inout VisCache, FCS_AIVisibilityBudget &inout Budget, const FAIVisibilityCacheConfig &inout CacheConfig)
{
    bool local_3;
    if ((!((Budget.LastResetTime == Now))))
    {
        Budget.TracesThisFrame = 0;
        Budget.LastResetTime = Now;
    }
    ++Budget.TotalTraceRequests;
    EVisibilityTier local_6 = FAIVisibilityUtils::GetVisibilityTier(Target, EVisibilityTier(SourceLODTier));
    FTargetEntity local_8 = FTargetEntity(Target);
    if (int(local_6) == 3)
    {
        return true;
    }
    if ((int(local_6)) == 0)
    {
        local_3 = FAIVisibilityUtils::DoVisibilityLineTrace(Source, SourcePos, TargetPos, Target.GetIdValue());
        ++Budget.FullTraceCount;
        return local_3;
    }
    local_3 = false;
    if (FAIVisibilityUtils::TryGetCachedVisibility(VisCache, local_8, SourcePos, TargetPos, Now, Target, local_3, CacheConfig, EVisibilityTier(local_6)))
    {
        ++Budget.CacheHits;
        return local_3;
    }
    if (!(Budget.CanTrace()))
    {
        ++Budget.BudgetSkips;
        if (VisCache.Cache.Contains(local_8))
        {
            return VisCache.Cache[local_8].bVisible;
        }
        return true;
    }
    bool local_10_2 = FAIVisibilityUtils::DoVisibilityLineTrace(Source, SourcePos, TargetPos, Target.GetIdValue());
    Budget.ConsumeTrace();
    FAIVisibilityUtils::UpdateVisibilityCache(VisCache, local_8, local_10_2, SourcePos, TargetPos, Now, EVisibilityTier(local_6));
    return local_10_2;
}
}
