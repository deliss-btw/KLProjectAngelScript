
namespace __INTENRAL_FC_PelvisAngleControlHistory_NS
{
    const TECSComponentDerivedPtr<FC_PelvisAngleControlHistory> DerivedPtr = TECSComponentDerivedPtr<FC_PelvisAngleControlHistory>();
    const FC_PelvisAngleControlHistory DefaultValue = FC_PelvisAngleControlHistory();

}
struct FC_PelvisAngleControlHistory : FECSComponent
{
    TInterpoHistory<FC_PelvisAngleControl, auto> History;

    FC_PelvisAngleControlHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_PelvisAngleControl &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_PelvisAngleControl>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_PelvisAngleControl &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_PelvisAngleControlHistory
{
UFUNCTION()
bool HasPelvisAngleControlHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PelvisAngleControlHistory);
}
FC_PelvisAngleControlHistory& AssignPelvisAngleControlHistory(const FECSEntity &inout Entity, const FC_PelvisAngleControlHistory &inout DefaultValue = FC_PelvisAngleControlHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PelvisAngleControlHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPelvisAngleControlHistory_BP(const FECSEntity &inout Entity, const FC_PelvisAngleControlHistory &inout DefaultValue = FC_PelvisAngleControlHistory())
{
    ECSFunc_FC_PelvisAngleControlHistory::AssignPelvisAngleControlHistory(Entity, DefaultValue);
    return;
}
FC_PelvisAngleControlHistory& ModifyPelvisAngleControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PelvisAngleControlHistory));
    return local_12.GetComp();
}
FC_PelvisAngleControlHistory& ModifyOrAddPelvisAngleControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PelvisAngleControlHistory));
    return local_12.GetComp();
}
const FC_PelvisAngleControlHistory& GetPelvisAngleControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PelvisAngleControlHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_PelvisAngleControlHistory GetPelvisAngleControlHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PelvisAngleControlHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_PelvisAngleControlHistory::GetPelvisAngleControlHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PelvisAngleControlHistory GetDefaultedPelvisAngleControlHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PelvisAngleControlHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PelvisAngleControlHistory);
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
FC_PelvisAngleControlHistory GetDefaultedPelvisAngleControlHistory_BP(const FECSEntity &inout Entity)
{
    FC_PelvisAngleControlHistory __r;
    return __r;
}
UFUNCTION()
bool RemovePelvisAngleControlHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PelvisAngleControlHistory);
}
}
FECSMonitorRuntimeView __GetMonitorPelvisAngleControlHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PelvisAngleControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPelvisAngleControlHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PelvisAngleControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPelvisAngleControlHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PelvisAngleControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPelvisAngleControlHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PelvisAngleControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPelvisAngleControlHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PelvisAngleControlHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorPelvisAngleControlHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PelvisAngleControlHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPelvisAngleControlHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PelvisAngleControlHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPelvisAngleControlHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PelvisAngleControlHistory, bFixedFrame, Details);
    return;
}
