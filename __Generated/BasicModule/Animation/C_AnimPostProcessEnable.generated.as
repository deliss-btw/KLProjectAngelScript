
namespace __INTENRAL_FC_AnimPostProcessEnableHistory_NS
{
    const TECSComponentDerivedPtr<FC_AnimPostProcessEnableHistory> DerivedPtr = TECSComponentDerivedPtr<FC_AnimPostProcessEnableHistory>();
    const FC_AnimPostProcessEnableHistory DefaultValue = FC_AnimPostProcessEnableHistory();

}
struct FC_AnimPostProcessEnableHistory : FECSComponent
{
    TInterpoHistory<FC_AnimPostProcessEnable, auto> History;

    FC_AnimPostProcessEnableHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_AnimPostProcessEnable &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_AnimPostProcessEnable>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_AnimPostProcessEnable &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_AnimPostProcessEnableHistory
{
UFUNCTION()
bool HasAnimPostProcessEnableHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimPostProcessEnableHistory);
}
FC_AnimPostProcessEnableHistory& AssignAnimPostProcessEnableHistory(const FECSEntity &inout Entity, const FC_AnimPostProcessEnableHistory &inout DefaultValue = FC_AnimPostProcessEnableHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimPostProcessEnableHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimPostProcessEnableHistory_BP(const FECSEntity &inout Entity, const FC_AnimPostProcessEnableHistory &inout DefaultValue = FC_AnimPostProcessEnableHistory())
{
    ECSFunc_FC_AnimPostProcessEnableHistory::AssignAnimPostProcessEnableHistory(Entity, DefaultValue);
    return;
}
FC_AnimPostProcessEnableHistory& ModifyAnimPostProcessEnableHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimPostProcessEnableHistory));
    return local_12.GetComp();
}
FC_AnimPostProcessEnableHistory& ModifyOrAddAnimPostProcessEnableHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimPostProcessEnableHistory));
    return local_12.GetComp();
}
const FC_AnimPostProcessEnableHistory& GetAnimPostProcessEnableHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimPostProcessEnableHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimPostProcessEnableHistory GetAnimPostProcessEnableHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AnimPostProcessEnableHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_AnimPostProcessEnableHistory::GetAnimPostProcessEnableHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AnimPostProcessEnableHistory GetDefaultedAnimPostProcessEnableHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimPostProcessEnableHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimPostProcessEnableHistory);
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
FC_AnimPostProcessEnableHistory GetDefaultedAnimPostProcessEnableHistory_BP(const FECSEntity &inout Entity)
{
    FC_AnimPostProcessEnableHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveAnimPostProcessEnableHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimPostProcessEnableHistory);
}
}
FECSMonitorRuntimeView __GetMonitorAnimPostProcessEnableHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimPostProcessEnableHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimPostProcessEnableHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimPostProcessEnableHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimPostProcessEnableHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimPostProcessEnableHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimPostProcessEnableHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimPostProcessEnableHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimPostProcessEnableHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimPostProcessEnableHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimPostProcessEnableHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimPostProcessEnableHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimPostProcessEnableHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimPostProcessEnableHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimPostProcessEnableHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimPostProcessEnableHistory, bFixedFrame, Details);
    return;
}
