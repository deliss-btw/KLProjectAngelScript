
namespace __INTENRAL_FC_AIPathConnectionCache_NS
{
    const TECSComponentDerivedPtr<FC_AIPathConnectionCache> DerivedPtr = TECSComponentDerivedPtr<FC_AIPathConnectionCache>();
    const FC_AIPathConnectionCache DefaultValue = FC_AIPathConnectionCache();

}
struct FAIPathConnectionCacheEntry
{
    UPROPERTY()
    bool bConnected = false;
    UPROPERTY()
    FFPTime LastCheckTime = -1;


}

struct FC_AIPathConnectionCache : FECSComponent
{
    UPROPERTY()
    TMap<FName, FAIPathConnectionCacheEntry> Cache;

    FC_AIPathConnectionCache()
    {
        return;
    }
}

namespace ECSFunc_FC_AIPathConnectionCache
{
UFUNCTION()
bool HasAIPathConnectionCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIPathConnectionCache);
}
FC_AIPathConnectionCache& AssignAIPathConnectionCache(const FECSEntity &inout Entity, const FC_AIPathConnectionCache &inout DefaultValue = FC_AIPathConnectionCache())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIPathConnectionCache, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIPathConnectionCache_BP(const FECSEntity &inout Entity, const FC_AIPathConnectionCache &inout DefaultValue = FC_AIPathConnectionCache())
{
    ECSFunc_FC_AIPathConnectionCache::AssignAIPathConnectionCache(Entity, DefaultValue);
    return;
}
FC_AIPathConnectionCache& ModifyAIPathConnectionCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIPathConnectionCache));
    return local_12.GetComp();
}
FC_AIPathConnectionCache& ModifyOrAddAIPathConnectionCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIPathConnectionCache));
    return local_12.GetComp();
}
const FC_AIPathConnectionCache& GetAIPathConnectionCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIPathConnectionCache));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIPathConnectionCache GetAIPathConnectionCache_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AIPathConnectionCache __r;
    bValid = false;
    bValid = ECSFunc_FC_AIPathConnectionCache::GetAIPathConnectionCache(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AIPathConnectionCache GetDefaultedAIPathConnectionCache(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIPathConnectionCache __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIPathConnectionCache);
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
FC_AIPathConnectionCache GetDefaultedAIPathConnectionCache_BP(const FECSEntity &inout Entity)
{
    FC_AIPathConnectionCache __r;
    return __r;
}
UFUNCTION()
bool RemoveAIPathConnectionCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIPathConnectionCache);
}
}
FECSMonitorRuntimeView __GetMonitorAIPathConnectionCacheOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIPathConnectionCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathConnectionCacheOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIPathConnectionCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathConnectionCacheOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIPathConnectionCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathConnectionCacheOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIPathConnectionCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathConnectionCacheOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIPathConnectionCache, bFixedFrame, bMustHandleAll);
}
void __MonitorAIPathConnectionCacheLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIPathConnectionCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIPathConnectionCacheActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIPathConnectionCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIPathConnectionCacheModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIPathConnectionCache, bFixedFrame, Details);
    return;
}
