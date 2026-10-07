
enum EPublicEventStatus
{
    PrepareToInteract,
    Interactable,
    InProgress,
    Complete,
    Failed,
}

namespace __INTENRAL_FC_LevelPublicEventInfo_NS
{
    const TECSComponentDerivedPtr<FC_LevelPublicEventInfo> DerivedPtr = TECSComponentDerivedPtr<FC_LevelPublicEventInfo>();
    const FC_LevelPublicEventInfo DefaultValue = FC_LevelPublicEventInfo();
}
namespace __INTENRAL_FC_LevelPublicEventInteractTarget_NS
{
    const TECSComponentDerivedPtr<FC_LevelPublicEventInteractTarget> DerivedPtr = TECSComponentDerivedPtr<FC_LevelPublicEventInteractTarget>();
    const FC_LevelPublicEventInteractTarget DefaultValue = FC_LevelPublicEventInteractTarget();
}
namespace __INTENRAL_FCS_LevelPublicEventData_NS
{
    const TECSComponentDerivedPtr<FCS_LevelPublicEventData> DerivedPtr = TECSComponentDerivedPtr<FCS_LevelPublicEventData>();
    const FCS_LevelPublicEventData DefaultValue = FCS_LevelPublicEventData();
}
namespace __INTENRAL_FCE_LevelPublicEventCompleted_NS
{
    const TECSEventDerivedPtr<FCE_LevelPublicEventCompleted> DerivedPtr = TECSEventDerivedPtr<FCE_LevelPublicEventCompleted>();

}
struct FC_LevelPublicEventInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    EPublicEventStatus m_Status;
    UPROPERTY()
    FFPTime m_ChangeStatusTime;
    UPROPERTY()
    FFPTime m_InStatusTime;
    UPROPERTY()
    FECSEntity m_InteractEntity;

    FC_LevelPublicEventInfo()
    {
        this.m_Status = EPublicEventStatus(0);
        this.m_ChangeStatusTime = -1;
        this.m_InStatusTime = -1;
        this.__InitDirtyFlags();
        return;
    }
    FC_LevelPublicEventInfo(const FC_LevelPublicEventInfo &inout Other)
    {
        this.m_Status = EPublicEventStatus(0);
        this.m_ChangeStatusTime = -1;
        this.m_InStatusTime = -1;
        this.__InitDirtyFlags();
        this.m_Status = Other.m_Status;
        this.m_ChangeStatusTime = Other.m_ChangeStatusTime;
        this.m_InStatusTime = Other.m_InStatusTime;
        this.m_InteractEntity = Other.m_InteractEntity;
        return;
    }
    FC_LevelPublicEventInfo opAssign(const FC_LevelPublicEventInfo &inout Other)
    {
        FC_LevelPublicEventInfo __r;
        this.SetStatus(Other.GetStatus());
        this.SetChangeStatusTime(Other.GetChangeStatusTime());
        this.SetInStatusTime(Other.GetInStatusTime());
        this.SetInteractEntity(Other.GetInteractEntity());
        return __r;
    }
    EPublicEventStatus GetStatus() const property
    {
        return this.m_Status;
    }
    void SetStatus(const EPublicEventStatus __Value) property
    {
        if (int(this.m_Status) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Status = __Value;
        return;
    }
    const FFPTime GetChangeStatusTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_ChangeStatusTime() property
    {
        FFPTime __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetChangeStatusTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_ChangeStatusTime = __Value;
        return;
    }
    const FFPTime GetInStatusTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_InStatusTime() property
    {
        FFPTime __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetInStatusTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_InStatusTime = __Value;
        return;
    }
    const FECSEntity GetInteractEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetInteractEntity() property
    {
        FECSEntity __r;
        return __r;
    }
    void SetInteractEntity(const FECSEntity &inout __Value) property
    {
        this.m_InteractEntity = __Value;
        return;
    }
}

struct FC_LevelPublicEventInteractTarget : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_LevelPublicEventEntity;

    FC_LevelPublicEventInteractTarget()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_LevelPublicEventInteractTarget(const FC_LevelPublicEventInteractTarget &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_LevelPublicEventEntity = Other.m_LevelPublicEventEntity;
        return;
    }
    FC_LevelPublicEventInteractTarget opAssign(const FC_LevelPublicEventInteractTarget &inout Other)
    {
        FC_LevelPublicEventInteractTarget __r;
        this.SetLevelPublicEventEntity(Other.GetLevelPublicEventEntity());
        return __r;
    }
    const FECSEntity GetLevelPublicEventEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_LevelPublicEventEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetLevelPublicEventEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_LevelPublicEventEntity = __Value;
        return;
    }
}

