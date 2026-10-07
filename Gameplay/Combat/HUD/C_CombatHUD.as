
enum ECombatHUDReason
{
    None,
    InCombat,
    InLockTarget,
    InAim,
    AttackPress,
    LoadingFinish,
    HPChanged,
    StaminaChanged,
    HPStaminaMaxChanged,
    OnGetShield,
    OnGetBuff,
    OnUseItem,
    OnTeamMemberChanged,
    OnCallMouse,
    OnChangeSkillPanel,
    OnLBPSkillPanel,
    OnLBPSkillPanelInstant,
    OnPadChordAction,
    OnPadChordSkill,
    OnRemnantEquipChange,
    OnCampsite,
}

namespace __INTENRAL_FC_CombatHUDCache_NS
{
    const TECSComponentDerivedPtr<FC_CombatHUDCache> DerivedPtr = TECSComponentDerivedPtr<FC_CombatHUDCache>();
    const FC_CombatHUDCache DefaultValue = FC_CombatHUDCache();
}
namespace __INTENRAL_FCE_CombatHUD_NS
{
    const TECSEventDerivedPtr<FCE_CombatHUD> DerivedPtr = TECSEventDerivedPtr<FCE_CombatHUD>();
}
namespace __INTENRAL_FCE_ECSyncCombatHUD_NS
{
    const TECSEventDerivedPtr<FCE_ECSyncCombatHUD> DerivedPtr = TECSEventDerivedPtr<FCE_ECSyncCombatHUD>();

}
struct FC_CombatHUDCache : FECSComponent
{
    UPROPERTY()
    bool bLastCacheInCombat;
    UPROPERTY()
    bool bLastLockTarget;
    UPROPERTY()
    bool bLastAim;
    UPROPERTY()
    float32 LastHPMax;
    UPROPERTY()
    float32 LastStaminaMax;
    UPROPERTY()
    float32 LastHP;
    UPROPERTY()
    float32 LastStamina;
    UPROPERTY()
    bool bLastHasShield;
    UPROPERTY()
    bool bLastAttackPress;


}

struct FCE_CombatHUD : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    ECombatHUDReason CombatHUDReason;
    UPROPERTY()
    bool bEnabled = false;


}

struct FCE_ECSyncCombatHUD : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    ECombatHUDReason CombatHUDReason;
    UPROPERTY()
    bool bEnabled = false;


}

namespace ECSFunc_FC_CombatHUDCache
{
UFUNCTION()
bool HasCombatHUDCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CombatHUDCache);
}
FC_CombatHUDCache& AssignCombatHUDCache(const FECSEntity &inout Entity, const FC_CombatHUDCache &inout DefaultValue = FC_CombatHUDCache())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CombatHUDCache, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCombatHUDCache_BP(const FECSEntity &inout Entity, const FC_CombatHUDCache &inout DefaultValue = FC_CombatHUDCache())
{
    ECSFunc_FC_CombatHUDCache::AssignCombatHUDCache(Entity, DefaultValue);
    return;
}
FC_CombatHUDCache& ModifyCombatHUDCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CombatHUDCache));
    return local_12.GetComp();
}
FC_CombatHUDCache& ModifyOrAddCombatHUDCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CombatHUDCache));
    return local_12.GetComp();
}
const FC_CombatHUDCache& GetCombatHUDCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CombatHUDCache));
    return local_12.GetComp();
}
UFUNCTION()
FC_CombatHUDCache GetCombatHUDCache_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CombatHUDCache& local_4 = ECSFunc_FC_CombatHUDCache::GetCombatHUDCache(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CombatHUDCache();
}
const FC_CombatHUDCache GetDefaultedCombatHUDCache(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CombatHUDCache __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CombatHUDCache);
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
FC_CombatHUDCache GetDefaultedCombatHUDCache_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CombatHUDCache::GetDefaultedCombatHUDCache(Entity);
}
UFUNCTION()
bool RemoveCombatHUDCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CombatHUDCache);
}
}
FECSMonitorRuntimeView __GetMonitorCombatHUDCacheOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CombatHUDCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatHUDCacheOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CombatHUDCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatHUDCacheOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CombatHUDCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatHUDCacheOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CombatHUDCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatHUDCacheOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CombatHUDCache, bFixedFrame, bMustHandleAll);
}
void __MonitorCombatHUDCacheLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CombatHUDCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatHUDCacheActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CombatHUDCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatHUDCacheModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CombatHUDCache, bFixedFrame, Details);
    return;
}
