
namespace __INTENRAL_FC_GlimmeringWolfTailGroomHistory_NS
{
    const TECSComponentDerivedPtr<FC_GlimmeringWolfTailGroomHistory> DerivedPtr = TECSComponentDerivedPtr<FC_GlimmeringWolfTailGroomHistory>();
    const FC_GlimmeringWolfTailGroomHistory DefaultValue = FC_GlimmeringWolfTailGroomHistory();

}
struct FC_GlimmeringWolfTailGroomHistory : FECSComponent
{
    TInterpoHistory<FC_GlimmeringWolfTailGroom, auto> History;

    FC_GlimmeringWolfTailGroomHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_GlimmeringWolfTailGroom &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_GlimmeringWolfTailGroom>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_GlimmeringWolfTailGroom &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_GlimmeringWolfTailGroomHistory
{
UFUNCTION()
bool HasGlimmeringWolfTailGroomHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GlimmeringWolfTailGroomHistory);
}
FC_GlimmeringWolfTailGroomHistory& AssignGlimmeringWolfTailGroomHistory(const FECSEntity &inout Entity, const FC_GlimmeringWolfTailGroomHistory &inout DefaultValue = FC_GlimmeringWolfTailGroomHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GlimmeringWolfTailGroomHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGlimmeringWolfTailGroomHistory_BP(const FECSEntity &inout Entity, const FC_GlimmeringWolfTailGroomHistory &inout DefaultValue = FC_GlimmeringWolfTailGroomHistory())
{
    ECSFunc_FC_GlimmeringWolfTailGroomHistory::AssignGlimmeringWolfTailGroomHistory(Entity, DefaultValue);
    return;
}
FC_GlimmeringWolfTailGroomHistory& ModifyGlimmeringWolfTailGroomHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GlimmeringWolfTailGroomHistory));
    return local_12.GetComp();
}
FC_GlimmeringWolfTailGroomHistory& ModifyOrAddGlimmeringWolfTailGroomHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GlimmeringWolfTailGroomHistory));
    return local_12.GetComp();
}
const FC_GlimmeringWolfTailGroomHistory& GetGlimmeringWolfTailGroomHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GlimmeringWolfTailGroomHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_GlimmeringWolfTailGroomHistory GetGlimmeringWolfTailGroomHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_GlimmeringWolfTailGroomHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_GlimmeringWolfTailGroomHistory::GetGlimmeringWolfTailGroomHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_GlimmeringWolfTailGroomHistory GetDefaultedGlimmeringWolfTailGroomHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GlimmeringWolfTailGroomHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GlimmeringWolfTailGroomHistory);
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
FC_GlimmeringWolfTailGroomHistory GetDefaultedGlimmeringWolfTailGroomHistory_BP(const FECSEntity &inout Entity)
{
    FC_GlimmeringWolfTailGroomHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveGlimmeringWolfTailGroomHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GlimmeringWolfTailGroomHistory);
}
}
FECSMonitorRuntimeView __GetMonitorGlimmeringWolfTailGroomHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GlimmeringWolfTailGroomHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGlimmeringWolfTailGroomHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GlimmeringWolfTailGroomHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGlimmeringWolfTailGroomHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GlimmeringWolfTailGroomHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGlimmeringWolfTailGroomHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GlimmeringWolfTailGroomHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGlimmeringWolfTailGroomHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GlimmeringWolfTailGroomHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorGlimmeringWolfTailGroomHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GlimmeringWolfTailGroomHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGlimmeringWolfTailGroomHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GlimmeringWolfTailGroomHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGlimmeringWolfTailGroomHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GlimmeringWolfTailGroomHistory, bFixedFrame, Details);
    return;
}
