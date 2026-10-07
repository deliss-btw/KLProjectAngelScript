
namespace __INTENRAL_FC_PendingInitAreaEventObjectiveTag_NS
{
    const TECSComponentDerivedPtr<FC_PendingInitAreaEventObjectiveTag> DerivedPtr = TECSComponentDerivedPtr<FC_PendingInitAreaEventObjectiveTag>();
    const FC_PendingInitAreaEventObjectiveTag DefaultValue = FC_PendingInitAreaEventObjectiveTag();
}
namespace __INTENRAL_FC_AreaEventObjective_NS
{
    const TECSComponentDerivedPtr<FC_AreaEventObjective> DerivedPtr = TECSComponentDerivedPtr<FC_AreaEventObjective>();
    const FC_AreaEventObjective DefaultValue = FC_AreaEventObjective();

}
struct FC_PendingInitAreaEventObjectiveTag : FECSComponent
{
    FC_PendingInitAreaEventObjectiveTag()
    {
        return;
    }
}

struct FObjectiveProgressData
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    EObjectiveStatus m_ObjectiveState;
    UPROPERTY()
    int m_SuccessProgressValue;
    UPROPERTY()
    int m_FailedProgressValue;

    FObjectiveProgressData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FObjectiveProgressData(const FObjectiveProgressData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FObjectiveProgressData opAssign(const FObjectiveProgressData &inout Other)
    {
        FObjectiveProgressData __r;
        this.SetObjectiveState(Other.GetObjectiveState());
        this.SetSuccessProgressValue(Other.GetSuccessProgressValue());
        this.SetFailedProgressValue(Other.GetFailedProgressValue());
        return __r;
    }
    EObjectiveStatus GetObjectiveState() const property
    {
        return this.m_ObjectiveState;
    }
    void SetObjectiveState(const EObjectiveStatus __Value) property
    {
        if (int(this.m_ObjectiveState) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ObjectiveState = __Value;
        return;
    }
    int GetSuccessProgressValue() const property
    {
        return this.m_SuccessProgressValue;
    }
    void SetSuccessProgressValue(const int __Value) property
    {
        if (this.m_SuccessProgressValue == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_SuccessProgressValue = __Value;
        return;
    }
    int GetFailedProgressValue() const property
    {
        return this.m_FailedProgressValue;
    }
    void SetFailedProgressValue(const int __Value) property
    {
        if (this.m_FailedProgressValue == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_FailedProgressValue = __Value;
        return;
    }
}

struct FC_AreaEventObjective : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<TDataObjectPtr<FObjectiveConfig>> m_Objectives;
    UPROPERTY()
    int m_CurrentObjectiveIndex;
    UPROPERTY()
    TDataObjectPtr<FObjectiveConfig> m_CurrentObjective;
    UPROPERTY()
    uint m_CurrentObjectiveInstanceId;
    UPROPERTY()
    FObjectiveProgressData m_Progress;
    UPROPERTY()
    TMap<uint, FObjectiveProgressData> m_ObjectiveGroupSuccessProgress;

    FC_AreaEventObjective()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AreaEventObjective(const FC_AreaEventObjective &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AreaEventObjective opAssign(const FC_AreaEventObjective &inout Other)
    {
        FC_AreaEventObjective __r;
        this.SetObjectives(Other.GetObjectives());
        this.SetCurrentObjectiveIndex(Other.GetCurrentObjectiveIndex());
        this.SetCurrentObjective(Other.GetCurrentObjective());
        this.SetCurrentObjectiveInstanceId(Other.GetCurrentObjectiveInstanceId());
        this.SetProgress(Other.GetProgress());
        this.SetObjectiveGroupSuccessProgress(Other.GetObjectiveGroupSuccessProgress());
        return __r;
    }
    const TArray<TDataObjectPtr<FObjectiveConfig>> GetObjectives() const property
    {
        const TArray<TDataObjectPtr<FObjectiveConfig>> __r;
        return __r;
    }
    TArray<TDataObjectPtr<FObjectiveConfig>> GetObjectives() property
    {
        TArray<TDataObjectPtr<FObjectiveConfig>> __r;
        return __r;
    }
    void SetObjectives(const TArray<TDataObjectPtr<FObjectiveConfig>> &inout __Value) property
    {
        this.m_Objectives = __Value;
        return;
    }
    int GetCurrentObjectiveIndex() const property
    {
        return this.m_CurrentObjectiveIndex;
    }
    void SetCurrentObjectiveIndex(const int __Value) property
    {
        if (this.m_CurrentObjectiveIndex == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_CurrentObjectiveIndex = __Value;
        return;
    }
    const TDataObjectPtr<FObjectiveConfig> GetCurrentObjective() const property
    {
        const TDataObjectPtr<FObjectiveConfig> __r;
        return __r;
    }
    TDataObjectPtr<FObjectiveConfig> GetModify_CurrentObjective() property
    {
        TDataObjectPtr<FObjectiveConfig> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetCurrentObjective(const TDataObjectPtr<FObjectiveConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_CurrentObjective = __Value;
        return;
    }
    uint GetCurrentObjectiveInstanceId() const property
    {
        return this.m_CurrentObjectiveInstanceId;
    }
    void SetCurrentObjectiveInstanceId(const uint __Value) property
    {
        if (this.m_CurrentObjectiveInstanceId == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_CurrentObjectiveInstanceId = __Value;
        return;
    }
    FObjectiveProgressData GetProgress() const property
    {
        FObjectiveProgressData __r;
        return __r;
    }
    FObjectiveProgressData GetProgress() property
    {
        FObjectiveProgressData __r;
        return __r;
    }
    void SetProgress(const FObjectiveProgressData &inout __Value) property
    {
        this.m_Progress = __Value;
        return;
    }
    const TMap<uint, FObjectiveProgressData> GetObjectiveGroupSuccessProgress() const property
    {
        const TMap<uint, FObjectiveProgressData> __r;
        return __r;
    }
    TMap<uint, FObjectiveProgressData> GetModify_ObjectiveGroupSuccessProgress() property
    {
        TMap<uint, FObjectiveProgressData> __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetObjectiveGroupSuccessProgress(const TMap<uint, FObjectiveProgressData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_ObjectiveGroupSuccessProgress = __Value;
        return;
    }
}

namespace ECSFunc_FC_PendingInitAreaEventObjectiveTag
{
UFUNCTION()
bool HasPendingInitAreaEventObjectiveTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PendingInitAreaEventObjectiveTag);
}
FC_PendingInitAreaEventObjectiveTag& AssignPendingInitAreaEventObjectiveTag(const FECSEntity &inout Entity, const FC_PendingInitAreaEventObjectiveTag &inout DefaultValue = FC_PendingInitAreaEventObjectiveTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PendingInitAreaEventObjectiveTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPendingInitAreaEventObjectiveTag_BP(const FECSEntity &inout Entity, const FC_PendingInitAreaEventObjectiveTag &inout DefaultValue = FC_PendingInitAreaEventObjectiveTag())
{
    ECSFunc_FC_PendingInitAreaEventObjectiveTag::AssignPendingInitAreaEventObjectiveTag(Entity, DefaultValue);
    return;
}
FC_PendingInitAreaEventObjectiveTag& ModifyPendingInitAreaEventObjectiveTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PendingInitAreaEventObjectiveTag));
    return local_12.GetComp();
}
FC_PendingInitAreaEventObjectiveTag& ModifyOrAddPendingInitAreaEventObjectiveTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PendingInitAreaEventObjectiveTag));
    return local_12.GetComp();
}
const FC_PendingInitAreaEventObjectiveTag& GetPendingInitAreaEventObjectiveTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PendingInitAreaEventObjectiveTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_PendingInitAreaEventObjectiveTag GetPendingInitAreaEventObjectiveTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PendingInitAreaEventObjectiveTag& local_4 = ECSFunc_FC_PendingInitAreaEventObjectiveTag::GetPendingInitAreaEventObjectiveTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PendingInitAreaEventObjectiveTag();
}
const FC_PendingInitAreaEventObjectiveTag GetDefaultedPendingInitAreaEventObjectiveTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PendingInitAreaEventObjectiveTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PendingInitAreaEventObjectiveTag);
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
FC_PendingInitAreaEventObjectiveTag GetDefaultedPendingInitAreaEventObjectiveTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PendingInitAreaEventObjectiveTag::GetDefaultedPendingInitAreaEventObjectiveTag(Entity);
}
UFUNCTION()
bool RemovePendingInitAreaEventObjectiveTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PendingInitAreaEventObjectiveTag);
}
}
FECSMonitorRuntimeView __GetMonitorPendingInitAreaEventObjectiveTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PendingInitAreaEventObjectiveTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPendingInitAreaEventObjectiveTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PendingInitAreaEventObjectiveTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPendingInitAreaEventObjectiveTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PendingInitAreaEventObjectiveTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPendingInitAreaEventObjectiveTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PendingInitAreaEventObjectiveTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPendingInitAreaEventObjectiveTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PendingInitAreaEventObjectiveTag, bFixedFrame, bMustHandleAll);
}
void __MonitorPendingInitAreaEventObjectiveTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PendingInitAreaEventObjectiveTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPendingInitAreaEventObjectiveTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PendingInitAreaEventObjectiveTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPendingInitAreaEventObjectiveTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PendingInitAreaEventObjectiveTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AreaEventObjective
{
UFUNCTION()
bool HasAreaEventObjective(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AreaEventObjective);
}
FC_AreaEventObjective& AssignAreaEventObjective(const FECSEntity &inout Entity, const FC_AreaEventObjective &inout DefaultValue = FC_AreaEventObjective())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AreaEventObjective, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAreaEventObjective_BP(const FECSEntity &inout Entity, const FC_AreaEventObjective &inout DefaultValue = FC_AreaEventObjective())
{
    ECSFunc_FC_AreaEventObjective::AssignAreaEventObjective(Entity, DefaultValue);
    return;
}
FC_AreaEventObjective& ModifyAreaEventObjective(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AreaEventObjective));
    return local_12.GetComp();
}
FC_AreaEventObjective& ModifyOrAddAreaEventObjective(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AreaEventObjective));
    return local_12.GetComp();
}
const FC_AreaEventObjective& GetAreaEventObjective(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AreaEventObjective));
    return local_12.GetComp();
}
UFUNCTION()
FC_AreaEventObjective GetAreaEventObjective_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AreaEventObjective& local_4 = ECSFunc_FC_AreaEventObjective::GetAreaEventObjective(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AreaEventObjective();
}
const FC_AreaEventObjective GetDefaultedAreaEventObjective(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AreaEventObjective __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AreaEventObjective);
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
FC_AreaEventObjective GetDefaultedAreaEventObjective_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AreaEventObjective::GetDefaultedAreaEventObjective(Entity);
}
UFUNCTION()
bool RemoveAreaEventObjective(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AreaEventObjective);
}
}
FECSMonitorRuntimeView __GetMonitorAreaEventObjectiveOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AreaEventObjective, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAreaEventObjectiveOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AreaEventObjective, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAreaEventObjectiveOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AreaEventObjective, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAreaEventObjectiveOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AreaEventObjective, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAreaEventObjectiveOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AreaEventObjective, bFixedFrame, bMustHandleAll);
}
void __MonitorAreaEventObjectiveLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AreaEventObjective, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAreaEventObjectiveActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AreaEventObjective, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAreaEventObjectiveModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AreaEventObjective, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FObjectiveProgressData &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FObjectiveProgressData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FObjectiveProgressData
{
int __IndexOf_ObjectiveState()
{
    return 0;
}
int __IndexOf_SuccessProgressValue()
{
    return 1;
}
int __IndexOf_FailedProgressValue()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AreaEventObjective &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AreaEventObjective &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AreaEventObjective &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AreaEventObjective
{
int __IndexOf_CurrentObjectiveIndex()
{
    return 0;
}
int __IndexOf_CurrentObjective()
{
    return 1;
}
int __IndexOf_CurrentObjectiveInstanceId()
{
    return 2;
}
int __IndexOf_Progress()
{
    return 3;
}
int __IndexOf_ObjectiveGroupSuccessProgress()
{
    return 6;
}
}
