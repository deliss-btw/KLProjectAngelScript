
namespace __INTENRAL_FC_AimTargetControlHistory_NS
{
    const TECSComponentDerivedPtr<FC_AimTargetControlHistory> DerivedPtr = TECSComponentDerivedPtr<FC_AimTargetControlHistory>();
    const FC_AimTargetControlHistory DefaultValue = FC_AimTargetControlHistory();

}
struct FC_AimTargetControlHistory : FECSComponent
{
    TInterpoHistory<FC_AimTargetControl, auto> History;

    FC_AimTargetControlHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_AimTargetControl &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_AimTargetControl>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_AimTargetControl &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_AimTargetControlHistory
{
UFUNCTION()
bool HasAimTargetControlHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AimTargetControlHistory);
}
FC_AimTargetControlHistory& AssignAimTargetControlHistory(const FECSEntity &inout Entity, const FC_AimTargetControlHistory &inout DefaultValue = FC_AimTargetControlHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AimTargetControlHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAimTargetControlHistory_BP(const FECSEntity &inout Entity, const FC_AimTargetControlHistory &inout DefaultValue = FC_AimTargetControlHistory())
{
    ECSFunc_FC_AimTargetControlHistory::AssignAimTargetControlHistory(Entity, DefaultValue);
    return;
}
FC_AimTargetControlHistory& ModifyAimTargetControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AimTargetControlHistory));
    return local_12.GetComp();
}
FC_AimTargetControlHistory& ModifyOrAddAimTargetControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AimTargetControlHistory));
    return local_12.GetComp();
}
const FC_AimTargetControlHistory& GetAimTargetControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AimTargetControlHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_AimTargetControlHistory GetAimTargetControlHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AimTargetControlHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_AimTargetControlHistory::GetAimTargetControlHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AimTargetControlHistory GetDefaultedAimTargetControlHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AimTargetControlHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AimTargetControlHistory);
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
FC_AimTargetControlHistory GetDefaultedAimTargetControlHistory_BP(const FECSEntity &inout Entity)
{
    FC_AimTargetControlHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveAimTargetControlHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AimTargetControlHistory);
}
}
FECSMonitorRuntimeView __GetMonitorAimTargetControlHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AimTargetControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAimTargetControlHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AimTargetControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAimTargetControlHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AimTargetControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAimTargetControlHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AimTargetControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAimTargetControlHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AimTargetControlHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorAimTargetControlHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AimTargetControlHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAimTargetControlHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AimTargetControlHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAimTargetControlHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AimTargetControlHistory, bFixedFrame, Details);
    return;
}
