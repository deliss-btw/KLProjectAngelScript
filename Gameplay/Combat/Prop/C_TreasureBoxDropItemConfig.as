
enum ETreasureBoxRecordState
{
    Unopened,
    OpenedNotCollected,
    OpenedCollected,
}

namespace __INTENRAL_FC_TreasureBoxDropItemConfig_NS
{
    const TECSComponentDerivedPtr<FC_TreasureBoxDropItemConfig> DerivedPtr = TECSComponentDerivedPtr<FC_TreasureBoxDropItemConfig>();
    const FC_TreasureBoxDropItemConfig DefaultValue = FC_TreasureBoxDropItemConfig();
}
namespace __INTENRAL_FC_TreasureTracker_NS
{
    const TECSComponentDerivedPtr<FC_TreasureTracker> DerivedPtr = TECSComponentDerivedPtr<FC_TreasureTracker>();
    const FC_TreasureTracker DefaultValue = FC_TreasureTracker();

}
struct FC_TreasureBoxDropItemConfig : FECSComponent
{
    UPROPERTY()
    FSoftClassPath TreasurePrefabClass;
    UPROPERTY()
    TArray<FDropConfigItem> DropItems;
    UPROPERTY()
    FVector SpawnLocationOffset;
    UPROPERTY()
    FRotator SpawnRotationOffset;

    FC_TreasureBoxDropItemConfig()
    {
        return;
    }
}

struct FC_TreasureTracker : FECSComponent
{
    UPROPERTY()
    bool bCollected = false;
    UPROPERTY()
    FECSEntity TrackPlayerEntity;
    UPROPERTY()
    FECSEntity TreasureBoxEntity;


}

namespace ECSFunc_FC_TreasureBoxDropItemConfig
{
UFUNCTION()
bool HasTreasureBoxDropItemConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TreasureBoxDropItemConfig);
}
FC_TreasureBoxDropItemConfig& AssignTreasureBoxDropItemConfig(const FECSEntity &inout Entity, const FC_TreasureBoxDropItemConfig &inout DefaultValue = FC_TreasureBoxDropItemConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TreasureBoxDropItemConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTreasureBoxDropItemConfig_BP(const FECSEntity &inout Entity, const FC_TreasureBoxDropItemConfig &inout DefaultValue = FC_TreasureBoxDropItemConfig())
{
    ECSFunc_FC_TreasureBoxDropItemConfig::AssignTreasureBoxDropItemConfig(Entity, DefaultValue);
    return;
}
FC_TreasureBoxDropItemConfig& ModifyTreasureBoxDropItemConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TreasureBoxDropItemConfig));
    return local_12.GetComp();
}
FC_TreasureBoxDropItemConfig& ModifyOrAddTreasureBoxDropItemConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TreasureBoxDropItemConfig));
    return local_12.GetComp();
}
const FC_TreasureBoxDropItemConfig& GetTreasureBoxDropItemConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TreasureBoxDropItemConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_TreasureBoxDropItemConfig GetTreasureBoxDropItemConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_TreasureBoxDropItemConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_TreasureBoxDropItemConfig::GetTreasureBoxDropItemConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_TreasureBoxDropItemConfig GetDefaultedTreasureBoxDropItemConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TreasureBoxDropItemConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TreasureBoxDropItemConfig);
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
FC_TreasureBoxDropItemConfig GetDefaultedTreasureBoxDropItemConfig_BP(const FECSEntity &inout Entity)
{
    FC_TreasureBoxDropItemConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveTreasureBoxDropItemConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TreasureBoxDropItemConfig);
}
}
FECSMonitorRuntimeView __GetMonitorTreasureBoxDropItemConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TreasureBoxDropItemConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTreasureBoxDropItemConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TreasureBoxDropItemConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTreasureBoxDropItemConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TreasureBoxDropItemConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTreasureBoxDropItemConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TreasureBoxDropItemConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTreasureBoxDropItemConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TreasureBoxDropItemConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorTreasureBoxDropItemConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TreasureBoxDropItemConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTreasureBoxDropItemConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TreasureBoxDropItemConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTreasureBoxDropItemConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TreasureBoxDropItemConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_TreasureTracker
{
UFUNCTION()
bool HasTreasureTracker(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TreasureTracker);
}
FC_TreasureTracker& AssignTreasureTracker(const FECSEntity &inout Entity, const FC_TreasureTracker &inout DefaultValue = FC_TreasureTracker())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TreasureTracker, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTreasureTracker_BP(const FECSEntity &inout Entity, const FC_TreasureTracker &inout DefaultValue = FC_TreasureTracker())
{
    ECSFunc_FC_TreasureTracker::AssignTreasureTracker(Entity, DefaultValue);
    return;
}
FC_TreasureTracker& ModifyTreasureTracker(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TreasureTracker));
    return local_12.GetComp();
}
FC_TreasureTracker& ModifyOrAddTreasureTracker(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TreasureTracker));
    return local_12.GetComp();
}
const FC_TreasureTracker& GetTreasureTracker(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TreasureTracker));
    return local_12.GetComp();
}
UFUNCTION()
FC_TreasureTracker GetTreasureTracker_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_TreasureTracker __r;
    bValid = false;
    bValid = ECSFunc_FC_TreasureTracker::GetTreasureTracker(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_TreasureTracker GetDefaultedTreasureTracker(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TreasureTracker __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TreasureTracker);
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
FC_TreasureTracker GetDefaultedTreasureTracker_BP(const FECSEntity &inout Entity)
{
    FC_TreasureTracker __r;
    return __r;
}
UFUNCTION()
bool RemoveTreasureTracker(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TreasureTracker);
}
}
FECSMonitorRuntimeView __GetMonitorTreasureTrackerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TreasureTracker, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTreasureTrackerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TreasureTracker, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTreasureTrackerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TreasureTracker, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTreasureTrackerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TreasureTracker, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTreasureTrackerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TreasureTracker, bFixedFrame, bMustHandleAll);
}
void __MonitorTreasureTrackerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TreasureTracker, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTreasureTrackerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TreasureTracker, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTreasureTrackerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TreasureTracker, bFixedFrame, Details);
    return;
}
