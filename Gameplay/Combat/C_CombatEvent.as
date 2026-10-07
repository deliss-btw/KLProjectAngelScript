
enum EInvincibleCounterType
{
    Default,
    Dodge,
}

namespace __INTENRAL_FC_WaitHitBreakRecover_NS
{
    const TECSComponentDerivedPtr<FC_WaitHitBreakRecover> DerivedPtr = TECSComponentDerivedPtr<FC_WaitHitBreakRecover>();
    const FC_WaitHitBreakRecover DefaultValue = FC_WaitHitBreakRecover();
}
namespace __INTENRAL_FCE_HitEvent_NS
{
    const TECSEventDerivedPtr<FCE_HitEvent> DerivedPtr = TECSEventDerivedPtr<FCE_HitEvent>();
}
namespace __INTENRAL_FCE_DamageEvent_NS
{
    const TECSEventDerivedPtr<FCE_DamageEvent> DerivedPtr = TECSEventDerivedPtr<FCE_DamageEvent>();
}
namespace __INTENRAL_FCE_DeathResistanceHPChangeEvent_NS
{
    const TECSEventDerivedPtr<FCE_DeathResistanceHPChangeEvent> DerivedPtr = TECSEventDerivedPtr<FCE_DeathResistanceHPChangeEvent>();
}
namespace __INTENRAL_FCE_NotifyBeDamageForMiniHpBarEvent_NS
{
    const TECSEventDerivedPtr<FCE_NotifyBeDamageForMiniHpBarEvent> DerivedPtr = TECSEventDerivedPtr<FCE_NotifyBeDamageForMiniHpBarEvent>();
}
namespace __INTENRAL_FCE_BeHitFreezeFrame_NS
{
    const TECSEventDerivedPtr<FCE_BeHitFreezeFrame> DerivedPtr = TECSEventDerivedPtr<FCE_BeHitFreezeFrame>();
}
namespace __INTENRAL_FCE_ShowDamageNumber_NS
{
    const TECSEventDerivedPtr<FCE_ShowDamageNumber> DerivedPtr = TECSEventDerivedPtr<FCE_ShowDamageNumber>();
}
namespace __INTENRAL_FCE_HitAIHostility_NS
{
    const TECSEventDerivedPtr<FCE_HitAIHostility> DerivedPtr = TECSEventDerivedPtr<FCE_HitAIHostility>();
}
namespace __INTENRAL_FCE_EntityDestroyRequest_NS
{
    const TECSEventDerivedPtr<FCE_EntityDestroyRequest> DerivedPtr = TECSEventDerivedPtr<FCE_EntityDestroyRequest>();
}
namespace __INTENRAL_FCE_HitStateChanged_NS
{
    const TECSEventDerivedPtr<FCE_HitStateChanged> DerivedPtr = TECSEventDerivedPtr<FCE_HitStateChanged>();
}
namespace __INTENRAL_FCE_InvincibleCounterEvent_NS
{
    const TECSEventDerivedPtr<FCE_InvincibleCounterEvent> DerivedPtr = TECSEventDerivedPtr<FCE_InvincibleCounterEvent>();
}
namespace __INTENRAL_FCE_PerfectDodgeEvent_NS
{
    const TECSEventDerivedPtr<FCE_PerfectDodgeEvent> DerivedPtr = TECSEventDerivedPtr<FCE_PerfectDodgeEvent>();
}
namespace __INTENRAL_FCE_GuardHitEvent_NS
{
    const TECSEventDerivedPtr<FCE_GuardHitEvent> DerivedPtr = TECSEventDerivedPtr<FCE_GuardHitEvent>();
}
namespace __INTENRAL_FCE_HitShakeEvent_NS
{
    const TECSEventDerivedPtr<FCE_HitShakeEvent> DerivedPtr = TECSEventDerivedPtr<FCE_HitShakeEvent>();
}
namespace __INTENRAL_FCE_Reborn_NS
{
    const TECSEventDerivedPtr<FCE_Reborn> DerivedPtr = TECSEventDerivedPtr<FCE_Reborn>();

}
struct FCE_HitEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    bool bClientWaitForServerOnHit = false;
    UPROPERTY()
    bool bNeedHitMeshPresentation = true;
    UPROPERTY()
    bool bAttackHitFXSpawnToStrikeCenterLine = false;
    UPROPERTY()
    bool bHitWeakness = false;
    UPROPERTY()
    bool bDefended = false;
    UPROPERTY()
    bool bBanPresentation = false;
    UPROPERTY()
    FECSEntity Attacker;
    UPROPERTY()
    FECSEntity Receiver;
    UPROPERTY()
    FVector HitPosition;
    UPROPERTY()
    EHitShakeBodyType HitShakeBodyType;
    UPROPERTY()
    FName HitBoneName;
    UPROPERTY()
    FName HitBodyPart;
    UPROPERTY()
    FName OverrideAnimSocket;
    UPROPERTY()
    TSoftObjectPtr<UGamePhysicalMaterial> PhysicalMaterial;
    UPROPERTY()
    FHitStrikeData StrikeData;
    UPROPERTY()
    FName StrikeKey;
    UPROPERTY()
    TDataObjectPtr<FAttackData> AttackData;


}

