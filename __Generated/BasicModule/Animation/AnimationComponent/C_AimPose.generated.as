
namespace __INTENRAL_FC_AimPoseConfigHistory_NS
{
    const TECSComponentDerivedPtr<FC_AimPoseConfigHistory> DerivedPtr = TECSComponentDerivedPtr<FC_AimPoseConfigHistory>();
    const FC_AimPoseConfigHistory DefaultValue = FC_AimPoseConfigHistory();
}
namespace __INTENRAL_FC_AnimAimPoseOutputHistory_NS
{
    const TECSComponentDerivedPtr<FC_AnimAimPoseOutputHistory> DerivedPtr = TECSComponentDerivedPtr<FC_AnimAimPoseOutputHistory>();
    const FC_AnimAimPoseOutputHistory DefaultValue = FC_AnimAimPoseOutputHistory();

}
struct FC_AimPoseConfigHistory : FECSComponent
{
    TInterpoHistory<FC_AimPoseConfig, auto> History;

    FC_AimPoseConfigHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_AimPoseConfig &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_AimPoseConfig>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_AimPoseConfig &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

struct FC_AnimAimPoseOutputHistory : FECSComponent
{
    TInterpoHistory<FC_AnimAimPoseOutput, auto> History;

    FC_AnimAimPoseOutputHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_AnimAimPoseOutput &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_AnimAimPoseOutput>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_AnimAimPoseOutput &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_AimPoseConfigHistory
{
UFUNCTION()
bool HasAimPoseConfigHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AimPoseConfigHistory);
}
FC_AimPoseConfigHistory& AssignAimPoseConfigHistory(const FECSEntity &inout Entity, const FC_AimPoseConfigHistory &inout DefaultValue = FC_AimPoseConfigHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AimPoseConfigHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAimPoseConfigHistory_BP(const FECSEntity &inout Entity, const FC_AimPoseConfigHistory &inout DefaultValue = FC_AimPoseConfigHistory())
{
    ECSFunc_FC_AimPoseConfigHistory::AssignAimPoseConfigHistory(Entity, DefaultValue);
    return;
}
FC_AimPoseConfigHistory& ModifyAimPoseConfigHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AimPoseConfigHistory));
    return local_12.GetComp();
}
FC_AimPoseConfigHistory& ModifyOrAddAimPoseConfigHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AimPoseConfigHistory));
    return local_12.GetComp();
}
const FC_AimPoseConfigHistory& GetAimPoseConfigHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AimPoseConfigHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_AimPoseConfigHistory GetAimPoseConfigHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AimPoseConfigHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_AimPoseConfigHistory::GetAimPoseConfigHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AimPoseConfigHistory GetDefaultedAimPoseConfigHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AimPoseConfigHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AimPoseConfigHistory);
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
FC_AimPoseConfigHistory GetDefaultedAimPoseConfigHistory_BP(const FECSEntity &inout Entity)
{
    FC_AimPoseConfigHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveAimPoseConfigHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AimPoseConfigHistory);
}
}
FECSMonitorRuntimeView __GetMonitorAimPoseConfigHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AimPoseConfigHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAimPoseConfigHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AimPoseConfigHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAimPoseConfigHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AimPoseConfigHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAimPoseConfigHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AimPoseConfigHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAimPoseConfigHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AimPoseConfigHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorAimPoseConfigHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AimPoseConfigHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAimPoseConfigHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AimPoseConfigHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAimPoseConfigHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AimPoseConfigHistory, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AnimAimPoseOutputHistory
{
UFUNCTION()
bool HasAnimAimPoseOutputHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimAimPoseOutputHistory);
}
FC_AnimAimPoseOutputHistory& AssignAnimAimPoseOutputHistory(const FECSEntity &inout Entity, const FC_AnimAimPoseOutputHistory &inout DefaultValue = FC_AnimAimPoseOutputHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimAimPoseOutputHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimAimPoseOutputHistory_BP(const FECSEntity &inout Entity, const FC_AnimAimPoseOutputHistory &inout DefaultValue = FC_AnimAimPoseOutputHistory())
{
    ECSFunc_FC_AnimAimPoseOutputHistory::AssignAnimAimPoseOutputHistory(Entity, DefaultValue);
    return;
}
FC_AnimAimPoseOutputHistory& ModifyAnimAimPoseOutputHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimAimPoseOutputHistory));
    return local_12.GetComp();
}
FC_AnimAimPoseOutputHistory& ModifyOrAddAnimAimPoseOutputHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimAimPoseOutputHistory));
    return local_12.GetComp();
}
const FC_AnimAimPoseOutputHistory& GetAnimAimPoseOutputHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimAimPoseOutputHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimAimPoseOutputHistory GetAnimAimPoseOutputHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AnimAimPoseOutputHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_AnimAimPoseOutputHistory::GetAnimAimPoseOutputHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AnimAimPoseOutputHistory GetDefaultedAnimAimPoseOutputHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimAimPoseOutputHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimAimPoseOutputHistory);
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
FC_AnimAimPoseOutputHistory GetDefaultedAnimAimPoseOutputHistory_BP(const FECSEntity &inout Entity)
{
    FC_AnimAimPoseOutputHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveAnimAimPoseOutputHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimAimPoseOutputHistory);
}
}
FECSMonitorRuntimeView __GetMonitorAnimAimPoseOutputHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimAimPoseOutputHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimAimPoseOutputHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimAimPoseOutputHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimAimPoseOutputHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimAimPoseOutputHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimAimPoseOutputHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimAimPoseOutputHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimAimPoseOutputHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimAimPoseOutputHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimAimPoseOutputHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimAimPoseOutputHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimAimPoseOutputHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimAimPoseOutputHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimAimPoseOutputHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimAimPoseOutputHistory, bFixedFrame, Details);
    return;
}
