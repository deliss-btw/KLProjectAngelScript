
namespace __INTENRAL_FC_FootPlacementHistory_NS
{
    const TECSComponentDerivedPtr<FC_FootPlacementHistory> DerivedPtr = TECSComponentDerivedPtr<FC_FootPlacementHistory>();
    const FC_FootPlacementHistory DefaultValue = FC_FootPlacementHistory();

}
struct FC_FootPlacementHistory : FECSComponent
{
    TInterpoHistory<FC_FootPlacement, auto> History;

    FC_FootPlacementHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_FootPlacement &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_FootPlacement>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_FootPlacement &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_FootPlacementHistory
{
UFUNCTION()
bool HasFootPlacementHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_FootPlacementHistory);
}
FC_FootPlacementHistory& AssignFootPlacementHistory(const FECSEntity &inout Entity, const FC_FootPlacementHistory &inout DefaultValue = FC_FootPlacementHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_FootPlacementHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignFootPlacementHistory_BP(const FECSEntity &inout Entity, const FC_FootPlacementHistory &inout DefaultValue = FC_FootPlacementHistory())
{
    ECSFunc_FC_FootPlacementHistory::AssignFootPlacementHistory(Entity, DefaultValue);
    return;
}
FC_FootPlacementHistory& ModifyFootPlacementHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_FootPlacementHistory));
    return local_12.GetComp();
}
FC_FootPlacementHistory& ModifyOrAddFootPlacementHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_FootPlacementHistory));
    return local_12.GetComp();
}
const FC_FootPlacementHistory& GetFootPlacementHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_FootPlacementHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_FootPlacementHistory GetFootPlacementHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_FootPlacementHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_FootPlacementHistory::GetFootPlacementHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_FootPlacementHistory GetDefaultedFootPlacementHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_FootPlacementHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_FootPlacementHistory);
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
FC_FootPlacementHistory GetDefaultedFootPlacementHistory_BP(const FECSEntity &inout Entity)
{
    FC_FootPlacementHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveFootPlacementHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_FootPlacementHistory);
}
}
FECSMonitorRuntimeView __GetMonitorFootPlacementHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_FootPlacementHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFootPlacementHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_FootPlacementHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFootPlacementHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_FootPlacementHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFootPlacementHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_FootPlacementHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFootPlacementHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_FootPlacementHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorFootPlacementHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_FootPlacementHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFootPlacementHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_FootPlacementHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFootPlacementHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_FootPlacementHistory, bFixedFrame, Details);
    return;
}
