
namespace __INTENRAL_FC_RandomMonsterSpawner_NS
{
    const TECSComponentDerivedPtr<FC_RandomMonsterSpawner> DerivedPtr = TECSComponentDerivedPtr<FC_RandomMonsterSpawner>();
    const FC_RandomMonsterSpawner DefaultValue = FC_RandomMonsterSpawner();
}
namespace __INTENRAL_FC_RandomMonsterSpawnerPendingSpawnTag_NS
{
    const TECSComponentDerivedPtr<FC_RandomMonsterSpawnerPendingSpawnTag> DerivedPtr = TECSComponentDerivedPtr<FC_RandomMonsterSpawnerPendingSpawnTag>();
    const FC_RandomMonsterSpawnerPendingSpawnTag DefaultValue = FC_RandomMonsterSpawnerPendingSpawnTag();
}
namespace __INTENRAL_FC_RandomMonsterSpawnerRuntimeInfo_NS
{
    const TECSComponentDerivedPtr<FC_RandomMonsterSpawnerRuntimeInfo> DerivedPtr = TECSComponentDerivedPtr<FC_RandomMonsterSpawnerRuntimeInfo>();
    const FC_RandomMonsterSpawnerRuntimeInfo DefaultValue = FC_RandomMonsterSpawnerRuntimeInfo();
}
namespace __INTENRAL_FC_MonsterSpawnedBySpawner_NS
{
    const TECSComponentDerivedPtr<FC_MonsterSpawnedBySpawner> DerivedPtr = TECSComponentDerivedPtr<FC_MonsterSpawnedBySpawner>();
    const FC_MonsterSpawnedBySpawner DefaultValue = FC_MonsterSpawnedBySpawner();

}
struct FC_RandomMonsterSpawner : FECSComponent
{
    UPROPERTY()
    int TargetSpawnNum = 1;
    UPROPERTY()
    TArray<TSoftObjectPtr<AActor>> CandidatePoints;
    UPROPERTY()
    TArray<TSoftClassPtr<AMonsterPrefab>> MonsterTypeList;


    void PostPrefabLoad(const FECSEntity &inout Entity)
    {
        FC_RandomMonsterSpawnerPendingSpawnTag local_6;
        Assign local_4;
        local_4.opCall(local_6);
        return;
    }
}

struct FC_RandomMonsterSpawnerPendingSpawnTag : FECSComponent
{
    FC_RandomMonsterSpawnerPendingSpawnTag()
    {
        return;
    }
}

struct FC_RandomMonsterSpawnerRuntimeInfo : FECSComponent
{
    UPROPERTY()
    TArray<FECSEntity> SpawnedMonsters;
    UPROPERTY()
    bool bSpawnFinished = false;


}

struct FC_MonsterSpawnedBySpawner : FECSComponent
{
    UPROPERTY()
    FECSEntity SpawnerEntity;

    FC_MonsterSpawnedBySpawner()
    {
        return;
    }
}

