
namespace __INTENRAL_FC_EstimatedSpeedHistory_NS
{
    const TECSComponentDerivedPtr<FC_EstimatedSpeedHistory> DerivedPtr = TECSComponentDerivedPtr<FC_EstimatedSpeedHistory>();
    const FC_EstimatedSpeedHistory DefaultValue = FC_EstimatedSpeedHistory();

}
struct FC_EstimatedSpeedHistory : FECSComponent
{
    TInterpoHistory<FC_EstimatedSpeed, auto> History;

    FC_EstimatedSpeedHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_EstimatedSpeed &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_EstimatedSpeed>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_EstimatedSpeed &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_EstimatedSpeedHistory
{
UFUNCTION()
bool HasEstimatedSpeedHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EstimatedSpeedHistory);
}
FC_EstimatedSpeedHistory& AssignEstimatedSpeedHistory(const FECSEntity &inout Entity, const FC_EstimatedSpeedHistory &inout DefaultValue = FC_EstimatedSpeedHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EstimatedSpeedHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEstimatedSpeedHistory_BP(const FECSEntity &inout Entity, const FC_EstimatedSpeedHistory &inout DefaultValue = FC_EstimatedSpeedHistory())
{
    ECSFunc_FC_EstimatedSpeedHistory::AssignEstimatedSpeedHistory(Entity, DefaultValue);
    return;
}
FC_EstimatedSpeedHistory& ModifyEstimatedSpeedHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EstimatedSpeedHistory));
    return local_12.GetComp();
}
FC_EstimatedSpeedHistory& ModifyOrAddEstimatedSpeedHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EstimatedSpeedHistory));
    return local_12.GetComp();
}
const FC_EstimatedSpeedHistory& GetEstimatedSpeedHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EstimatedSpeedHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_EstimatedSpeedHistory GetEstimatedSpeedHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EstimatedSpeedHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_EstimatedSpeedHistory::GetEstimatedSpeedHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EstimatedSpeedHistory GetDefaultedEstimatedSpeedHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EstimatedSpeedHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EstimatedSpeedHistory);
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
FC_EstimatedSpeedHistory GetDefaultedEstimatedSpeedHistory_BP(const FECSEntity &inout Entity)
{
    FC_EstimatedSpeedHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveEstimatedSpeedHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EstimatedSpeedHistory);
}
}
FECSMonitorRuntimeView __GetMonitorEstimatedSpeedHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EstimatedSpeedHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEstimatedSpeedHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EstimatedSpeedHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEstimatedSpeedHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EstimatedSpeedHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEstimatedSpeedHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EstimatedSpeedHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEstimatedSpeedHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EstimatedSpeedHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorEstimatedSpeedHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EstimatedSpeedHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEstimatedSpeedHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EstimatedSpeedHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEstimatedSpeedHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EstimatedSpeedHistory, bFixedFrame, Details);
    return;
}