struct FRuntimePublicEventLBPData
{
    UPROPERTY()
    TDataObjectPtr<FLevelEventInfoConfigBase> EventInfoConfig;
    UPROPERTY()
    FFPTime CoolDownEndTime = -1;
    UPROPERTY()
    int ActiveCount = 0;
    UPROPERTY()
    int Priority = 0;


}

struct FRuntimePublicEventPointData
{
    UPROPERTY()
    ALevelPublicEventPoint PublicEventPoint;
    UPROPERTY()
    int SelectedLBPIndex = -1;
    UPROPERTY()
    TArray<TSoftClassPtr<AKLLevelScriptPublicEvent>> LBPs;


}

struct FCS_LevelPublicEventData : FECSSingleton
{
    UPROPERTY()
    TArray<FRuntimePublicEventPointData> RandomPublicEventPointData;
    UPROPERTY()
    TArray<int> SelectedEventPointIndexes;
    UPROPERTY()
    int MaxEventCount;
    UPROPERTY()
    int CurrentEventCount;
    UPROPERTY()
    TMap<TSoftClassPtr<AKLLevelScriptPublicEvent>, FRuntimePublicEventLBPData> RuntimePublicEventLBPDatas;


}

struct FCE_LevelPublicEventCompleted : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity PublicEventEntity;
    UPROPERTY()
    TDataObjectPtr<FLevelPublicEventInfoConfig> EventInfo;
    UPROPERTY()
    TArray<FECSEntity> TriggeredPlayers;

    FCE_LevelPublicEventCompleted()
    {
        return;
    }
}

