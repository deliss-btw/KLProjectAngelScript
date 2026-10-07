
namespace FAnimSnapshotKeys
{
    const FName Look = n"Look";
}
namespace __INTENRAL_FC_AnimResolved_NS
{
    const TECSComponentDerivedPtr<FC_AnimResolved> DerivedPtr = TECSComponentDerivedPtr<FC_AnimResolved>();
    const FC_AnimResolved DefaultValue = FC_AnimResolved();
}
namespace __INTENRAL_FC_LookResolvedTarget_NS
{
    const TECSComponentDerivedPtr<FC_LookResolvedTarget> DerivedPtr = TECSComponentDerivedPtr<FC_LookResolvedTarget>();
    const FC_LookResolvedTarget DefaultValue = FC_LookResolvedTarget();
}
namespace __INTENRAL_FC_LookResolved_NS
{
    const TECSComponentDerivedPtr<FC_LookResolved> DerivedPtr = TECSComponentDerivedPtr<FC_LookResolved>();
    const FC_LookResolved DefaultValue = FC_LookResolved();
}
namespace __INTENRAL_FC_AnimResolvedSynced_NS
{
    const TECSComponentDerivedPtr<FC_AnimResolvedSynced> DerivedPtr = TECSComponentDerivedPtr<FC_AnimResolvedSynced>();
    const FC_AnimResolvedSynced DefaultValue = FC_AnimResolvedSynced();
}
namespace __INTENRAL_FC_AnimResolvedState_NS
{
    const TECSComponentDerivedPtr<FC_AnimResolvedState> DerivedPtr = TECSComponentDerivedPtr<FC_AnimResolvedState>();
    const FC_AnimResolvedState DefaultValue = FC_AnimResolvedState();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_AnimResolvedSyncedRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_AnimResolved : FECSComponent
{
    UPROPERTY()
    TMap<FName, FAnimSnapshot> SnapshotMap;

    FC_AnimResolved()
    {
        return;
    }
}

struct FC_LookResolvedTarget : FECSComponent
{
    UPROPERTY()
    bool bHasTarget = false;
    UPROPERTY()
    FLookSnapshot Snapshot;
    UPROPERTY()
    bool bInTransition = false;


}

struct FC_LookResolved : FECSComponent
{
    UPROPERTY()
    bool bHasTarget = false;
    UPROPERTY()
    FLookSnapshot Snapshot;


}

struct FC_AnimResolvedSynced : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<FName, FAnimSnapshot> m_SnapshotMap;

