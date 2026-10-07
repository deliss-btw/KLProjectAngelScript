
namespace __INTENRAL_FCS_PlayerEntitySummary_NS
{
    const TECSComponentDerivedPtr<FCS_PlayerEntitySummary> DerivedPtr = TECSComponentDerivedPtr<FCS_PlayerEntitySummary>();
    const FCS_PlayerEntitySummary DefaultValue = FCS_PlayerEntitySummary();
}
namespace __INTENRAL_FCS_BossMonsterChangeAreaSummary_NS
{
    const TECSComponentDerivedPtr<FCS_BossMonsterChangeAreaSummary> DerivedPtr = TECSComponentDerivedPtr<FCS_BossMonsterChangeAreaSummary>();
    const FCS_BossMonsterChangeAreaSummary DefaultValue = FCS_BossMonsterChangeAreaSummary();
}
namespace __INTENRAL_FCS_EcologyFlockComponentSummaryServerCache_NS
{
    const TECSComponentDerivedPtr<FCS_EcologyFlockComponentSummaryServerCache> DerivedPtr = TECSComponentDerivedPtr<FCS_EcologyFlockComponentSummaryServerCache>();
    const FCS_EcologyFlockComponentSummaryServerCache DefaultValue = FCS_EcologyFlockComponentSummaryServerCache();
}
namespace __INTENRAL_FCS_EcologyFlockComponentSummaryNeedUpdateTag_NS
{
    const TECSComponentDerivedPtr<FCS_EcologyFlockComponentSummaryNeedUpdateTag> DerivedPtr = TECSComponentDerivedPtr<FCS_EcologyFlockComponentSummaryNeedUpdateTag>();
    const FCS_EcologyFlockComponentSummaryNeedUpdateTag DefaultValue = FCS_EcologyFlockComponentSummaryNeedUpdateTag();

}
struct FCS_PlayerEntitySummary : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<uint, FECSEntity> m_PlayerEntities;

    FCS_PlayerEntitySummary()
    {
        this.__InitDirtyFlags();
        return;
    }
    FCS_PlayerEntitySummary(const FCS_PlayerEntitySummary &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_PlayerEntities = Other.m_PlayerEntities;
        return;
    }
    FCS_PlayerEntitySummary opAssign(const FCS_PlayerEntitySummary &inout Other)
    {
        FCS_PlayerEntitySummary __r;
        this.SetPlayerEntities(Other.GetPlayerEntities());
        return __r;
    }
    const TMap<uint, FECSEntity> GetPlayerEntities() const property
    {
        const TMap<uint, FECSEntity> __r;
        return __r;
    }
    TMap<uint, FECSEntity> GetModify_PlayerEntities() property
    {
        TMap<uint, FECSEntity> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetPlayerEntities(const TMap<uint, FECSEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_PlayerEntities = __Value;
        return;
    }
}

struct FCS_BossMonsterChangeAreaSummary : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<FECSEntityId, FVector> m_MonsterTargetLocationMap;

    FCS_BossMonsterChangeAreaSummary()
    {
        this.__InitDirtyFlags();
        return;
    }
    FCS_BossMonsterChangeAreaSummary(const FCS_BossMonsterChangeAreaSummary &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_MonsterTargetLocationMap = Other.m_MonsterTargetLocationMap;
        return;
    }
    FCS_BossMonsterChangeAreaSummary opAssign(const FCS_BossMonsterChangeAreaSummary &inout Other)
    {
        FCS_BossMonsterChangeAreaSummary __r;
        this.SetMonsterTargetLocationMap(Other.GetMonsterTargetLocationMap());
        return __r;
    }
    const TMap<FECSEntityId, FVector> GetMonsterTargetLocationMap() const property
    {
        const TMap<FECSEntityId, FVector> __r;
        return __r;
    }
    TMap<FECSEntityId, FVector> GetModify_MonsterTargetLocationMap() property
    {
        TMap<FECSEntityId, FVector> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetMonsterTargetLocationMap(const TMap<FECSEntityId, FVector> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_MonsterTargetLocationMap = __Value;
        return;
    }
}

