
namespace __INTENRAL_FC_LookRequestHistory_NS
{
    const TECSComponentDerivedPtr<FC_LookRequestHistory> DerivedPtr = TECSComponentDerivedPtr<FC_LookRequestHistory>();
    const FC_LookRequestHistory DefaultValue = FC_LookRequestHistory();

}
struct FC_LookRequestHistory : FECSComponent
{
    TInterpoHistory<FC_LookRequest, auto> History;

    FC_LookRequestHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_LookRequest &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_LookRequest>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_LookRequest &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_LookRequestHistory
{
UFUNCTION()
bool HasLookRequestHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LookRequestHistory);
}
FC_LookRequestHistory& AssignLookRequestHistory(const FECSEntity &inout Entity, const FC_LookRequestHistory &inout DefaultValue = FC_LookRequestHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LookRequestHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLookRequestHistory_BP(const FECSEntity &inout Entity, const FC_LookRequestHistory &inout DefaultValue = FC_LookRequestHistory())
{
    ECSFunc_FC_LookRequestHistory::AssignLookRequestHistory(Entity, DefaultValue);
    return;
}
FC_LookRequestHistory& ModifyLookRequestHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LookRequestHistory));
    return local_12.GetComp();
}
FC_LookRequestHistory& ModifyOrAddLookRequestHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LookRequestHistory));
    return local_12.GetComp();
}
const FC_LookRequestHistory& GetLookRequestHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LookRequestHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_LookRequestHistory GetLookRequestHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_LookRequestHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_LookRequestHistory::GetLookRequestHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_LookRequestHistory GetDefaultedLookRequestHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LookRequestHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LookRequestHistory);
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
FC_LookRequestHistory GetDefaultedLookRequestHistory_BP(const FECSEntity &inout Entity)
{
    FC_LookRequestHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveLookRequestHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LookRequestHistory);
}
}
FECSMonitorRuntimeView __GetMonitorLookRequestHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LookRequestHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLookRequestHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LookRequestHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLookRequestHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LookRequestHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLookRequestHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LookRequestHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLookRequestHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LookRequestHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorLookRequestHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LookRequestHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLookRequestHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LookRequestHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLookRequestHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LookRequestHistory, bFixedFrame, Details);
    return;
}
