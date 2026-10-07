
namespace __INTENRAL_FC_TrackingMission_NS
{
    const TECSComponentDerivedPtr<FC_TrackingMission> DerivedPtr = TECSComponentDerivedPtr<FC_TrackingMission>();
    const FC_TrackingMission DefaultValue = FC_TrackingMission();
}
namespace __INTENRAL_FC_PlayerMissionInfo_NS
{
    const TECSComponentDerivedPtr<FC_PlayerMissionInfo> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerMissionInfo>();
    const FC_PlayerMissionInfo DefaultValue = FC_PlayerMissionInfo();
}
namespace __INTENRAL_FCE_OnMissionStatusTransited_NS
{
    const TECSEventDerivedPtr<FCE_OnMissionStatusTransited> DerivedPtr = TECSEventDerivedPtr<FCE_OnMissionStatusTransited>();
}
namespace __INTENRAL_FCE_OnMissionStarted_NS
{
    const TECSEventDerivedPtr<FCE_OnMissionStarted> DerivedPtr = TECSEventDerivedPtr<FCE_OnMissionStarted>();
}
namespace __INTENRAL_FCE_OnMissionAccepted_NS
{
    const TECSEventDerivedPtr<FCE_OnMissionAccepted> DerivedPtr = TECSEventDerivedPtr<FCE_OnMissionAccepted>();
}
namespace __INTENRAL_FCE_MissionTriggerEvent_NS
{
    const TECSEventDerivedPtr<FCE_MissionTriggerEvent> DerivedPtr = TECSEventDerivedPtr<FCE_MissionTriggerEvent>();
}
namespace __INTENRAL_FCE_NotifyClientMissionTransited_NS
{
    const TECSEventDerivedPtr<FCE_NotifyClientMissionTransited> DerivedPtr = TECSEventDerivedPtr<FCE_NotifyClientMissionTransited>();
}
namespace __INTENRAL_FCE_NotifyClientOpenCGPlayer_NS
{
    const TECSEventDerivedPtr<FCE_NotifyClientOpenCGPlayer> DerivedPtr = TECSEventDerivedPtr<FCE_NotifyClientOpenCGPlayer>();
}
namespace __INTENRAL_FCE_NotifyServerCGPlayFinished_NS
{
    const TECSEventDerivedPtr<FCE_NotifyServerCGPlayFinished> DerivedPtr = TECSEventDerivedPtr<FCE_NotifyServerCGPlayFinished>();
}
namespace __INTENRAL_FCE_MissionPerformTransition_NS
{
    const TECSEventDerivedPtr<FCE_MissionPerformTransition> DerivedPtr = TECSEventDerivedPtr<FCE_MissionPerformTransition>();
}
namespace __INTENRAL_FCE_MissionRequestToggleTrack_NS
{
    const TECSEventDerivedPtr<FCE_MissionRequestToggleTrack> DerivedPtr = TECSEventDerivedPtr<FCE_MissionRequestToggleTrack>();

}
struct FStatusTransitionInfo
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    uint m_MissionId;
    UPROPERTY()
    uint m_MissionPhaseId;
    UPROPERTY()
    int m_ExecutionEntryId;
    UPROPERTY()
    EMissionStatus m_OldStatus;
    UPROPERTY()
    EMissionStatus m_NewStatus;

    FStatusTransitionInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FStatusTransitionInfo(const FStatusTransitionInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FStatusTransitionInfo(const uint InMissionId, const uint InMissionPhaseId, const EMissionStatus InOldStatus, const EMissionStatus InNewStatus)
    {
        this.m_MissionId = 0;
        this.m_MissionPhaseId = 0;
        this.m_ExecutionEntryId = 0;
        this.m_OldStatus = EMissionStatus(0);
        this.m_NewStatus = EMissionStatus(0);
        this.SetMissionId(InMissionId);
        this.SetMissionPhaseId(InMissionPhaseId);
        this.SetOldStatus(EMissionStatus(InOldStatus));
        this.SetNewStatus(EMissionStatus(InNewStatus));
        return;
    }
    FStatusTransitionInfo opAssign(const FStatusTransitionInfo &inout Other)
    {
        FStatusTransitionInfo __r;
        this.SetMissionId(Other.GetMissionId());
        this.SetMissionPhaseId(Other.GetMissionPhaseId());
        this.SetExecutionEntryId(Other.GetExecutionEntryId());
        this.SetOldStatus(Other.GetOldStatus());
        this.SetNewStatus(Other.GetNewStatus());
        return __r;
    }
    uint GetMissionId() const property
    {
        return this.m_MissionId;
    }
    void SetMissionId(const uint __Value) property
    {
        if (this.m_MissionId == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_MissionId = __Value;
        return;
    }
    uint GetMissionPhaseId() const property
    {
        return this.m_MissionPhaseId;
    }
    void SetMissionPhaseId(const uint __Value) property
    {
        if (this.m_MissionPhaseId == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_MissionPhaseId = __Value;
        return;
    }
    int GetExecutionEntryId() const property
    {
        return this.m_ExecutionEntryId;
    }
    void SetExecutionEntryId(const int __Value) property
    {
        if (this.m_ExecutionEntryId == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_ExecutionEntryId = __Value;
        return;
    }
    EMissionStatus GetOldStatus() const property
    {
        return this.m_OldStatus;
    }
    void SetOldStatus(const EMissionStatus __Value) property
    {
        if (int(this.m_OldStatus) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_OldStatus = __Value;
        return;
    }
    EMissionStatus GetNewStatus() const property
    {
        return this.m_NewStatus;
    }
    void SetNewStatus(const EMissionStatus __Value) property
    {
        if (int(this.m_NewStatus) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_NewStatus = __Value;
        return;
    }
}

struct FMissionTransitionInfo
{
    UPROPERTY()
    uint MissionId;
    UPROPERTY()
    EMissionStatus CurMissionStatus;
    UPROPERTY()
    TArray<FStatusTransitionInfo> PhaseTransitionInfos;


}

struct FMissionObjectiveInfo
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    uint m_InstanceId;
    UPROPERTY()
    uint m_ObjectiveId;
    UPROPERTY()
    EObjectiveStatus m_ObjectiveStatus;
    UPROPERTY()
    int m_FinishProgressValue;
    UPROPERTY()
    int m_FailProgressValue;

    FMissionObjectiveInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FMissionObjectiveInfo(const FMissionObjectiveInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FMissionObjectiveInfo(const uint InInstanceId, const uint InObjectiveId, const EObjectiveStatus InObjectiveStatus)
    {
        this.m_InstanceId = 0;
        this.m_ObjectiveId = 0;
        this.m_ObjectiveStatus = EObjectiveStatus(0);
        this.m_FinishProgressValue = 0;
        this.m_FailProgressValue = 0;
        this.SetInstanceId(InInstanceId);
        this.SetObjectiveId(InObjectiveId);
        this.SetObjectiveStatus(EObjectiveStatus(InObjectiveStatus));
        return;
    }
    FMissionObjectiveInfo opAssign(const FMissionObjectiveInfo &inout Other)
    {
        FMissionObjectiveInfo __r;
        this.SetInstanceId(Other.GetInstanceId());
        this.SetObjectiveId(Other.GetObjectiveId());
        this.SetObjectiveStatus(Other.GetObjectiveStatus());
        this.SetFinishProgressValue(Other.GetFinishProgressValue());
        this.SetFailProgressValue(Other.GetFailProgressValue());
        return __r;
    }
    uint GetInstanceId() const property
    {
        return this.m_InstanceId;
    }
    void SetInstanceId(const uint __Value) property
    {
        if (this.m_InstanceId == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_InstanceId = __Value;
        return;
    }
    uint GetObjectiveId() const property
    {
        return this.m_ObjectiveId;
    }
    void SetObjectiveId(const uint __Value) property
    {
        if (this.m_ObjectiveId == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_ObjectiveId = __Value;
        return;
    }
    EObjectiveStatus GetObjectiveStatus() const property
    {
        return this.m_ObjectiveStatus;
    }
    void SetObjectiveStatus(const EObjectiveStatus __Value) property
    {
        if (int(this.m_ObjectiveStatus) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_ObjectiveStatus = __Value;
        return;
    }
    int GetFinishProgressValue() const property
    {
        return this.m_FinishProgressValue;
    }
    void SetFinishProgressValue(const int __Value) property
    {
        if (this.m_FinishProgressValue == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_FinishProgressValue = __Value;
        return;
    }
    int GetFailProgressValue() const property
    {
        return this.m_FailProgressValue;
    }
    void SetFailProgressValue(const int __Value) property
    {
        if (this.m_FailProgressValue == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_FailProgressValue = __Value;
        return;
    }
}

struct FMissionDetail
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FMissionConfig> m_MissionConfig;
    UPROPERTY()
    EMissionStatus m_MissionStatus;
    UPROPERTY()
    TDataObjectPtr<FMissionPhaseConfig> m_ActivePhaseConfig;
    UPROPERTY()
    TMap<FName, TDataObjectPtr<FDialogueConfig>> m_ActiveDialogueMap;
    UPROPERTY()
    TMap<uint, FMissionObjectiveInfo> m_ActiveObjectiveStatusMap;
    UPROPERTY()
    TMap<uint, EMissionStatus> m_MissionPhaseStatusMap;

    FMissionDetail()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FMissionDetail(const FMissionDetail &inout Other)
    {
        this.m_MissionStatus = EMissionStatus(0);
        this.m_MissionConfig = Other.m_MissionConfig;
        this.m_MissionStatus = Other.m_MissionStatus;
        this.m_ActivePhaseConfig = Other.m_ActivePhaseConfig;
        this.m_ActiveDialogueMap = Other.m_ActiveDialogueMap;
        this.m_ActiveObjectiveStatusMap = Other.m_ActiveObjectiveStatusMap;
        this.m_MissionPhaseStatusMap = Other.m_MissionPhaseStatusMap;
        return;
    }
    FMissionDetail opAssign(const FMissionDetail &inout Other)
    {
        FMissionDetail __r;
        this.SetMissionConfig(Other.GetMissionConfig());
        this.SetMissionStatus(Other.GetMissionStatus());
        this.SetActivePhaseConfig(Other.GetActivePhaseConfig());
        this.SetActiveDialogueMap(Other.GetActiveDialogueMap());
        this.SetActiveObjectiveStatusMap(Other.GetActiveObjectiveStatusMap());
        this.SetMissionPhaseStatusMap(Other.GetMissionPhaseStatusMap());
        return __r;
    }
    FName GetMissionName() const
    {
        return this.GetMissionConfig().GetDataName();
    }
    uint GetActivePhaseId() const
    {
        int local_2 = 0;
        if (!(this.GetActivePhaseConfig().IsSet()))
        {
            return 0;
        }
        return local_2;
    }
    const TDataObjectPtr<FMissionConfig> GetMissionConfig() const property
    {
        const TDataObjectPtr<FMissionConfig> __r;
        return __r;
    }
    TDataObjectPtr<FMissionConfig> GetModify_MissionConfig() property
    {
        TDataObjectPtr<FMissionConfig> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetMissionConfig(const TDataObjectPtr<FMissionConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_MissionConfig = __Value;
        return;
    }
    EMissionStatus GetMissionStatus() const property
    {
        return this.m_MissionStatus;
    }
    void SetMissionStatus(const EMissionStatus __Value) property
    {
        if (int(this.m_MissionStatus) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_MissionStatus = __Value;
        return;
    }
    const TDataObjectPtr<FMissionPhaseConfig> GetActivePhaseConfig() const property
    {
        const TDataObjectPtr<FMissionPhaseConfig> __r;
        return __r;
    }
    TDataObjectPtr<FMissionPhaseConfig> GetModify_ActivePhaseConfig() property
    {
        TDataObjectPtr<FMissionPhaseConfig> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetActivePhaseConfig(const TDataObjectPtr<FMissionPhaseConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_ActivePhaseConfig = __Value;
        return;
    }
    const TMap<FName, TDataObjectPtr<FDialogueConfig>> GetActiveDialogueMap() const property
    {
        const TMap<FName, TDataObjectPtr<FDialogueConfig>> __r;
        return __r;
    }
    TMap<FName, TDataObjectPtr<FDialogueConfig>> GetModify_ActiveDialogueMap() property
    {
        TMap<FName, TDataObjectPtr<FDialogueConfig>> __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetActiveDialogueMap(const TMap<FName, TDataObjectPtr<FDialogueConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_ActiveDialogueMap = __Value;
        return;
    }
    const TMap<uint, FMissionObjectiveInfo> GetActiveObjectiveStatusMap() const property
    {
        const TMap<uint, FMissionObjectiveInfo> __r;
        return __r;
    }
    TMap<uint, FMissionObjectiveInfo> GetModify_ActiveObjectiveStatusMap() property
    {
        TMap<uint, FMissionObjectiveInfo> __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetActiveObjectiveStatusMap(const TMap<uint, FMissionObjectiveInfo> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_ActiveObjectiveStatusMap = __Value;
        return;
    }
    const TMap<uint, EMissionStatus> GetMissionPhaseStatusMap() const property
    {
        const TMap<uint, EMissionStatus> __r;
        return __r;
    }
    TMap<uint, EMissionStatus> GetModify_MissionPhaseStatusMap() property
    {
        TMap<uint, EMissionStatus> __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetMissionPhaseStatusMap(const TMap<uint, EMissionStatus> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_MissionPhaseStatusMap = __Value;
        return;
    }
}

struct FC_TrackingMission : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<EMissionType, TDataObjectPtr<FMissionConfig>> m_TrackingMissionMap;

    FC_TrackingMission()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_TrackingMission(const FC_TrackingMission &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_TrackingMissionMap = Other.m_TrackingMissionMap;
        return;
    }
    FC_TrackingMission opAssign(const FC_TrackingMission &inout Other)
    {
        FC_TrackingMission __r;
        this.SetTrackingMissionMap(Other.GetTrackingMissionMap());
        return __r;
    }
    const TMap<EMissionType, TDataObjectPtr<FMissionConfig>> GetTrackingMissionMap() const property
    {
        const TMap<EMissionType, TDataObjectPtr<FMissionConfig>> __r;
        return __r;
    }
    TMap<EMissionType, TDataObjectPtr<FMissionConfig>> GetModify_TrackingMissionMap() property
    {
        TMap<EMissionType, TDataObjectPtr<FMissionConfig>> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetTrackingMissionMap(const TMap<EMissionType, TDataObjectPtr<FMissionConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TrackingMissionMap = __Value;
        return;
    }
}

struct FC_PlayerMissionInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<uint, FMissionDetail> m_ActiveMissionStatus;
    UPROPERTY()
    TMap<uint, FMissionDetail> m_FinishedMissionStatus;

    FC_PlayerMissionInfo()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_PlayerMissionInfo(const FC_PlayerMissionInfo &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_ActiveMissionStatus = Other.m_ActiveMissionStatus;
        this.m_FinishedMissionStatus = Other.m_FinishedMissionStatus;
        return;
    }
    FC_PlayerMissionInfo opAssign(const FC_PlayerMissionInfo &inout Other)
    {
        FC_PlayerMissionInfo __r;
        this.SetActiveMissionStatus(Other.GetActiveMissionStatus());
        this.SetFinishedMissionStatus(Other.GetFinishedMissionStatus());
        return __r;
    }
    const TMap<uint, FMissionDetail> GetActiveMissionStatus() const property
    {
        const TMap<uint, FMissionDetail> __r;
        return __r;
    }
    TMap<uint, FMissionDetail> GetModify_ActiveMissionStatus() property
    {
        TMap<uint, FMissionDetail> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetActiveMissionStatus(const TMap<uint, FMissionDetail> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ActiveMissionStatus = __Value;
        return;
    }
    const TMap<uint, FMissionDetail> GetFinishedMissionStatus() const property
    {
        const TMap<uint, FMissionDetail> __r;
        return __r;
    }
    TMap<uint, FMissionDetail> GetModify_FinishedMissionStatus() property
    {
        TMap<uint, FMissionDetail> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetFinishedMissionStatus(const TMap<uint, FMissionDetail> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_FinishedMissionStatus = __Value;
        return;
    }
}

struct FCE_OnMissionStatusTransited : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntityId PlayerEntityId;
    UPROPERTY()
    TArray<FMissionTransitionInfo> TransitionInfos;

    FCE_OnMissionStatusTransited()
    {
        return;
    }
}

struct FCE_OnMissionStarted : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TDataObjectPtr<FMissionConfig> MissionConfig;

    FCE_OnMissionStarted()
    {
        return;
    }
}

struct FCE_OnMissionAccepted : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TDataObjectPtr<FMissionConfig> MissionConfig;

    FCE_OnMissionAccepted()
    {
        return;
    }
}

struct FCE_MissionTriggerEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    EMissionTriggerType TriggerType;
    UPROPERTY()
    TDataObjectPtr<FMissionConfig> MissionConfig;
    UPROPERTY()
    TDataObjectPtr<FMissionPhaseConfig> MissionPhaseConfig;


}

struct FCE_NotifyClientMissionTransited : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint MissionId;
    UPROPERTY()
    TArray<FStatusTransitionInfo> TransitionInfos;


}

struct FCE_NotifyClientOpenCGPlayer : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TDataObjectPtr<FCGConfig> CGConfig;

    FCE_NotifyClientOpenCGPlayer()
    {
        return;
    }
}

struct FCE_NotifyServerCGPlayFinished : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TDataObjectPtr<FCGConfig> CGConfig;

    FCE_NotifyServerCGPlayFinished()
    {
        return;
    }
    bool Validate() const
    {
        return true;
    }
}

struct FCE_MissionPerformTransition : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TArray<FStatusTransitionInfo> TransitionInfos;

    FCE_MissionPerformTransition()
    {
        return;
    }
}

struct FCE_MissionRequestToggleTrack : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TDataObjectPtr<FMissionConfig> MissionConfig;
    UPROPERTY()
    bool bIsTracking;
    UPROPERTY()
    bool bOpenMapAndSelect;


    bool Validate() const
    {
        return true;
    }
}

namespace ECSFunc_FC_TrackingMission
{
UFUNCTION()
bool HasTrackingMission(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TrackingMission);
}
FC_TrackingMission& AssignTrackingMission(const FECSEntity &inout Entity, const FC_TrackingMission &inout DefaultValue = FC_TrackingMission())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TrackingMission, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTrackingMission_BP(const FECSEntity &inout Entity, const FC_TrackingMission &inout DefaultValue = FC_TrackingMission())
{
    ECSFunc_FC_TrackingMission::AssignTrackingMission(Entity, DefaultValue);
    return;
}
FC_TrackingMission& ModifyTrackingMission(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TrackingMission));
    return local_12.GetComp();
}
FC_TrackingMission& ModifyOrAddTrackingMission(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TrackingMission));
    return local_12.GetComp();
}
const FC_TrackingMission& GetTrackingMission(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TrackingMission));
    return local_12.GetComp();
}
UFUNCTION()
FC_TrackingMission GetTrackingMission_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_TrackingMission& local_4 = ECSFunc_FC_TrackingMission::GetTrackingMission(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_TrackingMission();
}
const FC_TrackingMission GetDefaultedTrackingMission(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TrackingMission __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TrackingMission);
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
FC_TrackingMission GetDefaultedTrackingMission_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_TrackingMission::GetDefaultedTrackingMission(Entity);
}
UFUNCTION()
bool RemoveTrackingMission(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TrackingMission);
}
}
FECSMonitorRuntimeView __GetMonitorTrackingMissionOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TrackingMission, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTrackingMissionOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TrackingMission, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTrackingMissionOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TrackingMission, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTrackingMissionOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TrackingMission, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTrackingMissionOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TrackingMission, bFixedFrame, bMustHandleAll);
}
void __MonitorTrackingMissionLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TrackingMission, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTrackingMissionActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TrackingMission, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTrackingMissionModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TrackingMission, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PlayerMissionInfo
{
UFUNCTION()
bool HasPlayerMissionInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerMissionInfo);
}
FC_PlayerMissionInfo& AssignPlayerMissionInfo(const FECSEntity &inout Entity, const FC_PlayerMissionInfo &inout DefaultValue = FC_PlayerMissionInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerMissionInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerMissionInfo_BP(const FECSEntity &inout Entity, const FC_PlayerMissionInfo &inout DefaultValue = FC_PlayerMissionInfo())
{
    ECSFunc_FC_PlayerMissionInfo::AssignPlayerMissionInfo(Entity, DefaultValue);
    return;
}
FC_PlayerMissionInfo& ModifyPlayerMissionInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerMissionInfo));
    return local_12.GetComp();
}
FC_PlayerMissionInfo& ModifyOrAddPlayerMissionInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerMissionInfo));
    return local_12.GetComp();
}
const FC_PlayerMissionInfo& GetPlayerMissionInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerMissionInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerMissionInfo GetPlayerMissionInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PlayerMissionInfo& local_4 = ECSFunc_FC_PlayerMissionInfo::GetPlayerMissionInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PlayerMissionInfo();
}
const FC_PlayerMissionInfo GetDefaultedPlayerMissionInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerMissionInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerMissionInfo);
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
FC_PlayerMissionInfo GetDefaultedPlayerMissionInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PlayerMissionInfo::GetDefaultedPlayerMissionInfo(Entity);
}
UFUNCTION()
bool RemovePlayerMissionInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerMissionInfo);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerMissionInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerMissionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerMissionInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerMissionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerMissionInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerMissionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerMissionInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerMissionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerMissionInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerMissionInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerMissionInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerMissionInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerMissionInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerMissionInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerMissionInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerMissionInfo, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FStatusTransitionInfo &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FStatusTransitionInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FStatusTransitionInfo
{
int __IndexOf_MissionId()
{
    return 0;
}
int __IndexOf_MissionPhaseId()
{
    return 1;
}
int __IndexOf_ExecutionEntryId()
{
    return 2;
}
int __IndexOf_OldStatus()
{
    return 3;
}
int __IndexOf_NewStatus()
{
    return 4;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FMissionObjectiveInfo &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FMissionObjectiveInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FMissionObjectiveInfo
{
int __IndexOf_InstanceId()
{
    return 0;
}
int __IndexOf_ObjectiveId()
{
    return 1;
}
int __IndexOf_ObjectiveStatus()
{
    return 2;
}
int __IndexOf_FinishProgressValue()
{
    return 3;
}
int __IndexOf_FailProgressValue()
{
    return 4;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FMissionDetail &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FMissionDetail &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FMissionDetail
{
int __IndexOf_MissionConfig()
{
    return 0;
}
int __IndexOf_MissionStatus()
{
    return 1;
}
int __IndexOf_ActivePhaseConfig()
{
    return 2;
}
int __IndexOf_ActiveDialogueMap()
{
    return 3;
}
int __IndexOf_ActiveObjectiveStatusMap()
{
    return 4;
}
int __IndexOf_MissionPhaseStatusMap()
{
    return 5;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_TrackingMission &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_TrackingMission &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_TrackingMission &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_TrackingMission
{
int __IndexOf_TrackingMissionMap()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PlayerMissionInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PlayerMissionInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PlayerMissionInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PlayerMissionInfo
{
int __IndexOf_ActiveMissionStatus()
{
    return 0;
}
int __IndexOf_FinishedMissionStatus()
{
    return 1;
}
}
