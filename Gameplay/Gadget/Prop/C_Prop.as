
namespace __INTENRAL_FC_Prop_NS
{
    const TECSComponentDerivedPtr<FC_Prop> DerivedPtr = TECSComponentDerivedPtr<FC_Prop>();
    const FC_Prop DefaultValue = FC_Prop();
}
namespace __INTENRAL_FC_PropDeathConfig_NS
{
    const TECSComponentDerivedPtr<FC_PropDeathConfig> DerivedPtr = TECSComponentDerivedPtr<FC_PropDeathConfig>();
    const FC_PropDeathConfig DefaultValue = FC_PropDeathConfig();
}
namespace __INTENRAL_FC_PropTrackOwner_NS
{
    const TECSComponentDerivedPtr<FC_PropTrackOwner> DerivedPtr = TECSComponentDerivedPtr<FC_PropTrackOwner>();
    const FC_PropTrackOwner DefaultValue = FC_PropTrackOwner();
}
namespace __INTENRAL_FC_ManipulateProp_NS
{
    const TECSComponentDerivedPtr<FC_ManipulateProp> DerivedPtr = TECSComponentDerivedPtr<FC_ManipulateProp>();
    const FC_ManipulateProp DefaultValue = FC_ManipulateProp();
}
namespace __INTENRAL_FC_ManipulatedPropStartOverHeatCoolDownTimer_NS
{
    const TECSComponentDerivedPtr<FC_ManipulatedPropStartOverHeatCoolDownTimer> DerivedPtr = TECSComponentDerivedPtr<FC_ManipulatedPropStartOverHeatCoolDownTimer>();
    const FC_ManipulatedPropStartOverHeatCoolDownTimer DefaultValue = FC_ManipulatedPropStartOverHeatCoolDownTimer();
}
namespace __INTENRAL_FC_ManipulatedPropOverHeatCoolDownTag_NS
{
    const TECSComponentDerivedPtr<FC_ManipulatedPropOverHeatCoolDownTag> DerivedPtr = TECSComponentDerivedPtr<FC_ManipulatedPropOverHeatCoolDownTag>();
    const FC_ManipulatedPropOverHeatCoolDownTag DefaultValue = FC_ManipulatedPropOverHeatCoolDownTag();
}
namespace __INTENRAL_FC_PropEnvBreakableConfig_NS
{
    const TECSComponentDerivedPtr<FC_PropEnvBreakableConfig> DerivedPtr = TECSComponentDerivedPtr<FC_PropEnvBreakableConfig>();
    const FC_PropEnvBreakableConfig DefaultValue = FC_PropEnvBreakableConfig();
}
namespace __INTENRAL_FCE_EnvBreakablePropDeadEvent_NS
{
    const TECSEventDerivedPtr<FCE_EnvBreakablePropDeadEvent> DerivedPtr = TECSEventDerivedPtr<FCE_EnvBreakablePropDeadEvent>();
}
namespace __INTENRAL_FCE_EnvBreakablePropPhaseChangedEvent_NS
{
    const TECSEventDerivedPtr<FCE_EnvBreakablePropPhaseChangedEvent> DerivedPtr = TECSEventDerivedPtr<FCE_EnvBreakablePropPhaseChangedEvent>();

}
struct FC_Prop : FECSComponent
{
    UPROPERTY()
    bool bHasSpawnRecycleDis = false;
    UPROPERTY()
    bool bActiveWithOwner = false;
    UPROPERTY()
    float32 SpawnRecycleDis = 10000.0f;
    UPROPERTY()
    TDataObjectPtr<FMotionData> SpawnConfig;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> HintConfig;


}

struct FC_PropDeathConfig : FECSComponent
{
    UPROPERTY()
    FFXConfig DeadFx;
    UPROPERTY()
    bool bHasDestroyWaitTime = false;
    UPROPERTY()
    float32 DeathDestroyWaitTime = -1.0f;
    UPROPERTY()
    bool bAddBuffToPlayerWhenKilledByPlayer = false;
    UPROPERTY()
    bool bIncludeDefaultBuffConfigs = true;
    UPROPERTY()
    FPrefabConfigNameSelector BuffTagNames;


}