namespace ECSFunc_FC_LevelPublicEventInfo
{
UFUNCTION()
bool HasLevelPublicEventInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LevelPublicEventInfo);
}
FC_LevelPublicEventInfo& AssignLevelPublicEventInfo(const FECSEntity &inout Entity, const FC_LevelPublicEventInfo &inout DefaultValue = FC_LevelPublicEventInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LevelPublicEventInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLevelPublicEventInfo_BP(const FECSEntity &inout Entity, const FC_LevelPublicEventInfo &inout DefaultValue = FC_LevelPublicEventInfo())
{
    ECSFunc_FC_LevelPublicEventInfo::AssignLevelPublicEventInfo(Entity, DefaultValue);
    return;
}
FC_LevelPublicEventInfo& ModifyLevelPublicEventInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LevelPublicEventInfo));
    return local_12.GetComp();
}
FC_LevelPublicEventInfo& ModifyOrAddLevelPublicEventInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LevelPublicEventInfo));
    return local_12.GetComp();
}
const FC_LevelPublicEventInfo& GetLevelPublicEventInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LevelPublicEventInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_LevelPublicEventInfo GetLevelPublicEventInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LevelPublicEventInfo& local_4 = ECSFunc_FC_LevelPublicEventInfo::GetLevelPublicEventInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LevelPublicEventInfo();
}
const FC_LevelPublicEventInfo GetDefaultedLevelPublicEventInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LevelPublicEventInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LevelPublicEventInfo);
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
FC_LevelPublicEventInfo GetDefaultedLevelPublicEventInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LevelPublicEventInfo::GetDefaultedLevelPublicEventInfo(Entity);
}
UFUNCTION()
bool RemoveLevelPublicEventInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LevelPublicEventInfo);
}
}
FECSMonitorRuntimeView __GetMonitorLevelPublicEventInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LevelPublicEventInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelPublicEventInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LevelPublicEventInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelPublicEventInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LevelPublicEventInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelPublicEventInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LevelPublicEventInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelPublicEventInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LevelPublicEventInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorLevelPublicEventInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LevelPublicEventInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelPublicEventInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LevelPublicEventInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelPublicEventInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LevelPublicEventInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LevelPublicEventInteractTarget
{
UFUNCTION()
bool HasLevelPublicEventInteractTarget(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LevelPublicEventInteractTarget);
}
FC_LevelPublicEventInteractTarget& AssignLevelPublicEventInteractTarget(const FECSEntity &inout Entity, const FC_LevelPublicEventInteractTarget &inout DefaultValue = FC_LevelPublicEventInteractTarget())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LevelPublicEventInteractTarget, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLevelPublicEventInteractTarget_BP(const FECSEntity &inout Entity, const FC_LevelPublicEventInteractTarget &inout DefaultValue = FC_LevelPublicEventInteractTarget())
{
    ECSFunc_FC_LevelPublicEventInteractTarget::AssignLevelPublicEventInteractTarget(Entity, DefaultValue);
    return;
}
FC_LevelPublicEventInteractTarget& ModifyLevelPublicEventInteractTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LevelPublicEventInteractTarget));
    return local_12.GetComp();
}
FC_LevelPublicEventInteractTarget& ModifyOrAddLevelPublicEventInteractTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LevelPublicEventInteractTarget));
    return local_12.GetComp();
}
const FC_LevelPublicEventInteractTarget& GetLevelPublicEventInteractTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LevelPublicEventInteractTarget));
    return local_12.GetComp();
}
UFUNCTION()
FC_LevelPublicEventInteractTarget GetLevelPublicEventInteractTarget_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LevelPublicEventInteractTarget& local_4 = ECSFunc_FC_LevelPublicEventInteractTarget::GetLevelPublicEventInteractTarget(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LevelPublicEventInteractTarget();
}
const FC_LevelPublicEventInteractTarget GetDefaultedLevelPublicEventInteractTarget(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LevelPublicEventInteractTarget __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LevelPublicEventInteractTarget);
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
FC_LevelPublicEventInteractTarget GetDefaultedLevelPublicEventInteractTarget_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LevelPublicEventInteractTarget::GetDefaultedLevelPublicEventInteractTarget(Entity);
}
UFUNCTION()
bool RemoveLevelPublicEventInteractTarget(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LevelPublicEventInteractTarget);
}
}
FECSMonitorRuntimeView __GetMonitorLevelPublicEventInteractTargetOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LevelPublicEventInteractTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelPublicEventInteractTargetOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LevelPublicEventInteractTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelPublicEventInteractTargetOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LevelPublicEventInteractTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelPublicEventInteractTargetOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LevelPublicEventInteractTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelPublicEventInteractTargetOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LevelPublicEventInteractTarget, bFixedFrame, bMustHandleAll);
}
void __MonitorLevelPublicEventInteractTargetLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LevelPublicEventInteractTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelPublicEventInteractTargetActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LevelPublicEventInteractTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelPublicEventInteractTargetModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LevelPublicEventInteractTarget, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_LevelPublicEventData
{
UFUNCTION()
bool HasLevelPublicEventData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_LevelPublicEventData);
}
FCS_LevelPublicEventData& AssignLevelPublicEventData(const FECSWorldPtr &inout World, const FCS_LevelPublicEventData &inout DefaultValue = FCS_LevelPublicEventData())
{
    UScriptStruct local_6 = FCS_LevelPublicEventData;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignLevelPublicEventData_BP(const FECSWorldPtr &inout World, const FCS_LevelPublicEventData &inout DefaultValue = FCS_LevelPublicEventData())
{
    ECSFunc_FCS_LevelPublicEventData::AssignLevelPublicEventData(World, DefaultValue);
    return;
}
FCS_LevelPublicEventData& ModifyLevelPublicEventData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelPublicEventData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_LevelPublicEventData& ModifyOrAddLevelPublicEventData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelPublicEventData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_LevelPublicEventData& GetLevelPublicEventData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelPublicEventData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_LevelPublicEventData GetLevelPublicEventData_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_LevelPublicEventData __r;
    bValid = false;
    bValid = ECSFunc_FCS_LevelPublicEventData::GetLevelPublicEventData(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_LevelPublicEventData GetDefaultedLevelPublicEventData(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_LevelPublicEventData __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_LevelPublicEventData);
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
FCS_LevelPublicEventData GetDefaultedLevelPublicEventData_BP(const FECSWorldPtr &inout World)
{
    FCS_LevelPublicEventData __r;
    return __r;
}
UFUNCTION()
bool RemoveLevelPublicEventData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_LevelPublicEventData);
}
}
void __MonitorLevelPublicEventDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_LevelPublicEventData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelPublicEventDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_LevelPublicEventData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelPublicEventDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_LevelPublicEventData, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_LevelPublicEventInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_LevelPublicEventInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_LevelPublicEventInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_LevelPublicEventInfo
{
int __IndexOf_Status()
{
    return 0;
}
int __IndexOf_ChangeStatusTime()
{
    return 1;
}
int __IndexOf_InStatusTime()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_LevelPublicEventInteractTarget &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_LevelPublicEventInteractTarget &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_LevelPublicEventInteractTarget &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_LevelPublicEventInteractTarget
{
int __IndexOf_LevelPublicEventEntity()
{
    return 0;
}
}
