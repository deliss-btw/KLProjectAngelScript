
namespace __INTENRAL_FC_AnimMoveParamsHistory_NS
{
    const TECSComponentDerivedPtr<FC_AnimMoveParamsHistory> DerivedPtr = TECSComponentDerivedPtr<FC_AnimMoveParamsHistory>();
    const FC_AnimMoveParamsHistory DefaultValue = FC_AnimMoveParamsHistory();
}
namespace __INTENRAL_FC_AnimMoveParamsTempHistory_NS
{
    const TECSComponentDerivedPtr<FC_AnimMoveParamsTempHistory> DerivedPtr = TECSComponentDerivedPtr<FC_AnimMoveParamsTempHistory>();
    const FC_AnimMoveParamsTempHistory DefaultValue = FC_AnimMoveParamsTempHistory();

}
struct FC_AnimMoveParamsHistory : FECSComponent
{
    TInterpoHistory<FC_AnimMoveParams, auto> History;

    FC_AnimMoveParamsHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_AnimMoveParams &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_AnimMoveParams>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_AnimMoveParams &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

struct FC_AnimMoveParamsTempHistory : FECSComponent
{
    TInterpoHistory<FC_AnimMoveParamsTemp, auto> History;

    FC_AnimMoveParamsTempHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_AnimMoveParamsTemp &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_AnimMoveParamsTemp>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_AnimMoveParamsTemp &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_AnimMoveParamsHistory
{
UFUNCTION()
bool HasAnimMoveParamsHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimMoveParamsHistory);
}
FC_AnimMoveParamsHistory& AssignAnimMoveParamsHistory(const FECSEntity &inout Entity, const FC_AnimMoveParamsHistory &inout DefaultValue = FC_AnimMoveParamsHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimMoveParamsHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimMoveParamsHistory_BP(const FECSEntity &inout Entity, const FC_AnimMoveParamsHistory &inout DefaultValue = FC_AnimMoveParamsHistory())
{
    ECSFunc_FC_AnimMoveParamsHistory::AssignAnimMoveParamsHistory(Entity, DefaultValue);
    return;
}
FC_AnimMoveParamsHistory& ModifyAnimMoveParamsHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimMoveParamsHistory));
    return local_12.GetComp();
}
FC_AnimMoveParamsHistory& ModifyOrAddAnimMoveParamsHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimMoveParamsHistory));
    return local_12.GetComp();
}
const FC_AnimMoveParamsHistory& GetAnimMoveParamsHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimMoveParamsHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimMoveParamsHistory GetAnimMoveParamsHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AnimMoveParamsHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_AnimMoveParamsHistory::GetAnimMoveParamsHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AnimMoveParamsHistory GetDefaultedAnimMoveParamsHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimMoveParamsHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimMoveParamsHistory);
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
FC_AnimMoveParamsHistory GetDefaultedAnimMoveParamsHistory_BP(const FECSEntity &inout Entity)
{
    FC_AnimMoveParamsHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveAnimMoveParamsHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimMoveParamsHistory);
}
}
FECSMonitorRuntimeView __GetMonitorAnimMoveParamsHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimMoveParamsHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimMoveParamsHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimMoveParamsHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimMoveParamsHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimMoveParamsHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimMoveParamsHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimMoveParamsHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimMoveParamsHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimMoveParamsHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimMoveParamsHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimMoveParamsHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimMoveParamsHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimMoveParamsHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimMoveParamsHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimMoveParamsHistory, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AnimMoveParamsTempHistory
{
UFUNCTION()
bool HasAnimMoveParamsTempHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimMoveParamsTempHistory);
}
FC_AnimMoveParamsTempHistory& AssignAnimMoveParamsTempHistory(const FECSEntity &inout Entity, const FC_AnimMoveParamsTempHistory &inout DefaultValue = FC_AnimMoveParamsTempHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimMoveParamsTempHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimMoveParamsTempHistory_BP(const FECSEntity &inout Entity, const FC_AnimMoveParamsTempHistory &inout DefaultValue = FC_AnimMoveParamsTempHistory())
{
    ECSFunc_FC_AnimMoveParamsTempHistory::AssignAnimMoveParamsTempHistory(Entity, DefaultValue);
    return;
}
FC_AnimMoveParamsTempHistory& ModifyAnimMoveParamsTempHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimMoveParamsTempHistory));
    return local_12.GetComp();
}
FC_AnimMoveParamsTempHistory& ModifyOrAddAnimMoveParamsTempHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimMoveParamsTempHistory));
    return local_12.GetComp();
}
const FC_AnimMoveParamsTempHistory& GetAnimMoveParamsTempHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimMoveParamsTempHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimMoveParamsTempHistory GetAnimMoveParamsTempHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AnimMoveParamsTempHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_AnimMoveParamsTempHistory::GetAnimMoveParamsTempHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AnimMoveParamsTempHistory GetDefaultedAnimMoveParamsTempHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimMoveParamsTempHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimMoveParamsTempHistory);
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
FC_AnimMoveParamsTempHistory GetDefaultedAnimMoveParamsTempHistory_BP(const FECSEntity &inout Entity)
{
    FC_AnimMoveParamsTempHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveAnimMoveParamsTempHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimMoveParamsTempHistory);
}
}
FECSMonitorRuntimeView __GetMonitorAnimMoveParamsTempHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimMoveParamsTempHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimMoveParamsTempHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimMoveParamsTempHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimMoveParamsTempHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimMoveParamsTempHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimMoveParamsTempHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimMoveParamsTempHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimMoveParamsTempHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimMoveParamsTempHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimMoveParamsTempHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimMoveParamsTempHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimMoveParamsTempHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimMoveParamsTempHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimMoveParamsTempHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimMoveParamsTempHistory, bFixedFrame, Details);
    return;
}
