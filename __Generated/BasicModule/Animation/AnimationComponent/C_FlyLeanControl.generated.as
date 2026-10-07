
namespace __INTENRAL_FC_FlyLeanControlHistory_NS
{
    const TECSComponentDerivedPtr<FC_FlyLeanControlHistory> DerivedPtr = TECSComponentDerivedPtr<FC_FlyLeanControlHistory>();
    const FC_FlyLeanControlHistory DefaultValue = FC_FlyLeanControlHistory();

}
struct FC_FlyLeanControlHistory : FECSComponent
{
    TInterpoHistory<FC_FlyLeanControl, auto> History;

    FC_FlyLeanControlHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_FlyLeanControl &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_FlyLeanControl>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_FlyLeanControl &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_FlyLeanControlHistory
{
UFUNCTION()
bool HasFlyLeanControlHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_FlyLeanControlHistory);
}
FC_FlyLeanControlHistory& AssignFlyLeanControlHistory(const FECSEntity &inout Entity, const FC_FlyLeanControlHistory &inout DefaultValue = FC_FlyLeanControlHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_FlyLeanControlHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignFlyLeanControlHistory_BP(const FECSEntity &inout Entity, const FC_FlyLeanControlHistory &inout DefaultValue = FC_FlyLeanControlHistory())
{
    ECSFunc_FC_FlyLeanControlHistory::AssignFlyLeanControlHistory(Entity, DefaultValue);
    return;
}
FC_FlyLeanControlHistory& ModifyFlyLeanControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_FlyLeanControlHistory));
    return local_12.GetComp();
}
FC_FlyLeanControlHistory& ModifyOrAddFlyLeanControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_FlyLeanControlHistory));
    return local_12.GetComp();
}
const FC_FlyLeanControlHistory& GetFlyLeanControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_FlyLeanControlHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_FlyLeanControlHistory GetFlyLeanControlHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_FlyLeanControlHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_FlyLeanControlHistory::GetFlyLeanControlHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_FlyLeanControlHistory GetDefaultedFlyLeanControlHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_FlyLeanControlHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_FlyLeanControlHistory);
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
FC_FlyLeanControlHistory GetDefaultedFlyLeanControlHistory_BP(const FECSEntity &inout Entity)
{
    FC_FlyLeanControlHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveFlyLeanControlHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_FlyLeanControlHistory);
}
}
FECSMonitorRuntimeView __GetMonitorFlyLeanControlHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_FlyLeanControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFlyLeanControlHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_FlyLeanControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFlyLeanControlHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_FlyLeanControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFlyLeanControlHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_FlyLeanControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFlyLeanControlHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_FlyLeanControlHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorFlyLeanControlHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_FlyLeanControlHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFlyLeanControlHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_FlyLeanControlHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFlyLeanControlHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_FlyLeanControlHistory, bFixedFrame, Details);
    return;
}
