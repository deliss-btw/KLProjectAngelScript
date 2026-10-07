
enum ESimpleDestructibleApplyResult
{
    Applied,
    AlreadyApplied,
    Deferred,
    PermanentFailure,
}

namespace __INTENRAL_FCS_SimpleDestructibleManager_NS
{
    const TECSComponentDerivedPtr<FCS_SimpleDestructibleManager> DerivedPtr = TECSComponentDerivedPtr<FCS_SimpleDestructibleManager>();
    const FCS_SimpleDestructibleManager DefaultValue = FCS_SimpleDestructibleManager();
}
namespace __INTENRAL_FCS_SimpleDestructibleServerCache_NS
{
    const TECSComponentDerivedPtr<FCS_SimpleDestructibleServerCache> DerivedPtr = TECSComponentDerivedPtr<FCS_SimpleDestructibleServerCache>();
    const FCS_SimpleDestructibleServerCache DefaultValue = FCS_SimpleDestructibleServerCache();
}
namespace __INTENRAL_FCS_SimpleDestructibleClientCache_NS
{
    const TECSComponentDerivedPtr<FCS_SimpleDestructibleClientCache> DerivedPtr = TECSComponentDerivedPtr<FCS_SimpleDestructibleClientCache>();
    const FCS_SimpleDestructibleClientCache DefaultValue = FCS_SimpleDestructibleClientCache();
}
namespace __INTENRAL_FCS_SimpleDestructibleStreamingSignal_NS
{
    const TECSComponentDerivedPtr<FCS_SimpleDestructibleStreamingSignal> DerivedPtr = TECSComponentDerivedPtr<FCS_SimpleDestructibleStreamingSignal>();
    const FCS_SimpleDestructibleStreamingSignal DefaultValue = FCS_SimpleDestructibleStreamingSignal();
}
namespace __INTENRAL_FCE_SimpleDestructibleHitEvent_FoliageISM_NS
{
    const TECSEventDerivedPtr<FCE_SimpleDestructibleHitEvent_FoliageISM> DerivedPtr = TECSEventDerivedPtr<FCE_SimpleDestructibleHitEvent_FoliageISM>();
}
namespace __INTENRAL_FCE_SimpleDestructibleHitEvent_FoliageISkM_NS
{
    const TECSEventDerivedPtr<FCE_SimpleDestructibleHitEvent_FoliageISkM> DerivedPtr = TECSEventDerivedPtr<FCE_SimpleDestructibleHitEvent_FoliageISkM>();
}
namespace __INTENRAL_FCE_SimpleDestructibleHitEvent_StaticMesh_NS
{
    const TECSEventDerivedPtr<FCE_SimpleDestructibleHitEvent_StaticMesh> DerivedPtr = TECSEventDerivedPtr<FCE_SimpleDestructibleHitEvent_StaticMesh>();
}
namespace __INTENRAL_FCE_SimpleDestructibleProcessView_FoliageISM_NS
{
    const TECSEventDerivedPtr<FCE_SimpleDestructibleProcessView_FoliageISM> DerivedPtr = TECSEventDerivedPtr<FCE_SimpleDestructibleProcessView_FoliageISM>();
}
namespace __INTENRAL_FCE_SimpleDestructibleProcessView_FoliageISkM_NS
{
    const TECSEventDerivedPtr<FCE_SimpleDestructibleProcessView_FoliageISkM> DerivedPtr = TECSEventDerivedPtr<FCE_SimpleDestructibleProcessView_FoliageISkM>();
}
namespace __INTENRAL_FCE_SimpleDestructibleProcessView_StaticMesh_NS
{
    const TECSEventDerivedPtr<FCE_SimpleDestructibleProcessView_StaticMesh> DerivedPtr = TECSEventDerivedPtr<FCE_SimpleDestructibleProcessView_StaticMesh>();

}
struct FSimpleDestructibleCacheStateValue
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    EImpactType m_ImpactType;
    UPROPERTY()
    EImpactStrength m_ImpactStrength;
    UPROPERTY()
    FVector m_ForceDirection;

    FSimpleDestructibleCacheStateValue()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FSimpleDestructibleCacheStateValue(const FSimpleDestructibleCacheStateValue &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FSimpleDestructibleCacheStateValue opAssign(const FSimpleDestructibleCacheStateValue &inout Other)
    {
        FSimpleDestructibleCacheStateValue __r;
        this.SetImpactType(Other.GetImpactType());
        this.SetImpactStrength(Other.GetImpactStrength());
        this.SetForceDirection(Other.GetForceDirection());
        return __r;
    }
    EImpactType GetImpactType() const property
    {
        return this.m_ImpactType;
    }
    void SetImpactType(const EImpactType __Value) property
    {
        if (int(this.m_ImpactType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ImpactType = __Value;
        return;
    }
    EImpactStrength GetImpactStrength() const property
    {
        return this.m_ImpactStrength;
    }
    void SetImpactStrength(const EImpactStrength __Value) property
    {
        if (int(this.m_ImpactStrength) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_ImpactStrength = __Value;
        return;
    }
    const FVector GetForceDirection() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_ForceDirection() property
    {
        FVector __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetForceDirection(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_ForceDirection = __Value;
        return;
    }
}

struct FCS_SimpleDestructibleManager : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<FSimpleDestructibleCacheKey_FoliageISM, FSimpleDestructibleCacheStateValue> m_StateMap_FoliageISM;
    UPROPERTY()
    TMap<FSimpleDestructibleCacheKey_FoliageISkM, FSimpleDestructibleCacheStateValue> m_StateMap_FoliageISkM;
    UPROPERTY()
    TMap<FSimpleDestructibleCacheKey_StaticMesh, FSimpleDestructibleCacheStateValue> m_StateMap_StaticMesh;

    FCS_SimpleDestructibleManager()
    {
        this.__InitDirtyFlags();
        return;
    }
    FCS_SimpleDestructibleManager(const FCS_SimpleDestructibleManager &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_StateMap_FoliageISM = Other.m_StateMap_FoliageISM;
        this.m_StateMap_FoliageISkM = Other.m_StateMap_FoliageISkM;
        this.m_StateMap_StaticMesh = Other.m_StateMap_StaticMesh;
        return;
    }
    FCS_SimpleDestructibleManager opAssign(const FCS_SimpleDestructibleManager &inout Other)
    {
        FCS_SimpleDestructibleManager __r;
        this.SetStateMap_FoliageISM(Other.GetStateMap_FoliageISM());
        this.SetStateMap_FoliageISkM(Other.GetStateMap_FoliageISkM());
        this.SetStateMap_StaticMesh(Other.GetStateMap_StaticMesh());
        return __r;
    }
    const TMap<FSimpleDestructibleCacheKey_FoliageISM, FSimpleDestructibleCacheStateValue> GetStateMap_FoliageISM() const property
    {
        const TMap<FSimpleDestructibleCacheKey_FoliageISM, FSimpleDestructibleCacheStateValue> __r;
        return __r;
    }
    TMap<FSimpleDestructibleCacheKey_FoliageISM, FSimpleDestructibleCacheStateValue> GetModify_StateMap_FoliageISM() property
    {
        TMap<FSimpleDestructibleCacheKey_FoliageISM, FSimpleDestructibleCacheStateValue> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetStateMap_FoliageISM(const TMap<FSimpleDestructibleCacheKey_FoliageISM, FSimpleDestructibleCacheStateValue> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_StateMap_FoliageISM = __Value;
        return;
    }
    const TMap<FSimpleDestructibleCacheKey_FoliageISkM, FSimpleDestructibleCacheStateValue> GetStateMap_FoliageISkM() const property
    {
        const TMap<FSimpleDestructibleCacheKey_FoliageISkM, FSimpleDestructibleCacheStateValue> __r;
        return __r;
    }
    TMap<FSimpleDestructibleCacheKey_FoliageISkM, FSimpleDestructibleCacheStateValue> GetModify_StateMap_FoliageISkM() property
    {
        TMap<FSimpleDestructibleCacheKey_FoliageISkM, FSimpleDestructibleCacheStateValue> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetStateMap_FoliageISkM(const TMap<FSimpleDestructibleCacheKey_FoliageISkM, FSimpleDestructibleCacheStateValue> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_StateMap_FoliageISkM = __Value;
        return;
    }
    const TMap<FSimpleDestructibleCacheKey_StaticMesh, FSimpleDestructibleCacheStateValue> GetStateMap_StaticMesh() const property
    {
        const TMap<FSimpleDestructibleCacheKey_StaticMesh, FSimpleDestructibleCacheStateValue> __r;
        return __r;
    }
    TMap<FSimpleDestructibleCacheKey_StaticMesh, FSimpleDestructibleCacheStateValue> GetModify_StateMap_StaticMesh() property
    {
        TMap<FSimpleDestructibleCacheKey_StaticMesh, FSimpleDestructibleCacheStateValue> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetStateMap_StaticMesh(const TMap<FSimpleDestructibleCacheKey_StaticMesh, FSimpleDestructibleCacheStateValue> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_StateMap_StaticMesh = __Value;
        return;
    }
}

struct FCS_SimpleDestructibleServerCache : FECSSingleton
{
    UPROPERTY()
    TMap<FSimpleDestructibleCacheKey_FoliageISM, FPrimitiveInstanceId> RemainISMIndexMap_FoliageISM;
    UPROPERTY()
    TMap<FSimpleDestructibleCacheKey_FoliageISkM, FPrimitiveInstanceId> RemainISMIndexMap_FoliageISkM;
    UPROPERTY()
    TMap<FSimpleDestructibleCacheKey_StaticMesh, FPrimitiveInstanceId> RemainISMIndexMap_StaticMesh;

    FCS_SimpleDestructibleServerCache()
    {
        return;
    }
}

struct FSimpleDestructibleAppliedState
{
    UPROPERTY()
    bool bApplied = false;
    UPROPERTY()
    int SourceUniqueId = 0;
    UPROPERTY()
    FTransform OriginalTransform;
    UPROPERTY()
    bool bHasRemain = false;
    UPROPERTY()
    FPrimitiveInstanceId RemainInstanceId;
    UPROPERTY()
    TSoftObjectPtr<UStaticMesh> RemainStaticMesh;
    UPROPERTY()
    bool bOriginalVisible = true;
    UPROPERTY()
    ECollisionEnabled OriginalCollisionEnabled = ECollisionEnabled(0);


}

struct FCS_SimpleDestructibleClientCache : FECSSingleton
{
    UPROPERTY()
    TSet<FSimpleDestructibleCacheKey_FoliageISM> ObservedAuthorityKeys_FoliageISM;
    UPROPERTY()
    TSet<FSimpleDestructibleCacheKey_FoliageISkM> ObservedAuthorityKeys_FoliageISkM;
    UPROPERTY()
    TSet<FSimpleDestructibleCacheKey_StaticMesh> ObservedAuthorityKeys_StaticMesh;
    UPROPERTY()
    TMap<FSimpleDestructibleCacheKey_FoliageISM, FSimpleDestructibleAppliedState> AppliedStateMap_FoliageISM;
    UPROPERTY()
    TMap<FSimpleDestructibleCacheKey_FoliageISkM, FSimpleDestructibleAppliedState> AppliedStateMap_FoliageISkM;
    UPROPERTY()
    TMap<FSimpleDestructibleCacheKey_StaticMesh, FSimpleDestructibleAppliedState> AppliedStateMap_StaticMesh;
    UPROPERTY()
    bool bInitialRestoreDone = false;
    UPROPERTY()
    bool ActiveUseManagerOnModify = false;


    void Reset()
    {
        this.Reset();
        this.ObservedAuthorityKeys_FoliageISkM.Reset();
        this.ObservedAuthorityKeys_StaticMesh.Reset();
        this.AppliedStateMap_FoliageISM.Reset();
        this.AppliedStateMap_FoliageISkM.Reset();
        this.AppliedStateMap_StaticMesh.Reset();
        this.bInitialRestoreDone = false;
        return;
    }
}

struct FCS_SimpleDestructibleStreamingSignal : FECSSingleton
{
    UPROPERTY()
    int Version = 0;


    void Reset()
    {
        this.Version = 0;
        return;
    }
}

struct FCE_SimpleDestructibleHitEvent_FoliageISM : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TSoftObjectPtr<UHierarchicalInstancedStaticMeshComponent> ReceiverComponent;
    UPROPERTY()
    int ItemIndex = -1;
    UPROPERTY()
    EImpactType ImpactType = EImpactType(0);
    UPROPERTY()
    EImpactStrength ImpactStrength = EImpactStrength(0);
    UPROPERTY()
    FVector ForceDirection = FVector::ZeroVector;
    UPROPERTY()
    EDestructibleClassLevel DestructibleDamageLevel = EDestructibleClassLevel(0);


}

struct FCE_SimpleDestructibleHitEvent_FoliageISkM : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TSoftObjectPtr<UInstancedSkinnedMeshComponent> ReceiverComponent;
    UPROPERTY()
    int ItemIndex = -1;
    UPROPERTY()
    EImpactType ImpactType = EImpactType(0);
    UPROPERTY()
    EImpactStrength ImpactStrength = EImpactStrength(0);
    UPROPERTY()
    FVector ForceDirection = FVector::ZeroVector;
    UPROPERTY()
    EDestructibleClassLevel DestructibleDamageLevel = EDestructibleClassLevel(0);


}

struct FCE_SimpleDestructibleHitEvent_StaticMesh : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TSoftObjectPtr<UStaticMeshComponent> ReceiverComponent;
    UPROPERTY()
    EImpactType ImpactType = EImpactType(0);
    UPROPERTY()
    EImpactStrength ImpactStrength = EImpactStrength(0);
    UPROPERTY()
    FVector ForceDirection = FVector::ZeroVector;
    UPROPERTY()
    EDestructibleClassLevel DestructibleDamageLevel = EDestructibleClassLevel(0);


}

struct FCE_SimpleDestructibleProcessView_FoliageISM : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TSoftObjectPtr<UHierarchicalInstancedStaticMeshComponent> ReceiverComponent;
    UPROPERTY()
    int ItemIndex = -1;
    UPROPERTY()
    FTransform Transform;
    UPROPERTY()
    int QueuedSourceUniqueId = 0;


}

struct FCE_SimpleDestructibleProcessView_FoliageISkM : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TSoftObjectPtr<UInstancedSkinnedMeshComponent> ReceiverComponent;
    UPROPERTY()
    int ItemIndex = -1;
    UPROPERTY()
    FTransform Transform;
    UPROPERTY()
    int QueuedSourceUniqueId = 0;


}

struct FCE_SimpleDestructibleProcessView_StaticMesh : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TSoftObjectPtr<UStaticMeshComponent> ReceiverComponent;
    UPROPERTY()
    FTransform Transform;
    UPROPERTY()
    int QueuedSourceUniqueId = 0;


}

