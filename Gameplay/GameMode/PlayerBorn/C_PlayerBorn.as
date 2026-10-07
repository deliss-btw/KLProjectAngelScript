
namespace __INTENRAL_FC_PlayerBornState_NS
{
    const TECSComponentDerivedPtr<FC_PlayerBornState> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerBornState>();
    const FC_PlayerBornState DefaultValue = FC_PlayerBornState();
}
namespace __INTENRAL_FCE_DispatchSpecialtyChangeFromDS_NS
{
    const TECSEventDerivedPtr<FCE_DispatchSpecialtyChangeFromDS> DerivedPtr = TECSEventDerivedPtr<FCE_DispatchSpecialtyChangeFromDS>();

}
struct FCE_DispatchSpecialtyChangeFromDS : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint FromSpecialtyID = 0;
    UPROPERTY()
    uint ToSpecialtyID = 0;


}

struct FC_PlayerBornState : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bBorn;

    FC_PlayerBornState()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_PlayerBornState(const FC_PlayerBornState &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_PlayerBornState opAssign(const FC_PlayerBornState &inout Other)
    {
        FC_PlayerBornState __r;
        this.SetbBorn(Other.GetbBorn());
        return __r;
    }
    bool GetbBorn() const property
    {
        return this.m_bBorn;
    }
    void SetbBorn(const bool __Value) property
    {
        if (!(this.m_bBorn) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bBorn = __Value;
        return;
    }
}

namespace ECSFunc_FC_PlayerBornState
{
UFUNCTION()
bool HasPlayerBornState(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerBornState);
}
FC_PlayerBornState& AssignPlayerBornState(const FECSEntity &inout Entity, const FC_PlayerBornState &inout DefaultValue = FC_PlayerBornState())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerBornState, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerBornState_BP(const FECSEntity &inout Entity, const FC_PlayerBornState &inout DefaultValue = FC_PlayerBornState())
{
    ECSFunc_FC_PlayerBornState::AssignPlayerBornState(Entity, DefaultValue);
    return;
}
FC_PlayerBornState& ModifyPlayerBornState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerBornState));
    return local_12.GetComp();
}
FC_PlayerBornState& ModifyOrAddPlayerBornState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerBornState));
    return local_12.GetComp();
}
const FC_PlayerBornState& GetPlayerBornState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerBornState));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerBornState GetPlayerBornState_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PlayerBornState& local_4 = ECSFunc_FC_PlayerBornState::GetPlayerBornState(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PlayerBornState();
}
const FC_PlayerBornState GetDefaultedPlayerBornState(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerBornState __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerBornState);
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
FC_PlayerBornState GetDefaultedPlayerBornState_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PlayerBornState::GetDefaultedPlayerBornState(Entity);
}
UFUNCTION()
bool RemovePlayerBornState(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerBornState);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerBornStateOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerBornState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerBornStateOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerBornState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerBornStateOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerBornState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerBornStateOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerBornState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerBornStateOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerBornState, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerBornStateLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerBornState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerBornStateActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerBornState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerBornStateModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerBornState, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PlayerBornState &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PlayerBornState &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PlayerBornState &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PlayerBornState
{
int __IndexOf_bBorn()
{
    return 0;
}
}
