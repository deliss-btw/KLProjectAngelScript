
enum ECombatSessionEndReason
{
    None,
    ExitCombat,
    Death,
    EntityInvalid,
}

namespace __INTENRAL_FC_CombatState_NS
{
    const TECSComponentDerivedPtr<FC_CombatState> DerivedPtr = TECSComponentDerivedPtr<FC_CombatState>();
    const FC_CombatState DefaultValue = FC_CombatState();
}
namespace __INTENRAL_FC_CombatStateUncontrollableTag_NS
{
    const TECSComponentDerivedPtr<FC_CombatStateUncontrollableTag> DerivedPtr = TECSComponentDerivedPtr<FC_CombatStateUncontrollableTag>();
    const FC_CombatStateUncontrollableTag DefaultValue = FC_CombatStateUncontrollableTag();
}
namespace __INTENRAL_FC_PlayerCombatState_NS
{
    const TECSComponentDerivedPtr<FC_PlayerCombatState> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerCombatState>();
    const FC_PlayerCombatState DefaultValue = FC_PlayerCombatState();
}
namespace __INTENRAL_FCS_CombatStateGlobal_NS
{
    const TECSComponentDerivedPtr<FCS_CombatStateGlobal> DerivedPtr = TECSComponentDerivedPtr<FCS_CombatStateGlobal>();
    const FCS_CombatStateGlobal DefaultValue = FCS_CombatStateGlobal();

}
struct FCombatSession
{
    UPROPERTY()
    uint SessionID = 0;
    UPROPERTY()
    FFPTime EnterCombatTime;
    UPROPERTY()
    FFPTime ExitCombatTime;
    UPROPERTY()
    FFPTime FirstDamageTime;
    UPROPERTY()
    float32 UncontrollableDuration = 0.0f;
    UPROPERTY()
    ECombatSessionEndReason EndReason = ECombatSessionEndReason(0);


}

struct FBossCombatSessionInfo : FCombatSession
{
    FCombatSession _base_FCombatSession;
    UPROPERTY()
    uint BossId = 0;
    UPROPERTY()
    uint BossInstanceId = 0;


}

struct FC_CombatState : FECSComponent
{
    UPROPERTY()
    bool bInCombat = false;
    UPROPERTY()
    float32 LastHPOnEnterCombat = 0.0f;
    UPROPERTY()
    float32 LastHPMaxOnEnterCombat = 0.0f;
    UPROPERTY()
    FCombatSession SelfCombatSession;
    UPROPERTY()
    TMap<FECSEntityId, FBossCombatSessionInfo> BossCombatSessions;


}

struct FC_CombatStateUncontrollableTag : FECSComponent
{
    FC_CombatStateUncontrollableTag()
    {
        return;
    }
}

struct FC_PlayerCombatState : FECSComponent
{
    UPROPERTY()
    FCombatSession SelfCombatSession;
    UPROPERTY()
    TMap<FECSEntityId, FCombatSession> BossCombatSessions;

    FC_PlayerCombatState()
    {
        return;
    }
}

struct FCS_CombatStateGlobal : FECSSingleton
{
    UPROPERTY()
    uint SessionIDCount = 0;


}

