
enum EPowerSwitchPlayerCondition
{
    None,
    TargetHitState,
}

namespace __INTENRAL_FC_SwitchPlayerAvatarConfig_NS
{
    const TECSComponentDerivedPtr<FC_SwitchPlayerAvatarConfig> DerivedPtr = TECSComponentDerivedPtr<FC_SwitchPlayerAvatarConfig>();
    const FC_SwitchPlayerAvatarConfig DefaultValue = FC_SwitchPlayerAvatarConfig();
}
namespace __INTENRAL_FC_SwitchPlayerConfig_NS
{
    const TECSComponentDerivedPtr<FC_SwitchPlayerConfig> DerivedPtr = TECSComponentDerivedPtr<FC_SwitchPlayerConfig>();
    const FC_SwitchPlayerConfig DefaultValue = FC_SwitchPlayerConfig();
}
namespace __INTENRAL_FC_SwitchPlayerInfo_NS
{
    const TECSComponentDerivedPtr<FC_SwitchPlayerInfo> DerivedPtr = TECSComponentDerivedPtr<FC_SwitchPlayerInfo>();
    const FC_SwitchPlayerInfo DefaultValue = FC_SwitchPlayerInfo();
}
namespace __INTENRAL_FC_PlayerPendingSwitchOutTag_NS
{
    const TECSComponentDerivedPtr<FC_PlayerPendingSwitchOutTag> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerPendingSwitchOutTag>();
    const FC_PlayerPendingSwitchOutTag DefaultValue = FC_PlayerPendingSwitchOutTag();
}
namespace __INTENRAL_FC_PlayerPendingSwitchInTag_NS
{
    const TECSComponentDerivedPtr<FC_PlayerPendingSwitchInTag> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerPendingSwitchInTag>();
    const FC_PlayerPendingSwitchInTag DefaultValue = FC_PlayerPendingSwitchInTag();
}
namespace __INTENRAL_FC_PendingGameAttributeSwitchSync_NS
{
    const TECSComponentDerivedPtr<FC_PendingGameAttributeSwitchSync> DerivedPtr = TECSComponentDerivedPtr<FC_PendingGameAttributeSwitchSync>();
    const FC_PendingGameAttributeSwitchSync DefaultValue = FC_PendingGameAttributeSwitchSync();
}
namespace __INTENRAL_FCE_SwitchPlayer_NS
{
    const TECSEventDerivedPtr<FCE_SwitchPlayer> DerivedPtr = TECSEventDerivedPtr<FCE_SwitchPlayer>();
}
namespace __INTENRAL_FCE_PlayerSwitchSuccess_NS
{
    const TECSEventDerivedPtr<FCE_PlayerSwitchSuccess> DerivedPtr = TECSEventDerivedPtr<FCE_PlayerSwitchSuccess>();

}
struct FC_SwitchPlayerAvatarConfig : FECSComponent
{
    UPROPERTY()
    float32 SkillReleaseDistance = 800.0f;
    UPROPERTY()
    float32 SkillPowerReleaseDistance = 1500.0f;
    UPROPERTY()
    float32 SkillDistanceNoCombat = 500.0f;
    UPROPERTY()
    float32 PowerSwitchEnergyRecoverSpeed = 6.0f;
    UPROPERTY()
    float32 HitRecoverSwitchPlayerEnergyBasedOnDamageRatio = 1.0f;
    UPROPERTY()
    ULockTargetConfig LockTargetConfig = nullptr;
    UPROPERTY()
    EPowerSwitchPlayerCondition PowerSwitchPlayerCondition = EPowerSwitchPlayerCondition(0);


}

struct FC_SwitchPlayerConfig : FECSComponent
{
    UPROPERTY()
    float32 SwitchPlayerNormalCD = 1.0f;
    UPROPERTY()
    float32 SwitchPlayerActionCD = 4.0f;
    UPROPERTY()
    float32 SwitchPlayerEnergyPower = 100.0f;


}