    FC_AnimResolvedSynced()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_AnimResolvedSynced(const FC_AnimResolvedSynced &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_SnapshotMap = Other.m_SnapshotMap;
        return;
    }
    FC_AnimResolvedSynced opAssign(const FC_AnimResolvedSynced &inout Other)
    {
        FC_AnimResolvedSynced __r;
        this.SetSnapshotMap(Other.GetSnapshotMap());
        return __r;
    }
    const TMap<FName, FAnimSnapshot> GetSnapshotMap() const property
    {
        const TMap<FName, FAnimSnapshot> __r;
        return __r;
    }
    TMap<FName, FAnimSnapshot> GetModify_SnapshotMap() property
    {
        TMap<FName, FAnimSnapshot> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetSnapshotMap(const TMap<FName, FAnimSnapshot> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_SnapshotMap = __Value;
        return;
    }
}

struct FAnimResolvedChannelState
{
    UPROPERTY()
    FName ChannelKey;
    UPROPERTY()
    TSet<EAnimLookSource> AllowSources;
    UPROPERTY()
    float32 TransitionSpeed = 5.0f;
    UPROPERTY()
    EAnimLookSource PrevWinnerSource = EAnimLookSource(0);
    UPROPERTY()
    FAnimSnapshot SmoothedSnapshot;
    UPROPERTY()
    bool bInTransition = false;
    UPROPERTY()
    bool bHasTarget = false;


}

struct FC_AnimResolvedState : FECSComponent
{
    UPROPERTY()
    TArray<FAnimResolvedChannelState> Channels;
    UPROPERTY()
    bool bRegistered = false;


}

namespace FC_AnimResolvedSynced
{
FC_AnimResolvedSynced Interpolate(const FC_AnimResolvedSynced &inout A, const FC_AnimResolvedSynced &inout B, const float32 T, const float32 DeltaTime)
{
    FC_AnimResolvedSynced local_24;
    if (T < 0.5f)
    {
        local_24 = A;
    }
    else
    {
        local_24 = B;
    }
    return local_24;
}
}
namespace ECSFunc_FC_AnimResolved
{
UFUNCTION()
bool HasAnimResolved(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimResolved);
}
FC_AnimResolved& AssignAnimResolved(const FECSEntity &inout Entity, const FC_AnimResolved &inout DefaultValue = FC_AnimResolved())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimResolved, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimResolved_BP(const FECSEntity &inout Entity, const FC_AnimResolved &inout DefaultValue = FC_AnimResolved())
{
    ECSFunc_FC_AnimResolved::AssignAnimResolved(Entity, DefaultValue);
    return;
}
FC_AnimResolved& ModifyAnimResolved(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimResolved));
    return local_12.GetComp();
}
FC_AnimResolved& ModifyOrAddAnimResolved(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimResolved));
    return local_12.GetComp();
}
const FC_AnimResolved& GetAnimResolved(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimResolved));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimResolved GetAnimResolved_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AnimResolved __r;
    bValid = false;
    bValid = ECSFunc_FC_AnimResolved::GetAnimResolved(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AnimResolved GetDefaultedAnimResolved(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimResolved __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimResolved);
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
FC_AnimResolved GetDefaultedAnimResolved_BP(const FECSEntity &inout Entity)
{
    FC_AnimResolved __r;
    return __r;
}
UFUNCTION()
bool RemoveAnimResolved(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimResolved);
}
}
FECSMonitorRuntimeView __GetMonitorAnimResolvedOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimResolved, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimResolvedOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimResolved, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimResolvedOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimResolved, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimResolvedOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimResolved, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimResolvedOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimResolved, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimResolvedLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimResolved, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimResolvedActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimResolved, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimResolvedModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimResolved, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LookResolvedTarget
{
UFUNCTION()
bool HasLookResolvedTarget(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LookResolvedTarget);
}
FC_LookResolvedTarget& AssignLookResolvedTarget(const FECSEntity &inout Entity, const FC_LookResolvedTarget &inout DefaultValue = FC_LookResolvedTarget())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LookResolvedTarget, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLookResolvedTarget_BP(const FECSEntity &inout Entity, const FC_LookResolvedTarget &inout DefaultValue = FC_LookResolvedTarget())
{
    ECSFunc_FC_LookResolvedTarget::AssignLookResolvedTarget(Entity, DefaultValue);
    return;
}
FC_LookResolvedTarget& ModifyLookResolvedTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LookResolvedTarget));
    return local_12.GetComp();
}
FC_LookResolvedTarget& ModifyOrAddLookResolvedTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LookResolvedTarget));
    return local_12.GetComp();
}
const FC_LookResolvedTarget& GetLookResolvedTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LookResolvedTarget));
    return local_12.GetComp();
}
UFUNCTION()
FC_LookResolvedTarget GetLookResolvedTarget_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_LookResolvedTarget __r;
    bValid = false;
    bValid = ECSFunc_FC_LookResolvedTarget::GetLookResolvedTarget(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_LookResolvedTarget GetDefaultedLookResolvedTarget(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LookResolvedTarget __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LookResolvedTarget);
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
FC_LookResolvedTarget GetDefaultedLookResolvedTarget_BP(const FECSEntity &inout Entity)
{
    FC_LookResolvedTarget __r;
    return __r;
}
UFUNCTION()
bool RemoveLookResolvedTarget(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LookResolvedTarget);
}
}
FECSMonitorRuntimeView __GetMonitorLookResolvedTargetOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LookResolvedTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLookResolvedTargetOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LookResolvedTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLookResolvedTargetOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LookResolvedTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLookResolvedTargetOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LookResolvedTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLookResolvedTargetOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LookResolvedTarget, bFixedFrame, bMustHandleAll);
}
void __MonitorLookResolvedTargetLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LookResolvedTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLookResolvedTargetActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LookResolvedTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLookResolvedTargetModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LookResolvedTarget, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LookResolved
{
UFUNCTION()
bool HasLookResolved(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LookResolved);
}
FC_LookResolved& AssignLookResolved(const FECSEntity &inout Entity, const FC_LookResolved &inout DefaultValue = FC_LookResolved())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LookResolved, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLookResolved_BP(const FECSEntity &inout Entity, const FC_LookResolved &inout DefaultValue = FC_LookResolved())
{
    ECSFunc_FC_LookResolved::AssignLookResolved(Entity, DefaultValue);
    return;
}
FC_LookResolved& ModifyLookResolved(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LookResolved));
    return local_12.GetComp();
}
FC_LookResolved& ModifyOrAddLookResolved(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LookResolved));
    return local_12.GetComp();
}
const FC_LookResolved& GetLookResolved(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LookResolved));
    return local_12.GetComp();
}
UFUNCTION()
FC_LookResolved GetLookResolved_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_LookResolved __r;
    bValid = false;
    bValid = ECSFunc_FC_LookResolved::GetLookResolved(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_LookResolved GetDefaultedLookResolved(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LookResolved __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LookResolved);
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
FC_LookResolved GetDefaultedLookResolved_BP(const FECSEntity &inout Entity)
{
    FC_LookResolved __r;
    return __r;
}
UFUNCTION()
bool RemoveLookResolved(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LookResolved);
}
}
FECSMonitorRuntimeView __GetMonitorLookResolvedOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LookResolved, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLookResolvedOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LookResolved, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLookResolvedOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LookResolved, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLookResolvedOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LookResolved, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLookResolvedOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LookResolved, bFixedFrame, bMustHandleAll);
}
void __MonitorLookResolvedLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LookResolved, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLookResolvedActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LookResolved, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLookResolvedModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LookResolved, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AnimResolvedSynced
{
UFUNCTION()
bool HasAnimResolvedSynced(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimResolvedSynced);
}
FC_AnimResolvedSynced& AssignAnimResolvedSynced(const FECSEntity &inout Entity, const FC_AnimResolvedSynced &inout DefaultValue = FC_AnimResolvedSynced())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimResolvedSynced, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimResolvedSynced_BP(const FECSEntity &inout Entity, const FC_AnimResolvedSynced &inout DefaultValue = FC_AnimResolvedSynced())
{
    ECSFunc_FC_AnimResolvedSynced::AssignAnimResolvedSynced(Entity, DefaultValue);
    return;
}
FC_AnimResolvedSynced& ModifyAnimResolvedSynced(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimResolvedSynced));
    return local_12.GetComp();
}
FC_AnimResolvedSynced& ModifyOrAddAnimResolvedSynced(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimResolvedSynced));
    return local_12.GetComp();
}
const FC_AnimResolvedSynced& GetAnimResolvedSynced(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimResolvedSynced));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimResolvedSynced GetAnimResolvedSynced_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AnimResolvedSynced& local_4 = ECSFunc_FC_AnimResolvedSynced::GetAnimResolvedSynced(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AnimResolvedSynced();
}
const FC_AnimResolvedSynced GetDefaultedAnimResolvedSynced(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimResolvedSynced __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimResolvedSynced);
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
FC_AnimResolvedSynced GetDefaultedAnimResolvedSynced_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AnimResolvedSynced::GetDefaultedAnimResolvedSynced(Entity);
}
UFUNCTION()
bool RemoveAnimResolvedSynced(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimResolvedSynced);
}
}
FECSMonitorRuntimeView __GetMonitorAnimResolvedSyncedOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimResolvedSynced, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimResolvedSyncedOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimResolvedSynced, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimResolvedSyncedOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimResolvedSynced, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimResolvedSyncedOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimResolvedSynced, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimResolvedSyncedOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimResolvedSynced, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimResolvedSyncedLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimResolvedSynced, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimResolvedSyncedActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimResolvedSynced, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimResolvedSyncedModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimResolvedSynced, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AnimResolvedState
{
UFUNCTION()
bool HasAnimResolvedState(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimResolvedState);
}
FC_AnimResolvedState& AssignAnimResolvedState(const FECSEntity &inout Entity, const FC_AnimResolvedState &inout DefaultValue = FC_AnimResolvedState())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimResolvedState, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimResolvedState_BP(const FECSEntity &inout Entity, const FC_AnimResolvedState &inout DefaultValue = FC_AnimResolvedState())
{
    ECSFunc_FC_AnimResolvedState::AssignAnimResolvedState(Entity, DefaultValue);
    return;
}
FC_AnimResolvedState& ModifyAnimResolvedState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimResolvedState));
    return local_12.GetComp();
}
FC_AnimResolvedState& ModifyOrAddAnimResolvedState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimResolvedState));
    return local_12.GetComp();
}
const FC_AnimResolvedState& GetAnimResolvedState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimResolvedState));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimResolvedState GetAnimResolvedState_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AnimResolvedState __r;
    bValid = false;
    bValid = ECSFunc_FC_AnimResolvedState::GetAnimResolvedState(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AnimResolvedState GetDefaultedAnimResolvedState(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimResolvedState __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimResolvedState);
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
FC_AnimResolvedState GetDefaultedAnimResolvedState_BP(const FECSEntity &inout Entity)
{
    FC_AnimResolvedState __r;
    return __r;
}
UFUNCTION()
bool RemoveAnimResolvedState(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimResolvedState);
}
}
FECSMonitorRuntimeView __GetMonitorAnimResolvedStateOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimResolvedState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimResolvedStateOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimResolvedState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimResolvedStateOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimResolvedState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimResolvedStateOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimResolvedState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimResolvedStateOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimResolvedState, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimResolvedStateLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimResolvedState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimResolvedStateActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimResolvedState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimResolvedStateModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimResolvedState, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AnimResolvedSynced &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AnimResolvedSynced &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AnimResolvedSynced &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AnimResolvedSynced
{
int __IndexOf_SnapshotMap()
{
    return 0;
}
}
