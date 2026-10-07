
namespace __INTENRAL_FC_RiderHandIKControlHistory_NS
{
    const TECSComponentDerivedPtr<FC_RiderHandIKControlHistory> DerivedPtr = TECSComponentDerivedPtr<FC_RiderHandIKControlHistory>();
    const FC_RiderHandIKControlHistory DefaultValue = FC_RiderHandIKControlHistory();

}
struct FC_RiderHandIKControlHistory : FECSComponent
{
    TInterpoHistory<FC_RiderHandIKControl, auto> History;

    FC_RiderHandIKControlHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_RiderHandIKControl &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_RiderHandIKControl>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_RiderHandIKControl &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_RiderHandIKControlHistory
{
UFUNCTION()
bool HasRiderHandIKControlHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_RiderHandIKControlHistory);
}
FC_RiderHandIKControlHistory& AssignRiderHandIKControlHistory(const FECSEntity &inout Entity, const FC_RiderHandIKControlHistory &inout DefaultValue = FC_RiderHandIKControlHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_RiderHandIKControlHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignRiderHandIKControlHistory_BP(const FECSEntity &inout Entity, const FC_RiderHandIKControlHistory &inout DefaultValue = FC_RiderHandIKControlHistory())
{
    ECSFunc_FC_RiderHandIKControlHistory::AssignRiderHandIKControlHistory(Entity, DefaultValue);
    return;
}
FC_RiderHandIKControlHistory& ModifyRiderHandIKControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_RiderHandIKControlHistory));
    return local_12.GetComp();
}
FC_RiderHandIKControlHistory& ModifyOrAddRiderHandIKControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_RiderHandIKControlHistory));
    return local_12.GetComp();
}
const FC_RiderHandIKControlHistory& GetRiderHandIKControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_RiderHandIKControlHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_RiderHandIKControlHistory GetRiderHandIKControlHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_RiderHandIKControlHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_RiderHandIKControlHistory::GetRiderHandIKControlHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_RiderHandIKControlHistory GetDefaultedRiderHandIKControlHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_RiderHandIKControlHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_RiderHandIKControlHistory);
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
FC_RiderHandIKControlHistory GetDefaultedRiderHandIKControlHistory_BP(const FECSEntity &inout Entity)
{
    FC_RiderHandIKControlHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveRiderHandIKControlHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_RiderHandIKControlHistory);
}
}
FECSMonitorRuntimeView __GetMonitorRiderHandIKControlHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_RiderHandIKControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRiderHandIKControlHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_RiderHandIKControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRiderHandIKControlHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_RiderHandIKControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRiderHandIKControlHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_RiderHandIKControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRiderHandIKControlHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_RiderHandIKControlHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorRiderHandIKControlHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_RiderHandIKControlHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRiderHandIKControlHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_RiderHandIKControlHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRiderHandIKControlHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_RiderHandIKControlHistory, bFixedFrame, Details);
    return;
}
