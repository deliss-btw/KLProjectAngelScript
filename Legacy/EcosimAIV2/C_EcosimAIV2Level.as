
namespace __INTENRAL_FC_EcosimAIV2WaveInfo_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2WaveInfo> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2WaveInfo>();
    const FC_EcosimAIV2WaveInfo DefaultValue = FC_EcosimAIV2WaveInfo();
}
namespace __INTENRAL_FC_EcosimAIV2WaveMember_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2WaveMember> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2WaveMember>();
    const FC_EcosimAIV2WaveMember DefaultValue = FC_EcosimAIV2WaveMember();
}
namespace __INTENRAL_FC_EcosimAIV2LevelSpawnInitInfo_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2LevelSpawnInitInfo> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2LevelSpawnInitInfo>();
    const FC_EcosimAIV2LevelSpawnInitInfo DefaultValue = FC_EcosimAIV2LevelSpawnInitInfo();
}
namespace __INTENRAL_FCE_EcosimAIV2WaveMemberChange_NS
{
    const TECSEventDerivedPtr<FCE_EcosimAIV2WaveMemberChange> DerivedPtr = TECSEventDerivedPtr<FCE_EcosimAIV2WaveMemberChange>();

}
struct FEcosimAIV2WaveBase
{
    FEcosimAIV2WaveBase()
    {
        return;
    }
}

struct FEcosimAIV2Wave_SpawnWithPoint : FEcosimAIV2WaveBase
{
    FEcosimAIV2WaveBase _base_FEcosimAIV2WaveBase;
    UPROPERTY()
    TArray<ATargetPoint> TargetPointList;
    UPROPERTY()
    TArray<TSubclassOf<AECSPrefab>> PrefabList;
    UPROPERTY()
    float32 MaxNearbyRadius = 500.0f;


}

struct FEcosimAIV2WaveConfig
{
    UPROPERTY()
    FInstancedStruct WaveDetail;

    FEcosimAIV2WaveConfig()
    {
        return;
    }
}

struct FC_EcosimAIV2WaveInfo : FECSComponent
{
    UPROPERTY()
    TArray<FECSEntity> WaveMemberEntityList;
    UPROPERTY()
    int TotalDeathCount;


}

struct FC_EcosimAIV2WaveMember : FECSComponent
{
    UPROPERTY()
    FECSEntity WaveEntity;

    FC_EcosimAIV2WaveMember()
    {
        return;
    }
}

struct FCE_EcosimAIV2WaveMemberChange : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    int CurrentNum;
    UPROPERTY()
    bool bIsAdd;
    UPROPERTY()
    int TotalDeathCount;


}

struct FC_EcosimAIV2LevelSpawnInitInfo : FECSComponent
{
    UPROPERTY()
    FName ToState;

    FC_EcosimAIV2LevelSpawnInitInfo()
    {
        return;
    }
}

