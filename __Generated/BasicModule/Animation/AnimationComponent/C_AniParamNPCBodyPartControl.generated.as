
namespace __INTENRAL_FC_AniParamNPCBodyPartControlHistory_NS
{
    const TECSComponentDerivedPtr<FC_AniParamNPCBodyPartControlHistory> DerivedPtr = TECSComponentDerivedPtr<FC_AniParamNPCBodyPartControlHistory>();
    const FC_AniParamNPCBodyPartControlHistory DefaultValue = FC_AniParamNPCBodyPartControlHistory();

}
struct FC_AniParamNPCBodyPartControlHistory : FECSComponent
{
    TInterpoHistory<FC_AniParamNPCBodyPartControl, auto> History;

    FC_AniParamNPCBodyPartControlHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_AniParamNPCBodyPartControl &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_AniParamNPCBodyPartControl>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_AniParamNPCBodyPartControl &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_AniParamNPCBodyPartControlHistory
{
UFUNCTION()
bool HasAniParamNPCBodyPartControlHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AniParamNPCBodyPartControlHistory);
}
FC_AniParamNPCBodyPartControlHistory& AssignAniParamNPCBodyPartControlHistory(const FECSEntity &inout Entity, const FC_AniParamNPCBodyPartControlHistory &inout DefaultValue = FC_AniParamNPCBodyPartControlHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AniParamNPCBodyPartControlHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAniParamNPCBodyPartControlHistory_BP(const FECSEntity &inout Entity, const FC_AniParamNPCBodyPartControlHistory &inout DefaultValue = FC_AniParamNPCBodyPartControlHistory())
{
    ECSFunc_FC_AniParamNPCBodyPartControlHistory::AssignAniParamNPCBodyPartControlHistory(Entity, DefaultValue);
    return;
}
FC_AniParamNPCBodyPartControlHistory& ModifyAniParamNPCBodyPartControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AniParamNPCBodyPartControlHistory));
    return local_12.GetComp();
}
FC_AniParamNPCBodyPartControlHistory& ModifyOrAddAniParamNPCBodyPartControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AniParamNPCBodyPartControlHistory));
    return local_12.GetComp();
}
const FC_AniParamNPCBodyPartControlHistory& GetAniParamNPCBodyPartControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AniParamNPCBodyPartControlHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_AniParamNPCBodyPartControlHistory GetAniParamNPCBodyPartControlHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AniParamNPCBodyPartControlHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_AniParamNPCBodyPartControlHistory::GetAniParamNPCBodyPartControlHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AniParamNPCBodyPartControlHistory GetDefaultedAniParamNPCBodyPartControlHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AniParamNPCBodyPartControlHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AniParamNPCBodyPartControlHistory);
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
FC_AniParamNPCBodyPartControlHistory GetDefaultedAniParamNPCBodyPartControlHistory_BP(const FECSEntity &inout Entity)
{
    FC_AniParamNPCBodyPartControlHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveAniParamNPCBodyPartControlHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AniParamNPCBodyPartControlHistory);
}
}
FECSMonitorRuntimeView __GetMonitorAniParamNPCBodyPartControlHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AniParamNPCBodyPartControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAniParamNPCBodyPartControlHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AniParamNPCBodyPartControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAniParamNPCBodyPartControlHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AniParamNPCBodyPartControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAniParamNPCBodyPartControlHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AniParamNPCBodyPartControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAniParamNPCBodyPartControlHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AniParamNPCBodyPartControlHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorAniParamNPCBodyPartControlHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AniParamNPCBodyPartControlHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAniParamNPCBodyPartControlHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AniParamNPCBodyPartControlHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAniParamNPCBodyPartControlHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AniParamNPCBodyPartControlHistory, bFixedFrame, Details);
    return;
}
