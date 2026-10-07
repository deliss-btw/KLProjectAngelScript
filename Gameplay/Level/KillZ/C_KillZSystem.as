
namespace __INTENRAL_FC_LastValidGround_NS
{
    const TECSComponentDerivedPtr<FC_LastValidGround> DerivedPtr = TECSComponentDerivedPtr<FC_LastValidGround>();
    const FC_LastValidGround DefaultValue = FC_LastValidGround();
}
namespace __INTENRAL_FC_LastValidNavGround_NS
{
    const TECSComponentDerivedPtr<FC_LastValidNavGround> DerivedPtr = TECSComponentDerivedPtr<FC_LastValidNavGround>();
    const FC_LastValidNavGround DefaultValue = FC_LastValidNavGround();
}
namespace __INTENRAL_FCE_TeleportToLastValidGround_NS
{
    const TECSEventDerivedPtr<FCE_TeleportToLastValidGround> DerivedPtr = TECSEventDerivedPtr<FCE_TeleportToLastValidGround>();
}
namespace __INTENRAL_FCE_EnterKillZone_NS
{
    const TECSEventDerivedPtr<FCE_EnterKillZone> DerivedPtr = TECSEventDerivedPtr<FCE_EnterKillZone>();
}
namespace __INTENRAL_FCE_TriggerDeathByKillZone_NS
{
    const TECSEventDerivedPtr<FCE_TriggerDeathByKillZone> DerivedPtr = TECSEventDerivedPtr<FCE_TriggerDeathByKillZone>();

}
struct FC_LastValidGround : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FVector m_LastGroundPosition;

    FC_LastValidGround()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_LastValidGround(const FC_LastValidGround &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_LastGroundPosition = Other.m_LastGroundPosition;
        return;
    }
    FC_LastValidGround opAssign(const FC_LastValidGround &inout Other)
    {
        FC_LastValidGround __r;
        this.SetLastGroundPosition(Other.GetLastGroundPosition());
        return __r;
    }
    const FVector GetLastGroundPosition() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_LastGroundPosition() property
    {
        FVector __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetLastGroundPosition(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_LastGroundPosition = __Value;
        return;
    }
}

struct FC_LastValidNavGround : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FVector m_LastNavGroundPosition;

    FC_LastValidNavGround()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_LastValidNavGround(const FC_LastValidNavGround &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_LastNavGroundPosition = Other.m_LastNavGroundPosition;
        return;
    }
    FC_LastValidNavGround opAssign(const FC_LastValidNavGround &inout Other)
    {
        FC_LastValidNavGround __r;
        this.SetLastNavGroundPosition(Other.GetLastNavGroundPosition());
        return __r;
    }
    const FVector GetLastNavGroundPosition() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_LastNavGroundPosition() property
    {
        FVector __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetLastNavGroundPosition(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_LastNavGroundPosition = __Value;
        return;
    }
}

struct FCE_TeleportToLastValidGround : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FVector Location;
    UPROPERTY()
    FRotator Rotation;

    FCE_TeleportToLastValidGround()
    {
        return;
    }
}

struct FCE_EnterKillZone : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    float32 TriggerDeathDelay = 0.0f;
    UPROPERTY()
    bool bTeleportPlayerToSafePoint = false;


}

struct FCE_TriggerDeathByKillZone : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    bool bTeleportPlayerToSafePoint = false;


}

namespace ECSFunc_FC_LastValidGround
{
UFUNCTION()
bool HasLastValidGround(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LastValidGround);
}
FC_LastValidGround& AssignLastValidGround(const FECSEntity &inout Entity, const FC_LastValidGround &inout DefaultValue = FC_LastValidGround())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LastValidGround, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLastValidGround_BP(const FECSEntity &inout Entity, const FC_LastValidGround &inout DefaultValue = FC_LastValidGround())
{
    ECSFunc_FC_LastValidGround::AssignLastValidGround(Entity, DefaultValue);
    return;
}
FC_LastValidGround& ModifyLastValidGround(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LastValidGround));
    return local_12.GetComp();
}
FC_LastValidGround& ModifyOrAddLastValidGround(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LastValidGround));
    return local_12.GetComp();
}
const FC_LastValidGround& GetLastValidGround(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LastValidGround));
    return local_12.GetComp();
}
UFUNCTION()
FC_LastValidGround GetLastValidGround_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LastValidGround& local_4 = ECSFunc_FC_LastValidGround::GetLastValidGround(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LastValidGround();
}
const FC_LastValidGround GetDefaultedLastValidGround(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LastValidGround __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LastValidGround);
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
FC_LastValidGround GetDefaultedLastValidGround_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LastValidGround::GetDefaultedLastValidGround(Entity);
}
UFUNCTION()
bool RemoveLastValidGround(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LastValidGround);
}
}
FECSMonitorRuntimeView __GetMonitorLastValidGroundOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LastValidGround, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLastValidGroundOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LastValidGround, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLastValidGroundOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LastValidGround, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLastValidGroundOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LastValidGround, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLastValidGroundOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LastValidGround, bFixedFrame, bMustHandleAll);
}
void __MonitorLastValidGroundLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LastValidGround, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLastValidGroundActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LastValidGround, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLastValidGroundModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LastValidGround, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LastValidNavGround
{
UFUNCTION()
bool HasLastValidNavGround(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LastValidNavGround);
}
FC_LastValidNavGround& AssignLastValidNavGround(const FECSEntity &inout Entity, const FC_LastValidNavGround &inout DefaultValue = FC_LastValidNavGround())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LastValidNavGround, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLastValidNavGround_BP(const FECSEntity &inout Entity, const FC_LastValidNavGround &inout DefaultValue = FC_LastValidNavGround())
{
    ECSFunc_FC_LastValidNavGround::AssignLastValidNavGround(Entity, DefaultValue);
    return;
}
FC_LastValidNavGround& ModifyLastValidNavGround(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LastValidNavGround));
    return local_12.GetComp();
}
FC_LastValidNavGround& ModifyOrAddLastValidNavGround(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LastValidNavGround));
    return local_12.GetComp();
}
const FC_LastValidNavGround& GetLastValidNavGround(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LastValidNavGround));
    return local_12.GetComp();
}
UFUNCTION()
FC_LastValidNavGround GetLastValidNavGround_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LastValidNavGround& local_4 = ECSFunc_FC_LastValidNavGround::GetLastValidNavGround(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LastValidNavGround();
}
const FC_LastValidNavGround GetDefaultedLastValidNavGround(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LastValidNavGround __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LastValidNavGround);
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
FC_LastValidNavGround GetDefaultedLastValidNavGround_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LastValidNavGround::GetDefaultedLastValidNavGround(Entity);
}
UFUNCTION()
bool RemoveLastValidNavGround(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LastValidNavGround);
}
}
FECSMonitorRuntimeView __GetMonitorLastValidNavGroundOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LastValidNavGround, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLastValidNavGroundOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LastValidNavGround, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLastValidNavGroundOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LastValidNavGround, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLastValidNavGroundOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LastValidNavGround, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLastValidNavGroundOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LastValidNavGround, bFixedFrame, bMustHandleAll);
}
void __MonitorLastValidNavGroundLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LastValidNavGround, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLastValidNavGroundActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LastValidNavGround, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLastValidNavGroundModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LastValidNavGround, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_LastValidGround &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_LastValidGround &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_LastValidGround &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_LastValidGround
{
int __IndexOf_LastGroundPosition()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_LastValidNavGround &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_LastValidNavGround &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_LastValidNavGround &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_LastValidNavGround
{
int __IndexOf_LastNavGroundPosition()
{
    return 0;
}
}
