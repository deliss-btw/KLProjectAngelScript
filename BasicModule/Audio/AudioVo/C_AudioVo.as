
namespace __INTENRAL_FC_EntityGameplayTagTrace_NS
{
    const TECSComponentDerivedPtr<FC_EntityGameplayTagTrace> DerivedPtr = TECSComponentDerivedPtr<FC_EntityGameplayTagTrace>();
    const FC_EntityGameplayTagTrace DefaultValue = FC_EntityGameplayTagTrace();
}
namespace __INTENRAL_FCS_PendingDispatchAudioVo_NS
{
    const TECSComponentDerivedPtr<FCS_PendingDispatchAudioVo> DerivedPtr = TECSComponentDerivedPtr<FCS_PendingDispatchAudioVo>();
    const FCS_PendingDispatchAudioVo DefaultValue = FCS_PendingDispatchAudioVo();
}
namespace __INTENRAL_FCS_EntityAudioVoManager_NS
{
    const TECSComponentDerivedPtr<FCS_EntityAudioVoManager> DerivedPtr = TECSComponentDerivedPtr<FCS_EntityAudioVoManager>();
    const FCS_EntityAudioVoManager DefaultValue = FCS_EntityAudioVoManager();
}
namespace __INTENRAL_FCS_EntityAudioVoLogicManager_NS
{
    const TECSComponentDerivedPtr<FCS_EntityAudioVoLogicManager> DerivedPtr = TECSComponentDerivedPtr<FCS_EntityAudioVoLogicManager>();
    const FCS_EntityAudioVoLogicManager DefaultValue = FCS_EntityAudioVoLogicManager();
}
namespace __INTENRAL_FCE_AudioVoEvent_NS
{
    const TECSEventDerivedPtr<FCE_AudioVoEvent> DerivedPtr = TECSEventDerivedPtr<FCE_AudioVoEvent>();
}
namespace __INTENRAL_FCE_EntityBBChangedEvent_NS
{
    const TECSEventDerivedPtr<FCE_EntityBBChangedEvent> DerivedPtr = TECSEventDerivedPtr<FCE_EntityBBChangedEvent>();
}
namespace __INTENRAL_FCE_AudioVoEventPresentation_NS
{
    const TECSEventDerivedPtr<FCE_AudioVoEventPresentation> DerivedPtr = TECSEventDerivedPtr<FCE_AudioVoEventPresentation>();
}
namespace __INTENRAL_FCE_InventoryAudioVo_NS
{
    const TECSEventDerivedPtr<FCE_InventoryAudioVo> DerivedPtr = TECSEventDerivedPtr<FCE_InventoryAudioVo>();
}
namespace __INTENRAL_FCE_TriggerBeHitAudioVo_NS
{
    const TECSEventDerivedPtr<FCE_TriggerBeHitAudioVo> DerivedPtr = TECSEventDerivedPtr<FCE_TriggerBeHitAudioVo>();
}
namespace __INTENRAL_FCE_SkillHitAudioVo_NS
{
    const TECSEventDerivedPtr<FCE_SkillHitAudioVo> DerivedPtr = TECSEventDerivedPtr<FCE_SkillHitAudioVo>();
}
namespace __INTENRAL_FCE_DoExecutionVo_NS
{
    const TECSEventDerivedPtr<FCE_DoExecutionVo> DerivedPtr = TECSEventDerivedPtr<FCE_DoExecutionVo>();
}
namespace __INTENRAL_FCE_AbnormalStateEvent_NS
{
    const TECSEventDerivedPtr<FCE_AbnormalStateEvent> DerivedPtr = TECSEventDerivedPtr<FCE_AbnormalStateEvent>();
}
namespace __INTENRAL_FCE_RebornForAudioVo_NS
{
    const TECSEventDerivedPtr<FCE_RebornForAudioVo> DerivedPtr = TECSEventDerivedPtr<FCE_RebornForAudioVo>();
}
namespace __INTENRAL_FCE_HealHpAudioVo_NS
{
    const TECSEventDerivedPtr<FCE_HealHpAudioVo> DerivedPtr = TECSEventDerivedPtr<FCE_HealHpAudioVo>();
}
namespace __INTENRAL_FCE_BossZoneSwapEvent_NS
{
    const TECSEventDerivedPtr<FCE_BossZoneSwapEvent> DerivedPtr = TECSEventDerivedPtr<FCE_BossZoneSwapEvent>();

}
struct FAudioVoInfo
{
    UPROPERTY()
    FECSEntity m_Entity;
    UPROPERTY()
    FName m_VoRowName;

