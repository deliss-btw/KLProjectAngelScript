
namespace __INTENRAL_FC_RiderOffsetParamasHistory_NS
{
    const TECSComponentDerivedPtr<FC_RiderOffsetParamasHistory> DerivedPtr = TECSComponentDerivedPtr<FC_RiderOffsetParamasHistory>();
    const FC_RiderOffsetParamasHistory DefaultValue = FC_RiderOffsetParamasHistory();

}
struct FC_RiderOffsetParamasHistory : FECSComponent
{
    TInterpoHistory<FC_RiderOffsetParamas, auto> History;

    FC_RiderOffsetParamasHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_RiderOffsetParamas &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_RiderOffsetParamas>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_RiderOffsetParamas &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_RiderOffsetParamasHistory
{
UFUNCTION()
bool HasRiderOffsetParamasHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_RiderOffsetParamasHistory);
}
FC_RiderOffsetParamasHistory& AssignRiderOffsetParamasHistory(const FECSEntity &inout Entity, const FC_RiderOffsetParamasHistory &inout DefaultValue = FC_RiderOffsetParamasHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_RiderOffsetParamasHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignRiderOffsetParamasHistory_BP(const FECSEntity &inout Entity, const FC_RiderOffsetParamasHistory &inout DefaultValue = FC_RiderOffsetParamasHistory())
{
    ECSFunc_FC_RiderOffsetParamasHistory::AssignRiderOffsetParamasHistory(Entity, DefaultValue);
    return;
}
FC_RiderOffsetParamasHistory& ModifyRiderOffsetParamasHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_RiderOffsetParamasHistory));
    return local_12.GetComp();
}
FC_RiderOffsetParamasHistory& ModifyOrAddRiderOffsetParamasHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_RiderOffsetParamasHistory));
    return local_12.GetComp();
}
const FC_RiderOffsetParamasHistory& GetRiderOffsetParamasHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_RiderOffsetParamasHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_RiderOffsetParamasHistory GetRiderOffsetParamasHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_RiderOffsetParamasHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_RiderOffsetParamasHistory::GetRiderOffsetParamasHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_RiderOffsetParamasHistory GetDefaultedRiderOffsetParamasHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_RiderOffsetParamasHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_RiderOffsetParamasHistory);
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
FC_RiderOffsetParamasHistory GetDefaultedRiderOffsetParamasHistory_BP(const FECSEntity &inout Entity)
{
    FC_RiderOffsetParamasHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveRiderOffsetParamasHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_RiderOffsetParamasHistory);
}
}
FECSMonitorRuntimeView __GetMonitorRiderOffsetParamasHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_RiderOffsetParamasHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRiderOffsetParamasHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_RiderOffsetParamasHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRiderOffsetParamasHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_RiderOffsetParamasHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRiderOffsetParamasHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_RiderOffsetParamasHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRiderOffsetParamasHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_RiderOffsetParamasHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorRiderOffsetParamasHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_RiderOffsetParamasHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRiderOffsetParamasHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_RiderOffsetParamasHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRiderOffsetParamasHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_RiderOffsetParamasHistory, bFixedFrame, Details);
    return;
}
