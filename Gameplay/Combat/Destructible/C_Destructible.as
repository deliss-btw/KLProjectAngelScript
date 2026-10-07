
enum EDestructibleBreakType
{
    DestroyEntity,
    HideComponent,
}

namespace __INTENRAL_FC_DestructibleConfig_NS
{
    const TECSComponentDerivedPtr<FC_DestructibleConfig> DerivedPtr = TECSComponentDerivedPtr<FC_DestructibleConfig>();
    const FC_DestructibleConfig DefaultValue = FC_DestructibleConfig();
}
namespace __INTENRAL_FC_DestructibleDamageDefaultConfig_NS
{
    const TECSComponentDerivedPtr<FC_DestructibleDamageDefaultConfig> DerivedPtr = TECSComponentDerivedPtr<FC_DestructibleDamageDefaultConfig>();
    const FC_DestructibleDamageDefaultConfig DefaultValue = FC_DestructibleDamageDefaultConfig();
}
namespace __INTENRAL_FC_OverrideMovementDestructibleDamageLevel_NS
{
    const TECSComponentDerivedPtr<FC_OverrideMovementDestructibleDamageLevel> DerivedPtr = TECSComponentDerivedPtr<FC_OverrideMovementDestructibleDamageLevel>();
    const FC_OverrideMovementDestructibleDamageLevel DefaultValue = FC_OverrideMovementDestructibleDamageLevel();
}
namespace __INTENRAL_FC_DestructibleBreakedTag_NS
{
    const TECSComponentDerivedPtr<FC_DestructibleBreakedTag> DerivedPtr = TECSComponentDerivedPtr<FC_DestructibleBreakedTag>();
    const FC_DestructibleBreakedTag DefaultValue = FC_DestructibleBreakedTag();
}
namespace __INTENRAL_FCE_DestructibleHitEvent_NS
{
    const TECSEventDerivedPtr<FCE_DestructibleHitEvent> DerivedPtr = TECSEventDerivedPtr<FCE_DestructibleHitEvent>();

}
struct FHideComponentItem
{
    UPROPERTY()
    FName ComponentName;
    UPROPERTY()
    bool bVisibility = false;


}

struct FMoveDestructibleDetect : FECSComponent
{
    UPROPERTY()
    FCollisionShapeInfo MoveDestructibleDetectShape;
    UPROPERTY()
    FRotator MoveDestructibleDetectShapeRotation = FRotator::ZeroRotator;
    UPROPERTY()
    FVector MoveDestructibleDetectShapeOffsetToCenter = FVector::ZeroVector;
    UPROPERTY()
    EImpactType ImpactType = EImpactType(0);
    UPROPERTY()
    EImpactStrength ImpactStrength = EImpactStrength(0);


}

struct FC_DestructibleConfig : FECSComponent
{
    UPROPERTY()
    TSubclassOf<AFXActor> DestructibleFX;
    UPROPERTY()
    EDestructibleClassLevel DestructibleClass = EDestructibleClassLevel(1);
    UPROPERTY()
    EDestructibleBreakType BreakType = EDestructibleBreakType(0);
    UPROPERTY()
    TArray<FHideComponentItem> BreakToggleVisualCompts;
    UPROPERTY()
    TArray<FEnableDisableColliderItem> BreakToggleColliders;


}

struct FC_DestructibleDamageDefaultConfig : FECSComponent
{
    UPROPERTY()
    EDestructibleClassLevel AttackDestructibleDamageLevel = EDestructibleClassLevel(1);
    UPROPERTY()
    EDestructibleClassLevel MovementDestructibleDamageLevel = EDestructibleClassLevel(0);
    UPROPERTY()
    FMoveDestructibleDetect DefaultMoveDestructibleDetect;


}

