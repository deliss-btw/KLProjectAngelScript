
namespace __INTENRAL_FC_PlayerInGameState_NS
{
    const TECSComponentDerivedPtr<FC_PlayerInGameState> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerInGameState>();
    const FC_PlayerInGameState DefaultValue = FC_PlayerInGameState();
}
namespace __INTENRAL_FC_PlayerAvatarAttributeOverride_NS
{
    const TECSComponentDerivedPtr<FC_PlayerAvatarAttributeOverride> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerAvatarAttributeOverride>();
    const FC_PlayerAvatarAttributeOverride DefaultValue = FC_PlayerAvatarAttributeOverride();
}
namespace __INTENRAL_FC_PlayerEnterDSTime_NS
{
    const TECSComponentDerivedPtr<FC_PlayerEnterDSTime> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerEnterDSTime>();
    const FC_PlayerEnterDSTime DefaultValue = FC_PlayerEnterDSTime();
}
namespace __INTENRAL_FCE_PlayerLevelUpdateByGS_NS
{
    const TECSEventDerivedPtr<FCE_PlayerLevelUpdateByGS> DerivedPtr = TECSEventDerivedPtr<FCE_PlayerLevelUpdateByGS>();
}
namespace __INTENRAL_FCE_PlayerLevelChange_NS
{
    const TECSEventDerivedPtr<FCE_PlayerLevelChange> DerivedPtr = TECSEventDerivedPtr<FCE_PlayerLevelChange>();

}
struct FC_PlayerInGameState : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_CurLevel;

    FC_PlayerInGameState()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_PlayerInGameState(const FC_PlayerInGameState &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_PlayerInGameState opAssign(const FC_PlayerInGameState &inout Other)
    {
        FC_PlayerInGameState __r;
        this.SetCurLevel(Other.GetCurLevel());
        return __r;
    }
    int GetCurLevel() const property
    {
        return this.m_CurLevel;
    }
    void SetCurLevel(const int __Value) property
    {
        if (this.m_CurLevel == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_CurLevel = __Value;
        return;
    }
}

struct FCE_PlayerLevelUpdateByGS : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    int NewLevel;
    UPROPERTY()
    int NewExp;


}

struct FCE_PlayerLevelChange : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    int NewLevel;


}

struct FC_PlayerAvatarAttributeOverride : FECSComponent
{
    UPROPERTY()
    TMap<uint, TDataObjectPtr<FGameAttributeInitConfig_Avatar>> AtrributeInitConfigByAvatarId;

    FC_PlayerAvatarAttributeOverride()
    {
        return;
    }
}

struct FC_PlayerEnterDSTime : FECSComponent
{
    UPROPERTY()
    FFPTime EnterTime;

