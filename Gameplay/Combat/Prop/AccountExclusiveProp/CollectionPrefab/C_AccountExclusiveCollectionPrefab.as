
namespace __INTENRAL_FC_AccountExclusiveCollectionPrefabPresentationConfig_NS
{
    const TECSComponentDerivedPtr<FC_AccountExclusiveCollectionPrefabPresentationConfig> DerivedPtr = TECSComponentDerivedPtr<FC_AccountExclusiveCollectionPrefabPresentationConfig>();
    const FC_AccountExclusiveCollectionPrefabPresentationConfig DefaultValue = FC_AccountExclusiveCollectionPrefabPresentationConfig();
}
namespace __INTENRAL_FC_AccountExclusiveCollectionPrefabPresentationCache_NS
{
    const TECSComponentDerivedPtr<FC_AccountExclusiveCollectionPrefabPresentationCache> DerivedPtr = TECSComponentDerivedPtr<FC_AccountExclusiveCollectionPrefabPresentationCache>();
    const FC_AccountExclusiveCollectionPrefabPresentationCache DefaultValue = FC_AccountExclusiveCollectionPrefabPresentationCache();
}
namespace __INTENRAL_FCE_AccountExclusiveCollectionPrefabCollected_NS
{
    const TECSEventDerivedPtr<FCE_AccountExclusiveCollectionPrefabCollected> DerivedPtr = TECSEventDerivedPtr<FCE_AccountExclusiveCollectionPrefabCollected>();
}
namespace __INTENRAL_FCE_AccountExclusiveCollectionPrefabCollected_DataTracker_NS
{
    const TECSEventDerivedPtr<FCE_AccountExclusiveCollectionPrefabCollected_DataTracker> DerivedPtr = TECSEventDerivedPtr<FCE_AccountExclusiveCollectionPrefabCollected_DataTracker>();

}
struct FCE_AccountExclusiveCollectionPrefabCollected : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity CollectionPrefabEntity;

    FCE_AccountExclusiveCollectionPrefabCollected()
    {
        return;
    }
}

struct FC_AccountExclusiveCollectionPrefabPresentationConfig : FECSComponent
{
    UPROPERTY()
    TArray<FCollectionPrefabPlayFXCallParam> DurationalFXConfigs;
    UPROPERTY()
    TArray<FCollectionPrefabPlayFXCallParam> InstantFXConfigs;

    FC_AccountExclusiveCollectionPrefabPresentationConfig()
    {
        return;
    }
}

struct FC_AccountExclusiveCollectionPrefabPresentationCache : FECSComponent
{
    UPROPERTY()
    TArray<FECSEntity> NormalDurationalFXEntities;

    FC_AccountExclusiveCollectionPrefabPresentationCache()
    {
        return;
    }
}

struct FCE_AccountExclusiveCollectionPrefabCollected_DataTracker : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity CollectionPrefabEntity;
    UPROPERTY()
    FECSEntity InteractSourceEntity;
    UPROPERTY()
    uint DataId;


}