struct FC_SwitchPlayerInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FESMCost m_SwitchPlayerCD;
    UPROPERTY()
    bool m_bIsPowerSwitch;

    FC_SwitchPlayerInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_SwitchPlayerInfo(const FC_SwitchPlayerInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_SwitchPlayerInfo opAssign(const FC_SwitchPlayerInfo &inout Other)
    {
        FC_SwitchPlayerInfo __r;
        this.SetSwitchPlayerCD(Other.GetSwitchPlayerCD());
        this.SetbIsPowerSwitch(Other.GetbIsPowerSwitch());
        return __r;
    }
    const FESMCost GetSwitchPlayerCD() const property
    {
        const FESMCost __r;
        return __r;
    }
    FESMCost GetModify_SwitchPlayerCD() property
    {
        FESMCost __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetSwitchPlayerCD(const FESMCost &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_SwitchPlayerCD = __Value;
        return;
    }
    bool GetbIsPowerSwitch() const property
    {
        return this.m_bIsPowerSwitch;
    }
    void SetbIsPowerSwitch(const bool __Value) property
    {
        if (!(this.m_bIsPowerSwitch) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bIsPowerSwitch = __Value;
        return;
    }
}

struct FC_PlayerPendingSwitchOutTag : FECSComponent
{
    FC_PlayerPendingSwitchOutTag()
    {
        return;
    }
}

struct FC_PlayerPendingSwitchInTag : FECSComponent
{
    FC_PlayerPendingSwitchInTag()
    {
        return;
    }
}

struct FC_PendingGameAttributeSwitchSync : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFPTime m_SyncTime;

    FC_PendingGameAttributeSwitchSync()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_PendingGameAttributeSwitchSync(const FC_PendingGameAttributeSwitchSync &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_SyncTime = Other.m_SyncTime;
        return;
    }
    FC_PendingGameAttributeSwitchSync opAssign(const FC_PendingGameAttributeSwitchSync &inout Other)
    {
        FC_PendingGameAttributeSwitchSync __r;
        this.SetSyncTime(Other.GetSyncTime());
        return __r;
    }
    const FFPTime GetSyncTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_SyncTime() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetSyncTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_SyncTime = __Value;
        return;
    }
}

struct FCE_SwitchPlayer : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_SwitchPlayer()
    {
        return;
    }
}

struct FCE_PlayerSwitchSuccess : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity SwitchOutPawn;
    UPROPERTY()
    FECSEntity SwitchInPawn;

    FCE_PlayerSwitchSuccess()
    {
        return;
    }
}