struct FC_PropTrackOwner : FECSComponent
{
    UPROPERTY()
    USkillConfig OwnerSkillConfig;
    UPROPERTY()
    FName SignalName;

    FC_PropTrackOwner()
    {
        return;
    }
}

struct FC_ManipulateProp : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_ManipulatedPropEntity;
    UPROPERTY()
    FECSEntity m_ManipulatorEntity;
    UPROPERTY()
    EProjectileFireResourceType m_FireResourceType;
    UPROPERTY()
    float32 m_Energy;
    UPROPERTY()
    float32 m_EnergyMax;
    UPROPERTY()
    float32 m_HeatValue;
    UPROPERTY()
    float32 m_HeatValueMax;
    UPROPERTY()
    float32 m_StartOverHeatCoolDownTime;
    UPROPERTY()
    float32 m_OverHeatCoolDownSpeed;
    UPROPERTY()
    bool m_bIsOverHeat;

    FC_ManipulateProp()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ManipulateProp(const FC_ManipulateProp &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ManipulateProp opAssign(const FC_ManipulateProp &inout Other)
    {
        FC_ManipulateProp __r;
        this.SetManipulatedPropEntity(Other.GetManipulatedPropEntity());
        this.SetManipulatorEntity(Other.GetManipulatorEntity());
        this.SetFireResourceType(Other.GetFireResourceType());
        this.SetEnergy(Other.GetEnergy());
        this.SetEnergyMax(Other.GetEnergyMax());
        this.SetHeatValue(Other.GetHeatValue());
        this.SetHeatValueMax(Other.GetHeatValueMax());
        this.SetStartOverHeatCoolDownTime(Other.GetStartOverHeatCoolDownTime());
        this.SetOverHeatCoolDownSpeed(Other.GetOverHeatCoolDownSpeed());
        this.SetbIsOverHeat(Other.GetbIsOverHeat());
        return __r;
    }
    const FECSEntity GetManipulatedPropEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_ManipulatedPropEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetManipulatedPropEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ManipulatedPropEntity = __Value;
        return;
    }
    const FECSEntity GetManipulatorEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_ManipulatorEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetManipulatorEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_ManipulatorEntity = __Value;
        return;
    }
    EProjectileFireResourceType GetFireResourceType() const property
    {
        return this.m_FireResourceType;
    }
    void SetFireResourceType(const EProjectileFireResourceType __Value) property
    {
        if (int(this.m_FireResourceType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_FireResourceType = __Value;
        return;
    }
    float32 GetEnergy() const property
    {
        return this.m_Energy;
    }
    void SetEnergy(const float32 __Value) property
    {
        if (this.m_Energy == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_Energy = __Value;
        return;
    }
    float32 GetEnergyMax() const property
    {
        return this.m_EnergyMax;
    }
    void SetEnergyMax(const float32 __Value) property
    {
        if (this.m_EnergyMax == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_EnergyMax = __Value;
        return;
    }
    float32 GetHeatValue() const property
    {
        return this.m_HeatValue;
    }
    void SetHeatValue(const float32 __Value) property
    {
        if (this.m_HeatValue == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_HeatValue = __Value;
        return;
    }
    float32 GetHeatValueMax() const property
    {
        return this.m_HeatValueMax;
    }
    void SetHeatValueMax(const float32 __Value) property
    {
        if (this.m_HeatValueMax == __Value)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_HeatValueMax = __Value;
        return;
    }
    float32 GetStartOverHeatCoolDownTime() const property
    {
        return this.m_StartOverHeatCoolDownTime;
    }
    void SetStartOverHeatCoolDownTime(const float32 __Value) property
    {
        if (this.m_StartOverHeatCoolDownTime == __Value)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_StartOverHeatCoolDownTime = __Value;
        return;
    }
    float32 GetOverHeatCoolDownSpeed() const property
    {
        return this.m_OverHeatCoolDownSpeed;
    }
    void SetOverHeatCoolDownSpeed(const float32 __Value) property
    {
        if (this.m_OverHeatCoolDownSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_OverHeatCoolDownSpeed = __Value;
        return;
    }
    bool GetbIsOverHeat() const property
    {
        return this.m_bIsOverHeat;
    }
    void SetbIsOverHeat(const bool __Value) property
    {
        if (!(this.m_bIsOverHeat) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_bIsOverHeat = __Value;
        return;
    }
}

struct FC_ManipulatedPropStartOverHeatCoolDownTimer : FECSComponent
{
    UPROPERTY()
    FFPTime TargetWorldTime;

    FC_ManipulatedPropStartOverHeatCoolDownTimer()
    {
        return;
    }
}

struct FC_ManipulatedPropOverHeatCoolDownTag : FECSComponent
{
    FC_ManipulatedPropOverHeatCoolDownTag()
    {
        return;
    }
}

struct FC_PropEnvBreakableConfig : FECSComponent
{
    UPROPERTY()
    EDestructibleClassLevel DestructibleClass = EDestructibleClassLevel(1);
    UPROPERTY()
    bool bAutoDeadWhenEnvHPZero = false;
    UPROPERTY()
    TArray<float32> BreakPhases;


    bool CheckValidSorted() const
    {
        if (this.BreakPhases.Num() <= 1)
        {
            return true;
        }
        int local_4 = 0;
        for (; local_4 < (this.BreakPhases.Num() - 1); ++local_4)
        {
            if (this.BreakPhases[local_4] <= this.BreakPhases[local_4 + 1])
            {
                return false;
            }
        }
        return true;
    }
}

struct FCE_EnvBreakablePropDeadEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity FinalDamageSource;

    FCE_EnvBreakablePropDeadEvent()
    {
        return;
    }
}

struct FCE_EnvBreakablePropPhaseChangedEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    int OldPhase;
    UPROPERTY()
    int NewPhase;


}

namespace ECSFunc_FC_Prop
{
UFUNCTION()
bool HasProp(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_Prop);
}
FC_Prop& AssignProp(const FECSEntity &inout Entity, const FC_Prop &inout DefaultValue = FC_Prop())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_Prop, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProp_BP(const FECSEntity &inout Entity, const FC_Prop &inout DefaultValue = FC_Prop())
{
    ECSFunc_FC_Prop::AssignProp(Entity, DefaultValue);
    return;
}
FC_Prop& ModifyProp(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_Prop));
    return local_12.GetComp();
}
FC_Prop& ModifyOrAddProp(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_Prop));
    return local_12.GetComp();
}
const FC_Prop& GetProp(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_Prop));
    return local_12.GetComp();
}
UFUNCTION()
FC_Prop GetProp_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_Prop __r;
    bValid = false;
    bValid = ECSFunc_FC_Prop::GetProp(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_Prop GetDefaultedProp(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_Prop __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_Prop);
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
FC_Prop GetDefaultedProp_BP(const FECSEntity &inout Entity)
{
    FC_Prop __r;
    return __r;
}
UFUNCTION()
bool RemoveProp(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_Prop);
}
}
FECSMonitorRuntimeView __GetMonitorPropOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_Prop, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_Prop, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_Prop, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_Prop, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_Prop, bFixedFrame, bMustHandleAll);
}
void __MonitorPropLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_Prop, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPropActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_Prop, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPropModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_Prop, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PropDeathConfig
{
UFUNCTION()
bool HasPropDeathConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PropDeathConfig);
}
FC_PropDeathConfig& AssignPropDeathConfig(const FECSEntity &inout Entity, const FC_PropDeathConfig &inout DefaultValue = FC_PropDeathConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PropDeathConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPropDeathConfig_BP(const FECSEntity &inout Entity, const FC_PropDeathConfig &inout DefaultValue = FC_PropDeathConfig())
{
    ECSFunc_FC_PropDeathConfig::AssignPropDeathConfig(Entity, DefaultValue);
    return;
}
FC_PropDeathConfig& ModifyPropDeathConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PropDeathConfig));
    return local_12.GetComp();
}
FC_PropDeathConfig& ModifyOrAddPropDeathConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PropDeathConfig));
    return local_12.GetComp();
}
const FC_PropDeathConfig& GetPropDeathConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PropDeathConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_PropDeathConfig GetPropDeathConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PropDeathConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_PropDeathConfig::GetPropDeathConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PropDeathConfig GetDefaultedPropDeathConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PropDeathConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PropDeathConfig);
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
FC_PropDeathConfig GetDefaultedPropDeathConfig_BP(const FECSEntity &inout Entity)
{
    FC_PropDeathConfig __r;
    return __r;
}
UFUNCTION()
bool RemovePropDeathConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PropDeathConfig);
}
}
FECSMonitorRuntimeView __GetMonitorPropDeathConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PropDeathConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropDeathConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PropDeathConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropDeathConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PropDeathConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropDeathConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PropDeathConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropDeathConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PropDeathConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorPropDeathConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PropDeathConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPropDeathConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PropDeathConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPropDeathConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PropDeathConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PropTrackOwner
{
UFUNCTION()
bool HasPropTrackOwner(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PropTrackOwner);
}
FC_PropTrackOwner& AssignPropTrackOwner(const FECSEntity &inout Entity, const FC_PropTrackOwner &inout DefaultValue = FC_PropTrackOwner())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PropTrackOwner, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPropTrackOwner_BP(const FECSEntity &inout Entity, const FC_PropTrackOwner &inout DefaultValue = FC_PropTrackOwner())
{
    ECSFunc_FC_PropTrackOwner::AssignPropTrackOwner(Entity, DefaultValue);
    return;
}
FC_PropTrackOwner& ModifyPropTrackOwner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PropTrackOwner));
    return local_12.GetComp();
}
FC_PropTrackOwner& ModifyOrAddPropTrackOwner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PropTrackOwner));
    return local_12.GetComp();
}
const FC_PropTrackOwner& GetPropTrackOwner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PropTrackOwner));
    return local_12.GetComp();
}
UFUNCTION()
FC_PropTrackOwner GetPropTrackOwner_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PropTrackOwner& local_4 = ECSFunc_FC_PropTrackOwner::GetPropTrackOwner(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PropTrackOwner();
}
const FC_PropTrackOwner GetDefaultedPropTrackOwner(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PropTrackOwner __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PropTrackOwner);
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
FC_PropTrackOwner GetDefaultedPropTrackOwner_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PropTrackOwner::GetDefaultedPropTrackOwner(Entity);
}
UFUNCTION()
bool RemovePropTrackOwner(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PropTrackOwner);
}
}
FECSMonitorRuntimeView __GetMonitorPropTrackOwnerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PropTrackOwner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropTrackOwnerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PropTrackOwner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropTrackOwnerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PropTrackOwner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropTrackOwnerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PropTrackOwner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropTrackOwnerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PropTrackOwner, bFixedFrame, bMustHandleAll);
}
void __MonitorPropTrackOwnerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PropTrackOwner, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPropTrackOwnerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PropTrackOwner, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPropTrackOwnerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PropTrackOwner, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ManipulateProp
{
UFUNCTION()
bool HasManipulateProp(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ManipulateProp);
}
FC_ManipulateProp& AssignManipulateProp(const FECSEntity &inout Entity, const FC_ManipulateProp &inout DefaultValue = FC_ManipulateProp())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ManipulateProp, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignManipulateProp_BP(const FECSEntity &inout Entity, const FC_ManipulateProp &inout DefaultValue = FC_ManipulateProp())
{
    ECSFunc_FC_ManipulateProp::AssignManipulateProp(Entity, DefaultValue);
    return;
}
FC_ManipulateProp& ModifyManipulateProp(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ManipulateProp));
    return local_12.GetComp();
}
FC_ManipulateProp& ModifyOrAddManipulateProp(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ManipulateProp));
    return local_12.GetComp();
}
const FC_ManipulateProp& GetManipulateProp(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ManipulateProp));
    return local_12.GetComp();
}
UFUNCTION()
FC_ManipulateProp GetManipulateProp_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ManipulateProp& local_4 = ECSFunc_FC_ManipulateProp::GetManipulateProp(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ManipulateProp();
}
const FC_ManipulateProp GetDefaultedManipulateProp(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ManipulateProp __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ManipulateProp);
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
FC_ManipulateProp GetDefaultedManipulateProp_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ManipulateProp::GetDefaultedManipulateProp(Entity);
}
UFUNCTION()
bool RemoveManipulateProp(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ManipulateProp);
}
}
FECSMonitorRuntimeView __GetMonitorManipulatePropOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ManipulateProp, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulatePropOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ManipulateProp, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulatePropOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ManipulateProp, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulatePropOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ManipulateProp, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulatePropOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ManipulateProp, bFixedFrame, bMustHandleAll);
}
void __MonitorManipulatePropLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ManipulateProp, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorManipulatePropActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ManipulateProp, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorManipulatePropModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ManipulateProp, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ManipulatedPropStartOverHeatCoolDownTimer
{
UFUNCTION()
bool HasManipulatedPropStartOverHeatCoolDownTimer(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ManipulatedPropStartOverHeatCoolDownTimer);
}
FC_ManipulatedPropStartOverHeatCoolDownTimer& AssignManipulatedPropStartOverHeatCoolDownTimer(const FECSEntity &inout Entity, const FC_ManipulatedPropStartOverHeatCoolDownTimer &inout DefaultValue = FC_ManipulatedPropStartOverHeatCoolDownTimer())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ManipulatedPropStartOverHeatCoolDownTimer, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignManipulatedPropStartOverHeatCoolDownTimer_BP(const FECSEntity &inout Entity, const FC_ManipulatedPropStartOverHeatCoolDownTimer &inout DefaultValue = FC_ManipulatedPropStartOverHeatCoolDownTimer())
{
    ECSFunc_FC_ManipulatedPropStartOverHeatCoolDownTimer::AssignManipulatedPropStartOverHeatCoolDownTimer(Entity, DefaultValue);
    return;
}
FC_ManipulatedPropStartOverHeatCoolDownTimer& ModifyManipulatedPropStartOverHeatCoolDownTimer(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ManipulatedPropStartOverHeatCoolDownTimer));
    return local_12.GetComp();
}
FC_ManipulatedPropStartOverHeatCoolDownTimer& ModifyOrAddManipulatedPropStartOverHeatCoolDownTimer(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ManipulatedPropStartOverHeatCoolDownTimer));
    return local_12.GetComp();
}
const FC_ManipulatedPropStartOverHeatCoolDownTimer& GetManipulatedPropStartOverHeatCoolDownTimer(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ManipulatedPropStartOverHeatCoolDownTimer));
    return local_12.GetComp();
}
UFUNCTION()
FC_ManipulatedPropStartOverHeatCoolDownTimer GetManipulatedPropStartOverHeatCoolDownTimer_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ManipulatedPropStartOverHeatCoolDownTimer __r;
    bValid = false;
    bValid = ECSFunc_FC_ManipulatedPropStartOverHeatCoolDownTimer::GetManipulatedPropStartOverHeatCoolDownTimer(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ManipulatedPropStartOverHeatCoolDownTimer GetDefaultedManipulatedPropStartOverHeatCoolDownTimer(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ManipulatedPropStartOverHeatCoolDownTimer __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ManipulatedPropStartOverHeatCoolDownTimer);
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
FC_ManipulatedPropStartOverHeatCoolDownTimer GetDefaultedManipulatedPropStartOverHeatCoolDownTimer_BP(const FECSEntity &inout Entity)
{
    FC_ManipulatedPropStartOverHeatCoolDownTimer __r;
    return __r;
}
UFUNCTION()
bool RemoveManipulatedPropStartOverHeatCoolDownTimer(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ManipulatedPropStartOverHeatCoolDownTimer);
}
}
FECSMonitorRuntimeView __GetMonitorManipulatedPropStartOverHeatCoolDownTimerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ManipulatedPropStartOverHeatCoolDownTimer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulatedPropStartOverHeatCoolDownTimerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ManipulatedPropStartOverHeatCoolDownTimer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulatedPropStartOverHeatCoolDownTimerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ManipulatedPropStartOverHeatCoolDownTimer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulatedPropStartOverHeatCoolDownTimerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ManipulatedPropStartOverHeatCoolDownTimer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulatedPropStartOverHeatCoolDownTimerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ManipulatedPropStartOverHeatCoolDownTimer, bFixedFrame, bMustHandleAll);
}
void __MonitorManipulatedPropStartOverHeatCoolDownTimerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ManipulatedPropStartOverHeatCoolDownTimer, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorManipulatedPropStartOverHeatCoolDownTimerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ManipulatedPropStartOverHeatCoolDownTimer, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorManipulatedPropStartOverHeatCoolDownTimerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ManipulatedPropStartOverHeatCoolDownTimer, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ManipulatedPropOverHeatCoolDownTag
{
UFUNCTION()
bool HasManipulatedPropOverHeatCoolDownTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ManipulatedPropOverHeatCoolDownTag);
}
FC_ManipulatedPropOverHeatCoolDownTag& AssignManipulatedPropOverHeatCoolDownTag(const FECSEntity &inout Entity, const FC_ManipulatedPropOverHeatCoolDownTag &inout DefaultValue = FC_ManipulatedPropOverHeatCoolDownTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ManipulatedPropOverHeatCoolDownTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignManipulatedPropOverHeatCoolDownTag_BP(const FECSEntity &inout Entity, const FC_ManipulatedPropOverHeatCoolDownTag &inout DefaultValue = FC_ManipulatedPropOverHeatCoolDownTag())
{
    ECSFunc_FC_ManipulatedPropOverHeatCoolDownTag::AssignManipulatedPropOverHeatCoolDownTag(Entity, DefaultValue);
    return;
}
FC_ManipulatedPropOverHeatCoolDownTag& ModifyManipulatedPropOverHeatCoolDownTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ManipulatedPropOverHeatCoolDownTag));
    return local_12.GetComp();
}
FC_ManipulatedPropOverHeatCoolDownTag& ModifyOrAddManipulatedPropOverHeatCoolDownTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ManipulatedPropOverHeatCoolDownTag));
    return local_12.GetComp();
}
const FC_ManipulatedPropOverHeatCoolDownTag& GetManipulatedPropOverHeatCoolDownTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ManipulatedPropOverHeatCoolDownTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_ManipulatedPropOverHeatCoolDownTag GetManipulatedPropOverHeatCoolDownTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ManipulatedPropOverHeatCoolDownTag& local_4 = ECSFunc_FC_ManipulatedPropOverHeatCoolDownTag::GetManipulatedPropOverHeatCoolDownTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ManipulatedPropOverHeatCoolDownTag();
}
const FC_ManipulatedPropOverHeatCoolDownTag GetDefaultedManipulatedPropOverHeatCoolDownTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ManipulatedPropOverHeatCoolDownTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ManipulatedPropOverHeatCoolDownTag);
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
FC_ManipulatedPropOverHeatCoolDownTag GetDefaultedManipulatedPropOverHeatCoolDownTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ManipulatedPropOverHeatCoolDownTag::GetDefaultedManipulatedPropOverHeatCoolDownTag(Entity);
}
UFUNCTION()
bool RemoveManipulatedPropOverHeatCoolDownTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ManipulatedPropOverHeatCoolDownTag);
}
}
FECSMonitorRuntimeView __GetMonitorManipulatedPropOverHeatCoolDownTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ManipulatedPropOverHeatCoolDownTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulatedPropOverHeatCoolDownTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ManipulatedPropOverHeatCoolDownTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulatedPropOverHeatCoolDownTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ManipulatedPropOverHeatCoolDownTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulatedPropOverHeatCoolDownTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ManipulatedPropOverHeatCoolDownTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorManipulatedPropOverHeatCoolDownTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ManipulatedPropOverHeatCoolDownTag, bFixedFrame, bMustHandleAll);
}
void __MonitorManipulatedPropOverHeatCoolDownTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ManipulatedPropOverHeatCoolDownTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorManipulatedPropOverHeatCoolDownTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ManipulatedPropOverHeatCoolDownTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorManipulatedPropOverHeatCoolDownTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ManipulatedPropOverHeatCoolDownTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PropEnvBreakableConfig
{
UFUNCTION()
bool HasPropEnvBreakableConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PropEnvBreakableConfig);
}
FC_PropEnvBreakableConfig& AssignPropEnvBreakableConfig(const FECSEntity &inout Entity, const FC_PropEnvBreakableConfig &inout DefaultValue = FC_PropEnvBreakableConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PropEnvBreakableConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPropEnvBreakableConfig_BP(const FECSEntity &inout Entity, const FC_PropEnvBreakableConfig &inout DefaultValue = FC_PropEnvBreakableConfig())
{
    ECSFunc_FC_PropEnvBreakableConfig::AssignPropEnvBreakableConfig(Entity, DefaultValue);
    return;
}
FC_PropEnvBreakableConfig& ModifyPropEnvBreakableConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PropEnvBreakableConfig));
    return local_12.GetComp();
}
FC_PropEnvBreakableConfig& ModifyOrAddPropEnvBreakableConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PropEnvBreakableConfig));
    return local_12.GetComp();
}
const FC_PropEnvBreakableConfig& GetPropEnvBreakableConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PropEnvBreakableConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_PropEnvBreakableConfig GetPropEnvBreakableConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PropEnvBreakableConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_PropEnvBreakableConfig::GetPropEnvBreakableConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PropEnvBreakableConfig GetDefaultedPropEnvBreakableConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PropEnvBreakableConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PropEnvBreakableConfig);
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
FC_PropEnvBreakableConfig GetDefaultedPropEnvBreakableConfig_BP(const FECSEntity &inout Entity)
{
    FC_PropEnvBreakableConfig __r;
    return __r;
}
UFUNCTION()
bool RemovePropEnvBreakableConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PropEnvBreakableConfig);
}
}
FECSMonitorRuntimeView __GetMonitorPropEnvBreakableConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PropEnvBreakableConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropEnvBreakableConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PropEnvBreakableConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropEnvBreakableConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PropEnvBreakableConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropEnvBreakableConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PropEnvBreakableConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropEnvBreakableConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PropEnvBreakableConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorPropEnvBreakableConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PropEnvBreakableConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPropEnvBreakableConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PropEnvBreakableConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPropEnvBreakableConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PropEnvBreakableConfig, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_ManipulateProp_ManipulatedPropEntity(const FECSEntity &inout Entity, FECSEntity &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FECSEntity(local_4.opCall().GetManipulatedPropEntity());
    return;
}
void GetEntityBBVar_ManipulateProp_ManipulatorEntity(const FECSEntity &inout Entity, FECSEntity &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FECSEntity(local_4.opCall().GetManipulatorEntity());
    return;
}
void GetEntityBBVar_ManipulateProp_Energy(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetEnergy();
    return;
}
void GetEntityBBVar_ManipulateProp_HeatValue(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetHeatValue();
    return;
}
void GetEntityBBVar_ManipulateProp_HeatValueMax(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetHeatValueMax();
    return;
}
void GetEntityBBVar_ManipulateProp_StartOverHeatCoolDownTime(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetStartOverHeatCoolDownTime();
    return;
}
void GetEntityBBVar_ManipulateProp_OverHeatCoolDownSpeed(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetOverHeatCoolDownSpeed();
    return;
}
void GetEntityBBVar_ManipulateProp_bIsOverHeat(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetbIsOverHeat();
    return;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_ManipulateProp &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_ManipulateProp &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ManipulateProp &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ManipulateProp
{
int __IndexOf_ManipulatedPropEntity()
{
    return 0;
}
int __IndexOf_ManipulatorEntity()
{
    return 1;
}
int __IndexOf_FireResourceType()
{
    return 2;
}
int __IndexOf_Energy()
{
    return 3;
}
int __IndexOf_EnergyMax()
{
    return 4;
}
int __IndexOf_HeatValue()
{
    return 5;
}
int __IndexOf_HeatValueMax()
{
    return 6;
}
int __IndexOf_StartOverHeatCoolDownTime()
{
    return 7;
}
int __IndexOf_OverHeatCoolDownSpeed()
{
    return 8;
}
int __IndexOf_bIsOverHeat()
{
    return 9;
}
}