namespace ECSFunc_FCS_SimpleDestructibleManager
{
UFUNCTION()
bool HasSimpleDestructibleManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_SimpleDestructibleManager);
}
FCS_SimpleDestructibleManager& AssignSimpleDestructibleManager(const FECSWorldPtr &inout World, const FCS_SimpleDestructibleManager &inout DefaultValue = FCS_SimpleDestructibleManager())
{
    UScriptStruct local_6 = FCS_SimpleDestructibleManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignSimpleDestructibleManager_BP(const FECSWorldPtr &inout World, const FCS_SimpleDestructibleManager &inout DefaultValue = FCS_SimpleDestructibleManager())
{
    ECSFunc_FCS_SimpleDestructibleManager::AssignSimpleDestructibleManager(World, DefaultValue);
    return;
}
FCS_SimpleDestructibleManager& ModifySimpleDestructibleManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_SimpleDestructibleManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_SimpleDestructibleManager& ModifyOrAddSimpleDestructibleManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_SimpleDestructibleManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_SimpleDestructibleManager& GetSimpleDestructibleManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_SimpleDestructibleManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_SimpleDestructibleManager GetSimpleDestructibleManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_SimpleDestructibleManager& local_4 = ECSFunc_FCS_SimpleDestructibleManager::GetSimpleDestructibleManager(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_SimpleDestructibleManager();
}
const FCS_SimpleDestructibleManager GetDefaultedSimpleDestructibleManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_SimpleDestructibleManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_SimpleDestructibleManager);
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
FCS_SimpleDestructibleManager GetDefaultedSimpleDestructibleManager_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_SimpleDestructibleManager::GetDefaultedSimpleDestructibleManager(World);
}
UFUNCTION()
bool RemoveSimpleDestructibleManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_SimpleDestructibleManager);
}
}
void __MonitorSimpleDestructibleManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_SimpleDestructibleManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSimpleDestructibleManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_SimpleDestructibleManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSimpleDestructibleManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_SimpleDestructibleManager, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_SimpleDestructibleServerCache
{
UFUNCTION()
bool HasSimpleDestructibleServerCache(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_SimpleDestructibleServerCache);
}
FCS_SimpleDestructibleServerCache& AssignSimpleDestructibleServerCache(const FECSWorldPtr &inout World, const FCS_SimpleDestructibleServerCache &inout DefaultValue = FCS_SimpleDestructibleServerCache())
{
    UScriptStruct local_6 = FCS_SimpleDestructibleServerCache;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignSimpleDestructibleServerCache_BP(const FECSWorldPtr &inout World, const FCS_SimpleDestructibleServerCache &inout DefaultValue = FCS_SimpleDestructibleServerCache())
{
    ECSFunc_FCS_SimpleDestructibleServerCache::AssignSimpleDestructibleServerCache(World, DefaultValue);
    return;
}
FCS_SimpleDestructibleServerCache& ModifySimpleDestructibleServerCache(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_SimpleDestructibleServerCache;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_SimpleDestructibleServerCache& ModifyOrAddSimpleDestructibleServerCache(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_SimpleDestructibleServerCache;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_SimpleDestructibleServerCache& GetSimpleDestructibleServerCache(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_SimpleDestructibleServerCache;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_SimpleDestructibleServerCache GetSimpleDestructibleServerCache_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_SimpleDestructibleServerCache __r;
    bValid = false;
    bValid = ECSFunc_FCS_SimpleDestructibleServerCache::GetSimpleDestructibleServerCache(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_SimpleDestructibleServerCache GetDefaultedSimpleDestructibleServerCache(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_SimpleDestructibleServerCache __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_SimpleDestructibleServerCache);
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
FCS_SimpleDestructibleServerCache GetDefaultedSimpleDestructibleServerCache_BP(const FECSWorldPtr &inout World)
{
    FCS_SimpleDestructibleServerCache __r;
    return __r;
}
UFUNCTION()
bool RemoveSimpleDestructibleServerCache(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_SimpleDestructibleServerCache);
}
}
void __MonitorSimpleDestructibleServerCacheLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_SimpleDestructibleServerCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSimpleDestructibleServerCacheActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_SimpleDestructibleServerCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSimpleDestructibleServerCacheModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_SimpleDestructibleServerCache, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_SimpleDestructibleClientCache
{
UFUNCTION()
bool HasSimpleDestructibleClientCache(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_SimpleDestructibleClientCache);
}
FCS_SimpleDestructibleClientCache& AssignSimpleDestructibleClientCache(const FECSWorldPtr &inout World, const FCS_SimpleDestructibleClientCache &inout DefaultValue = FCS_SimpleDestructibleClientCache())
{
    UScriptStruct local_6 = FCS_SimpleDestructibleClientCache;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignSimpleDestructibleClientCache_BP(const FECSWorldPtr &inout World, const FCS_SimpleDestructibleClientCache &inout DefaultValue = FCS_SimpleDestructibleClientCache())
{
    ECSFunc_FCS_SimpleDestructibleClientCache::AssignSimpleDestructibleClientCache(World, DefaultValue);
    return;
}
FCS_SimpleDestructibleClientCache& ModifySimpleDestructibleClientCache(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_SimpleDestructibleClientCache;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_SimpleDestructibleClientCache& ModifyOrAddSimpleDestructibleClientCache(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_SimpleDestructibleClientCache;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_SimpleDestructibleClientCache& GetSimpleDestructibleClientCache(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_SimpleDestructibleClientCache;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_SimpleDestructibleClientCache GetSimpleDestructibleClientCache_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_SimpleDestructibleClientCache __r;
    bValid = false;
    bValid = ECSFunc_FCS_SimpleDestructibleClientCache::GetSimpleDestructibleClientCache(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_SimpleDestructibleClientCache GetDefaultedSimpleDestructibleClientCache(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_SimpleDestructibleClientCache __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_SimpleDestructibleClientCache);
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
FCS_SimpleDestructibleClientCache GetDefaultedSimpleDestructibleClientCache_BP(const FECSWorldPtr &inout World)
{
    FCS_SimpleDestructibleClientCache __r;
    return __r;
}
UFUNCTION()
bool RemoveSimpleDestructibleClientCache(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_SimpleDestructibleClientCache);
}
}
void __MonitorSimpleDestructibleClientCacheLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_SimpleDestructibleClientCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSimpleDestructibleClientCacheActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_SimpleDestructibleClientCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSimpleDestructibleClientCacheModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_SimpleDestructibleClientCache, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_SimpleDestructibleStreamingSignal
{
UFUNCTION()
bool HasSimpleDestructibleStreamingSignal(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_SimpleDestructibleStreamingSignal);
}
FCS_SimpleDestructibleStreamingSignal& AssignSimpleDestructibleStreamingSignal(const FECSWorldPtr &inout World, const FCS_SimpleDestructibleStreamingSignal &inout DefaultValue = FCS_SimpleDestructibleStreamingSignal())
{
    UScriptStruct local_6 = FCS_SimpleDestructibleStreamingSignal;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignSimpleDestructibleStreamingSignal_BP(const FECSWorldPtr &inout World, const FCS_SimpleDestructibleStreamingSignal &inout DefaultValue = FCS_SimpleDestructibleStreamingSignal())
{
    ECSFunc_FCS_SimpleDestructibleStreamingSignal::AssignSimpleDestructibleStreamingSignal(World, DefaultValue);
    return;
}
FCS_SimpleDestructibleStreamingSignal& ModifySimpleDestructibleStreamingSignal(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_SimpleDestructibleStreamingSignal;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_SimpleDestructibleStreamingSignal& ModifyOrAddSimpleDestructibleStreamingSignal(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_SimpleDestructibleStreamingSignal;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_SimpleDestructibleStreamingSignal& GetSimpleDestructibleStreamingSignal(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_SimpleDestructibleStreamingSignal;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_SimpleDestructibleStreamingSignal GetSimpleDestructibleStreamingSignal_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_SimpleDestructibleStreamingSignal& local_4 = ECSFunc_FCS_SimpleDestructibleStreamingSignal::GetSimpleDestructibleStreamingSignal(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_SimpleDestructibleStreamingSignal();
}
const FCS_SimpleDestructibleStreamingSignal GetDefaultedSimpleDestructibleStreamingSignal(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_SimpleDestructibleStreamingSignal __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_SimpleDestructibleStreamingSignal);
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
FCS_SimpleDestructibleStreamingSignal GetDefaultedSimpleDestructibleStreamingSignal_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_SimpleDestructibleStreamingSignal::GetDefaultedSimpleDestructibleStreamingSignal(World);
}
UFUNCTION()
bool RemoveSimpleDestructibleStreamingSignal(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_SimpleDestructibleStreamingSignal);
}
}
void __MonitorSimpleDestructibleStreamingSignalLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_SimpleDestructibleStreamingSignal, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSimpleDestructibleStreamingSignalActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_SimpleDestructibleStreamingSignal, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSimpleDestructibleStreamingSignalModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_SimpleDestructibleStreamingSignal, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FSimpleDestructibleCacheStateValue &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FSimpleDestructibleCacheStateValue &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FSimpleDestructibleCacheStateValue
{
int __IndexOf_ImpactType()
{
    return 0;
}
int __IndexOf_ImpactStrength()
{
    return 1;
}
int __IndexOf_ForceDirection()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_SimpleDestructibleManager &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_SimpleDestructibleManager &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_SimpleDestructibleManager &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_SimpleDestructibleManager
{
int __IndexOf_StateMap_FoliageISM()
{
    return 0;
}
int __IndexOf_StateMap_FoliageISkM()
{
    return 1;
}
int __IndexOf_StateMap_StaticMesh()
{
    return 2;
}
}
