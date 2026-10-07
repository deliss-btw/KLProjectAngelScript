
namespace __INTENRAL_FC_AniParamSampleTrajectoryHistory_NS
{
    const TECSComponentDerivedPtr<FC_AniParamSampleTrajectoryHistory> DerivedPtr = TECSComponentDerivedPtr<FC_AniParamSampleTrajectoryHistory>();
    const FC_AniParamSampleTrajectoryHistory DefaultValue = FC_AniParamSampleTrajectoryHistory();

}
struct FC_AniParamSampleTrajectoryHistory : FECSComponent
{
    TInterpoHistory<FC_AniParamSampleTrajectory, auto> History;

    FC_AniParamSampleTrajectoryHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_AniParamSampleTrajectory &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_AniParamSampleTrajectory>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_AniParamSampleTrajectory &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_AniParamSampleTrajectoryHistory
{
UFUNCTION()
bool HasAniParamSampleTrajectoryHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AniParamSampleTrajectoryHistory);
}
FC_AniParamSampleTrajectoryHistory& AssignAniParamSampleTrajectoryHistory(const FECSEntity &inout Entity, const FC_AniParamSampleTrajectoryHistory &inout DefaultValue = FC_AniParamSampleTrajectoryHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AniParamSampleTrajectoryHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAniParamSampleTrajectoryHistory_BP(const FECSEntity &inout Entity, const FC_AniParamSampleTrajectoryHistory &inout DefaultValue = FC_AniParamSampleTrajectoryHistory())
{
    ECSFunc_FC_AniParamSampleTrajectoryHistory::AssignAniParamSampleTrajectoryHistory(Entity, DefaultValue);
    return;
}
FC_AniParamSampleTrajectoryHistory& ModifyAniParamSampleTrajectoryHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AniParamSampleTrajectoryHistory));
    return local_12.GetComp();
}
FC_AniParamSampleTrajectoryHistory& ModifyOrAddAniParamSampleTrajectoryHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AniParamSampleTrajectoryHistory));
    return local_12.GetComp();
}
const FC_AniParamSampleTrajectoryHistory& GetAniParamSampleTrajectoryHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AniParamSampleTrajectoryHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_AniParamSampleTrajectoryHistory GetAniParamSampleTrajectoryHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AniParamSampleTrajectoryHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_AniParamSampleTrajectoryHistory::GetAniParamSampleTrajectoryHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AniParamSampleTrajectoryHistory GetDefaultedAniParamSampleTrajectoryHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AniParamSampleTrajectoryHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AniParamSampleTrajectoryHistory);
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
FC_AniParamSampleTrajectoryHistory GetDefaultedAniParamSampleTrajectoryHistory_BP(const FECSEntity &inout Entity)
{
    FC_AniParamSampleTrajectoryHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveAniParamSampleTrajectoryHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AniParamSampleTrajectoryHistory);
}
}
FECSMonitorRuntimeView __GetMonitorAniParamSampleTrajectoryHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AniParamSampleTrajectoryHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAniParamSampleTrajectoryHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AniParamSampleTrajectoryHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAniParamSampleTrajectoryHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AniParamSampleTrajectoryHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAniParamSampleTrajectoryHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AniParamSampleTrajectoryHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAniParamSampleTrajectoryHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AniParamSampleTrajectoryHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorAniParamSampleTrajectoryHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AniParamSampleTrajectoryHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAniParamSampleTrajectoryHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AniParamSampleTrajectoryHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAniParamSampleTrajectoryHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AniParamSampleTrajectoryHistory, bFixedFrame, Details);
    return;
}