    FAudioVoInfo()
    {
        return;
    }
    FECSEntity GetEntity() const property
    {
        FECSEntity __r;
        return __r;
    }
    FECSEntity GetEntity() property
    {
        FECSEntity __r;
        return __r;
    }
    void SetEntity(const FECSEntity &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FName GetVoRowName() const property
    {
        return this.m_VoRowName;
    }
    void SetVoRowName(const FName &inout __Value) property
    {
        this.m_VoRowName = __Value;
        return;
    }
}

struct FDodgeState
{
    UPROPERTY()
    FFPTime AccumulateDeadline;
    UPROPERTY()
    int Count;

    FDodgeState()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FC_EntityGameplayTagTrace : FECSComponent
{
    UPROPERTY()
    FGameplayTagContainer CurrentTags;
    UPROPERTY()
    FGameplayTagContainer LastTags;

    FC_EntityGameplayTagTrace()
    {
        return;
    }
}

struct FCE_AudioVoEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FAudioVoInfo AudioVoInfo;

    FCE_AudioVoEvent()
    {
        return;
    }
}

struct FCE_EntityBBChangedEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName BBKey;
    UPROPERTY()
    int OldValue;
    UPROPERTY()
    int NewValue;


}

struct FCE_AudioVoEventPresentation : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FAudioVoInfo AudioVoInfo;

    FCE_AudioVoEventPresentation()
    {
        return;
    }
}

struct FCS_PendingDispatchAudioVo : FECSSingleton
{
    UPROPERTY()
    TArray<FAudioVoInfo> Synced_AidoVoEvents;
    UPROPERTY()
    TArray<FAudioVoInfo> Presentation_AidoVoEvents;

    FCS_PendingDispatchAudioVo()
    {
        return;
    }
}

struct FCS_EntityAudioVoManager : FECSSingleton
{
    UPROPERTY()
    TMap<FECSEntity, FC_EntityGameplayTagTrace> EntityGameplayTagDiff;
    UPROPERTY()
    TMap<FECSEntityId, FDodgeState> DodgeStateMap;
    UPROPERTY()
    float32 AccumulateDuration = 10.0f;
    UPROPERTY()
    int TriggerThreshold = 2;


}

struct FCS_EntityAudioVoLogicManager : FECSSingleton
{
    UPROPERTY()
    TMap<FECSEntity, FFPTime> LastUltraSkillHitTime;
    UPROPERTY()
    float32 UltraSkillVoCd = 5.0f;
    UPROPERTY()
    TMap<FECSEntity, FFPTime> LastEntityHealedTime;
    UPROPERTY()
    float32 HealedCd = 10.0f;


}

struct FCE_InventoryAudioVo : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity InventoryGetter;
    UPROPERTY()
    FECSEntity InventoryDropper;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> Item;
    UPROPERTY()
    int AddNum;


}

struct FCE_TriggerBeHitAudioVo : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity Receiver;
    UPROPERTY()
    FECSEntity Attacker;
    UPROPERTY()
    FECSEntity Comforter;
    UPROPERTY()
    EAttackDataHitState HitLevel;


}

struct FCE_SkillHitAudioVo : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity Receiver;
    UPROPERTY()
    FECSEntity Attacker;
    UPROPERTY()
    FECSEntity Encourager;
    UPROPERTY()
    int AttackCategory;


}

struct FCE_DoExecutionVo : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity Executor;
    UPROPERTY()
    bool bIsMainExecutor = false;


}

struct FCE_AbnormalStateEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    EAbnormalState AbnormalState;
    UPROPERTY()
    FECSEntity Receiver;
    UPROPERTY()
    FECSEntity Caster;


}

struct FCE_RebornForAudioVo : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    float32 RebornHPRatio;
    UPROPERTY()
    FECSEntity RebornByEntity;


}

struct FCE_HealHpAudioVo : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    float32 HealHp;
    UPROPERTY()
    FECSEntity FromEntity;


}

struct FCE_BossZoneSwapEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_BossZoneSwapEvent()
    {
        return;
    }
}

