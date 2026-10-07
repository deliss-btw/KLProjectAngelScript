
namespace __INTENRAL_FC_AnimParamRigidBodyPhysicsControlHistory_NS
{
    const TECSComponentDerivedPtr<FC_AnimParamRigidBodyPhysicsControlHistory> DerivedPtr = TECSComponentDerivedPtr<FC_AnimParamRigidBodyPhysicsControlHistory>();
    const FC_AnimParamRigidBodyPhysicsControlHistory DefaultValue = FC_AnimParamRigidBodyPhysicsControlHistory();

}
struct FC_AnimParamRigidBodyPhysicsControlHistory : FECSComponent
{
    TInterpoHistory<FC_AnimParamRigidBodyPhysicsControl, auto> History;

    FC_AnimParamRigidBodyPhysicsControlHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_AnimParamRigidBodyPhysicsControl &inout Data, const FFPTime &inout FrameTime)
    {
        int local_2 = 0;
        FFPTime local_6 = local_2.GetLatestTime();
        if (FrameTime.opCmp(local_6) > 0 || (local_2.Num() <= 0))
        {
            local_2.EnqueueAndFlush(Data, FrameTime);
        }
        else
        {
            if ((FrameTime == local_6))
            {
                TInterpoFrame<FC_AnimParamRigidBodyPhysicsControl>& local_12 = local_2.PeekBack(0);
                local_12.SetData(Data);
                local_12.SetTime(FrameTime);
            }
        }
        return;
    }
    void Clear()
    {
        return;
    }
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_AnimParamRigidBodyPhysicsControl &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_AnimParamRigidBodyPhysicsControlHistory
{
UFUNCTION()
bool HasAnimParamRigidBodyPhysicsControlHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRigidBodyPhysicsControlHistory);
}
FC_AnimParamRigidBodyPhysicsControlHistory& AssignAnimParamRigidBodyPhysicsControlHistory(const FECSEntity &inout Entity, const FC_AnimParamRigidBodyPhysicsControlHistory &inout DefaultValue = FC_AnimParamRigidBodyPhysicsControlHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRigidBodyPhysicsControlHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimParamRigidBodyPhysicsControlHistory_BP(const FECSEntity &inout Entity, const FC_AnimParamRigidBodyPhysicsControlHistory &inout DefaultValue = FC_AnimParamRigidBodyPhysicsControlHistory())
{
    ECSFunc_FC_AnimParamRigidBodyPhysicsControlHistory::AssignAnimParamRigidBodyPhysicsControlHistory(Entity, DefaultValue);
    return;
}
FC_AnimParamRigidBodyPhysicsControlHistory& ModifyAnimParamRigidBodyPhysicsControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRigidBodyPhysicsControlHistory));
    return local_12.GetComp();
}
FC_AnimParamRigidBodyPhysicsControlHistory& ModifyOrAddAnimParamRigidBodyPhysicsControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRigidBodyPhysicsControlHistory));
    return local_12.GetComp();
}
const FC_AnimParamRigidBodyPhysicsControlHistory& GetAnimParamRigidBodyPhysicsControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRigidBodyPhysicsControlHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimParamRigidBodyPhysicsControlHistory GetAnimParamRigidBodyPhysicsControlHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AnimParamRigidBodyPhysicsControlHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_AnimParamRigidBodyPhysicsControlHistory::GetAnimParamRigidBodyPhysicsControlHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AnimParamRigidBodyPhysicsControlHistory GetDefaultedAnimParamRigidBodyPhysicsControlHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimParamRigidBodyPhysicsControlHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRigidBodyPhysicsControlHistory);
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
FC_AnimParamRigidBodyPhysicsControlHistory GetDefaultedAnimParamRigidBodyPhysicsControlHistory_BP(const FECSEntity &inout Entity)
{
    FC_AnimParamRigidBodyPhysicsControlHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveAnimParamRigidBodyPhysicsControlHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRigidBodyPhysicsControlHistory);
}
}
FECSMonitorRuntimeView __GetMonitorAnimParamRigidBodyPhysicsControlHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimParamRigidBodyPhysicsControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamRigidBodyPhysicsControlHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimParamRigidBodyPhysicsControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamRigidBodyPhysicsControlHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimParamRigidBodyPhysicsControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamRigidBodyPhysicsControlHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimParamRigidBodyPhysicsControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamRigidBodyPhysicsControlHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimParamRigidBodyPhysicsControlHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimParamRigidBodyPhysicsControlHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimParamRigidBodyPhysicsControlHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimParamRigidBodyPhysicsControlHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimParamRigidBodyPhysicsControlHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimParamRigidBodyPhysicsControlHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimParamRigidBodyPhysicsControlHistory, bFixedFrame, Details);
    return;
}