namespace ECSFunc_FC_SwitchPlayerAvatarConfig
{
UFUNCTION()
bool HasSwitchPlayerAvatarConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SwitchPlayerAvatarConfig);
}
FC_SwitchPlayerAvatarConfig& AssignSwitchPlayerAvatarConfig(const FECSEntity &inout Entity, const FC_SwitchPlayerAvatarConfig &inout DefaultValue = FC_SwitchPlayerAvatarConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SwitchPlayerAvatarConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSwitchPlayerAvatarConfig_BP(const FECSEntity &inout Entity, const FC_SwitchPlayerAvatarConfig &inout DefaultValue = FC_SwitchPlayerAvatarConfig())
{
    ECSFunc_FC_SwitchPlayerAvatarConfig::AssignSwitchPlayerAvatarConfig(Entity, DefaultValue);
    return;
}
FC_SwitchPlayerAvatarConfig& ModifySwitchPlayerAvatarConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SwitchPlayerAvatarConfig));
    return local_12.GetComp();
}
FC_SwitchPlayerAvatarConfig& ModifyOrAddSwitchPlayerAvatarConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SwitchPlayerAvatarConfig));
    return local_12.GetComp();
}
const FC_SwitchPlayerAvatarConfig& GetSwitchPlayerAvatarConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SwitchPlayerAvatarConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_SwitchPlayerAvatarConfig GetSwitchPlayerAvatarConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SwitchPlayerAvatarConfig& local_4 = ECSFunc_FC_SwitchPlayerAvatarConfig::GetSwitchPlayerAvatarConfig(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SwitchPlayerAvatarConfig();
}
const FC_SwitchPlayerAvatarConfig GetDefaultedSwitchPlayerAvatarConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SwitchPlayerAvatarConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SwitchPlayerAvatarConfig);
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
FC_SwitchPlayerAvatarConfig GetDefaultedSwitchPlayerAvatarConfig_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SwitchPlayerAvatarConfig::GetDefaultedSwitchPlayerAvatarConfig(Entity);
}
UFUNCTION()
bool RemoveSwitchPlayerAvatarConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SwitchPlayerAvatarConfig);
}
}
FECSMonitorRuntimeView __GetMonitorSwitchPlayerAvatarConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SwitchPlayerAvatarConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSwitchPlayerAvatarConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SwitchPlayerAvatarConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSwitchPlayerAvatarConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SwitchPlayerAvatarConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSwitchPlayerAvatarConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SwitchPlayerAvatarConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSwitchPlayerAvatarConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SwitchPlayerAvatarConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorSwitchPlayerAvatarConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SwitchPlayerAvatarConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSwitchPlayerAvatarConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SwitchPlayerAvatarConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSwitchPlayerAvatarConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SwitchPlayerAvatarConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SwitchPlayerConfig
{
UFUNCTION()
bool HasSwitchPlayerConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SwitchPlayerConfig);
}
FC_SwitchPlayerConfig& AssignSwitchPlayerConfig(const FECSEntity &inout Entity, const FC_SwitchPlayerConfig &inout DefaultValue = FC_SwitchPlayerConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SwitchPlayerConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSwitchPlayerConfig_BP(const FECSEntity &inout Entity, const FC_SwitchPlayerConfig &inout DefaultValue = FC_SwitchPlayerConfig())
{
    ECSFunc_FC_SwitchPlayerConfig::AssignSwitchPlayerConfig(Entity, DefaultValue);
    return;
}
FC_SwitchPlayerConfig& ModifySwitchPlayerConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SwitchPlayerConfig));
    return local_12.GetComp();
}
FC_SwitchPlayerConfig& ModifyOrAddSwitchPlayerConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SwitchPlayerConfig));
    return local_12.GetComp();
}
const FC_SwitchPlayerConfig& GetSwitchPlayerConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SwitchPlayerConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_SwitchPlayerConfig GetSwitchPlayerConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SwitchPlayerConfig& local_4 = ECSFunc_FC_SwitchPlayerConfig::GetSwitchPlayerConfig(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SwitchPlayerConfig();
}
const FC_SwitchPlayerConfig GetDefaultedSwitchPlayerConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SwitchPlayerConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SwitchPlayerConfig);
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
FC_SwitchPlayerConfig GetDefaultedSwitchPlayerConfig_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SwitchPlayerConfig::GetDefaultedSwitchPlayerConfig(Entity);
}
UFUNCTION()
bool RemoveSwitchPlayerConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SwitchPlayerConfig);
}
}
FECSMonitorRuntimeView __GetMonitorSwitchPlayerConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SwitchPlayerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSwitchPlayerConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SwitchPlayerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSwitchPlayerConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SwitchPlayerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSwitchPlayerConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SwitchPlayerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSwitchPlayerConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SwitchPlayerConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorSwitchPlayerConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SwitchPlayerConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSwitchPlayerConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SwitchPlayerConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSwitchPlayerConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SwitchPlayerConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SwitchPlayerInfo
{
UFUNCTION()
bool HasSwitchPlayerInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SwitchPlayerInfo);
}
FC_SwitchPlayerInfo& AssignSwitchPlayerInfo(const FECSEntity &inout Entity, const FC_SwitchPlayerInfo &inout DefaultValue = FC_SwitchPlayerInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SwitchPlayerInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSwitchPlayerInfo_BP(const FECSEntity &inout Entity, const FC_SwitchPlayerInfo &inout DefaultValue = FC_SwitchPlayerInfo())
{
    ECSFunc_FC_SwitchPlayerInfo::AssignSwitchPlayerInfo(Entity, DefaultValue);
    return;
}
FC_SwitchPlayerInfo& ModifySwitchPlayerInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SwitchPlayerInfo));
    return local_12.GetComp();
}
FC_SwitchPlayerInfo& ModifyOrAddSwitchPlayerInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SwitchPlayerInfo));
    return local_12.GetComp();
}
const FC_SwitchPlayerInfo& GetSwitchPlayerInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SwitchPlayerInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_SwitchPlayerInfo GetSwitchPlayerInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SwitchPlayerInfo& local_4 = ECSFunc_FC_SwitchPlayerInfo::GetSwitchPlayerInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SwitchPlayerInfo();
}
const FC_SwitchPlayerInfo GetDefaultedSwitchPlayerInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SwitchPlayerInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SwitchPlayerInfo);
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
FC_SwitchPlayerInfo GetDefaultedSwitchPlayerInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SwitchPlayerInfo::GetDefaultedSwitchPlayerInfo(Entity);
}
UFUNCTION()
bool RemoveSwitchPlayerInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SwitchPlayerInfo);
}
}
FECSMonitorRuntimeView __GetMonitorSwitchPlayerInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SwitchPlayerInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSwitchPlayerInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SwitchPlayerInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSwitchPlayerInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SwitchPlayerInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSwitchPlayerInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SwitchPlayerInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSwitchPlayerInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SwitchPlayerInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorSwitchPlayerInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SwitchPlayerInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSwitchPlayerInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SwitchPlayerInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSwitchPlayerInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SwitchPlayerInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PlayerPendingSwitchOutTag
{
UFUNCTION()
bool HasPlayerPendingSwitchOutTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingSwitchOutTag);
}
FC_PlayerPendingSwitchOutTag& AssignPlayerPendingSwitchOutTag(const FECSEntity &inout Entity, const FC_PlayerPendingSwitchOutTag &inout DefaultValue = FC_PlayerPendingSwitchOutTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingSwitchOutTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerPendingSwitchOutTag_BP(const FECSEntity &inout Entity, const FC_PlayerPendingSwitchOutTag &inout DefaultValue = FC_PlayerPendingSwitchOutTag())
{
    ECSFunc_FC_PlayerPendingSwitchOutTag::AssignPlayerPendingSwitchOutTag(Entity, DefaultValue);
    return;
}
FC_PlayerPendingSwitchOutTag& ModifyPlayerPendingSwitchOutTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingSwitchOutTag));
    return local_12.GetComp();
}
FC_PlayerPendingSwitchOutTag& ModifyOrAddPlayerPendingSwitchOutTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingSwitchOutTag));
    return local_12.GetComp();
}
const FC_PlayerPendingSwitchOutTag& GetPlayerPendingSwitchOutTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingSwitchOutTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerPendingSwitchOutTag GetPlayerPendingSwitchOutTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PlayerPendingSwitchOutTag& local_4 = ECSFunc_FC_PlayerPendingSwitchOutTag::GetPlayerPendingSwitchOutTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PlayerPendingSwitchOutTag();
}
const FC_PlayerPendingSwitchOutTag GetDefaultedPlayerPendingSwitchOutTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerPendingSwitchOutTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingSwitchOutTag);
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
FC_PlayerPendingSwitchOutTag GetDefaultedPlayerPendingSwitchOutTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PlayerPendingSwitchOutTag::GetDefaultedPlayerPendingSwitchOutTag(Entity);
}
UFUNCTION()
bool RemovePlayerPendingSwitchOutTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingSwitchOutTag);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerPendingSwitchOutTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerPendingSwitchOutTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerPendingSwitchOutTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerPendingSwitchOutTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerPendingSwitchOutTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerPendingSwitchOutTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerPendingSwitchOutTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerPendingSwitchOutTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerPendingSwitchOutTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerPendingSwitchOutTag, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerPendingSwitchOutTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerPendingSwitchOutTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerPendingSwitchOutTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerPendingSwitchOutTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerPendingSwitchOutTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerPendingSwitchOutTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PlayerPendingSwitchInTag
{
UFUNCTION()
bool HasPlayerPendingSwitchInTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingSwitchInTag);
}
FC_PlayerPendingSwitchInTag& AssignPlayerPendingSwitchInTag(const FECSEntity &inout Entity, const FC_PlayerPendingSwitchInTag &inout DefaultValue = FC_PlayerPendingSwitchInTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingSwitchInTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerPendingSwitchInTag_BP(const FECSEntity &inout Entity, const FC_PlayerPendingSwitchInTag &inout DefaultValue = FC_PlayerPendingSwitchInTag())
{
    ECSFunc_FC_PlayerPendingSwitchInTag::AssignPlayerPendingSwitchInTag(Entity, DefaultValue);
    return;
}
FC_PlayerPendingSwitchInTag& ModifyPlayerPendingSwitchInTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingSwitchInTag));
    return local_12.GetComp();
}
FC_PlayerPendingSwitchInTag& ModifyOrAddPlayerPendingSwitchInTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingSwitchInTag));
    return local_12.GetComp();
}
const FC_PlayerPendingSwitchInTag& GetPlayerPendingSwitchInTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingSwitchInTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerPendingSwitchInTag GetPlayerPendingSwitchInTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PlayerPendingSwitchInTag& local_4 = ECSFunc_FC_PlayerPendingSwitchInTag::GetPlayerPendingSwitchInTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PlayerPendingSwitchInTag();
}
const FC_PlayerPendingSwitchInTag GetDefaultedPlayerPendingSwitchInTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerPendingSwitchInTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingSwitchInTag);
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
FC_PlayerPendingSwitchInTag GetDefaultedPlayerPendingSwitchInTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PlayerPendingSwitchInTag::GetDefaultedPlayerPendingSwitchInTag(Entity);
}
UFUNCTION()
bool RemovePlayerPendingSwitchInTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerPendingSwitchInTag);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerPendingSwitchInTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerPendingSwitchInTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerPendingSwitchInTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerPendingSwitchInTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerPendingSwitchInTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerPendingSwitchInTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerPendingSwitchInTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerPendingSwitchInTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerPendingSwitchInTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerPendingSwitchInTag, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerPendingSwitchInTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerPendingSwitchInTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerPendingSwitchInTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerPendingSwitchInTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerPendingSwitchInTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerPendingSwitchInTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PendingGameAttributeSwitchSync
{
UFUNCTION()
bool HasPendingGameAttributeSwitchSync(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PendingGameAttributeSwitchSync);
}
FC_PendingGameAttributeSwitchSync& AssignPendingGameAttributeSwitchSync(const FECSEntity &inout Entity, const FC_PendingGameAttributeSwitchSync &inout DefaultValue = FC_PendingGameAttributeSwitchSync())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PendingGameAttributeSwitchSync, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPendingGameAttributeSwitchSync_BP(const FECSEntity &inout Entity, const FC_PendingGameAttributeSwitchSync &inout DefaultValue = FC_PendingGameAttributeSwitchSync())
{
    ECSFunc_FC_PendingGameAttributeSwitchSync::AssignPendingGameAttributeSwitchSync(Entity, DefaultValue);
    return;
}
FC_PendingGameAttributeSwitchSync& ModifyPendingGameAttributeSwitchSync(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PendingGameAttributeSwitchSync));
    return local_12.GetComp();
}
FC_PendingGameAttributeSwitchSync& ModifyOrAddPendingGameAttributeSwitchSync(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PendingGameAttributeSwitchSync));
    return local_12.GetComp();
}
const FC_PendingGameAttributeSwitchSync& GetPendingGameAttributeSwitchSync(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PendingGameAttributeSwitchSync));
    return local_12.GetComp();
}
UFUNCTION()
FC_PendingGameAttributeSwitchSync GetPendingGameAttributeSwitchSync_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PendingGameAttributeSwitchSync& local_4 = ECSFunc_FC_PendingGameAttributeSwitchSync::GetPendingGameAttributeSwitchSync(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PendingGameAttributeSwitchSync();
}
const FC_PendingGameAttributeSwitchSync GetDefaultedPendingGameAttributeSwitchSync(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PendingGameAttributeSwitchSync __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PendingGameAttributeSwitchSync);
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
FC_PendingGameAttributeSwitchSync GetDefaultedPendingGameAttributeSwitchSync_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PendingGameAttributeSwitchSync::GetDefaultedPendingGameAttributeSwitchSync(Entity);
}
UFUNCTION()
bool RemovePendingGameAttributeSwitchSync(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PendingGameAttributeSwitchSync);
}
}
FECSMonitorRuntimeView __GetMonitorPendingGameAttributeSwitchSyncOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PendingGameAttributeSwitchSync, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPendingGameAttributeSwitchSyncOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PendingGameAttributeSwitchSync, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPendingGameAttributeSwitchSyncOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PendingGameAttributeSwitchSync, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPendingGameAttributeSwitchSyncOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PendingGameAttributeSwitchSync, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPendingGameAttributeSwitchSyncOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PendingGameAttributeSwitchSync, bFixedFrame, bMustHandleAll);
}
void __MonitorPendingGameAttributeSwitchSyncLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PendingGameAttributeSwitchSync, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPendingGameAttributeSwitchSyncActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PendingGameAttributeSwitchSync, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPendingGameAttributeSwitchSyncModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PendingGameAttributeSwitchSync, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_SwitchPlayerConfig_SwitchPlayerEnergyPower(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    FECSEntity local_10 = local_4.opCall().GetOwnerEntityWithWorld(Entity.GetWorld());
    GetDefaulted local_18;
    OutRetValue = local_18.opCall().SwitchPlayerEnergyPower;
    return;
}
void GetEntityBBVar_SwitchPlayerInfo_SwitchPlayerCD(const FECSEntity &inout Entity, FESMCost &inout OutRetValue)
{
    GetDefaulted local_4;
    FECSEntity local_10 = local_4.opCall().GetOwnerEntityWithWorld(Entity.GetWorld());
    GetDefaulted local_18;
    OutRetValue = FESMCost(local_18.opCall().GetSwitchPlayerCD());
    return;
}
void GetEntityBBVar_SwitchPlayerInfo_bIsPowerSwitch(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    FECSEntity local_10 = local_4.opCall().GetOwnerEntityWithWorld(Entity.GetWorld());
    GetDefaulted local_18;
    OutRetValue = local_18.opCall().GetbIsPowerSwitch();
    return;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_SwitchPlayerInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_SwitchPlayerInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_SwitchPlayerInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_SwitchPlayerInfo
{
int __IndexOf_SwitchPlayerCD()
{
    return 0;
}
int __IndexOf_bIsPowerSwitch()
{
    return 1;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PendingGameAttributeSwitchSync &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PendingGameAttributeSwitchSync &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PendingGameAttributeSwitchSync &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PendingGameAttributeSwitchSync
{
int __IndexOf_SyncTime()
{
    return 0;
}
}
