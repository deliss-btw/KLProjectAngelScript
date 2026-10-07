
namespace __INTENRAL_FC_AnimIdleHeadControlHistory_NS
{
    const TECSComponentDerivedPtr<FC_AnimIdleHeadControlHistory> DerivedPtr = TECSComponentDerivedPtr<FC_AnimIdleHeadControlHistory>();
    const FC_AnimIdleHeadControlHistory DefaultValue = FC_AnimIdleHeadControlHistory();

}
struct FC_AnimIdleHeadControlHistory : FECSComponent
{
    TInterpoHistory<FC_AnimIdleHeadControl, auto> History;

    FC_AnimIdleHeadControlHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_AnimIdleHeadControl &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_AnimIdleHeadControl>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_AnimIdleHeadControl &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_AnimIdleHeadControlHistory
{
UFUNCTION()
bool HasAnimIdleHeadControlHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimIdleHeadControlHistory);
}
FC_AnimIdleHeadControlHistory& AssignAnimIdleHeadControlHistory(const FECSEntity &inout Entity, const FC_AnimIdleHeadControlHistory &inout DefaultValue = FC_AnimIdleHeadControlHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimIdleHeadControlHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimIdleHeadControlHistory_BP(const FECSEntity &inout Entity, const FC_AnimIdleHeadControlHistory &inout DefaultValue = FC_AnimIdleHeadControlHistory())
{
    ECSFunc_FC_AnimIdleHeadControlHistory::AssignAnimIdleHeadControlHistory(Entity, DefaultValue);
    return;
}
FC_AnimIdleHeadControlHistory& ModifyAnimIdleHeadControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimIdleHeadControlHistory));
    return local_12.GetComp();
}
FC_AnimIdleHeadControlHistory& ModifyOrAddAnimIdleHeadControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimIdleHeadControlHistory));
    return local_12.GetComp();
}
const FC_AnimIdleHeadControlHistory& GetAnimIdleHeadControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimIdleHeadControlHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimIdleHeadControlHistory GetAnimIdleHeadControlHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AnimIdleHeadControlHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_AnimIdleHeadControlHistory::GetAnimIdleHeadControlHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AnimIdleHeadControlHistory GetDefaultedAnimIdleHeadControlHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimIdleHeadControlHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimIdleHeadControlHistory);
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
FC_AnimIdleHeadControlHistory GetDefaultedAnimIdleHeadControlHistory_BP(const FECSEntity &inout Entity)
{
    FC_AnimIdleHeadControlHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveAnimIdleHeadControlHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimIdleHeadControlHistory);
}
}
FECSMonitorRuntimeView __GetMonitorAnimIdleHeadControlHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimIdleHeadControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimIdleHeadControlHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimIdleHeadControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimIdleHeadControlHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimIdleHeadControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimIdleHeadControlHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimIdleHeadControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimIdleHeadControlHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimIdleHeadControlHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimIdleHeadControlHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimIdleHeadControlHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimIdleHeadControlHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimIdleHeadControlHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimIdleHeadControlHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimIdleHeadControlHistory, bFixedFrame, Details);
    return;
}