namespace ECSFunc_FC_EcosimAIV2WaveInfo
{
UFUNCTION()
bool HasEcosimAIV2WaveInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2WaveInfo);
}
FC_EcosimAIV2WaveInfo& AssignEcosimAIV2WaveInfo(const FECSEntity &inout Entity, const FC_EcosimAIV2WaveInfo &inout DefaultValue = FC_EcosimAIV2WaveInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2WaveInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2WaveInfo_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2WaveInfo &inout DefaultValue = FC_EcosimAIV2WaveInfo())
{
    ECSFunc_FC_EcosimAIV2WaveInfo::AssignEcosimAIV2WaveInfo(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2WaveInfo& ModifyEcosimAIV2WaveInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2WaveInfo));
    return local_12.GetComp();
}
FC_EcosimAIV2WaveInfo& ModifyOrAddEcosimAIV2WaveInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2WaveInfo));
    return local_12.GetComp();
}
const FC_EcosimAIV2WaveInfo& GetEcosimAIV2WaveInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2WaveInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2WaveInfo GetEcosimAIV2WaveInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcosimAIV2WaveInfo __r;
    bValid = false;
    bValid = ECSFunc_FC_EcosimAIV2WaveInfo::GetEcosimAIV2WaveInfo(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcosimAIV2WaveInfo GetDefaultedEcosimAIV2WaveInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2WaveInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2WaveInfo);
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
FC_EcosimAIV2WaveInfo GetDefaultedEcosimAIV2WaveInfo_BP(const FECSEntity &inout Entity)
{
    FC_EcosimAIV2WaveInfo __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2WaveInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2WaveInfo);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2WaveInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2WaveInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2WaveInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2WaveInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2WaveInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2WaveInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2WaveInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2WaveInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2WaveInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2WaveInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2WaveInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2WaveInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2WaveInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2WaveInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2WaveInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2WaveInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcosimAIV2WaveMember
{
UFUNCTION()
bool HasEcosimAIV2WaveMember(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2WaveMember);
}
FC_EcosimAIV2WaveMember& AssignEcosimAIV2WaveMember(const FECSEntity &inout Entity, const FC_EcosimAIV2WaveMember &inout DefaultValue = FC_EcosimAIV2WaveMember())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2WaveMember, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2WaveMember_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2WaveMember &inout DefaultValue = FC_EcosimAIV2WaveMember())
{
    ECSFunc_FC_EcosimAIV2WaveMember::AssignEcosimAIV2WaveMember(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2WaveMember& ModifyEcosimAIV2WaveMember(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2WaveMember));
    return local_12.GetComp();
}
FC_EcosimAIV2WaveMember& ModifyOrAddEcosimAIV2WaveMember(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2WaveMember));
    return local_12.GetComp();
}
const FC_EcosimAIV2WaveMember& GetEcosimAIV2WaveMember(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2WaveMember));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2WaveMember GetEcosimAIV2WaveMember_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcosimAIV2WaveMember __r;
    bValid = false;
    bValid = ECSFunc_FC_EcosimAIV2WaveMember::GetEcosimAIV2WaveMember(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcosimAIV2WaveMember GetDefaultedEcosimAIV2WaveMember(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2WaveMember __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2WaveMember);
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
FC_EcosimAIV2WaveMember GetDefaultedEcosimAIV2WaveMember_BP(const FECSEntity &inout Entity)
{
    FC_EcosimAIV2WaveMember __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2WaveMember(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2WaveMember);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2WaveMemberOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2WaveMember, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2WaveMemberOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2WaveMember, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2WaveMemberOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2WaveMember, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2WaveMemberOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2WaveMember, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2WaveMemberOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2WaveMember, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2WaveMemberLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2WaveMember, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2WaveMemberActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2WaveMember, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2WaveMemberModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2WaveMember, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcosimAIV2LevelSpawnInitInfo
{
UFUNCTION()
bool HasEcosimAIV2LevelSpawnInitInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LevelSpawnInitInfo);
}
FC_EcosimAIV2LevelSpawnInitInfo& AssignEcosimAIV2LevelSpawnInitInfo(const FECSEntity &inout Entity, const FC_EcosimAIV2LevelSpawnInitInfo &inout DefaultValue = FC_EcosimAIV2LevelSpawnInitInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LevelSpawnInitInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2LevelSpawnInitInfo_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2LevelSpawnInitInfo &inout DefaultValue = FC_EcosimAIV2LevelSpawnInitInfo())
{
    ECSFunc_FC_EcosimAIV2LevelSpawnInitInfo::AssignEcosimAIV2LevelSpawnInitInfo(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2LevelSpawnInitInfo& ModifyEcosimAIV2LevelSpawnInitInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LevelSpawnInitInfo));
    return local_12.GetComp();
}
FC_EcosimAIV2LevelSpawnInitInfo& ModifyOrAddEcosimAIV2LevelSpawnInitInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LevelSpawnInitInfo));
    return local_12.GetComp();
}
const FC_EcosimAIV2LevelSpawnInitInfo& GetEcosimAIV2LevelSpawnInitInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LevelSpawnInitInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2LevelSpawnInitInfo GetEcosimAIV2LevelSpawnInitInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EcosimAIV2LevelSpawnInitInfo& local_4 = ECSFunc_FC_EcosimAIV2LevelSpawnInitInfo::GetEcosimAIV2LevelSpawnInitInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EcosimAIV2LevelSpawnInitInfo();
}
const FC_EcosimAIV2LevelSpawnInitInfo GetDefaultedEcosimAIV2LevelSpawnInitInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2LevelSpawnInitInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LevelSpawnInitInfo);
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
FC_EcosimAIV2LevelSpawnInitInfo GetDefaultedEcosimAIV2LevelSpawnInitInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EcosimAIV2LevelSpawnInitInfo::GetDefaultedEcosimAIV2LevelSpawnInitInfo(Entity);
}
UFUNCTION()
bool RemoveEcosimAIV2LevelSpawnInitInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2LevelSpawnInitInfo);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2LevelSpawnInitInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2LevelSpawnInitInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2LevelSpawnInitInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2LevelSpawnInitInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2LevelSpawnInitInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2LevelSpawnInitInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2LevelSpawnInitInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2LevelSpawnInitInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2LevelSpawnInitInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2LevelSpawnInitInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2LevelSpawnInitInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2LevelSpawnInitInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2LevelSpawnInitInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2LevelSpawnInitInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2LevelSpawnInitInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2LevelSpawnInitInfo, bFixedFrame, Details);
    return;
}