    FC_PlayerEnterDSTime()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

namespace ECSFunc_FC_PlayerInGameState
{
UFUNCTION()
bool HasPlayerInGameState(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerInGameState);
}
FC_PlayerInGameState& AssignPlayerInGameState(const FECSEntity &inout Entity, const FC_PlayerInGameState &inout DefaultValue = FC_PlayerInGameState())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerInGameState, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerInGameState_BP(const FECSEntity &inout Entity, const FC_PlayerInGameState &inout DefaultValue = FC_PlayerInGameState())
{
    ECSFunc_FC_PlayerInGameState::AssignPlayerInGameState(Entity, DefaultValue);
    return;
}
FC_PlayerInGameState& ModifyPlayerInGameState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerInGameState));
    return local_12.GetComp();
}
FC_PlayerInGameState& ModifyOrAddPlayerInGameState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerInGameState));
    return local_12.GetComp();
}
const FC_PlayerInGameState& GetPlayerInGameState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerInGameState));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerInGameState GetPlayerInGameState_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PlayerInGameState& local_4 = ECSFunc_FC_PlayerInGameState::GetPlayerInGameState(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PlayerInGameState();
}
const FC_PlayerInGameState GetDefaultedPlayerInGameState(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerInGameState __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerInGameState);
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
FC_PlayerInGameState GetDefaultedPlayerInGameState_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PlayerInGameState::GetDefaultedPlayerInGameState(Entity);
}
UFUNCTION()
bool RemovePlayerInGameState(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerInGameState);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerInGameStateOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerInGameState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerInGameStateOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerInGameState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerInGameStateOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerInGameState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerInGameStateOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerInGameState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerInGameStateOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerInGameState, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerInGameStateLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerInGameState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerInGameStateActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerInGameState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerInGameStateModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerInGameState, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PlayerAvatarAttributeOverride
{
UFUNCTION()
bool HasPlayerAvatarAttributeOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerAvatarAttributeOverride);
}
FC_PlayerAvatarAttributeOverride& AssignPlayerAvatarAttributeOverride(const FECSEntity &inout Entity, const FC_PlayerAvatarAttributeOverride &inout DefaultValue = FC_PlayerAvatarAttributeOverride())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerAvatarAttributeOverride, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerAvatarAttributeOverride_BP(const FECSEntity &inout Entity, const FC_PlayerAvatarAttributeOverride &inout DefaultValue = FC_PlayerAvatarAttributeOverride())
{
    ECSFunc_FC_PlayerAvatarAttributeOverride::AssignPlayerAvatarAttributeOverride(Entity, DefaultValue);
    return;
}
FC_PlayerAvatarAttributeOverride& ModifyPlayerAvatarAttributeOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerAvatarAttributeOverride));
    return local_12.GetComp();
}
FC_PlayerAvatarAttributeOverride& ModifyOrAddPlayerAvatarAttributeOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerAvatarAttributeOverride));
    return local_12.GetComp();
}
const FC_PlayerAvatarAttributeOverride& GetPlayerAvatarAttributeOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerAvatarAttributeOverride));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerAvatarAttributeOverride GetPlayerAvatarAttributeOverride_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PlayerAvatarAttributeOverride __r;
    bValid = false;
    bValid = ECSFunc_FC_PlayerAvatarAttributeOverride::GetPlayerAvatarAttributeOverride(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PlayerAvatarAttributeOverride GetDefaultedPlayerAvatarAttributeOverride(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerAvatarAttributeOverride __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerAvatarAttributeOverride);
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
FC_PlayerAvatarAttributeOverride GetDefaultedPlayerAvatarAttributeOverride_BP(const FECSEntity &inout Entity)
{
    FC_PlayerAvatarAttributeOverride __r;
    return __r;
}
UFUNCTION()
bool RemovePlayerAvatarAttributeOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerAvatarAttributeOverride);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerAvatarAttributeOverrideOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerAvatarAttributeOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerAvatarAttributeOverrideOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerAvatarAttributeOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerAvatarAttributeOverrideOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerAvatarAttributeOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerAvatarAttributeOverrideOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerAvatarAttributeOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerAvatarAttributeOverrideOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerAvatarAttributeOverride, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerAvatarAttributeOverrideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerAvatarAttributeOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerAvatarAttributeOverrideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerAvatarAttributeOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerAvatarAttributeOverrideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerAvatarAttributeOverride, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PlayerEnterDSTime
{
UFUNCTION()
bool HasPlayerEnterDSTime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerEnterDSTime);
}
FC_PlayerEnterDSTime& AssignPlayerEnterDSTime(const FECSEntity &inout Entity, const FC_PlayerEnterDSTime &inout DefaultValue = FC_PlayerEnterDSTime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerEnterDSTime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerEnterDSTime_BP(const FECSEntity &inout Entity, const FC_PlayerEnterDSTime &inout DefaultValue = FC_PlayerEnterDSTime())
{
    ECSFunc_FC_PlayerEnterDSTime::AssignPlayerEnterDSTime(Entity, DefaultValue);
    return;
}
FC_PlayerEnterDSTime& ModifyPlayerEnterDSTime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerEnterDSTime));
    return local_12.GetComp();
}
FC_PlayerEnterDSTime& ModifyOrAddPlayerEnterDSTime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerEnterDSTime));
    return local_12.GetComp();
}
const FC_PlayerEnterDSTime& GetPlayerEnterDSTime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerEnterDSTime));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerEnterDSTime GetPlayerEnterDSTime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PlayerEnterDSTime __r;
    bValid = false;
    bValid = ECSFunc_FC_PlayerEnterDSTime::GetPlayerEnterDSTime(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PlayerEnterDSTime GetDefaultedPlayerEnterDSTime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerEnterDSTime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerEnterDSTime);
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
FC_PlayerEnterDSTime GetDefaultedPlayerEnterDSTime_BP(const FECSEntity &inout Entity)
{
    FC_PlayerEnterDSTime __r;
    return __r;
}
UFUNCTION()
bool RemovePlayerEnterDSTime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerEnterDSTime);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerEnterDSTimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerEnterDSTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerEnterDSTimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerEnterDSTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerEnterDSTimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerEnterDSTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerEnterDSTimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerEnterDSTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerEnterDSTimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerEnterDSTime, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerEnterDSTimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerEnterDSTime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerEnterDSTimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerEnterDSTime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerEnterDSTimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerEnterDSTime, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PlayerInGameState &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PlayerInGameState &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PlayerInGameState &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PlayerInGameState
{
int __IndexOf_CurLevel()
{
    return 0;
}
}
