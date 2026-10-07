
namespace __INTENRAL_FC_PendingTeleport_NS
{
    const TECSComponentDerivedPtr<FC_PendingTeleport> DerivedPtr = TECSComponentDerivedPtr<FC_PendingTeleport>();
    const FC_PendingTeleport DefaultValue = FC_PendingTeleport();
}
namespace __INTENRAL_FCS_TeleportLoadingScreenState_NS
{
    const TECSComponentDerivedPtr<FCS_TeleportLoadingScreenState> DerivedPtr = TECSComponentDerivedPtr<FCS_TeleportLoadingScreenState>();
    const FCS_TeleportLoadingScreenState DefaultValue = FCS_TeleportLoadingScreenState();
}
namespace __INTENRAL_FC_TeleportBlockInput_NS
{
    const TECSComponentDerivedPtr<FC_TeleportBlockInput> DerivedPtr = TECSComponentDerivedPtr<FC_TeleportBlockInput>();
    const FC_TeleportBlockInput DefaultValue = FC_TeleportBlockInput();
}
namespace __INTENRAL_FC_TeleportLoadingTransaction_NS
{
    const TECSComponentDerivedPtr<FC_TeleportLoadingTransaction> DerivedPtr = TECSComponentDerivedPtr<FC_TeleportLoadingTransaction>();
    const FC_TeleportLoadingTransaction DefaultValue = FC_TeleportLoadingTransaction();
}
namespace __INTENRAL_FC_TeleportHideVisual_NS
{
    const TECSComponentDerivedPtr<FC_TeleportHideVisual> DerivedPtr = TECSComponentDerivedPtr<FC_TeleportHideVisual>();
    const FC_TeleportHideVisual DefaultValue = FC_TeleportHideVisual();
}
namespace __INTENRAL_FC_TeleportViewHideState_NS
{
    const TECSComponentDerivedPtr<FC_TeleportViewHideState> DerivedPtr = TECSComponentDerivedPtr<FC_TeleportViewHideState>();
    const FC_TeleportViewHideState DefaultValue = FC_TeleportViewHideState();
}
namespace __INTENRAL_FC_TeleportViewHideRuntime_NS
{
    const TECSComponentDerivedPtr<FC_TeleportViewHideRuntime> DerivedPtr = TECSComponentDerivedPtr<FC_TeleportViewHideRuntime>();
    const FC_TeleportViewHideRuntime DefaultValue = FC_TeleportViewHideRuntime();
}
namespace __INTENRAL_FC_TeleportLandOnLoadingClose_NS
{
    const TECSComponentDerivedPtr<FC_TeleportLandOnLoadingClose> DerivedPtr = TECSComponentDerivedPtr<FC_TeleportLandOnLoadingClose>();
    const FC_TeleportLandOnLoadingClose DefaultValue = FC_TeleportLandOnLoadingClose();
}
namespace __INTENRAL_FCE_ClientTeleportToLocationRequest_NS
{
    const TECSEventDerivedPtr<FCE_ClientTeleportToLocationRequest> DerivedPtr = TECSEventDerivedPtr<FCE_ClientTeleportToLocationRequest>();
}
namespace __INTENRAL_FCE_TeleportToLocationRequest_NS
{
    const TECSEventDerivedPtr<FCE_TeleportToLocationRequest> DerivedPtr = TECSEventDerivedPtr<FCE_TeleportToLocationRequest>();
}
namespace __INTENRAL_FCE_ShowTeleportLoadingScreen_NS
{
    const TECSEventDerivedPtr<FCE_ShowTeleportLoadingScreen> DerivedPtr = TECSEventDerivedPtr<FCE_ShowTeleportLoadingScreen>();
}
namespace __INTENRAL_FCE_TeleportLoadingScreenStateChanged_NS
{
    const TECSEventDerivedPtr<FCE_TeleportLoadingScreenStateChanged> DerivedPtr = TECSEventDerivedPtr<FCE_TeleportLoadingScreenStateChanged>();
}
namespace __INTENRAL_FCE_TeleportViewHideReady_NS
{
    const TECSEventDerivedPtr<FCE_TeleportViewHideReady> DerivedPtr = TECSEventDerivedPtr<FCE_TeleportViewHideReady>();
}
namespace __INTENRAL_FCE_TeleportCrossDSLandRequest_NS
{
    const TECSEventDerivedPtr<FCE_TeleportCrossDSLandRequest> DerivedPtr = TECSEventDerivedPtr<FCE_TeleportCrossDSLandRequest>();
}
namespace __INTENRAL_FCE_ServerToClientSetCameraPose_NS
{
    const TECSEventDerivedPtr<FCE_ServerToClientSetCameraPose> DerivedPtr = TECSEventDerivedPtr<FCE_ServerToClientSetCameraPose>();
}
namespace __INTENRAL_FCE_TeleportCompleted_NS
{
    const TECSEventDerivedPtr<FCE_TeleportCompleted> DerivedPtr = TECSEventDerivedPtr<FCE_TeleportCompleted>();
}
namespace __INTENRAL_FCE_TeleportToPublicEventRequest_NS
{
    const TECSEventDerivedPtr<FCE_TeleportToPublicEventRequest> DerivedPtr = TECSEventDerivedPtr<FCE_TeleportToPublicEventRequest>();

}
struct FCE_ClientTeleportToLocationRequest : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FVector2D Location;
    UPROPERTY()
    FRotator Rotation;

    FCE_ClientTeleportToLocationRequest()
    {
        return;
    }
}

