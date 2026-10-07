
namespace __INTENRAL_FC_AnimFocusTargetHistory_NS
{
    const TECSComponentDerivedPtr<FC_AnimFocusTargetHistory> DerivedPtr = TECSComponentDerivedPtr<FC_AnimFocusTargetHistory>();
    const FC_AnimFocusTargetHistory DefaultValue = FC_AnimFocusTargetHistory();

}
struct FC_AnimFocusTargetHistory : FECSComponent
{
    TInterpoHistory<FC_AnimFocusTarget, auto> History;

    FC_AnimFocusTargetHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_AnimFocusTarget &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_AnimFocusTarget>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_AnimFocusTarget &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_AnimFocusTargetHistory
{
UFUNCTION()
bool HasAnimFocusTargetHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimFocusTargetHistory);
}
FC_AnimFocusTargetHistory& AssignAnimFocusTargetHistory(const FECSEntity &inout Entity, const FC_AnimFocusTargetHistory &inout DefaultValue = FC_AnimFocusTargetHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimFocusTargetHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimFocusTargetHistory_BP(const FECSEntity &inout Entity, const FC_AnimFocusTargetHistory &inout DefaultValue = FC_AnimFocusTargetHistory())
{
    ECSFunc_FC_AnimFocusTargetHistory::AssignAnimFocusTargetHistory(Entity, DefaultValue);
    return;
}
FC_AnimFocusTargetHistory& ModifyAnimFocusTargetHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimFocusTargetHistory));
    return local_12.GetComp();
}
FC_AnimFocusTargetHistory& ModifyOrAddAnimFocusTargetHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimFocusTargetHistory));
    return local_12.GetComp();
}
const FC_AnimFocusTargetHistory& GetAnimFocusTargetHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimFocusTargetHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimFocusTargetHistory GetAnimFocusTargetHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AnimFocusTargetHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_AnimFocusTargetHistory::GetAnimFocusTargetHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AnimFocusTargetHistory GetDefaultedAnimFocusTargetHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimFocusTargetHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimFocusTargetHistory);
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
FC_AnimFocusTargetHistory GetDefaultedAnimFocusTargetHistory_BP(const FECSEntity &inout Entity)
{
    FC_AnimFocusTargetHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveAnimFocusTargetHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimFocusTargetHistory);
}
}
FECSMonitorRuntimeView __GetMonitorAnimFocusTargetHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimFocusTargetHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimFocusTargetHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimFocusTargetHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimFocusTargetHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimFocusTargetHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimFocusTargetHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimFocusTargetHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimFocusTargetHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimFocusTargetHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimFocusTargetHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimFocusTargetHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimFocusTargetHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimFocusTargetHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimFocusTargetHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimFocusTargetHistory, bFixedFrame, Details);
    return;
}
