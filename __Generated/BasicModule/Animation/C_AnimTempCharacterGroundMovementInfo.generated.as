
namespace __INTENRAL_FC_CharacterGroundMovementInfoHistory_NS
{
    const TECSComponentDerivedPtr<FC_CharacterGroundMovementInfoHistory> DerivedPtr = TECSComponentDerivedPtr<FC_CharacterGroundMovementInfoHistory>();
    const FC_CharacterGroundMovementInfoHistory DefaultValue = FC_CharacterGroundMovementInfoHistory();

}
struct FC_CharacterGroundMovementInfoHistory : FECSComponent
{
    TInterpoHistory<FC_CharacterGroundMovementInfo, auto> History;

    FC_CharacterGroundMovementInfoHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_CharacterGroundMovementInfo &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_CharacterGroundMovementInfo>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_CharacterGroundMovementInfo &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_CharacterGroundMovementInfoHistory
{
UFUNCTION()
bool HasCharacterGroundMovementInfoHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CharacterGroundMovementInfoHistory);
}
FC_CharacterGroundMovementInfoHistory& AssignCharacterGroundMovementInfoHistory(const FECSEntity &inout Entity, const FC_CharacterGroundMovementInfoHistory &inout DefaultValue = FC_CharacterGroundMovementInfoHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CharacterGroundMovementInfoHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCharacterGroundMovementInfoHistory_BP(const FECSEntity &inout Entity, const FC_CharacterGroundMovementInfoHistory &inout DefaultValue = FC_CharacterGroundMovementInfoHistory())
{
    ECSFunc_FC_CharacterGroundMovementInfoHistory::AssignCharacterGroundMovementInfoHistory(Entity, DefaultValue);
    return;
}
FC_CharacterGroundMovementInfoHistory& ModifyCharacterGroundMovementInfoHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CharacterGroundMovementInfoHistory));
    return local_12.GetComp();
}
FC_CharacterGroundMovementInfoHistory& ModifyOrAddCharacterGroundMovementInfoHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CharacterGroundMovementInfoHistory));
    return local_12.GetComp();
}
const FC_CharacterGroundMovementInfoHistory& GetCharacterGroundMovementInfoHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CharacterGroundMovementInfoHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_CharacterGroundMovementInfoHistory GetCharacterGroundMovementInfoHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CharacterGroundMovementInfoHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_CharacterGroundMovementInfoHistory::GetCharacterGroundMovementInfoHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CharacterGroundMovementInfoHistory GetDefaultedCharacterGroundMovementInfoHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CharacterGroundMovementInfoHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CharacterGroundMovementInfoHistory);
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
FC_CharacterGroundMovementInfoHistory GetDefaultedCharacterGroundMovementInfoHistory_BP(const FECSEntity &inout Entity)
{
    FC_CharacterGroundMovementInfoHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveCharacterGroundMovementInfoHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CharacterGroundMovementInfoHistory);
}
}
FECSMonitorRuntimeView __GetMonitorCharacterGroundMovementInfoHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CharacterGroundMovementInfoHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterGroundMovementInfoHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CharacterGroundMovementInfoHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterGroundMovementInfoHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CharacterGroundMovementInfoHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterGroundMovementInfoHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CharacterGroundMovementInfoHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterGroundMovementInfoHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CharacterGroundMovementInfoHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorCharacterGroundMovementInfoHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CharacterGroundMovementInfoHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCharacterGroundMovementInfoHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CharacterGroundMovementInfoHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCharacterGroundMovementInfoHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CharacterGroundMovementInfoHistory, bFixedFrame, Details);
    return;
}