namespace ECSFunc_FC_RandomMonsterSpawner
{
UFUNCTION()
bool HasRandomMonsterSpawner(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_RandomMonsterSpawner);
}
FC_RandomMonsterSpawner& AssignRandomMonsterSpawner(const FECSEntity &inout Entity, const FC_RandomMonsterSpawner &inout DefaultValue = FC_RandomMonsterSpawner())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_RandomMonsterSpawner, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignRandomMonsterSpawner_BP(const FECSEntity &inout Entity, const FC_RandomMonsterSpawner &inout DefaultValue = FC_RandomMonsterSpawner())
{
    ECSFunc_FC_RandomMonsterSpawner::AssignRandomMonsterSpawner(Entity, DefaultValue);
    return;
}
FC_RandomMonsterSpawner& ModifyRandomMonsterSpawner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_RandomMonsterSpawner));
    return local_12.GetComp();
}
FC_RandomMonsterSpawner& ModifyOrAddRandomMonsterSpawner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_RandomMonsterSpawner));
    return local_12.GetComp();
}
const FC_RandomMonsterSpawner& GetRandomMonsterSpawner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_RandomMonsterSpawner));
    return local_12.GetComp();
}
UFUNCTION()
FC_RandomMonsterSpawner GetRandomMonsterSpawner_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_RandomMonsterSpawner __r;
    bValid = false;
    bValid = ECSFunc_FC_RandomMonsterSpawner::GetRandomMonsterSpawner(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_RandomMonsterSpawner GetDefaultedRandomMonsterSpawner(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_RandomMonsterSpawner __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_RandomMonsterSpawner);
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
FC_RandomMonsterSpawner GetDefaultedRandomMonsterSpawner_BP(const FECSEntity &inout Entity)
{
    FC_RandomMonsterSpawner __r;
    return __r;
}
UFUNCTION()
bool RemoveRandomMonsterSpawner(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_RandomMonsterSpawner);
}
}
FECSMonitorRuntimeView __GetMonitorRandomMonsterSpawnerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_RandomMonsterSpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRandomMonsterSpawnerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_RandomMonsterSpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRandomMonsterSpawnerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_RandomMonsterSpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRandomMonsterSpawnerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_RandomMonsterSpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRandomMonsterSpawnerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_RandomMonsterSpawner, bFixedFrame, bMustHandleAll);
}
void __MonitorRandomMonsterSpawnerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_RandomMonsterSpawner, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRandomMonsterSpawnerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_RandomMonsterSpawner, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRandomMonsterSpawnerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_RandomMonsterSpawner, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_RandomMonsterSpawnerPendingSpawnTag
{
UFUNCTION()
bool HasRandomMonsterSpawnerPendingSpawnTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_RandomMonsterSpawnerPendingSpawnTag);
}
FC_RandomMonsterSpawnerPendingSpawnTag& AssignRandomMonsterSpawnerPendingSpawnTag(const FECSEntity &inout Entity, const FC_RandomMonsterSpawnerPendingSpawnTag &inout DefaultValue = FC_RandomMonsterSpawnerPendingSpawnTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_RandomMonsterSpawnerPendingSpawnTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignRandomMonsterSpawnerPendingSpawnTag_BP(const FECSEntity &inout Entity, const FC_RandomMonsterSpawnerPendingSpawnTag &inout DefaultValue = FC_RandomMonsterSpawnerPendingSpawnTag())
{
    ECSFunc_FC_RandomMonsterSpawnerPendingSpawnTag::AssignRandomMonsterSpawnerPendingSpawnTag(Entity, DefaultValue);
    return;
}
FC_RandomMonsterSpawnerPendingSpawnTag& ModifyRandomMonsterSpawnerPendingSpawnTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_RandomMonsterSpawnerPendingSpawnTag));
    return local_12.GetComp();
}
FC_RandomMonsterSpawnerPendingSpawnTag& ModifyOrAddRandomMonsterSpawnerPendingSpawnTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_RandomMonsterSpawnerPendingSpawnTag));
    return local_12.GetComp();
}
const FC_RandomMonsterSpawnerPendingSpawnTag& GetRandomMonsterSpawnerPendingSpawnTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_RandomMonsterSpawnerPendingSpawnTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_RandomMonsterSpawnerPendingSpawnTag GetRandomMonsterSpawnerPendingSpawnTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_RandomMonsterSpawnerPendingSpawnTag& local_4 = ECSFunc_FC_RandomMonsterSpawnerPendingSpawnTag::GetRandomMonsterSpawnerPendingSpawnTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_RandomMonsterSpawnerPendingSpawnTag();
}
const FC_RandomMonsterSpawnerPendingSpawnTag GetDefaultedRandomMonsterSpawnerPendingSpawnTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_RandomMonsterSpawnerPendingSpawnTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_RandomMonsterSpawnerPendingSpawnTag);
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
FC_RandomMonsterSpawnerPendingSpawnTag GetDefaultedRandomMonsterSpawnerPendingSpawnTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_RandomMonsterSpawnerPendingSpawnTag::GetDefaultedRandomMonsterSpawnerPendingSpawnTag(Entity);
}
UFUNCTION()
bool RemoveRandomMonsterSpawnerPendingSpawnTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_RandomMonsterSpawnerPendingSpawnTag);
}
}
FECSMonitorRuntimeView __GetMonitorRandomMonsterSpawnerPendingSpawnTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_RandomMonsterSpawnerPendingSpawnTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRandomMonsterSpawnerPendingSpawnTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_RandomMonsterSpawnerPendingSpawnTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRandomMonsterSpawnerPendingSpawnTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_RandomMonsterSpawnerPendingSpawnTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRandomMonsterSpawnerPendingSpawnTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_RandomMonsterSpawnerPendingSpawnTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRandomMonsterSpawnerPendingSpawnTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_RandomMonsterSpawnerPendingSpawnTag, bFixedFrame, bMustHandleAll);
}
void __MonitorRandomMonsterSpawnerPendingSpawnTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_RandomMonsterSpawnerPendingSpawnTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRandomMonsterSpawnerPendingSpawnTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_RandomMonsterSpawnerPendingSpawnTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRandomMonsterSpawnerPendingSpawnTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_RandomMonsterSpawnerPendingSpawnTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_RandomMonsterSpawnerRuntimeInfo
{
UFUNCTION()
bool HasRandomMonsterSpawnerRuntimeInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_RandomMonsterSpawnerRuntimeInfo);
}
FC_RandomMonsterSpawnerRuntimeInfo& AssignRandomMonsterSpawnerRuntimeInfo(const FECSEntity &inout Entity, const FC_RandomMonsterSpawnerRuntimeInfo &inout DefaultValue = FC_RandomMonsterSpawnerRuntimeInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_RandomMonsterSpawnerRuntimeInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignRandomMonsterSpawnerRuntimeInfo_BP(const FECSEntity &inout Entity, const FC_RandomMonsterSpawnerRuntimeInfo &inout DefaultValue = FC_RandomMonsterSpawnerRuntimeInfo())
{
    ECSFunc_FC_RandomMonsterSpawnerRuntimeInfo::AssignRandomMonsterSpawnerRuntimeInfo(Entity, DefaultValue);
    return;
}
FC_RandomMonsterSpawnerRuntimeInfo& ModifyRandomMonsterSpawnerRuntimeInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_RandomMonsterSpawnerRuntimeInfo));
    return local_12.GetComp();
}
FC_RandomMonsterSpawnerRuntimeInfo& ModifyOrAddRandomMonsterSpawnerRuntimeInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_RandomMonsterSpawnerRuntimeInfo));
    return local_12.GetComp();
}
const FC_RandomMonsterSpawnerRuntimeInfo& GetRandomMonsterSpawnerRuntimeInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_RandomMonsterSpawnerRuntimeInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_RandomMonsterSpawnerRuntimeInfo GetRandomMonsterSpawnerRuntimeInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_RandomMonsterSpawnerRuntimeInfo __r;
    bValid = false;
    bValid = ECSFunc_FC_RandomMonsterSpawnerRuntimeInfo::GetRandomMonsterSpawnerRuntimeInfo(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_RandomMonsterSpawnerRuntimeInfo GetDefaultedRandomMonsterSpawnerRuntimeInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_RandomMonsterSpawnerRuntimeInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_RandomMonsterSpawnerRuntimeInfo);
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
FC_RandomMonsterSpawnerRuntimeInfo GetDefaultedRandomMonsterSpawnerRuntimeInfo_BP(const FECSEntity &inout Entity)
{
    FC_RandomMonsterSpawnerRuntimeInfo __r;
    return __r;
}
UFUNCTION()
bool RemoveRandomMonsterSpawnerRuntimeInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_RandomMonsterSpawnerRuntimeInfo);
}
}
FECSMonitorRuntimeView __GetMonitorRandomMonsterSpawnerRuntimeInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_RandomMonsterSpawnerRuntimeInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRandomMonsterSpawnerRuntimeInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_RandomMonsterSpawnerRuntimeInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRandomMonsterSpawnerRuntimeInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_RandomMonsterSpawnerRuntimeInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRandomMonsterSpawnerRuntimeInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_RandomMonsterSpawnerRuntimeInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRandomMonsterSpawnerRuntimeInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_RandomMonsterSpawnerRuntimeInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorRandomMonsterSpawnerRuntimeInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_RandomMonsterSpawnerRuntimeInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRandomMonsterSpawnerRuntimeInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_RandomMonsterSpawnerRuntimeInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRandomMonsterSpawnerRuntimeInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_RandomMonsterSpawnerRuntimeInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_MonsterSpawnedBySpawner
{
UFUNCTION()
bool HasMonsterSpawnedBySpawner(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MonsterSpawnedBySpawner);
}
FC_MonsterSpawnedBySpawner& AssignMonsterSpawnedBySpawner(const FECSEntity &inout Entity, const FC_MonsterSpawnedBySpawner &inout DefaultValue = FC_MonsterSpawnedBySpawner())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MonsterSpawnedBySpawner, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMonsterSpawnedBySpawner_BP(const FECSEntity &inout Entity, const FC_MonsterSpawnedBySpawner &inout DefaultValue = FC_MonsterSpawnedBySpawner())
{
    ECSFunc_FC_MonsterSpawnedBySpawner::AssignMonsterSpawnedBySpawner(Entity, DefaultValue);
    return;
}
FC_MonsterSpawnedBySpawner& ModifyMonsterSpawnedBySpawner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MonsterSpawnedBySpawner));
    return local_12.GetComp();
}
FC_MonsterSpawnedBySpawner& ModifyOrAddMonsterSpawnedBySpawner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MonsterSpawnedBySpawner));
    return local_12.GetComp();
}
const FC_MonsterSpawnedBySpawner& GetMonsterSpawnedBySpawner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MonsterSpawnedBySpawner));
    return local_12.GetComp();
}
UFUNCTION()
FC_MonsterSpawnedBySpawner GetMonsterSpawnedBySpawner_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_MonsterSpawnedBySpawner __r;
    bValid = false;
    bValid = ECSFunc_FC_MonsterSpawnedBySpawner::GetMonsterSpawnedBySpawner(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_MonsterSpawnedBySpawner GetDefaultedMonsterSpawnedBySpawner(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MonsterSpawnedBySpawner __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MonsterSpawnedBySpawner);
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
FC_MonsterSpawnedBySpawner GetDefaultedMonsterSpawnedBySpawner_BP(const FECSEntity &inout Entity)
{
    FC_MonsterSpawnedBySpawner __r;
    return __r;
}
UFUNCTION()
bool RemoveMonsterSpawnedBySpawner(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MonsterSpawnedBySpawner);
}
}
FECSMonitorRuntimeView __GetMonitorMonsterSpawnedBySpawnerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MonsterSpawnedBySpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMonsterSpawnedBySpawnerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MonsterSpawnedBySpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMonsterSpawnedBySpawnerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MonsterSpawnedBySpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMonsterSpawnedBySpawnerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MonsterSpawnedBySpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMonsterSpawnedBySpawnerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MonsterSpawnedBySpawner, bFixedFrame, bMustHandleAll);
}
void __MonitorMonsterSpawnedBySpawnerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MonsterSpawnedBySpawner, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMonsterSpawnedBySpawnerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MonsterSpawnedBySpawner, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMonsterSpawnedBySpawnerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MonsterSpawnedBySpawner, bFixedFrame, Details);
    return;
}
