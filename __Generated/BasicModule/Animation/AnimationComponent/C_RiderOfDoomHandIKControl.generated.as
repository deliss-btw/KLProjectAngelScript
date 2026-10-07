
namespace __INTENRAL_FC_AnimRiderHandIKHistory_NS
{
    const TECSComponentDerivedPtr<FC_AnimRiderHandIKHistory> DerivedPtr = TECSComponentDerivedPtr<FC_AnimRiderHandIKHistory>();
    const FC_AnimRiderHandIKHistory DefaultValue = FC_AnimRiderHandIKHistory();

}
struct FC_AnimRiderHandIKHistory : FECSComponent
{
    TInterpoHistory<FC_AnimRiderHandIK, auto> History;

    FC_AnimRiderHandIKHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_AnimRiderHandIK &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_AnimRiderHandIK>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_AnimRiderHandIK &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_AnimRiderHandIKHistory
{
UFUNCTION()
bool HasAnimRiderHandIKHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimRiderHandIKHistory);
}
FC_AnimRiderHandIKHistory& AssignAnimRiderHandIKHistory(const FECSEntity &inout Entity, const FC_AnimRiderHandIKHistory &inout DefaultValue = FC_AnimRiderHandIKHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimRiderHandIKHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimRiderHandIKHistory_BP(const FECSEntity &inout Entity, const FC_AnimRiderHandIKHistory &inout DefaultValue = FC_AnimRiderHandIKHistory())
{
    ECSFunc_FC_AnimRiderHandIKHistory::AssignAnimRiderHandIKHistory(Entity, DefaultValue);
    return;
}
FC_AnimRiderHandIKHistory& ModifyAnimRiderHandIKHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimRiderHandIKHistory));
    return local_12.GetComp();
}
FC_AnimRiderHandIKHistory& ModifyOrAddAnimRiderHandIKHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimRiderHandIKHistory));
    return local_12.GetComp();
}
const FC_AnimRiderHandIKHistory& GetAnimRiderHandIKHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimRiderHandIKHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimRiderHandIKHistory GetAnimRiderHandIKHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AnimRiderHandIKHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_AnimRiderHandIKHistory::GetAnimRiderHandIKHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AnimRiderHandIKHistory GetDefaultedAnimRiderHandIKHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimRiderHandIKHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimRiderHandIKHistory);
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
FC_AnimRiderHandIKHistory GetDefaultedAnimRiderHandIKHistory_BP(const FECSEntity &inout Entity)
{
    FC_AnimRiderHandIKHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveAnimRiderHandIKHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimRiderHandIKHistory);
}
}
FECSMonitorRuntimeView __GetMonitorAnimRiderHandIKHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimRiderHandIKHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimRiderHandIKHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimRiderHandIKHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimRiderHandIKHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimRiderHandIKHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimRiderHandIKHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimRiderHandIKHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimRiderHandIKHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimRiderHandIKHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimRiderHandIKHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimRiderHandIKHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimRiderHandIKHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimRiderHandIKHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimRiderHandIKHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimRiderHandIKHistory, bFixedFrame, Details);
    return;
}
