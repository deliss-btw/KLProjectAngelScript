
namespace __INTENRAL_FC_CharacterFootLockInfoHistory_NS
{
    const TECSComponentDerivedPtr<FC_CharacterFootLockInfoHistory> DerivedPtr = TECSComponentDerivedPtr<FC_CharacterFootLockInfoHistory>();
    const FC_CharacterFootLockInfoHistory DefaultValue = FC_CharacterFootLockInfoHistory();

}
struct FC_CharacterFootLockInfoHistory : FECSComponent
{
    TInterpoHistory<FC_CharacterFootLockInfo, auto> History;

    FC_CharacterFootLockInfoHistory()
    {
        return;
    }
    void EnqueueAndFlush(const FC_CharacterFootLockInfo &inout Data, const FFPTime &inout FrameTime)
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
                TInterpoFrame<FC_CharacterFootLockInfo>& local_12 = local_2.PeekBack(0);
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
    bool GetInterpoValue(const FFPTime &inout WorldTime, FC_CharacterFootLockInfo &inout OutValue) const
    {
        return this.GetInterpoValue(WorldTime, OutValue);
    }
}

namespace ECSFunc_FC_CharacterFootLockInfoHistory
{
UFUNCTION()
bool HasCharacterFootLockInfoHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CharacterFootLockInfoHistory);
}
FC_CharacterFootLockInfoHistory& AssignCharacterFootLockInfoHistory(const FECSEntity &inout Entity, const FC_CharacterFootLockInfoHistory &inout DefaultValue = FC_CharacterFootLockInfoHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CharacterFootLockInfoHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCharacterFootLockInfoHistory_BP(const FECSEntity &inout Entity, const FC_CharacterFootLockInfoHistory &inout DefaultValue = FC_CharacterFootLockInfoHistory())
{
    ECSFunc_FC_CharacterFootLockInfoHistory::AssignCharacterFootLockInfoHistory(Entity, DefaultValue);
    return;
}
FC_CharacterFootLockInfoHistory& ModifyCharacterFootLockInfoHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CharacterFootLockInfoHistory));
    return local_12.GetComp();
}
FC_CharacterFootLockInfoHistory& ModifyOrAddCharacterFootLockInfoHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CharacterFootLockInfoHistory));
    return local_12.GetComp();
}
const FC_CharacterFootLockInfoHistory& GetCharacterFootLockInfoHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CharacterFootLockInfoHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_CharacterFootLockInfoHistory GetCharacterFootLockInfoHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CharacterFootLockInfoHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_CharacterFootLockInfoHistory::GetCharacterFootLockInfoHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CharacterFootLockInfoHistory GetDefaultedCharacterFootLockInfoHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CharacterFootLockInfoHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CharacterFootLockInfoHistory);
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
FC_CharacterFootLockInfoHistory GetDefaultedCharacterFootLockInfoHistory_BP(const FECSEntity &inout Entity)
{
    FC_CharacterFootLockInfoHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveCharacterFootLockInfoHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CharacterFootLockInfoHistory);
}
}
FECSMonitorRuntimeView __GetMonitorCharacterFootLockInfoHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CharacterFootLockInfoHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterFootLockInfoHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CharacterFootLockInfoHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterFootLockInfoHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CharacterFootLockInfoHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterFootLockInfoHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CharacterFootLockInfoHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterFootLockInfoHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CharacterFootLockInfoHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorCharacterFootLockInfoHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CharacterFootLockInfoHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCharacterFootLockInfoHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CharacterFootLockInfoHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCharacterFootLockInfoHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CharacterFootLockInfoHistory, bFixedFrame, Details);
    return;
}
