
namespace __INTENRAL_FC_RelativeDesiredRotationHistory_NS
{
    const TECSComponentDerivedPtr<FC_RelativeDesiredRotationHistory> DerivedPtr = TECSComponentDerivedPtr<FC_RelativeDesiredRotationHistory>();
    const FC_RelativeDesiredRotationHistory DefaultValue = FC_RelativeDesiredRotationHistory();

}
struct FC_RelativeDesiredRotationHistory : FECSComponent
{
    TInterpoHistory<FC_RelativeDesiredRotation, auto> History;

    FC_RelativeDesiredRotationHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_RelativeDesiredRotation &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_RelativeDesiredRotation>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_RelativeDesiredRotation &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_RelativeDesiredRotationHistory
{
UFUNCTION()
bool HasRelativeDesiredRotationHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_RelativeDesiredRotationHistory);
}
FC_RelativeDesiredRotationHistory& AssignRelativeDesiredRotationHistory(const FECSEntity &inout Entity, const FC_RelativeDesiredRotationHistory &inout DefaultValue = FC_RelativeDesiredRotationHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_RelativeDesiredRotationHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignRelativeDesiredRotationHistory_BP(const FECSEntity &inout Entity, const FC_RelativeDesiredRotationHistory &inout DefaultValue = FC_RelativeDesiredRotationHistory())
{
    ECSFunc_FC_RelativeDesiredRotationHistory::AssignRelativeDesiredRotationHistory(Entity, DefaultValue);
    return;
}
FC_RelativeDesiredRotationHistory& ModifyRelativeDesiredRotationHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_RelativeDesiredRotationHistory));
    return local_12.GetComp();
}
FC_RelativeDesiredRotationHistory& ModifyOrAddRelativeDesiredRotationHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_RelativeDesiredRotationHistory));
    return local_12.GetComp();
}
const FC_RelativeDesiredRotationHistory& GetRelativeDesiredRotationHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_RelativeDesiredRotationHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_RelativeDesiredRotationHistory GetRelativeDesiredRotationHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_RelativeDesiredRotationHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_RelativeDesiredRotationHistory::GetRelativeDesiredRotationHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_RelativeDesiredRotationHistory GetDefaultedRelativeDesiredRotationHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_RelativeDesiredRotationHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_RelativeDesiredRotationHistory);
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
FC_RelativeDesiredRotationHistory GetDefaultedRelativeDesiredRotationHistory_BP(const FECSEntity &inout Entity)
{
    FC_RelativeDesiredRotationHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveRelativeDesiredRotationHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_RelativeDesiredRotationHistory);
}
}
FECSMonitorRuntimeView __GetMonitorRelativeDesiredRotationHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_RelativeDesiredRotationHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRelativeDesiredRotationHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_RelativeDesiredRotationHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRelativeDesiredRotationHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_RelativeDesiredRotationHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRelativeDesiredRotationHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_RelativeDesiredRotationHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRelativeDesiredRotationHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_RelativeDesiredRotationHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorRelativeDesiredRotationHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_RelativeDesiredRotationHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRelativeDesiredRotationHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_RelativeDesiredRotationHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRelativeDesiredRotationHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_RelativeDesiredRotationHistory, bFixedFrame, Details);
    return;
}