struct FCE_TeleportToLocationRequest : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FVector Location;
    UPROPERTY()
    FRotator Rotation;
    UPROPERTY()
    bool bSetCameraRotation = false;
    UPROPERTY()
    FRotator CameraRotation;
    UPROPERTY()
    bool bTeleportCamera = false;
    UPROPERTY()
    bool bShowBlackScreen = true;
    UPROPERTY()
    ELoadingScreenAction Action = ELoadingScreenAction(0);
    UPROPERTY()
    bool bBlockInput = true;
    UPROPERTY()
    bool bWaitSelfDetached = false;
    UPROPERTY()
    FECSEntity WaitDetachChild;


}

struct FC_PendingTeleport : FECSComponent
{
    UPROPERTY()
    FVector Location;
    UPROPERTY()
    FRotator Rotation;
    UPROPERTY()
    bool bWaitSelfDetached = false;
    UPROPERTY()
    FECSEntity WaitDetachChild;
    UPROPERTY()
    bool bWaitLoadingVisible = false;
    UPROPERTY()
    uint64 LoadingSerial = 0;
    UPROPERTY()
    FFPTime DeadlineTime;


}

struct FCE_ShowTeleportLoadingScreen : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    ELoadingScreenAction Action = ELoadingScreenAction(0);
    UPROPERTY()
    uint64 Serial = 0;


}

struct FCE_TeleportLoadingScreenStateChanged : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    bool bVisible = false;
    UPROPERTY()
    ELoadingScreenAction Action = ELoadingScreenAction(0);
    UPROPERTY()
    uint64 Serial = 0;


    bool Validate() const
    {
        Has local_4;
        return ((local_4.opCall() && this.TargetEntity.IsValid()) && (this.Serial != 0));
    }
}

struct FCE_TeleportViewHideReady : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    uint64 Serial = 0;


    bool Validate() const
    {
        Has local_4;
        return ((local_4.opCall() && this.TargetEntity.IsValid()) && (this.Serial != 0));
    }
}

struct FCE_TeleportCrossDSLandRequest : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_TeleportCrossDSLandRequest()
    {
        return;
    }
}

struct FCS_TeleportLoadingScreenState : FECSSingleton
{
    UPROPERTY()
    bool bLastVisible = false;
    UPROPERTY()
    bool bSawVisible = false;
    UPROPERTY()
    FECSEntity TransactionEntity;
    UPROPERTY()
    uint64 Serial = 0;
    UPROPERTY()
    uint64 ConsumedCloseUIVisibilityRevision = 0;


}

struct FCE_ServerToClientSetCameraPose : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    bool bTeleportToTarget = true;
    UPROPERTY()
    bool bSetRotation = false;
    UPROPERTY()
    FRotator Rotation;


}

