
namespace __INTENRAL_FC_AINavProjectionCache_NS
{
    const TECSComponentDerivedPtr<FC_AINavProjectionCache> DerivedPtr = TECSComponentDerivedPtr<FC_AINavProjectionCache>();
    const FC_AINavProjectionCache DefaultValue = FC_AINavProjectionCache();

}
struct FAINavProjectionCacheEntry
{
    UPROPERTY()
    bool bProjected = false;
    UPROPERTY()
    FVector ProjectedLocation = FVector::ZeroVector;
    UPROPERTY()
    FFPTime LastCheckTime = -1;


}

struct FC_AINavProjectionCache : FECSComponent
{
    UPROPERTY()
    TMap<FName, FAINavProjectionCacheEntry> Cache;

    FC_AINavProjectionCache()
    {
        return;
    }
}

namespace ECSFunc_FC_AINavProjectionCache
{
UFUNCTION()
bool HasAINavProjectionCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AINavProjectionCache);
}
FC_AINavProjectionCache& AssignAINavProjectionCache(const FECSEntity &inout Entity, const FC_AINavProjectionCache &inout DefaultValue = FC_AINavProjectionCache())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AINavProjectionCache, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAINavProjectionCache_BP(const FECSEntity &inout Entity, const FC_AINavProjectionCache &inout DefaultValue = FC_AINavProjectionCache())
{
    ECSFunc_FC_AINavProjectionCache::AssignAINavProjectionCache(Entity, DefaultValue);
    return;
}
FC_AINavProjectionCache& ModifyAINavProjectionCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AINavProjectionCache));
    return local_12.GetComp();
}
FC_AINavProjectionCache& ModifyOrAddAINavProjectionCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AINavProjectionCache));
    return local_12.GetComp();
}
const FC_AINavProjectionCache& GetAINavProjectionCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AINavProjectionCache));
    return local_12.GetComp();
}
UFUNCTION()
FC_AINavProjectionCache GetAINavProjectionCache_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AINavProjectionCache __r;
    bValid = false;
    bValid = ECSFunc_FC_AINavProjectionCache::GetAINavProjectionCache(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AINavProjectionCache GetDefaultedAINavProjectionCache(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AINavProjectionCache __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AINavProjectionCache);
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
FC_AINavProjectionCache GetDefaultedAINavProjectionCache_BP(const FECSEntity &inout Entity)
{
    FC_AINavProjectionCache __r;
    return __r;
}
UFUNCTION()
bool RemoveAINavProjectionCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AINavProjectionCache);
}
}
FECSMonitorRuntimeView __GetMonitorAINavProjectionCacheOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AINavProjectionCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAINavProjectionCacheOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AINavProjectionCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAINavProjectionCacheOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AINavProjectionCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAINavProjectionCacheOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AINavProjectionCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAINavProjectionCacheOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AINavProjectionCache, bFixedFrame, bMustHandleAll);
}
void __MonitorAINavProjectionCacheLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AINavProjectionCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAINavProjectionCacheActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AINavProjectionCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAINavProjectionCacheModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AINavProjectionCache, bFixedFrame, Details);
    return;
}