struct FCE_DamageEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity Receiver;
    UPROPERTY()
    FECSEntity FinalDamageSource;
    UPROPERTY()
    FECSEntity DirectDamageCauser;
    UPROPERTY()
    float32 TotalDamageToHP = 0.0f;
    UPROPERTY()
    float32 ActualDamageToHP = 0.0f;
    UPROPERTY()
    float32 DamageToShield = 0.0f;
    UPROPERTY()
    float32 DamageToPosture = 0.0f;
    UPROPERTY()
    float32 AbnormalValue = 0.0f;
    UPROPERTY()
    bool bCritical = false;
    UPROPERTY()
    EDamageType DamageType = EDamageType(0);
    UPROPERTY()
    EDamageProcedureType DamageProcedureType = EDamageProcedureType(0);
    UPROPERTY()
    EDamageCalculationType DamageCalculationType = EDamageCalculationType(0);
    UPROPERTY()
    FDamageHitData HitData;
    UPROPERTY()
    bool bKillTarget = false;
    UPROPERTY()
    bool bMakeTargetNearDeath = false;
    UPROPERTY()
    bool bMakeTargetPostureStagger = false;
    UPROPERTY()
    bool bMakeTargetPostureBreak = false;
    UPROPERTY()
    bool bMakeTargetBodyPartDestroy = false;
    UPROPERTY()
    TDataObjectPtr<FAttackData> AttackData;


}

struct FCE_DeathResistanceHPChangeEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    float32 HP = 0.0f;
    UPROPERTY()
    float32 Delta = 0.0f;
    UPROPERTY()
    FECSEntity DamageCauser;


}

struct FCE_NotifyBeDamageForMiniHpBarEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity Attacker;

    FCE_NotifyBeDamageForMiniHpBarEvent()
    {
        return;
    }
}

struct FCE_BeHitFreezeFrame : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    int DeferredEventID;


}

struct FCE_ShowDamageNumber : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity Attacker;
    UPROPERTY()
    FECSEntity Receiver;
    UPROPERTY()
    float32 Damage = 0.0f;
    UPROPERTY()
    FVector HitPosition;
    UPROPERTY()
    EAttackType AttackType = EAttackType(0);
    UPROPERTY()
    EDamageType DamageType = EDamageType(0);
    UPROPERTY()
    bool bAdjustPresentationHitPos;
    UPROPERTY()
    TDataObjectPtr<FSpecialDamageTextConfig> SpecialDamageTextConfig;
    UPROPERTY()
    bool bHitWeakness = false;
    UPROPERTY()
    bool bAttenuated = false;
    UPROPERTY()
    bool bCritical = false;
    UPROPERTY()
    float32 DamageNumberRandomRatio = 1.0f;
    UPROPERTY()
    FName StrikeKey;
    UPROPERTY()
    FFPTime HitTime;


}

struct FCE_HitAIHostility : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity Receiver;
    UPROPERTY()
    float32 Damage = 0.0f;
    UPROPERTY()
    TDataObjectPtr<FAttackData> AttackData;


}

struct FCE_EntityDestroyRequest : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    bool bSkipPlayerControlled = false;


}

struct FC_WaitHitBreakRecover : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFPTime m_RecoverTime;

    FC_WaitHitBreakRecover()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_WaitHitBreakRecover(const FC_WaitHitBreakRecover &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_RecoverTime = Other.m_RecoverTime;
        return;
    }
    FC_WaitHitBreakRecover opAssign(const FC_WaitHitBreakRecover &inout Other)
    {
        FC_WaitHitBreakRecover __r;
        this.SetRecoverTime(Other.GetRecoverTime());
        return __r;
    }
    const FFPTime GetRecoverTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_RecoverTime() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetRecoverTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_RecoverTime = __Value;
        return;
    }
}