struct FCE_TeleportCompleted : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FVector PreviousLocation;
    UPROPERTY()
    FRotator PreviousRotation;

    FCE_TeleportCompleted()
    {
        return;
    }
}

struct FCE_TeleportToPublicEventRequest : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity PublicEventEntity;
    UPROPERTY()
    ELoadingScreenAction Action = ELoadingScreenAction(0);


    bool Validate() const
    {
        return this.PublicEventEntity.IsValid();
    }
}

struct FC_TeleportBlockInput : FECSComponent
{
    UPROPERTY()
    FFPTime EndTime;
    UPROPERTY()
    bool bInputDisabled = false;
    UPROPERTY()
    FECSEntity PlayerEntity;


}

struct FC_TeleportLoadingTransaction : FECSComponent
{
    UPROPERTY()
    uint64 Serial = 0;
    UPROPERTY()
    bool bActive = false;
    UPROPERTY()
    bool bLoadingVisible = false;
    UPROPERTY()
    bool bBarrierOpened = false;
    UPROPERTY()
    uint64 ExpectedGuardReadyMask = 0;
    UPROPERTY()
    uint64 GuardReadyMask = 0;
    UPROPERTY()
    bool bLoopTransitPending = false;
    UPROPERTY()
    bool bTeleportApplied = false;
    UPROPERTY()
    bool bCloseRequested = false;
    UPROPERTY()
    FFPTime ForceCloseTime;
    UPROPERTY()
    FFPTime GuardReadyDeadline;


}

struct FC_TeleportHideVisual : FECSComponent
{
    UPROPERTY()
    FFPTime EndTime;
    UPROPERTY()
    bool bHidden = false;
    UPROPERTY()
    uint64 TransactionSerial = 0;
    UPROPERTY()
    FECSEntity PlayerEntity;
    UPROPERTY()
    TArray<FName> HiddenMeshNames;


}

struct FC_TeleportViewHideState : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    uint64 m_TransactionSerial;
    UPROPERTY()
    bool m_bReleaseRequested;
    UPROPERTY()
    FFPTime m_ReleaseRequestTime;
    UPROPERTY()
    FFPTime m_ForceReleaseTime;

    FC_TeleportViewHideState()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_TeleportViewHideState(const FC_TeleportViewHideState &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_TeleportViewHideState opAssign(const FC_TeleportViewHideState &inout Other)
    {
        FC_TeleportViewHideState __r;
        this.SetTransactionSerial(Other.GetTransactionSerial());
        this.SetbReleaseRequested(Other.GetbReleaseRequested());
        this.SetReleaseRequestTime(Other.GetReleaseRequestTime());
        this.SetForceReleaseTime(Other.GetForceReleaseTime());
        return __r;
    }
    uint64 GetTransactionSerial() const property
    {
        return this.m_TransactionSerial;
    }
    void SetTransactionSerial(const uint64 __Value) property
    {
        if (this.m_TransactionSerial == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TransactionSerial = __Value;
        return;
    }
    bool GetbReleaseRequested() const property
    {
        return this.m_bReleaseRequested;
    }
    void SetbReleaseRequested(const bool __Value) property
    {
        if (!(this.m_bReleaseRequested) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bReleaseRequested = __Value;
        return;
    }
    const FFPTime GetReleaseRequestTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_ReleaseRequestTime() property
    {
        FFPTime __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetReleaseRequestTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_ReleaseRequestTime = __Value;
        return;
    }
    const FFPTime GetForceReleaseTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_ForceReleaseTime() property
    {
        FFPTime __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetForceReleaseTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_ForceReleaseTime = __Value;
        return;
    }
}

struct FC_TeleportViewHideRuntime : FECSComponent
{
    UPROPERTY()
    bool bInitialized = false;
    UPROPERTY()
    bool bWaitLogged = false;
    UPROPERTY()
    TArray<FName> GuardedMeshNames;
    UPROPERTY()
    FECSEntity GuardedWeaponViewEntity;
    UPROPERTY()
    uint64 TransactionSerial = 0;
    UPROPERTY()
    bool bReadyReported = false;
    UPROPERTY()
    bool bLoadingVisibleReported = false;
    UPROPERTY()
    bool bCloseReported = false;
    UPROPERTY()
    bool bGuardAppliedLogged = false;


}

struct FC_TeleportLandOnLoadingClose : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFPTime m_DeadlineTime;

    FC_TeleportLandOnLoadingClose()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_TeleportLandOnLoadingClose(const FC_TeleportLandOnLoadingClose &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_DeadlineTime = Other.m_DeadlineTime;
        return;
    }
    FC_TeleportLandOnLoadingClose opAssign(const FC_TeleportLandOnLoadingClose &inout Other)
    {
        FC_TeleportLandOnLoadingClose __r;
        this.SetDeadlineTime(Other.GetDeadlineTime());
        return __r;
    }
    const FFPTime GetDeadlineTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_DeadlineTime() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetDeadlineTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_DeadlineTime = __Value;
        return;
    }
}

