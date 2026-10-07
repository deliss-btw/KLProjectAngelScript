
namespace __INTENRAL_FC_FootIKControlHistory_NS
{
    const TECSComponentDerivedPtr<FC_FootIKControlHistory> DerivedPtr = TECSComponentDerivedPtr<FC_FootIKControlHistory>();
    const FC_FootIKControlHistory DefaultValue = FC_FootIKControlHistory();

}
struct FC_FootIKControlHistory : FECSComponent
{
    TInterpoHistory<FC_FootIKControl, auto> History;

    FC_FootIKControlHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_FootIKControl &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_FootIKControl>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_FootIKControl &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_FootIKControlHistory
{
UFUNCTION()
bool HasFootIKControlHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_FootIKControlHistory);
}
FC_FootIKControlHistory& AssignFootIKControlHistory(const FECSEntity &inout Entity, const FC_FootIKControlHistory &inout DefaultValue = FC_FootIKControlHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_FootIKControlHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignFootIKControlHistory_BP(const FECSEntity &inout Entity, const FC_FootIKControlHistory &inout DefaultValue = FC_FootIKControlHistory())
{
    ECSFunc_FC_FootIKControlHistory::AssignFootIKControlHistory(Entity, DefaultValue);
    return;
}
FC_FootIKControlHistory& ModifyFootIKControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_FootIKControlHistory));
    return local_12.GetComp();
}
FC_FootIKControlHistory& ModifyOrAddFootIKControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_FootIKControlHistory));
    return local_12.GetComp();
}
const FC_FootIKControlHistory& GetFootIKControlHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_FootIKControlHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_FootIKControlHistory GetFootIKControlHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_FootIKControlHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_FootIKControlHistory::GetFootIKControlHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_FootIKControlHistory GetDefaultedFootIKControlHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_FootIKControlHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_FootIKControlHistory);
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
FC_FootIKControlHistory GetDefaultedFootIKControlHistory_BP(const FECSEntity &inout Entity)
{
    FC_FootIKControlHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveFootIKControlHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_FootIKControlHistory);
}
}
FECSMonitorRuntimeView __GetMonitorFootIKControlHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_FootIKControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFootIKControlHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_FootIKControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFootIKControlHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_FootIKControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFootIKControlHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_FootIKControlHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFootIKControlHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_FootIKControlHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorFootIKControlHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_FootIKControlHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFootIKControlHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_FootIKControlHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFootIKControlHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_FootIKControlHistory, bFixedFrame, Details);
    return;
}