struct FCE_HitStateChanged : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName ToHitState;
    UPROPERTY()
    FECSEntity Attacker;

    FCE_HitStateChanged()
    {
        return;
    }
}

struct FCE_InvincibleCounterEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity Attacker;
    UPROPERTY()
    EInvincibleCounterType Type = EInvincibleCounterType(0);


}

struct FCE_PerfectDodgeEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity Attacker;

    FCE_PerfectDodgeEvent()
    {
        return;
    }
}

struct FCE_GuardHitEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity Attacker;

    FCE_GuardHitEvent()
    {
        return;
    }
}

struct FCE_HitShakeEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    float32 HitShakeTime;
    UPROPERTY()
    float32 HitShakeRatio;
    UPROPERTY()
    float32 HitAngle;
    UPROPERTY()
    FName HitShakeBoneName;
    UPROPERTY()
    EHitShakeBodyType HitShakeBodyType;


}

struct FCE_Reborn : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    float32 RebornHPRatio;
    UPROPERTY()
    FECSEntity RebornByEntity;
    UPROPERTY()
    bool bRebornWithAnimation = true;
    UPROPERTY()
    bool bFromPlayerRebornEvent = false;
    UPROPERTY()
    EReviveType ReviveType;


}

namespace ECSFunc_FC_WaitHitBreakRecover
{
UFUNCTION()
bool HasWaitHitBreakRecover(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_WaitHitBreakRecover);
}
FC_WaitHitBreakRecover& AssignWaitHitBreakRecover(const FECSEntity &inout Entity, const FC_WaitHitBreakRecover &inout DefaultValue = FC_WaitHitBreakRecover())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_WaitHitBreakRecover, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignWaitHitBreakRecover_BP(const FECSEntity &inout Entity, const FC_WaitHitBreakRecover &inout DefaultValue = FC_WaitHitBreakRecover())
{
    ECSFunc_FC_WaitHitBreakRecover::AssignWaitHitBreakRecover(Entity, DefaultValue);
    return;
}
FC_WaitHitBreakRecover& ModifyWaitHitBreakRecover(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_WaitHitBreakRecover));
    return local_12.GetComp();
}
FC_WaitHitBreakRecover& ModifyOrAddWaitHitBreakRecover(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_WaitHitBreakRecover));
    return local_12.GetComp();
}
const FC_WaitHitBreakRecover& GetWaitHitBreakRecover(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_WaitHitBreakRecover));
    return local_12.GetComp();
}
UFUNCTION()
FC_WaitHitBreakRecover GetWaitHitBreakRecover_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_WaitHitBreakRecover& local_4 = ECSFunc_FC_WaitHitBreakRecover::GetWaitHitBreakRecover(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_WaitHitBreakRecover();
}
const FC_WaitHitBreakRecover GetDefaultedWaitHitBreakRecover(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_WaitHitBreakRecover __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_WaitHitBreakRecover);
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
FC_WaitHitBreakRecover GetDefaultedWaitHitBreakRecover_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_WaitHitBreakRecover::GetDefaultedWaitHitBreakRecover(Entity);
}
UFUNCTION()
bool RemoveWaitHitBreakRecover(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_WaitHitBreakRecover);
}
}
FECSMonitorRuntimeView __GetMonitorWaitHitBreakRecoverOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_WaitHitBreakRecover, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWaitHitBreakRecoverOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_WaitHitBreakRecover, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWaitHitBreakRecoverOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_WaitHitBreakRecover, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWaitHitBreakRecoverOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_WaitHitBreakRecover, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWaitHitBreakRecoverOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_WaitHitBreakRecover, bFixedFrame, bMustHandleAll);
}
void __MonitorWaitHitBreakRecoverLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_WaitHitBreakRecover, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorWaitHitBreakRecoverActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_WaitHitBreakRecover, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorWaitHitBreakRecoverModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_WaitHitBreakRecover, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_WaitHitBreakRecover &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_WaitHitBreakRecover &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_WaitHitBreakRecover &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_WaitHitBreakRecover
{
int __IndexOf_RecoverTime()
{
    return 0;
}
}
