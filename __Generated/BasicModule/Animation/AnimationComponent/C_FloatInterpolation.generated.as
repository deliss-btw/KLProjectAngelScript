
namespace __INTENRAL_FC_FloatInterpolationHistory_NS
{
    const TECSComponentDerivedPtr<FC_FloatInterpolationHistory> DerivedPtr = TECSComponentDerivedPtr<FC_FloatInterpolationHistory>();
    const FC_FloatInterpolationHistory DefaultValue = FC_FloatInterpolationHistory();

}
struct FC_FloatInterpolationHistory : FECSComponent
{
    TInterpoHistory<FC_FloatInterpolation, auto> History;

    FC_FloatInterpolationHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_FloatInterpolation &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_FloatInterpolation>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_FloatInterpolation &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_FloatInterpolationHistory
{
UFUNCTION()
bool HasFloatInterpolationHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_FloatInterpolationHistory);
}
FC_FloatInterpolationHistory& AssignFloatInterpolationHistory(const FECSEntity &inout Entity, const FC_FloatInterpolationHistory &inout DefaultValue = FC_FloatInterpolationHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_FloatInterpolationHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignFloatInterpolationHistory_BP(const FECSEntity &inout Entity, const FC_FloatInterpolationHistory &inout DefaultValue = FC_FloatInterpolationHistory())
{
    ECSFunc_FC_FloatInterpolationHistory::AssignFloatInterpolationHistory(Entity, DefaultValue);
    return;
}
FC_FloatInterpolationHistory& ModifyFloatInterpolationHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_FloatInterpolationHistory));
    return local_12.GetComp();
}
FC_FloatInterpolationHistory& ModifyOrAddFloatInterpolationHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_FloatInterpolationHistory));
    return local_12.GetComp();
}
const FC_FloatInterpolationHistory& GetFloatInterpolationHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_FloatInterpolationHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_FloatInterpolationHistory GetFloatInterpolationHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_FloatInterpolationHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_FloatInterpolationHistory::GetFloatInterpolationHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_FloatInterpolationHistory GetDefaultedFloatInterpolationHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_FloatInterpolationHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_FloatInterpolationHistory);
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
FC_FloatInterpolationHistory GetDefaultedFloatInterpolationHistory_BP(const FECSEntity &inout Entity)
{
    FC_FloatInterpolationHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveFloatInterpolationHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_FloatInterpolationHistory);
}
}
FECSMonitorRuntimeView __GetMonitorFloatInterpolationHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_FloatInterpolationHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFloatInterpolationHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_FloatInterpolationHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFloatInterpolationHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_FloatInterpolationHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFloatInterpolationHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_FloatInterpolationHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFloatInterpolationHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_FloatInterpolationHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorFloatInterpolationHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_FloatInterpolationHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFloatInterpolationHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_FloatInterpolationHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFloatInterpolationHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_FloatInterpolationHistory, bFixedFrame, Details);
    return;
}