namespace ECSFunc_FC_PendingTeleport
{
UFUNCTION()
bool HasPendingTeleport(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PendingTeleport);
}
FC_PendingTeleport& AssignPendingTeleport(const FECSEntity &inout Entity, const FC_PendingTeleport &inout DefaultValue = FC_PendingTeleport())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PendingTeleport, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPendingTeleport_BP(const FECSEntity &inout Entity, const FC_PendingTeleport &inout DefaultValue = FC_PendingTeleport())
{
    ECSFunc_FC_PendingTeleport::AssignPendingTeleport(Entity, DefaultValue);
    return;
}
FC_PendingTeleport& ModifyPendingTeleport(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PendingTeleport));
    return local_12.GetComp();
}
FC_PendingTeleport& ModifyOrAddPendingTeleport(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PendingTeleport));
    return local_12.GetComp();
}
const FC_PendingTeleport& GetPendingTeleport(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PendingTeleport));
    return local_12.GetComp();
}
UFUNCTION()
FC_PendingTeleport GetPendingTeleport_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PendingTeleport __r;
    bValid = false;
    bValid = ECSFunc_FC_PendingTeleport::GetPendingTeleport(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PendingTeleport GetDefaultedPendingTeleport(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PendingTeleport __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PendingTeleport);
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
FC_PendingTeleport GetDefaultedPendingTeleport_BP(const FECSEntity &inout Entity)
{
    FC_PendingTeleport __r;
    return __r;
}
UFUNCTION()
bool RemovePendingTeleport(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PendingTeleport);
}
}
FECSMonitorRuntimeView __GetMonitorPendingTeleportOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PendingTeleport, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPendingTeleportOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PendingTeleport, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPendingTeleportOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PendingTeleport, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPendingTeleportOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PendingTeleport, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPendingTeleportOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PendingTeleport, bFixedFrame, bMustHandleAll);
}
void __MonitorPendingTeleportLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PendingTeleport, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPendingTeleportActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PendingTeleport, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPendingTeleportModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PendingTeleport, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_TeleportLoadingScreenState
{
UFUNCTION()
bool HasTeleportLoadingScreenState(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_TeleportLoadingScreenState);
}
FCS_TeleportLoadingScreenState& AssignTeleportLoadingScreenState(const FECSWorldPtr &inout World, const FCS_TeleportLoadingScreenState &inout DefaultValue = FCS_TeleportLoadingScreenState())
{
    UScriptStruct local_6 = FCS_TeleportLoadingScreenState;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignTeleportLoadingScreenState_BP(const FECSWorldPtr &inout World, const FCS_TeleportLoadingScreenState &inout DefaultValue = FCS_TeleportLoadingScreenState())
{
    ECSFunc_FCS_TeleportLoadingScreenState::AssignTeleportLoadingScreenState(World, DefaultValue);
    return;
}
FCS_TeleportLoadingScreenState& ModifyTeleportLoadingScreenState(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TeleportLoadingScreenState;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_TeleportLoadingScreenState& ModifyOrAddTeleportLoadingScreenState(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TeleportLoadingScreenState;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_TeleportLoadingScreenState& GetTeleportLoadingScreenState(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TeleportLoadingScreenState;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_TeleportLoadingScreenState GetTeleportLoadingScreenState_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_TeleportLoadingScreenState __r;
    bValid = false;
    bValid = ECSFunc_FCS_TeleportLoadingScreenState::GetTeleportLoadingScreenState(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_TeleportLoadingScreenState GetDefaultedTeleportLoadingScreenState(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_TeleportLoadingScreenState __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_TeleportLoadingScreenState);
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
FCS_TeleportLoadingScreenState GetDefaultedTeleportLoadingScreenState_BP(const FECSWorldPtr &inout World)
{
    FCS_TeleportLoadingScreenState __r;
    return __r;
}
UFUNCTION()
bool RemoveTeleportLoadingScreenState(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_TeleportLoadingScreenState);
}
}
void __MonitorTeleportLoadingScreenStateLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_TeleportLoadingScreenState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeleportLoadingScreenStateActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_TeleportLoadingScreenState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeleportLoadingScreenStateModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_TeleportLoadingScreenState, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_TeleportBlockInput
{
UFUNCTION()
bool HasTeleportBlockInput(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TeleportBlockInput);
}
FC_TeleportBlockInput& AssignTeleportBlockInput(const FECSEntity &inout Entity, const FC_TeleportBlockInput &inout DefaultValue = FC_TeleportBlockInput())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TeleportBlockInput, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTeleportBlockInput_BP(const FECSEntity &inout Entity, const FC_TeleportBlockInput &inout DefaultValue = FC_TeleportBlockInput())
{
    ECSFunc_FC_TeleportBlockInput::AssignTeleportBlockInput(Entity, DefaultValue);
    return;
}
FC_TeleportBlockInput& ModifyTeleportBlockInput(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TeleportBlockInput));
    return local_12.GetComp();
}
FC_TeleportBlockInput& ModifyOrAddTeleportBlockInput(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TeleportBlockInput));
    return local_12.GetComp();
}
const FC_TeleportBlockInput& GetTeleportBlockInput(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TeleportBlockInput));
    return local_12.GetComp();
}
UFUNCTION()
FC_TeleportBlockInput GetTeleportBlockInput_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_TeleportBlockInput __r;
    bValid = false;
    bValid = ECSFunc_FC_TeleportBlockInput::GetTeleportBlockInput(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_TeleportBlockInput GetDefaultedTeleportBlockInput(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TeleportBlockInput __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TeleportBlockInput);
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
FC_TeleportBlockInput GetDefaultedTeleportBlockInput_BP(const FECSEntity &inout Entity)
{
    FC_TeleportBlockInput __r;
    return __r;
}
UFUNCTION()
bool RemoveTeleportBlockInput(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TeleportBlockInput);
}
}
FECSMonitorRuntimeView __GetMonitorTeleportBlockInputOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TeleportBlockInput, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleportBlockInputOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TeleportBlockInput, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleportBlockInputOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TeleportBlockInput, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleportBlockInputOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TeleportBlockInput, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleportBlockInputOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TeleportBlockInput, bFixedFrame, bMustHandleAll);
}
void __MonitorTeleportBlockInputLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TeleportBlockInput, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeleportBlockInputActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TeleportBlockInput, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeleportBlockInputModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TeleportBlockInput, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_TeleportLoadingTransaction
{
UFUNCTION()
bool HasTeleportLoadingTransaction(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TeleportLoadingTransaction);
}
FC_TeleportLoadingTransaction& AssignTeleportLoadingTransaction(const FECSEntity &inout Entity, const FC_TeleportLoadingTransaction &inout DefaultValue = FC_TeleportLoadingTransaction())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TeleportLoadingTransaction, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTeleportLoadingTransaction_BP(const FECSEntity &inout Entity, const FC_TeleportLoadingTransaction &inout DefaultValue = FC_TeleportLoadingTransaction())
{
    ECSFunc_FC_TeleportLoadingTransaction::AssignTeleportLoadingTransaction(Entity, DefaultValue);
    return;
}
FC_TeleportLoadingTransaction& ModifyTeleportLoadingTransaction(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TeleportLoadingTransaction));
    return local_12.GetComp();
}
FC_TeleportLoadingTransaction& ModifyOrAddTeleportLoadingTransaction(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TeleportLoadingTransaction));
    return local_12.GetComp();
}
const FC_TeleportLoadingTransaction& GetTeleportLoadingTransaction(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TeleportLoadingTransaction));
    return local_12.GetComp();
}
UFUNCTION()
FC_TeleportLoadingTransaction GetTeleportLoadingTransaction_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_TeleportLoadingTransaction __r;
    bValid = false;
    bValid = ECSFunc_FC_TeleportLoadingTransaction::GetTeleportLoadingTransaction(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_TeleportLoadingTransaction GetDefaultedTeleportLoadingTransaction(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TeleportLoadingTransaction __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TeleportLoadingTransaction);
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
FC_TeleportLoadingTransaction GetDefaultedTeleportLoadingTransaction_BP(const FECSEntity &inout Entity)
{
    FC_TeleportLoadingTransaction __r;
    return __r;
}
UFUNCTION()
bool RemoveTeleportLoadingTransaction(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TeleportLoadingTransaction);
}
}
FECSMonitorRuntimeView __GetMonitorTeleportLoadingTransactionOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TeleportLoadingTransaction, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleportLoadingTransactionOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TeleportLoadingTransaction, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleportLoadingTransactionOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TeleportLoadingTransaction, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleportLoadingTransactionOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TeleportLoadingTransaction, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleportLoadingTransactionOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TeleportLoadingTransaction, bFixedFrame, bMustHandleAll);
}
void __MonitorTeleportLoadingTransactionLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TeleportLoadingTransaction, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeleportLoadingTransactionActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TeleportLoadingTransaction, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeleportLoadingTransactionModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TeleportLoadingTransaction, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_TeleportHideVisual
{
UFUNCTION()
bool HasTeleportHideVisual(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TeleportHideVisual);
}
FC_TeleportHideVisual& AssignTeleportHideVisual(const FECSEntity &inout Entity, const FC_TeleportHideVisual &inout DefaultValue = FC_TeleportHideVisual())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TeleportHideVisual, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTeleportHideVisual_BP(const FECSEntity &inout Entity, const FC_TeleportHideVisual &inout DefaultValue = FC_TeleportHideVisual())
{
    ECSFunc_FC_TeleportHideVisual::AssignTeleportHideVisual(Entity, DefaultValue);
    return;
}
FC_TeleportHideVisual& ModifyTeleportHideVisual(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TeleportHideVisual));
    return local_12.GetComp();
}
FC_TeleportHideVisual& ModifyOrAddTeleportHideVisual(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TeleportHideVisual));
    return local_12.GetComp();
}
const FC_TeleportHideVisual& GetTeleportHideVisual(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TeleportHideVisual));
    return local_12.GetComp();
}
UFUNCTION()
FC_TeleportHideVisual GetTeleportHideVisual_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_TeleportHideVisual __r;
    bValid = false;
    bValid = ECSFunc_FC_TeleportHideVisual::GetTeleportHideVisual(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_TeleportHideVisual GetDefaultedTeleportHideVisual(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TeleportHideVisual __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TeleportHideVisual);
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
FC_TeleportHideVisual GetDefaultedTeleportHideVisual_BP(const FECSEntity &inout Entity)
{
    FC_TeleportHideVisual __r;
    return __r;
}
UFUNCTION()
bool RemoveTeleportHideVisual(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TeleportHideVisual);
}
}
FECSMonitorRuntimeView __GetMonitorTeleportHideVisualOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TeleportHideVisual, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleportHideVisualOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TeleportHideVisual, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleportHideVisualOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TeleportHideVisual, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleportHideVisualOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TeleportHideVisual, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleportHideVisualOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TeleportHideVisual, bFixedFrame, bMustHandleAll);
}
void __MonitorTeleportHideVisualLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TeleportHideVisual, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeleportHideVisualActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TeleportHideVisual, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeleportHideVisualModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TeleportHideVisual, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_TeleportViewHideState
{
UFUNCTION()
bool HasTeleportViewHideState(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TeleportViewHideState);
}
FC_TeleportViewHideState& AssignTeleportViewHideState(const FECSEntity &inout Entity, const FC_TeleportViewHideState &inout DefaultValue = FC_TeleportViewHideState())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TeleportViewHideState, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTeleportViewHideState_BP(const FECSEntity &inout Entity, const FC_TeleportViewHideState &inout DefaultValue = FC_TeleportViewHideState())
{
    ECSFunc_FC_TeleportViewHideState::AssignTeleportViewHideState(Entity, DefaultValue);
    return;
}
FC_TeleportViewHideState& ModifyTeleportViewHideState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TeleportViewHideState));
    return local_12.GetComp();
}
FC_TeleportViewHideState& ModifyOrAddTeleportViewHideState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TeleportViewHideState));
    return local_12.GetComp();
}
const FC_TeleportViewHideState& GetTeleportViewHideState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TeleportViewHideState));
    return local_12.GetComp();
}
UFUNCTION()
FC_TeleportViewHideState GetTeleportViewHideState_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_TeleportViewHideState& local_4 = ECSFunc_FC_TeleportViewHideState::GetTeleportViewHideState(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_TeleportViewHideState();
}
const FC_TeleportViewHideState GetDefaultedTeleportViewHideState(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TeleportViewHideState __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TeleportViewHideState);
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
FC_TeleportViewHideState GetDefaultedTeleportViewHideState_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_TeleportViewHideState::GetDefaultedTeleportViewHideState(Entity);
}
UFUNCTION()
bool RemoveTeleportViewHideState(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TeleportViewHideState);
}
}
FECSMonitorRuntimeView __GetMonitorTeleportViewHideStateOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TeleportViewHideState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleportViewHideStateOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TeleportViewHideState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleportViewHideStateOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TeleportViewHideState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleportViewHideStateOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TeleportViewHideState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleportViewHideStateOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TeleportViewHideState, bFixedFrame, bMustHandleAll);
}
void __MonitorTeleportViewHideStateLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TeleportViewHideState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeleportViewHideStateActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TeleportViewHideState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeleportViewHideStateModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TeleportViewHideState, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_TeleportViewHideRuntime
{
UFUNCTION()
bool HasTeleportViewHideRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TeleportViewHideRuntime);
}
FC_TeleportViewHideRuntime& AssignTeleportViewHideRuntime(const FECSEntity &inout Entity, const FC_TeleportViewHideRuntime &inout DefaultValue = FC_TeleportViewHideRuntime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TeleportViewHideRuntime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTeleportViewHideRuntime_BP(const FECSEntity &inout Entity, const FC_TeleportViewHideRuntime &inout DefaultValue = FC_TeleportViewHideRuntime())
{
    ECSFunc_FC_TeleportViewHideRuntime::AssignTeleportViewHideRuntime(Entity, DefaultValue);
    return;
}
FC_TeleportViewHideRuntime& ModifyTeleportViewHideRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TeleportViewHideRuntime));
    return local_12.GetComp();
}
FC_TeleportViewHideRuntime& ModifyOrAddTeleportViewHideRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TeleportViewHideRuntime));
    return local_12.GetComp();
}
const FC_TeleportViewHideRuntime& GetTeleportViewHideRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TeleportViewHideRuntime));
    return local_12.GetComp();
}
UFUNCTION()
FC_TeleportViewHideRuntime GetTeleportViewHideRuntime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_TeleportViewHideRuntime __r;
    bValid = false;
    bValid = ECSFunc_FC_TeleportViewHideRuntime::GetTeleportViewHideRuntime(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_TeleportViewHideRuntime GetDefaultedTeleportViewHideRuntime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TeleportViewHideRuntime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TeleportViewHideRuntime);
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
FC_TeleportViewHideRuntime GetDefaultedTeleportViewHideRuntime_BP(const FECSEntity &inout Entity)
{
    FC_TeleportViewHideRuntime __r;
    return __r;
}
UFUNCTION()
bool RemoveTeleportViewHideRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TeleportViewHideRuntime);
}
}
FECSMonitorRuntimeView __GetMonitorTeleportViewHideRuntimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TeleportViewHideRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleportViewHideRuntimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TeleportViewHideRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleportViewHideRuntimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TeleportViewHideRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleportViewHideRuntimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TeleportViewHideRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleportViewHideRuntimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TeleportViewHideRuntime, bFixedFrame, bMustHandleAll);
}
void __MonitorTeleportViewHideRuntimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TeleportViewHideRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeleportViewHideRuntimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TeleportViewHideRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeleportViewHideRuntimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TeleportViewHideRuntime, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_TeleportLandOnLoadingClose
{
UFUNCTION()
bool HasTeleportLandOnLoadingClose(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TeleportLandOnLoadingClose);
}
FC_TeleportLandOnLoadingClose& AssignTeleportLandOnLoadingClose(const FECSEntity &inout Entity, const FC_TeleportLandOnLoadingClose &inout DefaultValue = FC_TeleportLandOnLoadingClose())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TeleportLandOnLoadingClose, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTeleportLandOnLoadingClose_BP(const FECSEntity &inout Entity, const FC_TeleportLandOnLoadingClose &inout DefaultValue = FC_TeleportLandOnLoadingClose())
{
    ECSFunc_FC_TeleportLandOnLoadingClose::AssignTeleportLandOnLoadingClose(Entity, DefaultValue);
    return;
}
FC_TeleportLandOnLoadingClose& ModifyTeleportLandOnLoadingClose(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TeleportLandOnLoadingClose));
    return local_12.GetComp();
}
FC_TeleportLandOnLoadingClose& ModifyOrAddTeleportLandOnLoadingClose(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TeleportLandOnLoadingClose));
    return local_12.GetComp();
}
const FC_TeleportLandOnLoadingClose& GetTeleportLandOnLoadingClose(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TeleportLandOnLoadingClose));
    return local_12.GetComp();
}
UFUNCTION()
FC_TeleportLandOnLoadingClose GetTeleportLandOnLoadingClose_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_TeleportLandOnLoadingClose& local_4 = ECSFunc_FC_TeleportLandOnLoadingClose::GetTeleportLandOnLoadingClose(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_TeleportLandOnLoadingClose();
}
const FC_TeleportLandOnLoadingClose GetDefaultedTeleportLandOnLoadingClose(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TeleportLandOnLoadingClose __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TeleportLandOnLoadingClose);
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
FC_TeleportLandOnLoadingClose GetDefaultedTeleportLandOnLoadingClose_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_TeleportLandOnLoadingClose::GetDefaultedTeleportLandOnLoadingClose(Entity);
}
UFUNCTION()
bool RemoveTeleportLandOnLoadingClose(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TeleportLandOnLoadingClose);
}
}
FECSMonitorRuntimeView __GetMonitorTeleportLandOnLoadingCloseOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TeleportLandOnLoadingClose, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleportLandOnLoadingCloseOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TeleportLandOnLoadingClose, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleportLandOnLoadingCloseOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TeleportLandOnLoadingClose, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleportLandOnLoadingCloseOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TeleportLandOnLoadingClose, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeleportLandOnLoadingCloseOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TeleportLandOnLoadingClose, bFixedFrame, bMustHandleAll);
}
void __MonitorTeleportLandOnLoadingCloseLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TeleportLandOnLoadingClose, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeleportLandOnLoadingCloseActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TeleportLandOnLoadingClose, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeleportLandOnLoadingCloseModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TeleportLandOnLoadingClose, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_TeleportViewHideState &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_TeleportViewHideState &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_TeleportViewHideState &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_TeleportViewHideState
{
int __IndexOf_TransactionSerial()
{
    return 0;
}
int __IndexOf_bReleaseRequested()
{
    return 1;
}
int __IndexOf_ReleaseRequestTime()
{
    return 2;
}
int __IndexOf_ForceReleaseTime()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_TeleportLandOnLoadingClose &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_TeleportLandOnLoadingClose &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_TeleportLandOnLoadingClose &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_TeleportLandOnLoadingClose
{
int __IndexOf_DeadlineTime()
{
    return 0;
}
}