namespace ECSFunc_FC_AccountExclusiveCollectionPrefabPresentationConfig
{
UFUNCTION()
bool HasAccountExclusiveCollectionPrefabPresentationConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusiveCollectionPrefabPresentationConfig);
}
FC_AccountExclusiveCollectionPrefabPresentationConfig& AssignAccountExclusiveCollectionPrefabPresentationConfig(const FECSEntity &inout Entity, const FC_AccountExclusiveCollectionPrefabPresentationConfig &inout DefaultValue = FC_AccountExclusiveCollectionPrefabPresentationConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusiveCollectionPrefabPresentationConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAccountExclusiveCollectionPrefabPresentationConfig_BP(const FECSEntity &inout Entity, const FC_AccountExclusiveCollectionPrefabPresentationConfig &inout DefaultValue = FC_AccountExclusiveCollectionPrefabPresentationConfig())
{
    ECSFunc_FC_AccountExclusiveCollectionPrefabPresentationConfig::AssignAccountExclusiveCollectionPrefabPresentationConfig(Entity, DefaultValue);
    return;
}
FC_AccountExclusiveCollectionPrefabPresentationConfig& ModifyAccountExclusiveCollectionPrefabPresentationConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusiveCollectionPrefabPresentationConfig));
    return local_12.GetComp();
}
FC_AccountExclusiveCollectionPrefabPresentationConfig& ModifyOrAddAccountExclusiveCollectionPrefabPresentationConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusiveCollectionPrefabPresentationConfig));
    return local_12.GetComp();
}
const FC_AccountExclusiveCollectionPrefabPresentationConfig& GetAccountExclusiveCollectionPrefabPresentationConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusiveCollectionPrefabPresentationConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_AccountExclusiveCollectionPrefabPresentationConfig GetAccountExclusiveCollectionPrefabPresentationConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AccountExclusiveCollectionPrefabPresentationConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_AccountExclusiveCollectionPrefabPresentationConfig::GetAccountExclusiveCollectionPrefabPresentationConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AccountExclusiveCollectionPrefabPresentationConfig GetDefaultedAccountExclusiveCollectionPrefabPresentationConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AccountExclusiveCollectionPrefabPresentationConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusiveCollectionPrefabPresentationConfig);
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
FC_AccountExclusiveCollectionPrefabPresentationConfig GetDefaultedAccountExclusiveCollectionPrefabPresentationConfig_BP(const FECSEntity &inout Entity)
{
    FC_AccountExclusiveCollectionPrefabPresentationConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveAccountExclusiveCollectionPrefabPresentationConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusiveCollectionPrefabPresentationConfig);
}
}
FECSMonitorRuntimeView __GetMonitorAccountExclusiveCollectionPrefabPresentationConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AccountExclusiveCollectionPrefabPresentationConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAccountExclusiveCollectionPrefabPresentationConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AccountExclusiveCollectionPrefabPresentationConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAccountExclusiveCollectionPrefabPresentationConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AccountExclusiveCollectionPrefabPresentationConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAccountExclusiveCollectionPrefabPresentationConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AccountExclusiveCollectionPrefabPresentationConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAccountExclusiveCollectionPrefabPresentationConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AccountExclusiveCollectionPrefabPresentationConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorAccountExclusiveCollectionPrefabPresentationConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AccountExclusiveCollectionPrefabPresentationConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAccountExclusiveCollectionPrefabPresentationConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AccountExclusiveCollectionPrefabPresentationConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAccountExclusiveCollectionPrefabPresentationConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AccountExclusiveCollectionPrefabPresentationConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AccountExclusiveCollectionPrefabPresentationCache
{
UFUNCTION()
bool HasAccountExclusiveCollectionPrefabPresentationCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusiveCollectionPrefabPresentationCache);
}
FC_AccountExclusiveCollectionPrefabPresentationCache& AssignAccountExclusiveCollectionPrefabPresentationCache(const FECSEntity &inout Entity, const FC_AccountExclusiveCollectionPrefabPresentationCache &inout DefaultValue = FC_AccountExclusiveCollectionPrefabPresentationCache())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusiveCollectionPrefabPresentationCache, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAccountExclusiveCollectionPrefabPresentationCache_BP(const FECSEntity &inout Entity, const FC_AccountExclusiveCollectionPrefabPresentationCache &inout DefaultValue = FC_AccountExclusiveCollectionPrefabPresentationCache())
{
    ECSFunc_FC_AccountExclusiveCollectionPrefabPresentationCache::AssignAccountExclusiveCollectionPrefabPresentationCache(Entity, DefaultValue);
    return;
}
FC_AccountExclusiveCollectionPrefabPresentationCache& ModifyAccountExclusiveCollectionPrefabPresentationCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusiveCollectionPrefabPresentationCache));
    return local_12.GetComp();
}
FC_AccountExclusiveCollectionPrefabPresentationCache& ModifyOrAddAccountExclusiveCollectionPrefabPresentationCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusiveCollectionPrefabPresentationCache));
    return local_12.GetComp();
}
const FC_AccountExclusiveCollectionPrefabPresentationCache& GetAccountExclusiveCollectionPrefabPresentationCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusiveCollectionPrefabPresentationCache));
    return local_12.GetComp();
}
UFUNCTION()
FC_AccountExclusiveCollectionPrefabPresentationCache GetAccountExclusiveCollectionPrefabPresentationCache_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AccountExclusiveCollectionPrefabPresentationCache __r;
    bValid = false;
    bValid = ECSFunc_FC_AccountExclusiveCollectionPrefabPresentationCache::GetAccountExclusiveCollectionPrefabPresentationCache(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AccountExclusiveCollectionPrefabPresentationCache GetDefaultedAccountExclusiveCollectionPrefabPresentationCache(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AccountExclusiveCollectionPrefabPresentationCache __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusiveCollectionPrefabPresentationCache);
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
FC_AccountExclusiveCollectionPrefabPresentationCache GetDefaultedAccountExclusiveCollectionPrefabPresentationCache_BP(const FECSEntity &inout Entity)
{
    FC_AccountExclusiveCollectionPrefabPresentationCache __r;
    return __r;
}
UFUNCTION()
bool RemoveAccountExclusiveCollectionPrefabPresentationCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusiveCollectionPrefabPresentationCache);
}
}
FECSMonitorRuntimeView __GetMonitorAccountExclusiveCollectionPrefabPresentationCacheOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AccountExclusiveCollectionPrefabPresentationCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAccountExclusiveCollectionPrefabPresentationCacheOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AccountExclusiveCollectionPrefabPresentationCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAccountExclusiveCollectionPrefabPresentationCacheOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AccountExclusiveCollectionPrefabPresentationCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAccountExclusiveCollectionPrefabPresentationCacheOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AccountExclusiveCollectionPrefabPresentationCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAccountExclusiveCollectionPrefabPresentationCacheOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AccountExclusiveCollectionPrefabPresentationCache, bFixedFrame, bMustHandleAll);
}
void __MonitorAccountExclusiveCollectionPrefabPresentationCacheLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AccountExclusiveCollectionPrefabPresentationCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAccountExclusiveCollectionPrefabPresentationCacheActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AccountExclusiveCollectionPrefabPresentationCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAccountExclusiveCollectionPrefabPresentationCacheModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AccountExclusiveCollectionPrefabPresentationCache, bFixedFrame, Details);
    return;
}