namespace ECSFunc_FC_EntityGameplayTagTrace
{
UFUNCTION()
bool HasEntityGameplayTagTrace(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EntityGameplayTagTrace);
}
FC_EntityGameplayTagTrace& AssignEntityGameplayTagTrace(const FECSEntity &inout Entity, const FC_EntityGameplayTagTrace &inout DefaultValue = FC_EntityGameplayTagTrace())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EntityGameplayTagTrace, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEntityGameplayTagTrace_BP(const FECSEntity &inout Entity, const FC_EntityGameplayTagTrace &inout DefaultValue = FC_EntityGameplayTagTrace())
{
    ECSFunc_FC_EntityGameplayTagTrace::AssignEntityGameplayTagTrace(Entity, DefaultValue);
    return;
}
FC_EntityGameplayTagTrace& ModifyEntityGameplayTagTrace(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EntityGameplayTagTrace));
    return local_12.GetComp();
}
FC_EntityGameplayTagTrace& ModifyOrAddEntityGameplayTagTrace(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EntityGameplayTagTrace));
    return local_12.GetComp();
}
const FC_EntityGameplayTagTrace& GetEntityGameplayTagTrace(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EntityGameplayTagTrace));
    return local_12.GetComp();
}
UFUNCTION()
FC_EntityGameplayTagTrace GetEntityGameplayTagTrace_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EntityGameplayTagTrace __r;
    bValid = false;
    bValid = ECSFunc_FC_EntityGameplayTagTrace::GetEntityGameplayTagTrace(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EntityGameplayTagTrace GetDefaultedEntityGameplayTagTrace(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EntityGameplayTagTrace __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EntityGameplayTagTrace);
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
FC_EntityGameplayTagTrace GetDefaultedEntityGameplayTagTrace_BP(const FECSEntity &inout Entity)
{
    FC_EntityGameplayTagTrace __r;
    return __r;
}
UFUNCTION()
bool RemoveEntityGameplayTagTrace(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EntityGameplayTagTrace);
}
}
FECSMonitorRuntimeView __GetMonitorEntityGameplayTagTraceOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EntityGameplayTagTrace, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityGameplayTagTraceOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EntityGameplayTagTrace, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityGameplayTagTraceOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EntityGameplayTagTrace, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityGameplayTagTraceOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EntityGameplayTagTrace, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityGameplayTagTraceOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EntityGameplayTagTrace, bFixedFrame, bMustHandleAll);
}
void __MonitorEntityGameplayTagTraceLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EntityGameplayTagTrace, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntityGameplayTagTraceActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EntityGameplayTagTrace, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntityGameplayTagTraceModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EntityGameplayTagTrace, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_PendingDispatchAudioVo
{
UFUNCTION()
bool HasPendingDispatchAudioVo(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_PendingDispatchAudioVo);
}
FCS_PendingDispatchAudioVo& AssignPendingDispatchAudioVo(const FECSWorldPtr &inout World, const FCS_PendingDispatchAudioVo &inout DefaultValue = FCS_PendingDispatchAudioVo())
{
    UScriptStruct local_6 = FCS_PendingDispatchAudioVo;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignPendingDispatchAudioVo_BP(const FECSWorldPtr &inout World, const FCS_PendingDispatchAudioVo &inout DefaultValue = FCS_PendingDispatchAudioVo())
{
    ECSFunc_FCS_PendingDispatchAudioVo::AssignPendingDispatchAudioVo(World, DefaultValue);
    return;
}
FCS_PendingDispatchAudioVo& ModifyPendingDispatchAudioVo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PendingDispatchAudioVo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_PendingDispatchAudioVo& ModifyOrAddPendingDispatchAudioVo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PendingDispatchAudioVo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_PendingDispatchAudioVo& GetPendingDispatchAudioVo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PendingDispatchAudioVo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_PendingDispatchAudioVo GetPendingDispatchAudioVo_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_PendingDispatchAudioVo __r;
    bValid = false;
    bValid = ECSFunc_FCS_PendingDispatchAudioVo::GetPendingDispatchAudioVo(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_PendingDispatchAudioVo GetDefaultedPendingDispatchAudioVo(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_PendingDispatchAudioVo __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_PendingDispatchAudioVo);
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
FCS_PendingDispatchAudioVo GetDefaultedPendingDispatchAudioVo_BP(const FECSWorldPtr &inout World)
{
    FCS_PendingDispatchAudioVo __r;
    return __r;
}
UFUNCTION()
bool RemovePendingDispatchAudioVo(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_PendingDispatchAudioVo);
}
}
void __MonitorPendingDispatchAudioVoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_PendingDispatchAudioVo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPendingDispatchAudioVoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_PendingDispatchAudioVo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPendingDispatchAudioVoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_PendingDispatchAudioVo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_EntityAudioVoManager
{
UFUNCTION()
bool HasEntityAudioVoManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_EntityAudioVoManager);
}
FCS_EntityAudioVoManager& AssignEntityAudioVoManager(const FECSWorldPtr &inout World, const FCS_EntityAudioVoManager &inout DefaultValue = FCS_EntityAudioVoManager())
{
    UScriptStruct local_6 = FCS_EntityAudioVoManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignEntityAudioVoManager_BP(const FECSWorldPtr &inout World, const FCS_EntityAudioVoManager &inout DefaultValue = FCS_EntityAudioVoManager())
{
    ECSFunc_FCS_EntityAudioVoManager::AssignEntityAudioVoManager(World, DefaultValue);
    return;
}
FCS_EntityAudioVoManager& ModifyEntityAudioVoManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EntityAudioVoManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_EntityAudioVoManager& ModifyOrAddEntityAudioVoManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EntityAudioVoManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_EntityAudioVoManager& GetEntityAudioVoManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EntityAudioVoManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_EntityAudioVoManager GetEntityAudioVoManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_EntityAudioVoManager __r;
    bValid = false;
    bValid = ECSFunc_FCS_EntityAudioVoManager::GetEntityAudioVoManager(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_EntityAudioVoManager GetDefaultedEntityAudioVoManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_EntityAudioVoManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_EntityAudioVoManager);
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
FCS_EntityAudioVoManager GetDefaultedEntityAudioVoManager_BP(const FECSWorldPtr &inout World)
{
    FCS_EntityAudioVoManager __r;
    return __r;
}
UFUNCTION()
bool RemoveEntityAudioVoManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_EntityAudioVoManager);
}
}
void __MonitorEntityAudioVoManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_EntityAudioVoManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntityAudioVoManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_EntityAudioVoManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntityAudioVoManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_EntityAudioVoManager, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_EntityAudioVoLogicManager
{
UFUNCTION()
bool HasEntityAudioVoLogicManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_EntityAudioVoLogicManager);
}
FCS_EntityAudioVoLogicManager& AssignEntityAudioVoLogicManager(const FECSWorldPtr &inout World, const FCS_EntityAudioVoLogicManager &inout DefaultValue = FCS_EntityAudioVoLogicManager())
{
    UScriptStruct local_6 = FCS_EntityAudioVoLogicManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignEntityAudioVoLogicManager_BP(const FECSWorldPtr &inout World, const FCS_EntityAudioVoLogicManager &inout DefaultValue = FCS_EntityAudioVoLogicManager())
{
    ECSFunc_FCS_EntityAudioVoLogicManager::AssignEntityAudioVoLogicManager(World, DefaultValue);
    return;
}
FCS_EntityAudioVoLogicManager& ModifyEntityAudioVoLogicManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EntityAudioVoLogicManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_EntityAudioVoLogicManager& ModifyOrAddEntityAudioVoLogicManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EntityAudioVoLogicManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_EntityAudioVoLogicManager& GetEntityAudioVoLogicManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EntityAudioVoLogicManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_EntityAudioVoLogicManager GetEntityAudioVoLogicManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_EntityAudioVoLogicManager __r;
    bValid = false;
    bValid = ECSFunc_FCS_EntityAudioVoLogicManager::GetEntityAudioVoLogicManager(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_EntityAudioVoLogicManager GetDefaultedEntityAudioVoLogicManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_EntityAudioVoLogicManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_EntityAudioVoLogicManager);
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
FCS_EntityAudioVoLogicManager GetDefaultedEntityAudioVoLogicManager_BP(const FECSWorldPtr &inout World)
{
    FCS_EntityAudioVoLogicManager __r;
    return __r;
}
UFUNCTION()
bool RemoveEntityAudioVoLogicManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_EntityAudioVoLogicManager);
}
}
void __MonitorEntityAudioVoLogicManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_EntityAudioVoLogicManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntityAudioVoLogicManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_EntityAudioVoLogicManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntityAudioVoLogicManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_EntityAudioVoLogicManager, bFixedFrame, Details);
    return;
}
