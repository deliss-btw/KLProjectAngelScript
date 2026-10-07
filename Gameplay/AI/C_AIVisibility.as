
enum EVisibilityTier
{
    FullTrace,
    CachedTrace,
    LightweightOnly,
    Skip,
}

enum EVisibilityPriorityBase
{
    Player,
    NPC,
    Boss,
    Elite,
    Normal,
    Env,
    Unknown,
}

const int DEFAULT_MAX_TRACES_PER_FRAME = 10;
namespace __INTENRAL_FC_AIVisibilityCache_NS
{
    const TECSComponentDerivedPtr<FC_AIVisibilityCache> DerivedPtr = TECSComponentDerivedPtr<FC_AIVisibilityCache>();
    const FC_AIVisibilityCache DefaultValue = FC_AIVisibilityCache();
}
namespace __INTENRAL_FCS_AIVisibilityBudget_NS
{
    const TECSComponentDerivedPtr<FCS_AIVisibilityBudget> DerivedPtr = TECSComponentDerivedPtr<FCS_AIVisibilityBudget>();
    const FCS_AIVisibilityBudget DefaultValue = FCS_AIVisibilityBudget();

}
struct FCachedVisibility
{
    UPROPERTY()
    bool bVisible = false;
    UPROPERTY()
    FFPTime LastCheckTime = -1;
    UPROPERTY()
    FVector LastSourcePos;
    UPROPERTY()
    FVector LastTargetPos;
    UPROPERTY()
    EVisibilityTier CachedAtTier = EVisibilityTier(3);
    UPROPERTY()
    int PendingCycles = 0;


}

struct FPrioritizedTarget
{
    UPROPERTY()
    FECSEntity Entity;
    UPROPERTY()
    FVector TargetPos;
    UPROPERTY()
    int Priority = 0;


}

struct FC_AIVisibilityCache : FECSComponent
{
    UPROPERTY()
    TMap<FTargetEntity, FCachedVisibility> Cache;

    FC_AIVisibilityCache()
    {
        return;
    }
}

struct FCS_AIVisibilityBudget : FECSSingleton
{
    UPROPERTY()
    int TracesThisFrame = 0;
    UPROPERTY()
    int MaxTracesPerFrame = 10;
    UPROPERTY()
    int TotalTraceRequests = 0;
    UPROPERTY()
    int FullTraceCount = 0;
    UPROPERTY()
    int CacheHits = 0;
    UPROPERTY()
    int BudgetSkips = 0;
    UPROPERTY()
    int FrameCounter = 0;
    UPROPERTY()
    FFPTime LastResetTime = -1;


    bool CanTrace() const
    {
        return (this.TracesThisFrame < this.MaxTracesPerFrame);
    }
    void ConsumeTrace()
    {
        ++this.TracesThisFrame;
        return;
    }
}

struct FAIVisibilityPriorityConfig
{
    UPROPERTY()
    TMap<EVisibilityPriorityBase, int> PriorityWeights;
    UPROPERTY()
    int NonCombatOffset;

    FAIVisibilityPriorityConfig()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
}

struct FAIVisibilityCacheConfig
{
    UPROPERTY()
    TMap<EMonsterRank, float32> CacheDurations;
    UPROPERTY()
    float32 DefaultCacheDuration;
    UPROPERTY()
    TMap<EMonsterRank, float32> CachePositionThresholds;
    UPROPERTY()
    float32 DefaultCachePositionThreshold;

    FAIVisibilityCacheConfig()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
}

namespace ECSFunc_FC_AIVisibilityCache
{
UFUNCTION()
bool HasAIVisibilityCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIVisibilityCache);
}
FC_AIVisibilityCache& AssignAIVisibilityCache(const FECSEntity &inout Entity, const FC_AIVisibilityCache &inout DefaultValue = FC_AIVisibilityCache())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIVisibilityCache, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIVisibilityCache_BP(const FECSEntity &inout Entity, const FC_AIVisibilityCache &inout DefaultValue = FC_AIVisibilityCache())
{
    ECSFunc_FC_AIVisibilityCache::AssignAIVisibilityCache(Entity, DefaultValue);
    return;
}
FC_AIVisibilityCache& ModifyAIVisibilityCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIVisibilityCache));
    return local_12.GetComp();
}
FC_AIVisibilityCache& ModifyOrAddAIVisibilityCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIVisibilityCache));
    return local_12.GetComp();
}
const FC_AIVisibilityCache& GetAIVisibilityCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIVisibilityCache));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIVisibilityCache GetAIVisibilityCache_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AIVisibilityCache __r;
    bValid = false;
    bValid = ECSFunc_FC_AIVisibilityCache::GetAIVisibilityCache(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AIVisibilityCache GetDefaultedAIVisibilityCache(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIVisibilityCache __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIVisibilityCache);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_AIVisibilityCache GetDefaultedAIVisibilityCache_BP(const FECSEntity &inout Entity)
{
    FC_AIVisibilityCache __r;
    return __r;
}
UFUNCTION()
bool RemoveAIVisibilityCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIVisibilityCache);
}
}
FECSMonitorRuntimeView __GetMonitorAIVisibilityCacheOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIVisibilityCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIVisibilityCacheOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIVisibilityCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIVisibilityCacheOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIVisibilityCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIVisibilityCacheOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIVisibilityCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIVisibilityCacheOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIVisibilityCache, bFixedFrame, bMustHandleAll);
}
void __MonitorAIVisibilityCacheLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIVisibilityCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIVisibilityCacheActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIVisibilityCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIVisibilityCacheModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIVisibilityCache, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_AIVisibilityBudget
{
UFUNCTION()
bool HasAIVisibilityBudget(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_AIVisibilityBudget);
}
FCS_AIVisibilityBudget& AssignAIVisibilityBudget(const FECSWorldPtr &inout World, const FCS_AIVisibilityBudget &inout DefaultValue = FCS_AIVisibilityBudget())
{
    UScriptStruct local_6 = FCS_AIVisibilityBudget;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignAIVisibilityBudget_BP(const FECSWorldPtr &inout World, const FCS_AIVisibilityBudget &inout DefaultValue = FCS_AIVisibilityBudget())
{
    ECSFunc_FCS_AIVisibilityBudget::AssignAIVisibilityBudget(World, DefaultValue);
    return;
}
FCS_AIVisibilityBudget& ModifyAIVisibilityBudget(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AIVisibilityBudget;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_AIVisibilityBudget& ModifyOrAddAIVisibilityBudget(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AIVisibilityBudget;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_AIVisibilityBudget& GetAIVisibilityBudget(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AIVisibilityBudget;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_AIVisibilityBudget GetAIVisibilityBudget_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_AIVisibilityBudget __r;
    bValid = false;
    bValid = ECSFunc_FCS_AIVisibilityBudget::GetAIVisibilityBudget(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_AIVisibilityBudget GetDefaultedAIVisibilityBudget(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_AIVisibilityBudget __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_AIVisibilityBudget);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_AIVisibilityBudget GetDefaultedAIVisibilityBudget_BP(const FECSWorldPtr &inout World)
{
    FCS_AIVisibilityBudget __r;
    return __r;
}
UFUNCTION()
bool RemoveAIVisibilityBudget(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_AIVisibilityBudget);
}
}
void __MonitorAIVisibilityBudgetLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_AIVisibilityBudget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIVisibilityBudgetActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_AIVisibilityBudget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIVisibilityBudgetModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_AIVisibilityBudget, bFixedFrame, Details);
    return;
}
