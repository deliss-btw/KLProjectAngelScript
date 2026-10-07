
namespace __INTENRAL_FC_AnimLeanParamsHistory_NS
{
    const TECSComponentDerivedPtr<FC_AnimLeanParamsHistory> DerivedPtr = TECSComponentDerivedPtr<FC_AnimLeanParamsHistory>();
    const FC_AnimLeanParamsHistory DefaultValue = FC_AnimLeanParamsHistory();

}
struct FC_AnimLeanParamsHistory : FECSComponent
{
    TInterpoHistory<FC_AnimLeanParams, auto> History;

    FC_AnimLeanParamsHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_AnimLeanParams &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_AnimLeanParams>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_AnimLeanParams &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_AnimLeanParamsHistory
{
UFUNCTION()
bool HasAnimLeanParamsHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimLeanParamsHistory);
}
FC_AnimLeanParamsHistory& AssignAnimLeanParamsHistory(const FECSEntity &inout Entity, const FC_AnimLeanParamsHistory &inout DefaultValue = FC_AnimLeanParamsHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimLeanParamsHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimLeanParamsHistory_BP(const FECSEntity &inout Entity, const FC_AnimLeanParamsHistory &inout DefaultValue = FC_AnimLeanParamsHistory())
{
    ECSFunc_FC_AnimLeanParamsHistory::AssignAnimLeanParamsHistory(Entity, DefaultValue);
    return;
}
FC_AnimLeanParamsHistory& ModifyAnimLeanParamsHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimLeanParamsHistory));
    return local_12.GetComp();
}
FC_AnimLeanParamsHistory& ModifyOrAddAnimLeanParamsHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimLeanParamsHistory));
    return local_12.GetComp();
}
const FC_AnimLeanParamsHistory& GetAnimLeanParamsHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimLeanParamsHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimLeanParamsHistory GetAnimLeanParamsHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AnimLeanParamsHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_AnimLeanParamsHistory::GetAnimLeanParamsHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AnimLeanParamsHistory GetDefaultedAnimLeanParamsHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimLeanParamsHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimLeanParamsHistory);
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
FC_AnimLeanParamsHistory GetDefaultedAnimLeanParamsHistory_BP(const FECSEntity &inout Entity)
{
    FC_AnimLeanParamsHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveAnimLeanParamsHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimLeanParamsHistory);
}
}
FECSMonitorRuntimeView __GetMonitorAnimLeanParamsHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimLeanParamsHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimLeanParamsHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimLeanParamsHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimLeanParamsHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimLeanParamsHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimLeanParamsHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimLeanParamsHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimLeanParamsHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimLeanParamsHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimLeanParamsHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimLeanParamsHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimLeanParamsHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimLeanParamsHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimLeanParamsHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimLeanParamsHistory, bFixedFrame, Details);
    return;
}
