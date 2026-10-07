
namespace __INTENRAL_FC_AnimParamSocketAimControlHistory_NS
{
    const TECSComponentDerivedPtr<FC_AnimParamSocketAimControlHistory> DerivedPtr = TECSComponentDerivedPtr<FC_AnimParamSocketAimControlHistory>();
    const FC_AnimParamSocketAimControlHistory DefaultValue = FC_AnimParamSocketAimControlHistory();

}
struct FC_AnimParamSocketAimControlHistory : FECSComponent
{
    TInterpoHistory<FC_AnimParamSocketAimControl, auto> History;

    FC_AnimParamSocketAimControlHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_AnimParamSocketAimControl &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_AnimParamSocketAimControl>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_AnimParamSocketAimControl &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_AnimParamSocketAimControlHistory
{
UFUNCTION()
bool HasAnimParamSocketAimControlHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimParamSocketAimControlHistory);
}
FC_AnimParamSocketAimControlHistory& AssignAnimParamSocketAimControlHistory(const FECSEntity &inout Entity, const FC_AnimParamSocketAimControlHistory &inout DefaultValue = FC_AnimParamSocketAimControlHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimParamSocketAimControlHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimParamSocketAimControlHistory_BP(const FECSEntity &inout Entity, const FC_AnimParamSocketAimControlHistory &inout DefaultValue = FC_AnimParamSocketAimControlHistory())
{
    ECSFunc_FC_AnimParamSocketAimControlHistory::AssignAnimParamSocketAimControlHistory(Entity, DefaultValue);
    return;
}
FC_AnimParamSocketAimControlHistory& ModifyAnimParamSocketAimControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimParamSocketAimControlHistory));
    return local_12.GetComp();
}
FC_AnimParamSocketAimControlHistory& ModifyOrAddAnimParamSocketAimControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimParamSocketAimControlHistory));
    return local_12.GetComp();
}
const FC_AnimParamSocketAimControlHistory& GetAnimParamSocketAimControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimParamSocketAimControlHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimParamSocketAimControlHistory GetAnimParamSocketAimControlHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AnimParamSocketAimControlHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_AnimParamSocketAimControlHistory::GetAnimParamSocketAimControlHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AnimParamSocketAimControlHistory GetDefaultedAnimParamSocketAimControlHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimParamSocketAimControlHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimParamSocketAimControlHistory);
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
FC_AnimParamSocketAimControlHistory GetDefaultedAnimParamSocketAimControlHistory_BP(const FECSEntity &inout Entity)
{
    FC_AnimParamSocketAimControlHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveAnimParamSocketAimControlHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimParamSocketAimControlHistory);
}
}
FECSMonitorRuntimeView __GetMonitorAnimParamSocketAimControlHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimParamSocketAimControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamSocketAimControlHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimParamSocketAimControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamSocketAimControlHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimParamSocketAimControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamSocketAimControlHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimParamSocketAimControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamSocketAimControlHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimParamSocketAimControlHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimParamSocketAimControlHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimParamSocketAimControlHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimParamSocketAimControlHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimParamSocketAimControlHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimParamSocketAimControlHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimParamSocketAimControlHistory, bFixedFrame, Details);
    return;
}
