
namespace __INTENRAL_FC_AnimHeadControlDataHistory_NS
{
    const TECSComponentDerivedPtr<FC_AnimHeadControlDataHistory> DerivedPtr = TECSComponentDerivedPtr<FC_AnimHeadControlDataHistory>();
    const FC_AnimHeadControlDataHistory DefaultValue = FC_AnimHeadControlDataHistory();

}
struct FC_AnimHeadControlDataHistory : FECSComponent
{
    TInterpoHistory<FC_AnimHeadControlData, auto> History;

    FC_AnimHeadControlDataHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_AnimHeadControlData &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_AnimHeadControlData>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_AnimHeadControlData &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_AnimHeadControlDataHistory
{
UFUNCTION()
bool HasAnimHeadControlDataHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimHeadControlDataHistory);
}
FC_AnimHeadControlDataHistory& AssignAnimHeadControlDataHistory(const FECSEntity &inout Entity, const FC_AnimHeadControlDataHistory &inout DefaultValue = FC_AnimHeadControlDataHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimHeadControlDataHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimHeadControlDataHistory_BP(const FECSEntity &inout Entity, const FC_AnimHeadControlDataHistory &inout DefaultValue = FC_AnimHeadControlDataHistory())
{
    ECSFunc_FC_AnimHeadControlDataHistory::AssignAnimHeadControlDataHistory(Entity, DefaultValue);
    return;
}
FC_AnimHeadControlDataHistory& ModifyAnimHeadControlDataHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimHeadControlDataHistory));
    return local_12.GetComp();
}
FC_AnimHeadControlDataHistory& ModifyOrAddAnimHeadControlDataHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimHeadControlDataHistory));
    return local_12.GetComp();
}
const FC_AnimHeadControlDataHistory& GetAnimHeadControlDataHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimHeadControlDataHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimHeadControlDataHistory GetAnimHeadControlDataHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AnimHeadControlDataHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_AnimHeadControlDataHistory::GetAnimHeadControlDataHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AnimHeadControlDataHistory GetDefaultedAnimHeadControlDataHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimHeadControlDataHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimHeadControlDataHistory);
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
FC_AnimHeadControlDataHistory GetDefaultedAnimHeadControlDataHistory_BP(const FECSEntity &inout Entity)
{
    FC_AnimHeadControlDataHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveAnimHeadControlDataHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimHeadControlDataHistory);
}
}
FECSMonitorRuntimeView __GetMonitorAnimHeadControlDataHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimHeadControlDataHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimHeadControlDataHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimHeadControlDataHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimHeadControlDataHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimHeadControlDataHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimHeadControlDataHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimHeadControlDataHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimHeadControlDataHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimHeadControlDataHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimHeadControlDataHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimHeadControlDataHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimHeadControlDataHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimHeadControlDataHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimHeadControlDataHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimHeadControlDataHistory, bFixedFrame, Details);
    return;
}
