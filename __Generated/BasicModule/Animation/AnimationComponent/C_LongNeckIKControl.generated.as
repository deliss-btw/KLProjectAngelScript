
namespace __INTENRAL_FC_LongNeckIKControlHistory_NS
{
    const TECSComponentDerivedPtr<FC_LongNeckIKControlHistory> DerivedPtr = TECSComponentDerivedPtr<FC_LongNeckIKControlHistory>();
    const FC_LongNeckIKControlHistory DefaultValue = FC_LongNeckIKControlHistory();

}
struct FC_LongNeckIKControlHistory : FECSComponent
{
    TInterpoHistory<FC_LongNeckIKControl, auto> History;

    FC_LongNeckIKControlHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_LongNeckIKControl &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_LongNeckIKControl>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_LongNeckIKControl &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_LongNeckIKControlHistory
{
UFUNCTION()
bool HasLongNeckIKControlHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LongNeckIKControlHistory);
}
FC_LongNeckIKControlHistory& AssignLongNeckIKControlHistory(const FECSEntity &inout Entity, const FC_LongNeckIKControlHistory &inout DefaultValue = FC_LongNeckIKControlHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LongNeckIKControlHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLongNeckIKControlHistory_BP(const FECSEntity &inout Entity, const FC_LongNeckIKControlHistory &inout DefaultValue = FC_LongNeckIKControlHistory())
{
    ECSFunc_FC_LongNeckIKControlHistory::AssignLongNeckIKControlHistory(Entity, DefaultValue);
    return;
}
FC_LongNeckIKControlHistory& ModifyLongNeckIKControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LongNeckIKControlHistory));
    return local_12.GetComp();
}
FC_LongNeckIKControlHistory& ModifyOrAddLongNeckIKControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LongNeckIKControlHistory));
    return local_12.GetComp();
}
const FC_LongNeckIKControlHistory& GetLongNeckIKControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LongNeckIKControlHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_LongNeckIKControlHistory GetLongNeckIKControlHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_LongNeckIKControlHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_LongNeckIKControlHistory::GetLongNeckIKControlHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_LongNeckIKControlHistory GetDefaultedLongNeckIKControlHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LongNeckIKControlHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LongNeckIKControlHistory);
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
FC_LongNeckIKControlHistory GetDefaultedLongNeckIKControlHistory_BP(const FECSEntity &inout Entity)
{
    FC_LongNeckIKControlHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveLongNeckIKControlHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LongNeckIKControlHistory);
}
}
FECSMonitorRuntimeView __GetMonitorLongNeckIKControlHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LongNeckIKControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLongNeckIKControlHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LongNeckIKControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLongNeckIKControlHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LongNeckIKControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLongNeckIKControlHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LongNeckIKControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLongNeckIKControlHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LongNeckIKControlHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorLongNeckIKControlHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LongNeckIKControlHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLongNeckIKControlHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LongNeckIKControlHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLongNeckIKControlHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LongNeckIKControlHistory, bFixedFrame, Details);
    return;
}