struct FC_OverrideMovementDestructibleDamageLevel : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    EDestructibleClassLevel m_MovementDestructibleDamageLevel;

    FC_OverrideMovementDestructibleDamageLevel()
    {
        this.m_MovementDestructibleDamageLevel = EDestructibleClassLevel(0);
        this.__InitDirtyFlags();
        return;
    }
    FC_OverrideMovementDestructibleDamageLevel(const FC_OverrideMovementDestructibleDamageLevel &inout Other)
    {
        this.m_MovementDestructibleDamageLevel = EDestructibleClassLevel(0);
        this.__InitDirtyFlags();
        this.m_MovementDestructibleDamageLevel = Other.m_MovementDestructibleDamageLevel;
        return;
    }
    FC_OverrideMovementDestructibleDamageLevel opAssign(const FC_OverrideMovementDestructibleDamageLevel &inout Other)
    {
        FC_OverrideMovementDestructibleDamageLevel __r;
        this.SetMovementDestructibleDamageLevel(Other.GetMovementDestructibleDamageLevel());
        return __r;
    }
    EDestructibleClassLevel GetMovementDestructibleDamageLevel() const property
    {
        return this.m_MovementDestructibleDamageLevel;
    }
    void SetMovementDestructibleDamageLevel(const EDestructibleClassLevel __Value) property
    {
        if (int(this.m_MovementDestructibleDamageLevel) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_MovementDestructibleDamageLevel = __Value;
        return;
    }
}

struct FC_DestructibleBreakedTag : FECSComponent
{
    FC_DestructibleBreakedTag()
    {
        return;
    }
}

struct FCE_DestructibleHitEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity Receiver;
    UPROPERTY()
    EImpactType ImpactType;
    UPROPERTY()
    EImpactStrength ImpactStrength;
    UPROPERTY()
    FVector ForceDirection;
    UPROPERTY()
    EDestructibleClassLevel DestructibleDamageLevel;


}

