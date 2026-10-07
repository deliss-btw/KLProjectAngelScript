
namespace __INTENRAL_FC_AnimParamRiderSwayControlHistory_NS
{
    const TECSComponentDerivedPtr<FC_AnimParamRiderSwayControlHistory> DerivedPtr = TECSComponentDerivedPtr<FC_AnimParamRiderSwayControlHistory>();
    const FC_AnimParamRiderSwayControlHistory DefaultValue = FC_AnimParamRiderSwayControlHistory();

}
struct FC_AnimParamRiderSwayControlHistory : FECSComponent
{
    TInterpoHistory<FC_AnimParamRiderSwayControl, auto> History;

    FC_AnimParamRiderSwayControlHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_AnimParamRiderSwayControl &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_AnimParamRiderSwayControl>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_AnimParamRiderSwayControl &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_AnimParamRiderSwayControlHistory
{
UFUNCTION()
bool HasAnimParamRiderSwayControlHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRiderSwayControlHistory);
}
FC_AnimParamRiderSwayControlHistory& AssignAnimParamRiderSwayControlHistory(const FECSEntity &inout Entity, const FC_AnimParamRiderSwayControlHistory &inout DefaultValue = FC_AnimParamRiderSwayControlHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRiderSwayControlHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimParamRiderSwayControlHistory_BP(const FECSEntity &inout Entity, const FC_AnimParamRiderSwayControlHistory &inout DefaultValue = FC_AnimParamRiderSwayControlHistory())
{
    ECSFunc_FC_AnimParamRiderSwayControlHistory::AssignAnimParamRiderSwayControlHistory(Entity, DefaultValue);
    return;
}
FC_AnimParamRiderSwayControlHistory& ModifyAnimParamRiderSwayControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRiderSwayControlHistory));
    return local_12.GetComp();
}
FC_AnimParamRiderSwayControlHistory& ModifyOrAddAnimParamRiderSwayControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRiderSwayControlHistory));
    return local_12.GetComp();
}
const FC_AnimParamRiderSwayControlHistory& GetAnimParamRiderSwayControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRiderSwayControlHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimParamRiderSwayControlHistory GetAnimParamRiderSwayControlHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AnimParamRiderSwayControlHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_AnimParamRiderSwayControlHistory::GetAnimParamRiderSwayControlHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AnimParamRiderSwayControlHistory GetDefaultedAnimParamRiderSwayControlHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimParamRiderSwayControlHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRiderSwayControlHistory);
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
FC_AnimParamRiderSwayControlHistory GetDefaultedAnimParamRiderSwayControlHistory_BP(const FECSEntity &inout Entity)
{
    FC_AnimParamRiderSwayControlHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveAnimParamRiderSwayControlHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimParamRiderSwayControlHistory);
}
}
FECSMonitorRuntimeView __GetMonitorAnimParamRiderSwayControlHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimParamRiderSwayControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamRiderSwayControlHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimParamRiderSwayControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamRiderSwayControlHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimParamRiderSwayControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamRiderSwayControlHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimParamRiderSwayControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamRiderSwayControlHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimParamRiderSwayControlHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimParamRiderSwayControlHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimParamRiderSwayControlHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimParamRiderSwayControlHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimParamRiderSwayControlHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimParamRiderSwayControlHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimParamRiderSwayControlHistory, bFixedFrame, Details);
    return;
}
