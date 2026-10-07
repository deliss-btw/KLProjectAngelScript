
namespace __INTENRAL_FC_TuneESMBBFloatValueHistory_NS
{
    const TECSComponentDerivedPtr<FC_TuneESMBBFloatValueHistory> DerivedPtr = TECSComponentDerivedPtr<FC_TuneESMBBFloatValueHistory>();
    const FC_TuneESMBBFloatValueHistory DefaultValue = FC_TuneESMBBFloatValueHistory();

}
struct FC_TuneESMBBFloatValueHistory : FECSComponent
{
    TInterpoHistory<FC_TuneESMBBFloatValue, auto> History;

    FC_TuneESMBBFloatValueHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_TuneESMBBFloatValue &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_TuneESMBBFloatValue>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_TuneESMBBFloatValue &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_TuneESMBBFloatValueHistory
{
UFUNCTION()
bool HasTuneESMBBFloatValueHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TuneESMBBFloatValueHistory);
}
FC_TuneESMBBFloatValueHistory& AssignTuneESMBBFloatValueHistory(const FECSEntity &inout Entity, const FC_TuneESMBBFloatValueHistory &inout DefaultValue = FC_TuneESMBBFloatValueHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TuneESMBBFloatValueHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTuneESMBBFloatValueHistory_BP(const FECSEntity &inout Entity, const FC_TuneESMBBFloatValueHistory &inout DefaultValue = FC_TuneESMBBFloatValueHistory())
{
    ECSFunc_FC_TuneESMBBFloatValueHistory::AssignTuneESMBBFloatValueHistory(Entity, DefaultValue);
    return;
}
FC_TuneESMBBFloatValueHistory& ModifyTuneESMBBFloatValueHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TuneESMBBFloatValueHistory));
    return local_12.GetComp();
}
FC_TuneESMBBFloatValueHistory& ModifyOrAddTuneESMBBFloatValueHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TuneESMBBFloatValueHistory));
    return local_12.GetComp();
}
const FC_TuneESMBBFloatValueHistory& GetTuneESMBBFloatValueHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TuneESMBBFloatValueHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_TuneESMBBFloatValueHistory GetTuneESMBBFloatValueHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_TuneESMBBFloatValueHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_TuneESMBBFloatValueHistory::GetTuneESMBBFloatValueHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_TuneESMBBFloatValueHistory GetDefaultedTuneESMBBFloatValueHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TuneESMBBFloatValueHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TuneESMBBFloatValueHistory);
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
FC_TuneESMBBFloatValueHistory GetDefaultedTuneESMBBFloatValueHistory_BP(const FECSEntity &inout Entity)
{
    FC_TuneESMBBFloatValueHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveTuneESMBBFloatValueHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TuneESMBBFloatValueHistory);
}
}
FECSMonitorRuntimeView __GetMonitorTuneESMBBFloatValueHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TuneESMBBFloatValueHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTuneESMBBFloatValueHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TuneESMBBFloatValueHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTuneESMBBFloatValueHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TuneESMBBFloatValueHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTuneESMBBFloatValueHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TuneESMBBFloatValueHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTuneESMBBFloatValueHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TuneESMBBFloatValueHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorTuneESMBBFloatValueHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TuneESMBBFloatValueHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTuneESMBBFloatValueHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TuneESMBBFloatValueHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTuneESMBBFloatValueHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TuneESMBBFloatValueHistory, bFixedFrame, Details);
    return;
}
