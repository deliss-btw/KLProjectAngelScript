
namespace __INTENRAL_FC_SlopeAdaptControlHistory_NS
{
    const TECSComponentDerivedPtr<FC_SlopeAdaptControlHistory> DerivedPtr = TECSComponentDerivedPtr<FC_SlopeAdaptControlHistory>();
    const FC_SlopeAdaptControlHistory DefaultValue = FC_SlopeAdaptControlHistory();

}
struct FC_SlopeAdaptControlHistory : FECSComponent
{
    TInterpoHistory<FC_SlopeAdaptControl, auto> History;

    FC_SlopeAdaptControlHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_SlopeAdaptControl &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_SlopeAdaptControl>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_SlopeAdaptControl &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_SlopeAdaptControlHistory
{
UFUNCTION()
bool HasSlopeAdaptControlHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SlopeAdaptControlHistory);
}
FC_SlopeAdaptControlHistory& AssignSlopeAdaptControlHistory(const FECSEntity &inout Entity, const FC_SlopeAdaptControlHistory &inout DefaultValue = FC_SlopeAdaptControlHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SlopeAdaptControlHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSlopeAdaptControlHistory_BP(const FECSEntity &inout Entity, const FC_SlopeAdaptControlHistory &inout DefaultValue = FC_SlopeAdaptControlHistory())
{
    ECSFunc_FC_SlopeAdaptControlHistory::AssignSlopeAdaptControlHistory(Entity, DefaultValue);
    return;
}
FC_SlopeAdaptControlHistory& ModifySlopeAdaptControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SlopeAdaptControlHistory));
    return local_12.GetComp();
}
FC_SlopeAdaptControlHistory& ModifyOrAddSlopeAdaptControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SlopeAdaptControlHistory));
    return local_12.GetComp();
}
const FC_SlopeAdaptControlHistory& GetSlopeAdaptControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SlopeAdaptControlHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_SlopeAdaptControlHistory GetSlopeAdaptControlHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_SlopeAdaptControlHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_SlopeAdaptControlHistory::GetSlopeAdaptControlHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_SlopeAdaptControlHistory GetDefaultedSlopeAdaptControlHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SlopeAdaptControlHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SlopeAdaptControlHistory);
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
FC_SlopeAdaptControlHistory GetDefaultedSlopeAdaptControlHistory_BP(const FECSEntity &inout Entity)
{
    FC_SlopeAdaptControlHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveSlopeAdaptControlHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SlopeAdaptControlHistory);
}
}
FECSMonitorRuntimeView __GetMonitorSlopeAdaptControlHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SlopeAdaptControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSlopeAdaptControlHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SlopeAdaptControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSlopeAdaptControlHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SlopeAdaptControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSlopeAdaptControlHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SlopeAdaptControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSlopeAdaptControlHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SlopeAdaptControlHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorSlopeAdaptControlHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SlopeAdaptControlHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSlopeAdaptControlHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SlopeAdaptControlHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSlopeAdaptControlHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SlopeAdaptControlHistory, bFixedFrame, Details);
    return;
}
