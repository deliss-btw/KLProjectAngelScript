
namespace __INTENRAL_FC_NearDeathInfo_NS
{
    const TECSComponentDerivedPtr<FC_NearDeathInfo> DerivedPtr = TECSComponentDerivedPtr<FC_NearDeathInfo>();
    const FC_NearDeathInfo DefaultValue = FC_NearDeathInfo();
}
namespace __INTENRAL_FC_NearDeathDeferTransition_NS
{
    const TECSComponentDerivedPtr<FC_NearDeathDeferTransition> DerivedPtr = TECSComponentDerivedPtr<FC_NearDeathDeferTransition>();
    const FC_NearDeathDeferTransition DefaultValue = FC_NearDeathDeferTransition();
}
namespace __INTENRAL_FC_BeingRescuedInfo_NS
{
    const TECSComponentDerivedPtr<FC_BeingRescuedInfo> DerivedPtr = TECSComponentDerivedPtr<FC_BeingRescuedInfo>();
    const FC_BeingRescuedInfo DefaultValue = FC_BeingRescuedInfo();
}
namespace __INTENRAL_FC_BeingRescuedViewProgress_NS
{
    const TECSComponentDerivedPtr<FC_BeingRescuedViewProgress> DerivedPtr = TECSComponentDerivedPtr<FC_BeingRescuedViewProgress>();
    const FC_BeingRescuedViewProgress DefaultValue = FC_BeingRescuedViewProgress();
}
namespace __INTENRAL_FC_InRescuedOtherInfo_NS
{
    const TECSComponentDerivedPtr<FC_InRescuedOtherInfo> DerivedPtr = TECSComponentDerivedPtr<FC_InRescuedOtherInfo>();
    const FC_InRescuedOtherInfo DefaultValue = FC_InRescuedOtherInfo();
}
namespace __INTENRAL_FC_NearDeathCounter_NS
{
    const TECSComponentDerivedPtr<FC_NearDeathCounter> DerivedPtr = TECSComponentDerivedPtr<FC_NearDeathCounter>();
    const FC_NearDeathCounter DefaultValue = FC_NearDeathCounter();
}
namespace __INTENRAL_FCS_NearDeathRule_NS
{
    const TECSComponentDerivedPtr<FCS_NearDeathRule> DerivedPtr = TECSComponentDerivedPtr<FCS_NearDeathRule>();
    const FCS_NearDeathRule DefaultValue = FCS_NearDeathRule();
}
namespace __INTENRAL_FCE_NearDeathEvent_NS
{
    const TECSEventDerivedPtr<FCE_NearDeathEvent> DerivedPtr = TECSEventDerivedPtr<FCE_NearDeathEvent>();
}
namespace __INTENRAL_FCE_RescueNearDeathEvent_NS
{
    const TECSEventDerivedPtr<FCE_RescueNearDeathEvent> DerivedPtr = TECSEventDerivedPtr<FCE_RescueNearDeathEvent>();
}
namespace __INTENRAL_FCE_RescuedFromNearDeathEvent_NS
{
    const TECSEventDerivedPtr<FCE_RescuedFromNearDeathEvent> DerivedPtr = TECSEventDerivedPtr<FCE_RescuedFromNearDeathEvent>();
}
namespace __INTENRAL_FCE_PlayerRequestGiveUpNearDeath_NS
{
    const TECSEventDerivedPtr<FCE_PlayerRequestGiveUpNearDeath> DerivedPtr = TECSEventDerivedPtr<FCE_PlayerRequestGiveUpNearDeath>();

}
struct FC_NearDeathInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_NearDeathHP;
    UPROPERTY()
    float32 m_MaxNearDeathHP;
    UPROPERTY()
    FECSEntityId m_KilledByEntity;
    UPROPERTY()
    bool m_bCanHitOrLockTargetWhenNearDeath;
    UPROPERTY()
    bool m_bNearDeathHPZeroByDamage;

    FC_NearDeathInfo()
    {
        this.m_NearDeathHP = 0.0f;
        this.m_MaxNearDeathHP = 0.0f;
        this.m_bCanHitOrLockTargetWhenNearDeath = false;
        this.m_bNearDeathHPZeroByDamage = false;
        this.m_KilledByEntity = ENTITY_ID_NULL;
        this.__InitDirtyFlags();
        return;
    }
    FC_NearDeathInfo(const FC_NearDeathInfo &inout Other)
    {
        this.m_NearDeathHP = 0.0f;
        this.m_MaxNearDeathHP = 0.0f;
        this.m_bCanHitOrLockTargetWhenNearDeath = false;
        this.m_bNearDeathHPZeroByDamage = false;
        this.m_KilledByEntity = ENTITY_ID_NULL;
        this.__InitDirtyFlags();
        this.m_NearDeathHP = Other.m_NearDeathHP;
        this.m_MaxNearDeathHP = Other.m_MaxNearDeathHP;
        this.m_KilledByEntity = Other.m_KilledByEntity;
        this.m_bCanHitOrLockTargetWhenNearDeath = Other.m_bCanHitOrLockTargetWhenNearDeath;
        this.m_bNearDeathHPZeroByDamage = Other.m_bNearDeathHPZeroByDamage;
        return;
    }
    FC_NearDeathInfo opAssign(const FC_NearDeathInfo &inout Other)
    {
        FC_NearDeathInfo __r;
        this.SetNearDeathHP(Other.GetNearDeathHP());
        this.SetMaxNearDeathHP(Other.GetMaxNearDeathHP());
        this.SetKilledByEntity(Other.GetKilledByEntity());
        this.SetbCanHitOrLockTargetWhenNearDeath(Other.GetbCanHitOrLockTargetWhenNearDeath());
        this.SetbNearDeathHPZeroByDamage(Other.GetbNearDeathHPZeroByDamage());
        return __r;
    }
    float32 GetNearDeathHP() const property
    {
        return this.m_NearDeathHP;
    }
    void SetNearDeathHP(const float32 __Value) property
    {
        if (this.m_NearDeathHP == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_NearDeathHP = __Value;
        return;
    }
    float32 GetMaxNearDeathHP() const property
    {
        return this.m_MaxNearDeathHP;
    }
    void SetMaxNearDeathHP(const float32 __Value) property
    {
        if (this.m_MaxNearDeathHP == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_MaxNearDeathHP = __Value;
        return;
    }
    const FECSEntityId GetKilledByEntity() const property
    {
        const FECSEntityId __r;
        return __r;
    }
    FECSEntityId GetModify_KilledByEntity() property
    {
        FECSEntityId __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetKilledByEntity(const FECSEntityId &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_KilledByEntity = __Value;
        return;
    }
    bool GetbCanHitOrLockTargetWhenNearDeath() const property
    {
        return this.m_bCanHitOrLockTargetWhenNearDeath;
    }
    void SetbCanHitOrLockTargetWhenNearDeath(const bool __Value) property
    {
        if (!(this.m_bCanHitOrLockTargetWhenNearDeath) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bCanHitOrLockTargetWhenNearDeath = __Value;
        return;
    }
    bool GetbNearDeathHPZeroByDamage() const property
    {
        return this.m_bNearDeathHPZeroByDamage;
    }
    void SetbNearDeathHPZeroByDamage(const bool __Value) property
    {
        if (!(this.m_bNearDeathHPZeroByDamage) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_bNearDeathHPZeroByDamage = __Value;
        return;
    }
}

struct FC_NearDeathDeferTransition : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bWaitLand;
    UPROPERTY()
    bool m_bDeferByAction;

    FC_NearDeathDeferTransition()
    {
        this.m_bWaitLand = false;
        this.m_bDeferByAction = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_NearDeathDeferTransition(const FC_NearDeathDeferTransition &inout Other)
    {
        this.m_bWaitLand = false;
        this.m_bDeferByAction = false;
        this.__InitDirtyFlags();
        this.m_bWaitLand = Other.m_bWaitLand;
        this.m_bDeferByAction = Other.m_bDeferByAction;
        return;
    }
    FC_NearDeathDeferTransition opAssign(const FC_NearDeathDeferTransition &inout Other)
    {
        FC_NearDeathDeferTransition __r;
        this.SetbWaitLand(Other.GetbWaitLand());
        this.SetbDeferByAction(Other.GetbDeferByAction());
        return __r;
    }
    bool NeedDefer() const
    {
        return this.GetbWaitLand() || this.GetbDeferByAction();
    }
    bool GetbWaitLand() const property
    {
        return this.m_bWaitLand;
    }
    void SetbWaitLand(const bool __Value) property
    {
        if (!(this.m_bWaitLand) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bWaitLand = __Value;
        return;
    }
    bool GetbDeferByAction() const property
    {
        return this.m_bDeferByAction;
    }
    void SetbDeferByAction(const bool __Value) property
    {
        if (!(this.m_bDeferByAction) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bDeferByAction = __Value;
        return;
    }
}

struct FC_BeingRescuedInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntityId m_RescuedByEntity;

    FC_BeingRescuedInfo()
    {
        this.m_RescuedByEntity = ENTITY_ID_NULL;
        this.__InitDirtyFlags();
        return;
    }
    FC_BeingRescuedInfo(const FC_BeingRescuedInfo &inout Other)
    {
        this.m_RescuedByEntity = ENTITY_ID_NULL;
        this.__InitDirtyFlags();
        this.m_RescuedByEntity = Other.m_RescuedByEntity;
        return;
    }
    FC_BeingRescuedInfo opAssign(const FC_BeingRescuedInfo &inout Other)
    {
        FC_BeingRescuedInfo __r;
        this.SetRescuedByEntity(Other.GetRescuedByEntity());
        return __r;
    }
    const FECSEntityId GetRescuedByEntity() const property
    {
        const FECSEntityId __r;
        return __r;
    }
    FECSEntityId GetModify_RescuedByEntity() property
    {
        FECSEntityId __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetRescuedByEntity(const FECSEntityId &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_RescuedByEntity = __Value;
        return;
    }
}

struct FC_BeingRescuedViewProgress : FECSComponent
{
    UPROPERTY()
    float32 RescueProgress = 0.0f;


}

struct FC_InRescuedOtherInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntityId m_RescuedTarget;

    FC_InRescuedOtherInfo()
    {
        this.m_RescuedTarget = ENTITY_ID_NULL;
        this.__InitDirtyFlags();
        return;
    }
    FC_InRescuedOtherInfo(const FC_InRescuedOtherInfo &inout Other)
    {
        this.m_RescuedTarget = ENTITY_ID_NULL;
        this.__InitDirtyFlags();
        this.m_RescuedTarget = Other.m_RescuedTarget;
        return;
    }
    FC_InRescuedOtherInfo opAssign(const FC_InRescuedOtherInfo &inout Other)
    {
        FC_InRescuedOtherInfo __r;
        this.SetRescuedTarget(Other.GetRescuedTarget());
        return __r;
    }
    const FECSEntityId GetRescuedTarget() const property
    {
        const FECSEntityId __r;
        return __r;
    }
    FECSEntityId GetModify_RescuedTarget() property
    {
        FECSEntityId __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetRescuedTarget(const FECSEntityId &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_RescuedTarget = __Value;
        return;
    }
}

struct FC_NearDeathCounter : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_NearDeathCount;

    FC_NearDeathCounter()
    {
        this.m_NearDeathCount = 0;
        this.__InitDirtyFlags();
        return;
    }
    FC_NearDeathCounter(const FC_NearDeathCounter &inout Other)
    {
        this.m_NearDeathCount = 0;
        this.__InitDirtyFlags();
        this.m_NearDeathCount = int(Other.m_NearDeathCount);
        return;
    }
    FC_NearDeathCounter opAssign(const FC_NearDeathCounter &inout Other)
    {
        FC_NearDeathCounter __r;
        this.SetNearDeathCount(Other.GetNearDeathCount());
        return __r;
    }
    int GetNearDeathCount() const property
    {
        return this.m_NearDeathCount;
    }
    void SetNearDeathCount(const int __Value) property
    {
        if (this.m_NearDeathCount == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_NearDeathCount = __Value;
        return;
    }
}

struct FCE_NearDeathEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntityId KilledByEntity = ENTITY_ID_NULL;

    FCE_NearDeathEvent()
    {
        return;
    }
}

struct FCE_RescueNearDeathEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity RescueByEntity;
    UPROPERTY()
    bool bRescueWithAnimation = true;
    UPROPERTY()
    float32 OverrideHpRatio = 0.0f;


}

struct FCE_RescuedFromNearDeathEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity RescueByEntity;

    FCE_RescuedFromNearDeathEvent()
    {
        return;
    }
}

struct FCE_PlayerRequestGiveUpNearDeath : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_PlayerRequestGiveUpNearDeath()
    {
        return;
    }
}

struct FCS_NearDeathRule : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FReviveData> m_ReviveData;

    FCS_NearDeathRule()
    {
        this.__InitDirtyFlags();
        return;
    }
    FCS_NearDeathRule(const FCS_NearDeathRule &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_ReviveData = Other.m_ReviveData;
        return;
    }
    FCS_NearDeathRule opAssign(const FCS_NearDeathRule &inout Other)
    {
        FCS_NearDeathRule __r;
        this.SetReviveData(Other.GetReviveData());
        return __r;
    }
    const TDataObjectPtr<FReviveData> GetReviveData() const property
    {
        const TDataObjectPtr<FReviveData> __r;
        return __r;
    }
    TDataObjectPtr<FReviveData> GetModify_ReviveData() property
    {
        TDataObjectPtr<FReviveData> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetReviveData(const TDataObjectPtr<FReviveData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ReviveData = __Value;
        return;
    }
}

namespace FNearDeathUtils
{
void TryRestoreHitboxFromNearDeath(const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_NearDeathInfo& local_6 = local_4.opCall();
    if (local_6)
    {
        if (!(local_6.GetbCanHitOrLockTargetWhenNearDeath()))
        {
            Modify local_12;
            FC_HitBox& local_14 = local_12.opCall();
            if (local_14)
            {
                local_14.GetOptions().EnableByReason(ECollisionDisableReason(8));
            }
        }
    }
    return;
}
bool CheckCanNearDeath(const FECSEntity &inout Entity)
{
    int local_32 = 0;
    if (!(FASCommonUtils::IsAvatarPrefab(Entity)))
    {
        return false;
    }
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    Get local_8;
    const FCS_NearDeathRule& local_10 = local_8.opCall();
    if (local_10)
    {
        if (local_10.GetReviveData())
        {
            bool local_13;
            EKnockdownCond local_11;
            EKnockdownCond local_12;
            local_11 = local_12;
            local_13 = false;
            int local_14 = int(local_11);
            if (local_14 == 0)
            {
                local_13 = false;
            }
            else
            {
                if (int(local_11) == 1)
                {
                    local_13 = true;
                }
                else
                {
                    local_14 = int(local_11);
                    if (local_14 == 2)
                    {
                        TArray<FECSEntity> local_20 = FTeamUtils::GetTeammates(Entity);
                        local_13 = (local_20.Num() > 1);
                    }
                }
            }
            if (!(local_13))
            {
                return false;
            }
            return (local_32.GetNearDeathCount() < local_14);
        }
    }
    return false;
}
}
namespace ECSFunc_FC_NearDeathInfo
{
UFUNCTION()
bool HasNearDeathInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_NearDeathInfo);
}
FC_NearDeathInfo& AssignNearDeathInfo(const FECSEntity &inout Entity, const FC_NearDeathInfo &inout DefaultValue = FC_NearDeathInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_NearDeathInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignNearDeathInfo_BP(const FECSEntity &inout Entity, const FC_NearDeathInfo &inout DefaultValue = FC_NearDeathInfo())
{
    ECSFunc_FC_NearDeathInfo::AssignNearDeathInfo(Entity, DefaultValue);
    return;
}
FC_NearDeathInfo& ModifyNearDeathInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_NearDeathInfo));
    return local_12.GetComp();
}
FC_NearDeathInfo& ModifyOrAddNearDeathInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_NearDeathInfo));
    return local_12.GetComp();
}
const FC_NearDeathInfo& GetNearDeathInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_NearDeathInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_NearDeathInfo GetNearDeathInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_NearDeathInfo& local_4 = ECSFunc_FC_NearDeathInfo::GetNearDeathInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_NearDeathInfo();
}
const FC_NearDeathInfo GetDefaultedNearDeathInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_NearDeathInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_NearDeathInfo);
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
FC_NearDeathInfo GetDefaultedNearDeathInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_NearDeathInfo::GetDefaultedNearDeathInfo(Entity);
}
UFUNCTION()
bool RemoveNearDeathInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_NearDeathInfo);
}
}
FECSMonitorRuntimeView __GetMonitorNearDeathInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_NearDeathInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNearDeathInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_NearDeathInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNearDeathInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_NearDeathInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNearDeathInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_NearDeathInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNearDeathInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_NearDeathInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorNearDeathInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_NearDeathInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNearDeathInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_NearDeathInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNearDeathInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_NearDeathInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_NearDeathDeferTransition
{
UFUNCTION()
bool HasNearDeathDeferTransition(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_NearDeathDeferTransition);
}
FC_NearDeathDeferTransition& AssignNearDeathDeferTransition(const FECSEntity &inout Entity, const FC_NearDeathDeferTransition &inout DefaultValue = FC_NearDeathDeferTransition())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_NearDeathDeferTransition, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignNearDeathDeferTransition_BP(const FECSEntity &inout Entity, const FC_NearDeathDeferTransition &inout DefaultValue = FC_NearDeathDeferTransition())
{
    ECSFunc_FC_NearDeathDeferTransition::AssignNearDeathDeferTransition(Entity, DefaultValue);
    return;
}
FC_NearDeathDeferTransition& ModifyNearDeathDeferTransition(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_NearDeathDeferTransition));
    return local_12.GetComp();
}
FC_NearDeathDeferTransition& ModifyOrAddNearDeathDeferTransition(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_NearDeathDeferTransition));
    return local_12.GetComp();
}
const FC_NearDeathDeferTransition& GetNearDeathDeferTransition(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_NearDeathDeferTransition));
    return local_12.GetComp();
}
UFUNCTION()
FC_NearDeathDeferTransition GetNearDeathDeferTransition_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_NearDeathDeferTransition& local_4 = ECSFunc_FC_NearDeathDeferTransition::GetNearDeathDeferTransition(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_NearDeathDeferTransition();
}
const FC_NearDeathDeferTransition GetDefaultedNearDeathDeferTransition(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_NearDeathDeferTransition __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_NearDeathDeferTransition);
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
FC_NearDeathDeferTransition GetDefaultedNearDeathDeferTransition_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_NearDeathDeferTransition::GetDefaultedNearDeathDeferTransition(Entity);
}
UFUNCTION()
bool RemoveNearDeathDeferTransition(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_NearDeathDeferTransition);
}
}
FECSMonitorRuntimeView __GetMonitorNearDeathDeferTransitionOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_NearDeathDeferTransition, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNearDeathDeferTransitionOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_NearDeathDeferTransition, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNearDeathDeferTransitionOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_NearDeathDeferTransition, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNearDeathDeferTransitionOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_NearDeathDeferTransition, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNearDeathDeferTransitionOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_NearDeathDeferTransition, bFixedFrame, bMustHandleAll);
}
void __MonitorNearDeathDeferTransitionLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_NearDeathDeferTransition, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNearDeathDeferTransitionActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_NearDeathDeferTransition, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNearDeathDeferTransitionModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_NearDeathDeferTransition, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_BeingRescuedInfo
{
UFUNCTION()
bool HasBeingRescuedInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_BeingRescuedInfo);
}
FC_BeingRescuedInfo& AssignBeingRescuedInfo(const FECSEntity &inout Entity, const FC_BeingRescuedInfo &inout DefaultValue = FC_BeingRescuedInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_BeingRescuedInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignBeingRescuedInfo_BP(const FECSEntity &inout Entity, const FC_BeingRescuedInfo &inout DefaultValue = FC_BeingRescuedInfo())
{
    ECSFunc_FC_BeingRescuedInfo::AssignBeingRescuedInfo(Entity, DefaultValue);
    return;
}
FC_BeingRescuedInfo& ModifyBeingRescuedInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_BeingRescuedInfo));
    return local_12.GetComp();
}
FC_BeingRescuedInfo& ModifyOrAddBeingRescuedInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_BeingRescuedInfo));
    return local_12.GetComp();
}
const FC_BeingRescuedInfo& GetBeingRescuedInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_BeingRescuedInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_BeingRescuedInfo GetBeingRescuedInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_BeingRescuedInfo& local_4 = ECSFunc_FC_BeingRescuedInfo::GetBeingRescuedInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_BeingRescuedInfo();
}
const FC_BeingRescuedInfo GetDefaultedBeingRescuedInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_BeingRescuedInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_BeingRescuedInfo);
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
FC_BeingRescuedInfo GetDefaultedBeingRescuedInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_BeingRescuedInfo::GetDefaultedBeingRescuedInfo(Entity);
}
UFUNCTION()
bool RemoveBeingRescuedInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_BeingRescuedInfo);
}
}
FECSMonitorRuntimeView __GetMonitorBeingRescuedInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_BeingRescuedInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeingRescuedInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_BeingRescuedInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeingRescuedInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_BeingRescuedInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeingRescuedInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_BeingRescuedInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeingRescuedInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_BeingRescuedInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorBeingRescuedInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_BeingRescuedInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBeingRescuedInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_BeingRescuedInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBeingRescuedInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_BeingRescuedInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_BeingRescuedViewProgress
{
UFUNCTION()
bool HasBeingRescuedViewProgress(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_BeingRescuedViewProgress);
}
FC_BeingRescuedViewProgress& AssignBeingRescuedViewProgress(const FECSEntity &inout Entity, const FC_BeingRescuedViewProgress &inout DefaultValue = FC_BeingRescuedViewProgress())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_BeingRescuedViewProgress, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignBeingRescuedViewProgress_BP(const FECSEntity &inout Entity, const FC_BeingRescuedViewProgress &inout DefaultValue = FC_BeingRescuedViewProgress())
{
    ECSFunc_FC_BeingRescuedViewProgress::AssignBeingRescuedViewProgress(Entity, DefaultValue);
    return;
}
FC_BeingRescuedViewProgress& ModifyBeingRescuedViewProgress(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_BeingRescuedViewProgress));
    return local_12.GetComp();
}
FC_BeingRescuedViewProgress& ModifyOrAddBeingRescuedViewProgress(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_BeingRescuedViewProgress));
    return local_12.GetComp();
}
const FC_BeingRescuedViewProgress& GetBeingRescuedViewProgress(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_BeingRescuedViewProgress));
    return local_12.GetComp();
}
UFUNCTION()
FC_BeingRescuedViewProgress GetBeingRescuedViewProgress_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_BeingRescuedViewProgress& local_4 = ECSFunc_FC_BeingRescuedViewProgress::GetBeingRescuedViewProgress(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_BeingRescuedViewProgress();
}
const FC_BeingRescuedViewProgress GetDefaultedBeingRescuedViewProgress(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_BeingRescuedViewProgress __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_BeingRescuedViewProgress);
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
FC_BeingRescuedViewProgress GetDefaultedBeingRescuedViewProgress_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_BeingRescuedViewProgress::GetDefaultedBeingRescuedViewProgress(Entity);
}
UFUNCTION()
bool RemoveBeingRescuedViewProgress(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_BeingRescuedViewProgress);
}
}
FECSMonitorRuntimeView __GetMonitorBeingRescuedViewProgressOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_BeingRescuedViewProgress, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeingRescuedViewProgressOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_BeingRescuedViewProgress, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeingRescuedViewProgressOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_BeingRescuedViewProgress, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeingRescuedViewProgressOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_BeingRescuedViewProgress, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeingRescuedViewProgressOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_BeingRescuedViewProgress, bFixedFrame, bMustHandleAll);
}
void __MonitorBeingRescuedViewProgressLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_BeingRescuedViewProgress, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBeingRescuedViewProgressActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_BeingRescuedViewProgress, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBeingRescuedViewProgressModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_BeingRescuedViewProgress, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_InRescuedOtherInfo
{
UFUNCTION()
bool HasInRescuedOtherInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_InRescuedOtherInfo);
}
FC_InRescuedOtherInfo& AssignInRescuedOtherInfo(const FECSEntity &inout Entity, const FC_InRescuedOtherInfo &inout DefaultValue = FC_InRescuedOtherInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_InRescuedOtherInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignInRescuedOtherInfo_BP(const FECSEntity &inout Entity, const FC_InRescuedOtherInfo &inout DefaultValue = FC_InRescuedOtherInfo())
{
    ECSFunc_FC_InRescuedOtherInfo::AssignInRescuedOtherInfo(Entity, DefaultValue);
    return;
}
FC_InRescuedOtherInfo& ModifyInRescuedOtherInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_InRescuedOtherInfo));
    return local_12.GetComp();
}
FC_InRescuedOtherInfo& ModifyOrAddInRescuedOtherInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_InRescuedOtherInfo));
    return local_12.GetComp();
}
const FC_InRescuedOtherInfo& GetInRescuedOtherInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_InRescuedOtherInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_InRescuedOtherInfo GetInRescuedOtherInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_InRescuedOtherInfo& local_4 = ECSFunc_FC_InRescuedOtherInfo::GetInRescuedOtherInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_InRescuedOtherInfo();
}
const FC_InRescuedOtherInfo GetDefaultedInRescuedOtherInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_InRescuedOtherInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_InRescuedOtherInfo);
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
FC_InRescuedOtherInfo GetDefaultedInRescuedOtherInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_InRescuedOtherInfo::GetDefaultedInRescuedOtherInfo(Entity);
}
UFUNCTION()
bool RemoveInRescuedOtherInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_InRescuedOtherInfo);
}
}
FECSMonitorRuntimeView __GetMonitorInRescuedOtherInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_InRescuedOtherInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInRescuedOtherInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_InRescuedOtherInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInRescuedOtherInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_InRescuedOtherInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInRescuedOtherInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_InRescuedOtherInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInRescuedOtherInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_InRescuedOtherInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorInRescuedOtherInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_InRescuedOtherInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInRescuedOtherInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_InRescuedOtherInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInRescuedOtherInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_InRescuedOtherInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_NearDeathCounter
{
UFUNCTION()
bool HasNearDeathCounter(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_NearDeathCounter);
}
FC_NearDeathCounter& AssignNearDeathCounter(const FECSEntity &inout Entity, const FC_NearDeathCounter &inout DefaultValue = FC_NearDeathCounter())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_NearDeathCounter, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignNearDeathCounter_BP(const FECSEntity &inout Entity, const FC_NearDeathCounter &inout DefaultValue = FC_NearDeathCounter())
{
    ECSFunc_FC_NearDeathCounter::AssignNearDeathCounter(Entity, DefaultValue);
    return;
}
FC_NearDeathCounter& ModifyNearDeathCounter(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_NearDeathCounter));
    return local_12.GetComp();
}
FC_NearDeathCounter& ModifyOrAddNearDeathCounter(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_NearDeathCounter));
    return local_12.GetComp();
}
const FC_NearDeathCounter& GetNearDeathCounter(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_NearDeathCounter));
    return local_12.GetComp();
}
UFUNCTION()
FC_NearDeathCounter GetNearDeathCounter_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_NearDeathCounter& local_4 = ECSFunc_FC_NearDeathCounter::GetNearDeathCounter(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_NearDeathCounter();
}
const FC_NearDeathCounter GetDefaultedNearDeathCounter(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_NearDeathCounter __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_NearDeathCounter);
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
FC_NearDeathCounter GetDefaultedNearDeathCounter_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_NearDeathCounter::GetDefaultedNearDeathCounter(Entity);
}
UFUNCTION()
bool RemoveNearDeathCounter(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_NearDeathCounter);
}
}
FECSMonitorRuntimeView __GetMonitorNearDeathCounterOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_NearDeathCounter, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNearDeathCounterOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_NearDeathCounter, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNearDeathCounterOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_NearDeathCounter, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNearDeathCounterOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_NearDeathCounter, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNearDeathCounterOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_NearDeathCounter, bFixedFrame, bMustHandleAll);
}
void __MonitorNearDeathCounterLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_NearDeathCounter, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNearDeathCounterActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_NearDeathCounter, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNearDeathCounterModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_NearDeathCounter, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_NearDeathRule
{
UFUNCTION()
bool HasNearDeathRule(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_NearDeathRule);
}
FCS_NearDeathRule& AssignNearDeathRule(const FECSWorldPtr &inout World, const FCS_NearDeathRule &inout DefaultValue = FCS_NearDeathRule())
{
    UScriptStruct local_6 = FCS_NearDeathRule;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignNearDeathRule_BP(const FECSWorldPtr &inout World, const FCS_NearDeathRule &inout DefaultValue = FCS_NearDeathRule())
{
    ECSFunc_FCS_NearDeathRule::AssignNearDeathRule(World, DefaultValue);
    return;
}
FCS_NearDeathRule& ModifyNearDeathRule(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_NearDeathRule;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_NearDeathRule& ModifyOrAddNearDeathRule(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_NearDeathRule;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_NearDeathRule& GetNearDeathRule(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_NearDeathRule;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_NearDeathRule GetNearDeathRule_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_NearDeathRule& local_4 = ECSFunc_FCS_NearDeathRule::GetNearDeathRule(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_NearDeathRule();
}
const FCS_NearDeathRule GetDefaultedNearDeathRule(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_NearDeathRule __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_NearDeathRule);
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
FCS_NearDeathRule GetDefaultedNearDeathRule_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_NearDeathRule::GetDefaultedNearDeathRule(World);
}
UFUNCTION()
bool RemoveNearDeathRule(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_NearDeathRule);
}
}
void __MonitorNearDeathRuleLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_NearDeathRule, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNearDeathRuleActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_NearDeathRule, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNearDeathRuleModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_NearDeathRule, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_BeingRescuedViewProgress_RescueProgress(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().RescueProgress;
    return;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_NearDeathInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_NearDeathInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_NearDeathInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_NearDeathInfo
{
int __IndexOf_NearDeathHP()
{
    return 0;
}
int __IndexOf_MaxNearDeathHP()
{
    return 1;
}
int __IndexOf_KilledByEntity()
{
    return 2;
}
int __IndexOf_bCanHitOrLockTargetWhenNearDeath()
{
    return 3;
}
int __IndexOf_bNearDeathHPZeroByDamage()
{
    return 4;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_NearDeathDeferTransition &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_NearDeathDeferTransition &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_NearDeathDeferTransition &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_NearDeathDeferTransition
{
int __IndexOf_bWaitLand()
{
    return 0;
}
int __IndexOf_bDeferByAction()
{
    return 1;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_BeingRescuedInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_BeingRescuedInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_BeingRescuedInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_BeingRescuedInfo
{
int __IndexOf_RescuedByEntity()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_InRescuedOtherInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_InRescuedOtherInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_InRescuedOtherInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_InRescuedOtherInfo
{
int __IndexOf_RescuedTarget()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_NearDeathCounter &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_NearDeathCounter &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_NearDeathCounter &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_NearDeathCounter
{
int __IndexOf_NearDeathCount()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_NearDeathRule &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_NearDeathRule &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_NearDeathRule &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_NearDeathRule
{
int __IndexOf_ReviveData()
{
    return 0;
}
}
