
namespace __INTENRAL_FC_BipedAimOffsetHistory_NS
{
    const TECSComponentDerivedPtr<FC_BipedAimOffsetHistory> DerivedPtr = TECSComponentDerivedPtr<FC_BipedAimOffsetHistory>();
    const FC_BipedAimOffsetHistory DefaultValue = FC_BipedAimOffsetHistory();

}
struct FC_BipedAimOffsetHistory : FECSComponent
{
    TInterpoHistory<FC_BipedAimOffset, auto> History;

    FC_BipedAimOffsetHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_BipedAimOffset &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_BipedAimOffset>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_BipedAimOffset &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_BipedAimOffsetHistory
{
UFUNCTION()
bool HasBipedAimOffsetHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_BipedAimOffsetHistory);
}
FC_BipedAimOffsetHistory& AssignBipedAimOffsetHistory(const FECSEntity &inout Entity, const FC_BipedAimOffsetHistory &inout DefaultValue = FC_BipedAimOffsetHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_BipedAimOffsetHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignBipedAimOffsetHistory_BP(const FECSEntity &inout Entity, const FC_BipedAimOffsetHistory &inout DefaultValue = FC_BipedAimOffsetHistory())
{
    ECSFunc_FC_BipedAimOffsetHistory::AssignBipedAimOffsetHistory(Entity, DefaultValue);
    return;
}
FC_BipedAimOffsetHistory& ModifyBipedAimOffsetHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_BipedAimOffsetHistory));
    return local_12.GetComp();
}
FC_BipedAimOffsetHistory& ModifyOrAddBipedAimOffsetHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_BipedAimOffsetHistory));
    return local_12.GetComp();
}
const FC_BipedAimOffsetHistory& GetBipedAimOffsetHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_BipedAimOffsetHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_BipedAimOffsetHistory GetBipedAimOffsetHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_BipedAimOffsetHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_BipedAimOffsetHistory::GetBipedAimOffsetHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_BipedAimOffsetHistory GetDefaultedBipedAimOffsetHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_BipedAimOffsetHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_BipedAimOffsetHistory);
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
FC_BipedAimOffsetHistory GetDefaultedBipedAimOffsetHistory_BP(const FECSEntity &inout Entity)
{
    FC_BipedAimOffsetHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveBipedAimOffsetHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_BipedAimOffsetHistory);
}
}
FECSMonitorRuntimeView __GetMonitorBipedAimOffsetHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_BipedAimOffsetHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBipedAimOffsetHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_BipedAimOffsetHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBipedAimOffsetHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_BipedAimOffsetHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBipedAimOffsetHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_BipedAimOffsetHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBipedAimOffsetHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_BipedAimOffsetHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorBipedAimOffsetHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_BipedAimOffsetHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBipedAimOffsetHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_BipedAimOffsetHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBipedAimOffsetHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_BipedAimOffsetHistory, bFixedFrame, Details);
    return;
}
