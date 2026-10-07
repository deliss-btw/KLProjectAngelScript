
namespace __INTENRAL_FC_FlowerWhipToxicLookHistory_NS
{
    const TECSComponentDerivedPtr<FC_FlowerWhipToxicLookHistory> DerivedPtr = TECSComponentDerivedPtr<FC_FlowerWhipToxicLookHistory>();
    const FC_FlowerWhipToxicLookHistory DefaultValue = FC_FlowerWhipToxicLookHistory();

}
struct FC_FlowerWhipToxicLookHistory : FECSComponent
{
    TInterpoHistory<FC_FlowerWhipToxicLook, auto> History;

    FC_FlowerWhipToxicLookHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_FlowerWhipToxicLook &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_FlowerWhipToxicLook>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_FlowerWhipToxicLook &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_FlowerWhipToxicLookHistory
{
UFUNCTION()
bool HasFlowerWhipToxicLookHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_FlowerWhipToxicLookHistory);
}
FC_FlowerWhipToxicLookHistory& AssignFlowerWhipToxicLookHistory(const FECSEntity &inout Entity, const FC_FlowerWhipToxicLookHistory &inout DefaultValue = FC_FlowerWhipToxicLookHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_FlowerWhipToxicLookHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignFlowerWhipToxicLookHistory_BP(const FECSEntity &inout Entity, const FC_FlowerWhipToxicLookHistory &inout DefaultValue = FC_FlowerWhipToxicLookHistory())
{
    ECSFunc_FC_FlowerWhipToxicLookHistory::AssignFlowerWhipToxicLookHistory(Entity, DefaultValue);
    return;
}
FC_FlowerWhipToxicLookHistory& ModifyFlowerWhipToxicLookHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_FlowerWhipToxicLookHistory));
    return local_12.GetComp();
}
FC_FlowerWhipToxicLookHistory& ModifyOrAddFlowerWhipToxicLookHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_FlowerWhipToxicLookHistory));
    return local_12.GetComp();
}
const FC_FlowerWhipToxicLookHistory& GetFlowerWhipToxicLookHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_FlowerWhipToxicLookHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_FlowerWhipToxicLookHistory GetFlowerWhipToxicLookHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_FlowerWhipToxicLookHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_FlowerWhipToxicLookHistory::GetFlowerWhipToxicLookHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_FlowerWhipToxicLookHistory GetDefaultedFlowerWhipToxicLookHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_FlowerWhipToxicLookHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_FlowerWhipToxicLookHistory);
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
FC_FlowerWhipToxicLookHistory GetDefaultedFlowerWhipToxicLookHistory_BP(const FECSEntity &inout Entity)
{
    FC_FlowerWhipToxicLookHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveFlowerWhipToxicLookHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_FlowerWhipToxicLookHistory);
}
}
FECSMonitorRuntimeView __GetMonitorFlowerWhipToxicLookHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_FlowerWhipToxicLookHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFlowerWhipToxicLookHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_FlowerWhipToxicLookHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFlowerWhipToxicLookHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_FlowerWhipToxicLookHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFlowerWhipToxicLookHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_FlowerWhipToxicLookHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFlowerWhipToxicLookHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_FlowerWhipToxicLookHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorFlowerWhipToxicLookHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_FlowerWhipToxicLookHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFlowerWhipToxicLookHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_FlowerWhipToxicLookHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFlowerWhipToxicLookHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_FlowerWhipToxicLookHistory, bFixedFrame, Details);
    return;
}