namespace ECSFunc_FC_CombatState
{
UFUNCTION()
bool HasCombatState(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CombatState);
}
FC_CombatState& AssignCombatState(const FECSEntity &inout Entity, const FC_CombatState &inout DefaultValue = FC_CombatState())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CombatState, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCombatState_BP(const FECSEntity &inout Entity, const FC_CombatState &inout DefaultValue = FC_CombatState())
{
    ECSFunc_FC_CombatState::AssignCombatState(Entity, DefaultValue);
    return;
}
FC_CombatState& ModifyCombatState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CombatState));
    return local_12.GetComp();
}
FC_CombatState& ModifyOrAddCombatState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CombatState));
    return local_12.GetComp();
}
const FC_CombatState& GetCombatState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CombatState));
    return local_12.GetComp();
}
UFUNCTION()
FC_CombatState GetCombatState_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CombatState __r;
    bValid = false;
    bValid = ECSFunc_FC_CombatState::GetCombatState(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CombatState GetDefaultedCombatState(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CombatState __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CombatState);
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
FC_CombatState GetDefaultedCombatState_BP(const FECSEntity &inout Entity)
{
    FC_CombatState __r;
    return __r;
}
UFUNCTION()
bool RemoveCombatState(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CombatState);
}
}
FECSMonitorRuntimeView __GetMonitorCombatStateOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CombatState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatStateOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CombatState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatStateOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CombatState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatStateOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CombatState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatStateOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CombatState, bFixedFrame, bMustHandleAll);
}
void __MonitorCombatStateLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CombatState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatStateActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CombatState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatStateModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CombatState, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CombatStateUncontrollableTag
{
UFUNCTION()
bool HasCombatStateUncontrollableTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CombatStateUncontrollableTag);
}
FC_CombatStateUncontrollableTag& AssignCombatStateUncontrollableTag(const FECSEntity &inout Entity, const FC_CombatStateUncontrollableTag &inout DefaultValue = FC_CombatStateUncontrollableTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CombatStateUncontrollableTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCombatStateUncontrollableTag_BP(const FECSEntity &inout Entity, const FC_CombatStateUncontrollableTag &inout DefaultValue = FC_CombatStateUncontrollableTag())
{
    ECSFunc_FC_CombatStateUncontrollableTag::AssignCombatStateUncontrollableTag(Entity, DefaultValue);
    return;
}
FC_CombatStateUncontrollableTag& ModifyCombatStateUncontrollableTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CombatStateUncontrollableTag));
    return local_12.GetComp();
}
FC_CombatStateUncontrollableTag& ModifyOrAddCombatStateUncontrollableTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CombatStateUncontrollableTag));
    return local_12.GetComp();
}
const FC_CombatStateUncontrollableTag& GetCombatStateUncontrollableTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CombatStateUncontrollableTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_CombatStateUncontrollableTag GetCombatStateUncontrollableTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CombatStateUncontrollableTag& local_4 = ECSFunc_FC_CombatStateUncontrollableTag::GetCombatStateUncontrollableTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CombatStateUncontrollableTag();
}
const FC_CombatStateUncontrollableTag GetDefaultedCombatStateUncontrollableTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CombatStateUncontrollableTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CombatStateUncontrollableTag);
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
FC_CombatStateUncontrollableTag GetDefaultedCombatStateUncontrollableTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CombatStateUncontrollableTag::GetDefaultedCombatStateUncontrollableTag(Entity);
}
UFUNCTION()
bool RemoveCombatStateUncontrollableTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CombatStateUncontrollableTag);
}
}
FECSMonitorRuntimeView __GetMonitorCombatStateUncontrollableTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CombatStateUncontrollableTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatStateUncontrollableTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CombatStateUncontrollableTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatStateUncontrollableTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CombatStateUncontrollableTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatStateUncontrollableTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CombatStateUncontrollableTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatStateUncontrollableTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CombatStateUncontrollableTag, bFixedFrame, bMustHandleAll);
}
void __MonitorCombatStateUncontrollableTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CombatStateUncontrollableTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatStateUncontrollableTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CombatStateUncontrollableTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatStateUncontrollableTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CombatStateUncontrollableTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PlayerCombatState
{
UFUNCTION()
bool HasPlayerCombatState(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerCombatState);
}
FC_PlayerCombatState& AssignPlayerCombatState(const FECSEntity &inout Entity, const FC_PlayerCombatState &inout DefaultValue = FC_PlayerCombatState())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerCombatState, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerCombatState_BP(const FECSEntity &inout Entity, const FC_PlayerCombatState &inout DefaultValue = FC_PlayerCombatState())
{
    ECSFunc_FC_PlayerCombatState::AssignPlayerCombatState(Entity, DefaultValue);
    return;
}
FC_PlayerCombatState& ModifyPlayerCombatState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerCombatState));
    return local_12.GetComp();
}
FC_PlayerCombatState& ModifyOrAddPlayerCombatState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerCombatState));
    return local_12.GetComp();
}
const FC_PlayerCombatState& GetPlayerCombatState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerCombatState));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerCombatState GetPlayerCombatState_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PlayerCombatState __r;
    bValid = false;
    bValid = ECSFunc_FC_PlayerCombatState::GetPlayerCombatState(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PlayerCombatState GetDefaultedPlayerCombatState(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerCombatState __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerCombatState);
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
FC_PlayerCombatState GetDefaultedPlayerCombatState_BP(const FECSEntity &inout Entity)
{
    FC_PlayerCombatState __r;
    return __r;
}
UFUNCTION()
bool RemovePlayerCombatState(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerCombatState);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerCombatStateOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerCombatState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerCombatStateOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerCombatState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerCombatStateOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerCombatState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerCombatStateOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerCombatState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerCombatStateOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerCombatState, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerCombatStateLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerCombatState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerCombatStateActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerCombatState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerCombatStateModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerCombatState, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_CombatStateGlobal
{
UFUNCTION()
bool HasCombatStateGlobal(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_CombatStateGlobal);
}
FCS_CombatStateGlobal& AssignCombatStateGlobal(const FECSWorldPtr &inout World, const FCS_CombatStateGlobal &inout DefaultValue = FCS_CombatStateGlobal())
{
    UScriptStruct local_6 = FCS_CombatStateGlobal;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignCombatStateGlobal_BP(const FECSWorldPtr &inout World, const FCS_CombatStateGlobal &inout DefaultValue = FCS_CombatStateGlobal())
{
    ECSFunc_FCS_CombatStateGlobal::AssignCombatStateGlobal(World, DefaultValue);
    return;
}
FCS_CombatStateGlobal& ModifyCombatStateGlobal(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CombatStateGlobal;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_CombatStateGlobal& ModifyOrAddCombatStateGlobal(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CombatStateGlobal;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_CombatStateGlobal& GetCombatStateGlobal(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CombatStateGlobal;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_CombatStateGlobal GetCombatStateGlobal_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_CombatStateGlobal& local_4 = ECSFunc_FCS_CombatStateGlobal::GetCombatStateGlobal(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_CombatStateGlobal();
}
const FCS_CombatStateGlobal GetDefaultedCombatStateGlobal(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_CombatStateGlobal __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_CombatStateGlobal);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_CombatStateGlobal GetDefaultedCombatStateGlobal_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_CombatStateGlobal::GetDefaultedCombatStateGlobal(World);
}
UFUNCTION()
bool RemoveCombatStateGlobal(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_CombatStateGlobal);
}
}
void __MonitorCombatStateGlobalLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_CombatStateGlobal, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatStateGlobalActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_CombatStateGlobal, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatStateGlobalModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_CombatStateGlobal, bFixedFrame, Details);
    return;
}