namespace ECSFunc_FC_DestructibleConfig
{
UFUNCTION()
bool HasDestructibleConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DestructibleConfig);
}
FC_DestructibleConfig& AssignDestructibleConfig(const FECSEntity &inout Entity, const FC_DestructibleConfig &inout DefaultValue = FC_DestructibleConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DestructibleConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDestructibleConfig_BP(const FECSEntity &inout Entity, const FC_DestructibleConfig &inout DefaultValue = FC_DestructibleConfig())
{
    ECSFunc_FC_DestructibleConfig::AssignDestructibleConfig(Entity, DefaultValue);
    return;
}
FC_DestructibleConfig& ModifyDestructibleConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DestructibleConfig));
    return local_12.GetComp();
}
FC_DestructibleConfig& ModifyOrAddDestructibleConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DestructibleConfig));
    return local_12.GetComp();
}
const FC_DestructibleConfig& GetDestructibleConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DestructibleConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_DestructibleConfig GetDestructibleConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_DestructibleConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_DestructibleConfig::GetDestructibleConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_DestructibleConfig GetDefaultedDestructibleConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DestructibleConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DestructibleConfig);
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
FC_DestructibleConfig GetDefaultedDestructibleConfig_BP(const FECSEntity &inout Entity)
{
    FC_DestructibleConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveDestructibleConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DestructibleConfig);
}
}
FECSMonitorRuntimeView __GetMonitorDestructibleConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DestructibleConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDestructibleConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DestructibleConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDestructibleConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DestructibleConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDestructibleConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DestructibleConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDestructibleConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DestructibleConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorDestructibleConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DestructibleConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDestructibleConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DestructibleConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDestructibleConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DestructibleConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DestructibleDamageDefaultConfig
{
UFUNCTION()
bool HasDestructibleDamageDefaultConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DestructibleDamageDefaultConfig);
}
FC_DestructibleDamageDefaultConfig& AssignDestructibleDamageDefaultConfig(const FECSEntity &inout Entity, const FC_DestructibleDamageDefaultConfig &inout DefaultValue = FC_DestructibleDamageDefaultConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DestructibleDamageDefaultConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDestructibleDamageDefaultConfig_BP(const FECSEntity &inout Entity, const FC_DestructibleDamageDefaultConfig &inout DefaultValue = FC_DestructibleDamageDefaultConfig())
{
    ECSFunc_FC_DestructibleDamageDefaultConfig::AssignDestructibleDamageDefaultConfig(Entity, DefaultValue);
    return;
}
FC_DestructibleDamageDefaultConfig& ModifyDestructibleDamageDefaultConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DestructibleDamageDefaultConfig));
    return local_12.GetComp();
}
FC_DestructibleDamageDefaultConfig& ModifyOrAddDestructibleDamageDefaultConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DestructibleDamageDefaultConfig));
    return local_12.GetComp();
}
const FC_DestructibleDamageDefaultConfig& GetDestructibleDamageDefaultConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DestructibleDamageDefaultConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_DestructibleDamageDefaultConfig GetDestructibleDamageDefaultConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_DestructibleDamageDefaultConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_DestructibleDamageDefaultConfig::GetDestructibleDamageDefaultConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_DestructibleDamageDefaultConfig GetDefaultedDestructibleDamageDefaultConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DestructibleDamageDefaultConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DestructibleDamageDefaultConfig);
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
FC_DestructibleDamageDefaultConfig GetDefaultedDestructibleDamageDefaultConfig_BP(const FECSEntity &inout Entity)
{
    FC_DestructibleDamageDefaultConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveDestructibleDamageDefaultConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DestructibleDamageDefaultConfig);
}
}
FECSMonitorRuntimeView __GetMonitorDestructibleDamageDefaultConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DestructibleDamageDefaultConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDestructibleDamageDefaultConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DestructibleDamageDefaultConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDestructibleDamageDefaultConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DestructibleDamageDefaultConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDestructibleDamageDefaultConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DestructibleDamageDefaultConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDestructibleDamageDefaultConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DestructibleDamageDefaultConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorDestructibleDamageDefaultConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DestructibleDamageDefaultConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDestructibleDamageDefaultConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DestructibleDamageDefaultConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDestructibleDamageDefaultConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DestructibleDamageDefaultConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_OverrideMovementDestructibleDamageLevel
{
UFUNCTION()
bool HasOverrideMovementDestructibleDamageLevel(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_OverrideMovementDestructibleDamageLevel);
}
FC_OverrideMovementDestructibleDamageLevel& AssignOverrideMovementDestructibleDamageLevel(const FECSEntity &inout Entity, const FC_OverrideMovementDestructibleDamageLevel &inout DefaultValue = FC_OverrideMovementDestructibleDamageLevel())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_OverrideMovementDestructibleDamageLevel, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignOverrideMovementDestructibleDamageLevel_BP(const FECSEntity &inout Entity, const FC_OverrideMovementDestructibleDamageLevel &inout DefaultValue = FC_OverrideMovementDestructibleDamageLevel())
{
    ECSFunc_FC_OverrideMovementDestructibleDamageLevel::AssignOverrideMovementDestructibleDamageLevel(Entity, DefaultValue);
    return;
}
FC_OverrideMovementDestructibleDamageLevel& ModifyOverrideMovementDestructibleDamageLevel(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_OverrideMovementDestructibleDamageLevel));
    return local_12.GetComp();
}
FC_OverrideMovementDestructibleDamageLevel& ModifyOrAddOverrideMovementDestructibleDamageLevel(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_OverrideMovementDestructibleDamageLevel));
    return local_12.GetComp();
}
const FC_OverrideMovementDestructibleDamageLevel& GetOverrideMovementDestructibleDamageLevel(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_OverrideMovementDestructibleDamageLevel));
    return local_12.GetComp();
}
UFUNCTION()
FC_OverrideMovementDestructibleDamageLevel GetOverrideMovementDestructibleDamageLevel_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_OverrideMovementDestructibleDamageLevel& local_4 = ECSFunc_FC_OverrideMovementDestructibleDamageLevel::GetOverrideMovementDestructibleDamageLevel(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_OverrideMovementDestructibleDamageLevel();
}
const FC_OverrideMovementDestructibleDamageLevel GetDefaultedOverrideMovementDestructibleDamageLevel(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_OverrideMovementDestructibleDamageLevel __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_OverrideMovementDestructibleDamageLevel);
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
FC_OverrideMovementDestructibleDamageLevel GetDefaultedOverrideMovementDestructibleDamageLevel_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_OverrideMovementDestructibleDamageLevel::GetDefaultedOverrideMovementDestructibleDamageLevel(Entity);
}
UFUNCTION()
bool RemoveOverrideMovementDestructibleDamageLevel(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_OverrideMovementDestructibleDamageLevel);
}
}
FECSMonitorRuntimeView __GetMonitorOverrideMovementDestructibleDamageLevelOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_OverrideMovementDestructibleDamageLevel, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOverrideMovementDestructibleDamageLevelOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_OverrideMovementDestructibleDamageLevel, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOverrideMovementDestructibleDamageLevelOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_OverrideMovementDestructibleDamageLevel, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOverrideMovementDestructibleDamageLevelOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_OverrideMovementDestructibleDamageLevel, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOverrideMovementDestructibleDamageLevelOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_OverrideMovementDestructibleDamageLevel, bFixedFrame, bMustHandleAll);
}
void __MonitorOverrideMovementDestructibleDamageLevelLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_OverrideMovementDestructibleDamageLevel, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorOverrideMovementDestructibleDamageLevelActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_OverrideMovementDestructibleDamageLevel, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorOverrideMovementDestructibleDamageLevelModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_OverrideMovementDestructibleDamageLevel, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DestructibleBreakedTag
{
UFUNCTION()
bool HasDestructibleBreakedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DestructibleBreakedTag);
}
FC_DestructibleBreakedTag& AssignDestructibleBreakedTag(const FECSEntity &inout Entity, const FC_DestructibleBreakedTag &inout DefaultValue = FC_DestructibleBreakedTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DestructibleBreakedTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDestructibleBreakedTag_BP(const FECSEntity &inout Entity, const FC_DestructibleBreakedTag &inout DefaultValue = FC_DestructibleBreakedTag())
{
    ECSFunc_FC_DestructibleBreakedTag::AssignDestructibleBreakedTag(Entity, DefaultValue);
    return;
}
FC_DestructibleBreakedTag& ModifyDestructibleBreakedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DestructibleBreakedTag));
    return local_12.GetComp();
}
FC_DestructibleBreakedTag& ModifyOrAddDestructibleBreakedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DestructibleBreakedTag));
    return local_12.GetComp();
}
const FC_DestructibleBreakedTag& GetDestructibleBreakedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DestructibleBreakedTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_DestructibleBreakedTag GetDestructibleBreakedTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DestructibleBreakedTag& local_4 = ECSFunc_FC_DestructibleBreakedTag::GetDestructibleBreakedTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DestructibleBreakedTag();
}
const FC_DestructibleBreakedTag GetDefaultedDestructibleBreakedTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DestructibleBreakedTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DestructibleBreakedTag);
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
FC_DestructibleBreakedTag GetDefaultedDestructibleBreakedTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DestructibleBreakedTag::GetDefaultedDestructibleBreakedTag(Entity);
}
UFUNCTION()
bool RemoveDestructibleBreakedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DestructibleBreakedTag);
}
}
FECSMonitorRuntimeView __GetMonitorDestructibleBreakedTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DestructibleBreakedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDestructibleBreakedTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DestructibleBreakedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDestructibleBreakedTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DestructibleBreakedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDestructibleBreakedTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DestructibleBreakedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDestructibleBreakedTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DestructibleBreakedTag, bFixedFrame, bMustHandleAll);
}
void __MonitorDestructibleBreakedTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DestructibleBreakedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDestructibleBreakedTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DestructibleBreakedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDestructibleBreakedTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DestructibleBreakedTag, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_OverrideMovementDestructibleDamageLevel &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_OverrideMovementDestructibleDamageLevel &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_OverrideMovementDestructibleDamageLevel &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_OverrideMovementDestructibleDamageLevel
{
int __IndexOf_MovementDestructibleDamageLevel()
{
    return 0;
}
}
