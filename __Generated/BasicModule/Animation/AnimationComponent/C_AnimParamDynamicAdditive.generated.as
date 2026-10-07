
namespace __INTENRAL_FC_AnimParamDynamicAdditiveConfigHistory_NS
{
    const TECSComponentDerivedPtr<FC_AnimParamDynamicAdditiveConfigHistory> DerivedPtr = TECSComponentDerivedPtr<FC_AnimParamDynamicAdditiveConfigHistory>();
    const FC_AnimParamDynamicAdditiveConfigHistory DefaultValue = FC_AnimParamDynamicAdditiveConfigHistory();
}
namespace __INTENRAL_FC_AnimParamDynamicAdditiveHistory_NS
{
    const TECSComponentDerivedPtr<FC_AnimParamDynamicAdditiveHistory> DerivedPtr = TECSComponentDerivedPtr<FC_AnimParamDynamicAdditiveHistory>();
    const FC_AnimParamDynamicAdditiveHistory DefaultValue = FC_AnimParamDynamicAdditiveHistory();

}
struct FC_AnimParamDynamicAdditiveConfigHistory : FECSComponent
{
    TInterpoHistory<FC_AnimParamDynamicAdditiveConfig, auto> History;

    FC_AnimParamDynamicAdditiveConfigHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_AnimParamDynamicAdditiveConfig &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_AnimParamDynamicAdditiveConfig>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_AnimParamDynamicAdditiveConfig &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

struct FC_AnimParamDynamicAdditiveHistory : FECSComponent
{
    TInterpoHistory<FC_AnimParamDynamicAdditive, auto> History;

    FC_AnimParamDynamicAdditiveHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_AnimParamDynamicAdditive &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_AnimParamDynamicAdditive>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_AnimParamDynamicAdditive &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_AnimParamDynamicAdditiveConfigHistory
{
UFUNCTION()
bool HasAnimParamDynamicAdditiveConfigHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimParamDynamicAdditiveConfigHistory);
}
FC_AnimParamDynamicAdditiveConfigHistory& AssignAnimParamDynamicAdditiveConfigHistory(const FECSEntity &inout Entity, const FC_AnimParamDynamicAdditiveConfigHistory &inout DefaultValue = FC_AnimParamDynamicAdditiveConfigHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimParamDynamicAdditiveConfigHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimParamDynamicAdditiveConfigHistory_BP(const FECSEntity &inout Entity, const FC_AnimParamDynamicAdditiveConfigHistory &inout DefaultValue = FC_AnimParamDynamicAdditiveConfigHistory())
{
    ECSFunc_FC_AnimParamDynamicAdditiveConfigHistory::AssignAnimParamDynamicAdditiveConfigHistory(Entity, DefaultValue);
    return;
}
FC_AnimParamDynamicAdditiveConfigHistory& ModifyAnimParamDynamicAdditiveConfigHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimParamDynamicAdditiveConfigHistory));
    return local_12.GetComp();
}
FC_AnimParamDynamicAdditiveConfigHistory& ModifyOrAddAnimParamDynamicAdditiveConfigHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimParamDynamicAdditiveConfigHistory));
    return local_12.GetComp();
}
const FC_AnimParamDynamicAdditiveConfigHistory& GetAnimParamDynamicAdditiveConfigHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimParamDynamicAdditiveConfigHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimParamDynamicAdditiveConfigHistory GetAnimParamDynamicAdditiveConfigHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AnimParamDynamicAdditiveConfigHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_AnimParamDynamicAdditiveConfigHistory::GetAnimParamDynamicAdditiveConfigHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AnimParamDynamicAdditiveConfigHistory GetDefaultedAnimParamDynamicAdditiveConfigHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimParamDynamicAdditiveConfigHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimParamDynamicAdditiveConfigHistory);
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
FC_AnimParamDynamicAdditiveConfigHistory GetDefaultedAnimParamDynamicAdditiveConfigHistory_BP(const FECSEntity &inout Entity)
{
    FC_AnimParamDynamicAdditiveConfigHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveAnimParamDynamicAdditiveConfigHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimParamDynamicAdditiveConfigHistory);
}
}
FECSMonitorRuntimeView __GetMonitorAnimParamDynamicAdditiveConfigHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimParamDynamicAdditiveConfigHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamDynamicAdditiveConfigHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimParamDynamicAdditiveConfigHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamDynamicAdditiveConfigHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimParamDynamicAdditiveConfigHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamDynamicAdditiveConfigHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimParamDynamicAdditiveConfigHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamDynamicAdditiveConfigHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimParamDynamicAdditiveConfigHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimParamDynamicAdditiveConfigHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimParamDynamicAdditiveConfigHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimParamDynamicAdditiveConfigHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimParamDynamicAdditiveConfigHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimParamDynamicAdditiveConfigHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimParamDynamicAdditiveConfigHistory, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AnimParamDynamicAdditiveHistory
{
UFUNCTION()
bool HasAnimParamDynamicAdditiveHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimParamDynamicAdditiveHistory);
}
FC_AnimParamDynamicAdditiveHistory& AssignAnimParamDynamicAdditiveHistory(const FECSEntity &inout Entity, const FC_AnimParamDynamicAdditiveHistory &inout DefaultValue = FC_AnimParamDynamicAdditiveHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimParamDynamicAdditiveHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimParamDynamicAdditiveHistory_BP(const FECSEntity &inout Entity, const FC_AnimParamDynamicAdditiveHistory &inout DefaultValue = FC_AnimParamDynamicAdditiveHistory())
{
    ECSFunc_FC_AnimParamDynamicAdditiveHistory::AssignAnimParamDynamicAdditiveHistory(Entity, DefaultValue);
    return;
}
FC_AnimParamDynamicAdditiveHistory& ModifyAnimParamDynamicAdditiveHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimParamDynamicAdditiveHistory));
    return local_12.GetComp();
}
FC_AnimParamDynamicAdditiveHistory& ModifyOrAddAnimParamDynamicAdditiveHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimParamDynamicAdditiveHistory));
    return local_12.GetComp();
}
const FC_AnimParamDynamicAdditiveHistory& GetAnimParamDynamicAdditiveHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimParamDynamicAdditiveHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimParamDynamicAdditiveHistory GetAnimParamDynamicAdditiveHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AnimParamDynamicAdditiveHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_AnimParamDynamicAdditiveHistory::GetAnimParamDynamicAdditiveHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AnimParamDynamicAdditiveHistory GetDefaultedAnimParamDynamicAdditiveHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimParamDynamicAdditiveHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimParamDynamicAdditiveHistory);
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
FC_AnimParamDynamicAdditiveHistory GetDefaultedAnimParamDynamicAdditiveHistory_BP(const FECSEntity &inout Entity)
{
    FC_AnimParamDynamicAdditiveHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveAnimParamDynamicAdditiveHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimParamDynamicAdditiveHistory);
}
}
FECSMonitorRuntimeView __GetMonitorAnimParamDynamicAdditiveHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimParamDynamicAdditiveHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamDynamicAdditiveHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimParamDynamicAdditiveHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamDynamicAdditiveHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimParamDynamicAdditiveHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamDynamicAdditiveHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimParamDynamicAdditiveHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimParamDynamicAdditiveHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimParamDynamicAdditiveHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimParamDynamicAdditiveHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimParamDynamicAdditiveHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimParamDynamicAdditiveHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimParamDynamicAdditiveHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimParamDynamicAdditiveHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimParamDynamicAdditiveHistory, bFixedFrame, Details);
    return;
}
