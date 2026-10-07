
namespace __INTENRAL_FC_LayeredBlendMaskHistory_NS
{
    const TECSComponentDerivedPtr<FC_LayeredBlendMaskHistory> DerivedPtr = TECSComponentDerivedPtr<FC_LayeredBlendMaskHistory>();
    const FC_LayeredBlendMaskHistory DefaultValue = FC_LayeredBlendMaskHistory();

}
struct FC_LayeredBlendMaskHistory : FECSComponent
{
    TInterpoHistory<FC_LayeredBlendMask, auto> History;

    FC_LayeredBlendMaskHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_LayeredBlendMask &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_LayeredBlendMask>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_LayeredBlendMask &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_LayeredBlendMaskHistory
{
UFUNCTION()
bool HasLayeredBlendMaskHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LayeredBlendMaskHistory);
}
FC_LayeredBlendMaskHistory& AssignLayeredBlendMaskHistory(const FECSEntity &inout Entity, const FC_LayeredBlendMaskHistory &inout DefaultValue = FC_LayeredBlendMaskHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LayeredBlendMaskHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLayeredBlendMaskHistory_BP(const FECSEntity &inout Entity, const FC_LayeredBlendMaskHistory &inout DefaultValue = FC_LayeredBlendMaskHistory())
{
    ECSFunc_FC_LayeredBlendMaskHistory::AssignLayeredBlendMaskHistory(Entity, DefaultValue);
    return;
}
FC_LayeredBlendMaskHistory& ModifyLayeredBlendMaskHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LayeredBlendMaskHistory));
    return local_12.GetComp();
}
FC_LayeredBlendMaskHistory& ModifyOrAddLayeredBlendMaskHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LayeredBlendMaskHistory));
    return local_12.GetComp();
}
const FC_LayeredBlendMaskHistory& GetLayeredBlendMaskHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LayeredBlendMaskHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_LayeredBlendMaskHistory GetLayeredBlendMaskHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_LayeredBlendMaskHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_LayeredBlendMaskHistory::GetLayeredBlendMaskHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_LayeredBlendMaskHistory GetDefaultedLayeredBlendMaskHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LayeredBlendMaskHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LayeredBlendMaskHistory);
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
FC_LayeredBlendMaskHistory GetDefaultedLayeredBlendMaskHistory_BP(const FECSEntity &inout Entity)
{
    FC_LayeredBlendMaskHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveLayeredBlendMaskHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LayeredBlendMaskHistory);
}
}
FECSMonitorRuntimeView __GetMonitorLayeredBlendMaskHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LayeredBlendMaskHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLayeredBlendMaskHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LayeredBlendMaskHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLayeredBlendMaskHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LayeredBlendMaskHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLayeredBlendMaskHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LayeredBlendMaskHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLayeredBlendMaskHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LayeredBlendMaskHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorLayeredBlendMaskHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LayeredBlendMaskHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLayeredBlendMaskHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LayeredBlendMaskHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLayeredBlendMaskHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LayeredBlendMaskHistory, bFixedFrame, Details);
    return;
}
