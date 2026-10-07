
namespace __INTENRAL_FC_AnimResolvedSyncedHistory_NS
{
    const TECSComponentDerivedPtr<FC_AnimResolvedSyncedHistory> DerivedPtr = TECSComponentDerivedPtr<FC_AnimResolvedSyncedHistory>();
    const FC_AnimResolvedSyncedHistory DefaultValue = FC_AnimResolvedSyncedHistory();

}
struct FC_AnimResolvedSyncedHistory : FECSComponent
{
    TInterpoHistory<FC_AnimResolvedSynced, auto> History;

    FC_AnimResolvedSyncedHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_AnimResolvedSynced &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_AnimResolvedSynced>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_AnimResolvedSynced &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_AnimResolvedSyncedHistory
{
UFUNCTION()
bool HasAnimResolvedSyncedHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimResolvedSyncedHistory);
}
FC_AnimResolvedSyncedHistory& AssignAnimResolvedSyncedHistory(const FECSEntity &inout Entity, const FC_AnimResolvedSyncedHistory &inout DefaultValue = FC_AnimResolvedSyncedHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimResolvedSyncedHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimResolvedSyncedHistory_BP(const FECSEntity &inout Entity, const FC_AnimResolvedSyncedHistory &inout DefaultValue = FC_AnimResolvedSyncedHistory())
{
    ECSFunc_FC_AnimResolvedSyncedHistory::AssignAnimResolvedSyncedHistory(Entity, DefaultValue);
    return;
}
FC_AnimResolvedSyncedHistory& ModifyAnimResolvedSyncedHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimResolvedSyncedHistory));
    return local_12.GetComp();
}
FC_AnimResolvedSyncedHistory& ModifyOrAddAnimResolvedSyncedHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimResolvedSyncedHistory));
    return local_12.GetComp();
}
const FC_AnimResolvedSyncedHistory& GetAnimResolvedSyncedHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimResolvedSyncedHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimResolvedSyncedHistory GetAnimResolvedSyncedHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AnimResolvedSyncedHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_AnimResolvedSyncedHistory::GetAnimResolvedSyncedHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AnimResolvedSyncedHistory GetDefaultedAnimResolvedSyncedHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimResolvedSyncedHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimResolvedSyncedHistory);
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
FC_AnimResolvedSyncedHistory GetDefaultedAnimResolvedSyncedHistory_BP(const FECSEntity &inout Entity)
{
    FC_AnimResolvedSyncedHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveAnimResolvedSyncedHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimResolvedSyncedHistory);
}
}
FECSMonitorRuntimeView __GetMonitorAnimResolvedSyncedHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimResolvedSyncedHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimResolvedSyncedHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimResolvedSyncedHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimResolvedSyncedHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimResolvedSyncedHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimResolvedSyncedHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimResolvedSyncedHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimResolvedSyncedHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimResolvedSyncedHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimResolvedSyncedHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimResolvedSyncedHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimResolvedSyncedHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimResolvedSyncedHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimResolvedSyncedHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimResolvedSyncedHistory, bFixedFrame, Details);
    return;
}