struct FCS_EcologyFlockComponentSummaryServerCache : FECSSingleton
{
    UPROPERTY()
    TMap<FECSEntity, FECSEntityId> RegisteredFlockToLeaderMap;
    UPROPERTY()
    TArray<FECSEntity> FlockEntitiesNeedUpdate;

    FCS_EcologyFlockComponentSummaryServerCache()
    {
        return;
    }
}

struct FCS_EcologyFlockComponentSummaryNeedUpdateTag : FECSSingleton
{
    FCS_EcologyFlockComponentSummaryNeedUpdateTag()
    {
        return;
    }
}

namespace ECSFunc_FCS_PlayerEntitySummary
{
UFUNCTION()
bool HasPlayerEntitySummary(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_PlayerEntitySummary);
}
FCS_PlayerEntitySummary& AssignPlayerEntitySummary(const FECSWorldPtr &inout World, const FCS_PlayerEntitySummary &inout DefaultValue = FCS_PlayerEntitySummary())
{
    UScriptStruct local_6 = FCS_PlayerEntitySummary;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignPlayerEntitySummary_BP(const FECSWorldPtr &inout World, const FCS_PlayerEntitySummary &inout DefaultValue = FCS_PlayerEntitySummary())
{
    ECSFunc_FCS_PlayerEntitySummary::AssignPlayerEntitySummary(World, DefaultValue);
    return;
}
FCS_PlayerEntitySummary& ModifyPlayerEntitySummary(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PlayerEntitySummary;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_PlayerEntitySummary& ModifyOrAddPlayerEntitySummary(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PlayerEntitySummary;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_PlayerEntitySummary& GetPlayerEntitySummary(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PlayerEntitySummary;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_PlayerEntitySummary GetPlayerEntitySummary_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_PlayerEntitySummary& local_4 = ECSFunc_FCS_PlayerEntitySummary::GetPlayerEntitySummary(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_PlayerEntitySummary();
}
const FCS_PlayerEntitySummary GetDefaultedPlayerEntitySummary(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_PlayerEntitySummary __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_PlayerEntitySummary);
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
FCS_PlayerEntitySummary GetDefaultedPlayerEntitySummary_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_PlayerEntitySummary::GetDefaultedPlayerEntitySummary(World);
}
UFUNCTION()
bool RemovePlayerEntitySummary(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_PlayerEntitySummary);
}
}
void __MonitorPlayerEntitySummaryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_PlayerEntitySummary, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerEntitySummaryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_PlayerEntitySummary, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerEntitySummaryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_PlayerEntitySummary, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_BossMonsterChangeAreaSummary
{
UFUNCTION()
bool HasBossMonsterChangeAreaSummary(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_BossMonsterChangeAreaSummary);
}
FCS_BossMonsterChangeAreaSummary& AssignBossMonsterChangeAreaSummary(const FECSWorldPtr &inout World, const FCS_BossMonsterChangeAreaSummary &inout DefaultValue = FCS_BossMonsterChangeAreaSummary())
{
    UScriptStruct local_6 = FCS_BossMonsterChangeAreaSummary;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignBossMonsterChangeAreaSummary_BP(const FECSWorldPtr &inout World, const FCS_BossMonsterChangeAreaSummary &inout DefaultValue = FCS_BossMonsterChangeAreaSummary())
{
    ECSFunc_FCS_BossMonsterChangeAreaSummary::AssignBossMonsterChangeAreaSummary(World, DefaultValue);
    return;
}
FCS_BossMonsterChangeAreaSummary& ModifyBossMonsterChangeAreaSummary(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_BossMonsterChangeAreaSummary;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_BossMonsterChangeAreaSummary& ModifyOrAddBossMonsterChangeAreaSummary(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_BossMonsterChangeAreaSummary;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_BossMonsterChangeAreaSummary& GetBossMonsterChangeAreaSummary(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_BossMonsterChangeAreaSummary;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_BossMonsterChangeAreaSummary GetBossMonsterChangeAreaSummary_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_BossMonsterChangeAreaSummary& local_4 = ECSFunc_FCS_BossMonsterChangeAreaSummary::GetBossMonsterChangeAreaSummary(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_BossMonsterChangeAreaSummary();
}
const FCS_BossMonsterChangeAreaSummary GetDefaultedBossMonsterChangeAreaSummary(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_BossMonsterChangeAreaSummary __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_BossMonsterChangeAreaSummary);
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
FCS_BossMonsterChangeAreaSummary GetDefaultedBossMonsterChangeAreaSummary_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_BossMonsterChangeAreaSummary::GetDefaultedBossMonsterChangeAreaSummary(World);
}
UFUNCTION()
bool RemoveBossMonsterChangeAreaSummary(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_BossMonsterChangeAreaSummary);
}
}
void __MonitorBossMonsterChangeAreaSummaryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_BossMonsterChangeAreaSummary, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBossMonsterChangeAreaSummaryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_BossMonsterChangeAreaSummary, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBossMonsterChangeAreaSummaryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_BossMonsterChangeAreaSummary, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_EcologyFlockComponentSummaryServerCache
{
UFUNCTION()
bool HasEcologyFlockComponentSummaryServerCache(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_EcologyFlockComponentSummaryServerCache);
}
FCS_EcologyFlockComponentSummaryServerCache& AssignEcologyFlockComponentSummaryServerCache(const FECSWorldPtr &inout World, const FCS_EcologyFlockComponentSummaryServerCache &inout DefaultValue = FCS_EcologyFlockComponentSummaryServerCache())
{
    UScriptStruct local_6 = FCS_EcologyFlockComponentSummaryServerCache;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignEcologyFlockComponentSummaryServerCache_BP(const FECSWorldPtr &inout World, const FCS_EcologyFlockComponentSummaryServerCache &inout DefaultValue = FCS_EcologyFlockComponentSummaryServerCache())
{
    ECSFunc_FCS_EcologyFlockComponentSummaryServerCache::AssignEcologyFlockComponentSummaryServerCache(World, DefaultValue);
    return;
}
FCS_EcologyFlockComponentSummaryServerCache& ModifyEcologyFlockComponentSummaryServerCache(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcologyFlockComponentSummaryServerCache;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_EcologyFlockComponentSummaryServerCache& ModifyOrAddEcologyFlockComponentSummaryServerCache(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcologyFlockComponentSummaryServerCache;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_EcologyFlockComponentSummaryServerCache& GetEcologyFlockComponentSummaryServerCache(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcologyFlockComponentSummaryServerCache;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_EcologyFlockComponentSummaryServerCache GetEcologyFlockComponentSummaryServerCache_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_EcologyFlockComponentSummaryServerCache __r;
    bValid = false;
    bValid = ECSFunc_FCS_EcologyFlockComponentSummaryServerCache::GetEcologyFlockComponentSummaryServerCache(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_EcologyFlockComponentSummaryServerCache GetDefaultedEcologyFlockComponentSummaryServerCache(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_EcologyFlockComponentSummaryServerCache __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_EcologyFlockComponentSummaryServerCache);
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
FCS_EcologyFlockComponentSummaryServerCache GetDefaultedEcologyFlockComponentSummaryServerCache_BP(const FECSWorldPtr &inout World)
{
    FCS_EcologyFlockComponentSummaryServerCache __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyFlockComponentSummaryServerCache(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_EcologyFlockComponentSummaryServerCache);
}
}
void __MonitorEcologyFlockComponentSummaryServerCacheLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_EcologyFlockComponentSummaryServerCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyFlockComponentSummaryServerCacheActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_EcologyFlockComponentSummaryServerCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyFlockComponentSummaryServerCacheModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_EcologyFlockComponentSummaryServerCache, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_EcologyFlockComponentSummaryNeedUpdateTag
{
UFUNCTION()
bool HasEcologyFlockComponentSummaryNeedUpdateTag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_EcologyFlockComponentSummaryNeedUpdateTag);
}
FCS_EcologyFlockComponentSummaryNeedUpdateTag& AssignEcologyFlockComponentSummaryNeedUpdateTag(const FECSWorldPtr &inout World, const FCS_EcologyFlockComponentSummaryNeedUpdateTag &inout DefaultValue = FCS_EcologyFlockComponentSummaryNeedUpdateTag())
{
    UScriptStruct local_6 = FCS_EcologyFlockComponentSummaryNeedUpdateTag;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignEcologyFlockComponentSummaryNeedUpdateTag_BP(const FECSWorldPtr &inout World, const FCS_EcologyFlockComponentSummaryNeedUpdateTag &inout DefaultValue = FCS_EcologyFlockComponentSummaryNeedUpdateTag())
{
    ECSFunc_FCS_EcologyFlockComponentSummaryNeedUpdateTag::AssignEcologyFlockComponentSummaryNeedUpdateTag(World, DefaultValue);
    return;
}
FCS_EcologyFlockComponentSummaryNeedUpdateTag& ModifyEcologyFlockComponentSummaryNeedUpdateTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcologyFlockComponentSummaryNeedUpdateTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_EcologyFlockComponentSummaryNeedUpdateTag& ModifyOrAddEcologyFlockComponentSummaryNeedUpdateTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcologyFlockComponentSummaryNeedUpdateTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_EcologyFlockComponentSummaryNeedUpdateTag& GetEcologyFlockComponentSummaryNeedUpdateTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcologyFlockComponentSummaryNeedUpdateTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_EcologyFlockComponentSummaryNeedUpdateTag GetEcologyFlockComponentSummaryNeedUpdateTag_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_EcologyFlockComponentSummaryNeedUpdateTag& local_4 = ECSFunc_FCS_EcologyFlockComponentSummaryNeedUpdateTag::GetEcologyFlockComponentSummaryNeedUpdateTag(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_EcologyFlockComponentSummaryNeedUpdateTag();
}
const FCS_EcologyFlockComponentSummaryNeedUpdateTag GetDefaultedEcologyFlockComponentSummaryNeedUpdateTag(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_EcologyFlockComponentSummaryNeedUpdateTag __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_EcologyFlockComponentSummaryNeedUpdateTag);
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
FCS_EcologyFlockComponentSummaryNeedUpdateTag GetDefaultedEcologyFlockComponentSummaryNeedUpdateTag_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_EcologyFlockComponentSummaryNeedUpdateTag::GetDefaultedEcologyFlockComponentSummaryNeedUpdateTag(World);
}
UFUNCTION()
bool RemoveEcologyFlockComponentSummaryNeedUpdateTag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_EcologyFlockComponentSummaryNeedUpdateTag);
}
}
void __MonitorEcologyFlockComponentSummaryNeedUpdateTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_EcologyFlockComponentSummaryNeedUpdateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyFlockComponentSummaryNeedUpdateTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_EcologyFlockComponentSummaryNeedUpdateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyFlockComponentSummaryNeedUpdateTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_EcologyFlockComponentSummaryNeedUpdateTag, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_PlayerEntitySummary &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_PlayerEntitySummary &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_PlayerEntitySummary &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_PlayerEntitySummary
{
int __IndexOf_PlayerEntities()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_BossMonsterChangeAreaSummary &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_BossMonsterChangeAreaSummary &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_BossMonsterChangeAreaSummary &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_BossMonsterChangeAreaSummary
{
int __IndexOf_MonsterTargetLocationMap()
{
    return 0;
}
}
