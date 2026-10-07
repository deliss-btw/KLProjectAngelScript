
namespace __INTENRAL_FC_AnimFloorInfoHistory_NS
{
    const TECSComponentDerivedPtr<FC_AnimFloorInfoHistory> DerivedPtr = TECSComponentDerivedPtr<FC_AnimFloorInfoHistory>();
    const FC_AnimFloorInfoHistory DefaultValue = FC_AnimFloorInfoHistory();

}
struct FC_AnimFloorInfoHistory : FECSComponent
{
    TInterpoHistory<FC_AnimFloorInfo, auto> History;

    FC_AnimFloorInfoHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_AnimFloorInfo &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_AnimFloorInfo>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_AnimFloorInfo &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_AnimFloorInfoHistory
{
UFUNCTION()
bool HasAnimFloorInfoHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimFloorInfoHistory);
}
FC_AnimFloorInfoHistory& AssignAnimFloorInfoHistory(const FECSEntity &inout Entity, const FC_AnimFloorInfoHistory &inout DefaultValue = FC_AnimFloorInfoHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimFloorInfoHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimFloorInfoHistory_BP(const FECSEntity &inout Entity, const FC_AnimFloorInfoHistory &inout DefaultValue = FC_AnimFloorInfoHistory())
{
    ECSFunc_FC_AnimFloorInfoHistory::AssignAnimFloorInfoHistory(Entity, DefaultValue);
    return;
}
FC_AnimFloorInfoHistory& ModifyAnimFloorInfoHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimFloorInfoHistory));
    return local_12.GetComp();
}
FC_AnimFloorInfoHistory& ModifyOrAddAnimFloorInfoHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimFloorInfoHistory));
    return local_12.GetComp();
}
const FC_AnimFloorInfoHistory& GetAnimFloorInfoHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimFloorInfoHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimFloorInfoHistory GetAnimFloorInfoHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AnimFloorInfoHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_AnimFloorInfoHistory::GetAnimFloorInfoHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AnimFloorInfoHistory GetDefaultedAnimFloorInfoHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimFloorInfoHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimFloorInfoHistory);
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
FC_AnimFloorInfoHistory GetDefaultedAnimFloorInfoHistory_BP(const FECSEntity &inout Entity)
{
    FC_AnimFloorInfoHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveAnimFloorInfoHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimFloorInfoHistory);
}
}
FECSMonitorRuntimeView __GetMonitorAnimFloorInfoHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimFloorInfoHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimFloorInfoHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimFloorInfoHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimFloorInfoHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimFloorInfoHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimFloorInfoHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimFloorInfoHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimFloorInfoHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimFloorInfoHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimFloorInfoHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimFloorInfoHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimFloorInfoHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimFloorInfoHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimFloorInfoHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimFloorInfoHistory, bFixedFrame, Details);
    return;
}
