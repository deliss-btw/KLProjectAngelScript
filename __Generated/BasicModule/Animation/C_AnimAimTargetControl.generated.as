
namespace __INTENRAL_FC_AnimAimTargetControlHistory_NS
{
    const TECSComponentDerivedPtr<FC_AnimAimTargetControlHistory> DerivedPtr = TECSComponentDerivedPtr<FC_AnimAimTargetControlHistory>();
    const FC_AnimAimTargetControlHistory DefaultValue = FC_AnimAimTargetControlHistory();

}
struct FC_AnimAimTargetControlHistory : FECSComponent
{
    TInterpoHistory<FC_AnimAimTargetControl, auto> History;

    FC_AnimAimTargetControlHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_AnimAimTargetControl &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_AnimAimTargetControl>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_AnimAimTargetControl &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_AnimAimTargetControlHistory
{
UFUNCTION()
bool HasAnimAimTargetControlHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimAimTargetControlHistory);
}
FC_AnimAimTargetControlHistory& AssignAnimAimTargetControlHistory(const FECSEntity &inout Entity, const FC_AnimAimTargetControlHistory &inout DefaultValue = FC_AnimAimTargetControlHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimAimTargetControlHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimAimTargetControlHistory_BP(const FECSEntity &inout Entity, const FC_AnimAimTargetControlHistory &inout DefaultValue = FC_AnimAimTargetControlHistory())
{
    ECSFunc_FC_AnimAimTargetControlHistory::AssignAnimAimTargetControlHistory(Entity, DefaultValue);
    return;
}
FC_AnimAimTargetControlHistory& ModifyAnimAimTargetControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimAimTargetControlHistory));
    return local_12.GetComp();
}
FC_AnimAimTargetControlHistory& ModifyOrAddAnimAimTargetControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimAimTargetControlHistory));
    return local_12.GetComp();
}
const FC_AnimAimTargetControlHistory& GetAnimAimTargetControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimAimTargetControlHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimAimTargetControlHistory GetAnimAimTargetControlHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AnimAimTargetControlHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_AnimAimTargetControlHistory::GetAnimAimTargetControlHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AnimAimTargetControlHistory GetDefaultedAnimAimTargetControlHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimAimTargetControlHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimAimTargetControlHistory);
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
FC_AnimAimTargetControlHistory GetDefaultedAnimAimTargetControlHistory_BP(const FECSEntity &inout Entity)
{
    FC_AnimAimTargetControlHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveAnimAimTargetControlHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimAimTargetControlHistory);
}
}
FECSMonitorRuntimeView __GetMonitorAnimAimTargetControlHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimAimTargetControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimAimTargetControlHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimAimTargetControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimAimTargetControlHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimAimTargetControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimAimTargetControlHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimAimTargetControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimAimTargetControlHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimAimTargetControlHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimAimTargetControlHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimAimTargetControlHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimAimTargetControlHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimAimTargetControlHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimAimTargetControlHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimAimTargetControlHistory, bFixedFrame, Details);
    return;
}
