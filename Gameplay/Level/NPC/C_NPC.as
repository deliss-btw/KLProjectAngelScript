
namespace __INTENRAL_FC_NPCIdentity_NS
{
    const TECSComponentDerivedPtr<FC_NPCIdentity> DerivedPtr = TECSComponentDerivedPtr<FC_NPCIdentity>();
    const FC_NPCIdentity DefaultValue = FC_NPCIdentity();
}
namespace __INTENRAL_FC_NPCInfo_NS
{
    const TECSComponentDerivedPtr<FC_NPCInfo> DerivedPtr = TECSComponentDerivedPtr<FC_NPCInfo>();
    const FC_NPCInfo DefaultValue = FC_NPCInfo();
}
namespace __INTENRAL_FC_NPCWatchPlayerLookModeOverride_NS
{
    const TECSComponentDerivedPtr<FC_NPCWatchPlayerLookModeOverride> DerivedPtr = TECSComponentDerivedPtr<FC_NPCWatchPlayerLookModeOverride>();
    const FC_NPCWatchPlayerLookModeOverride DefaultValue = FC_NPCWatchPlayerLookModeOverride();
}
namespace __INTENRAL_FC_NPCWatchPlayerLookDialogueTag_NS
{
    const TECSComponentDerivedPtr<FC_NPCWatchPlayerLookDialogueTag> DerivedPtr = TECSComponentDerivedPtr<FC_NPCWatchPlayerLookDialogueTag>();
    const FC_NPCWatchPlayerLookDialogueTag DefaultValue = FC_NPCWatchPlayerLookDialogueTag();
}
namespace __INTENRAL_FC_NPCReadyTag_NS
{
    const TECSComponentDerivedPtr<FC_NPCReadyTag> DerivedPtr = TECSComponentDerivedPtr<FC_NPCReadyTag>();
    const FC_NPCReadyTag DefaultValue = FC_NPCReadyTag();
}
namespace __INTENRAL_FC_NPCDailyRouteRuntime_NS
{
    const TECSComponentDerivedPtr<FC_NPCDailyRouteRuntime> DerivedPtr = TECSComponentDerivedPtr<FC_NPCDailyRouteRuntime>();
    const FC_NPCDailyRouteRuntime DefaultValue = FC_NPCDailyRouteRuntime();

}
struct FC_NPCIdentity : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_NPCId;
    UPROPERTY()
    int m_RoleId;
    UPROPERTY()
    ENPCCombatPriority m_CombatPriority;

    FC_NPCIdentity()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_NPCIdentity(const FC_NPCIdentity &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_NPCIdentity opAssign(const FC_NPCIdentity &inout Other)
    {
        FC_NPCIdentity __r;
        this.SetNPCId(Other.GetNPCId());
        this.SetRoleId(Other.GetRoleId());
        this.SetCombatPriority(Other.GetCombatPriority());
        return __r;
    }
    int GetNPCId() const property
    {
        return this.m_NPCId;
    }
    void SetNPCId(const int __Value) property
    {
        if (this.m_NPCId == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_NPCId = __Value;
        return;
    }
    int GetRoleId() const property
    {
        return this.m_RoleId;
    }
    void SetRoleId(const int __Value) property
    {
        if (this.m_RoleId == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_RoleId = __Value;
        return;
    }
    ENPCCombatPriority GetCombatPriority() const property
    {
        return this.m_CombatPriority;
    }
    void SetCombatPriority(const ENPCCombatPriority __Value) property
    {
        if (int(this.m_CombatPriority) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_CombatPriority = __Value;
        return;
    }
}

struct FC_NPCInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FNPCMainConfig> m_MainConfig;

    FC_NPCInfo()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_NPCInfo(const FC_NPCInfo &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_MainConfig = Other.m_MainConfig;
        return;
    }
    FC_NPCInfo opAssign(const FC_NPCInfo &inout Other)
    {
        FC_NPCInfo __r;
        this.SetMainConfig(Other.GetMainConfig());
        return __r;
    }
    const TDataObjectPtr<FNPCMainConfig> GetMainConfig() const property
    {
        const TDataObjectPtr<FNPCMainConfig> __r;
        return __r;
    }
    TDataObjectPtr<FNPCMainConfig> GetModify_MainConfig() property
    {
        TDataObjectPtr<FNPCMainConfig> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetMainConfig(const TDataObjectPtr<FNPCMainConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_MainConfig = __Value;
        return;
    }
}

struct FC_NPCWatchPlayerLookModeOverride : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    ENPCWatchPlayerLookMode m_Mode;

    FC_NPCWatchPlayerLookModeOverride()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_NPCWatchPlayerLookModeOverride(const FC_NPCWatchPlayerLookModeOverride &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_NPCWatchPlayerLookModeOverride opAssign(const FC_NPCWatchPlayerLookModeOverride &inout Other)
    {
        FC_NPCWatchPlayerLookModeOverride __r;
        this.SetMode(Other.GetMode());
        return __r;
    }
    ENPCWatchPlayerLookMode GetMode() const property
    {
        return this.m_Mode;
    }
    void SetMode(const ENPCWatchPlayerLookMode __Value) property
    {
        if (int(this.m_Mode) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Mode = __Value;
        return;
    }
}

struct FC_NPCWatchPlayerLookDialogueTag : FECSComponent
{
    FC_NPCWatchPlayerLookDialogueTag()
    {
        return;
    }
}

struct FC_NPCReadyTag : FECSComponent
{
    FC_NPCReadyTag()
    {
        return;
    }
}

struct FC_NPCDailyRouteRuntime : FECSComponent
{
    UPROPERTY()
    TDataObjectPtr<FNPCDailyRouteConfig> RouteConfig;
    UPROPERTY()
    int CurrentNodeIndex = -1;
    UPROPERTY()
    int PendingTargetNodeIndex = -1;
    UPROPERTY()
    FName CurrentPointId = NAME_None;
    UPROPERTY()
    FName TargetPointId = NAME_None;
    UPROPERTY()
    float32 TargetAcceptRadius = 100.0f;
    UPROPERTY()
    float32 SelectedStayTime = 0.0f;
    UPROPERTY()
    TArray<FVector> ActivePathPoints;
    UPROPERTY()
    int ActivePathPointIndex = 0;
    UPROPERTY()
    bool bHasPreparedTarget = false;


}

namespace FNPCDailyRouteUtils
{
bool TryGetRouteConfig(const FECSEntity &inout Entity, TDataObjectPtr<FNPCDailyRouteConfig> &out OutRouteConfig)
{
    OutRouteConfig = TDataObjectPtr<FNPCDailyRouteConfig>();
    if (!(Entity.IsValid()))
    {
        return false;
    }
    Get local_102;
    const FC_NPCDailyRouteRuntime& local_104 = local_102.opCall();
    if (local_104)
    {
        if (local_104.RouteConfig.IsSet())
        {
            OutRouteConfig = local_104.RouteConfig;
            return true;
        }
    }
    Get local_108;
    const FC_NPCInfo& local_110 = local_108.opCall();
    if (local_110)
    {
        if (local_110.GetMainConfig().IsSet() && GetDailyRouteConfig().IsSet())
        {
            OutRouteConfig = GetDailyRouteConfig();
            return true;
        }
    }
    return false;
}
void InitializeRouteState(const FECSEntity &inout Entity, const TDataObjectPtr<FNPCDailyRouteConfig> &inout RouteConfig, const int CurrentNodeIndex = -1)
{
    if (!(Entity.IsValid()) || !(RouteConfig.IsSet()))
    {
        return;
    }
    FC_NPCDailyRouteRuntime local_4;
    local_4.RouteConfig = RouteConfig;
    local_4.CurrentNodeIndex = CurrentNodeIndex;
    local_4.PendingTargetNodeIndex = -1;
    FName local_35;
    if (unresolved.Nodes.IsValidIndex(CurrentNodeIndex))
    {
    }
    else
    {
        local_35 = NAME_None;
    }
    local_4.CurrentPointId = local_35;
    local_4.TargetPointId = NAME_None;
    local_4.TargetAcceptRadius = 100.0f;
    local_4.SelectedStayTime = 0.0f;
    local_4.ActivePathPoints.Empty(0);
    local_4.ActivePathPointIndex = 0;
    local_4.bHasPreparedTarget = false;
    return;
}
float32 SelectStayTime(const FNPCDailyRouteStayTimeConfig &inout StayTime)
{
    if (int(StayTime.Mode) == 0)
    {
        return FMath::Max(0.0f, StayTime.FixedTime);
    }
    float32 local_6 = FMath::Max(0.0f, StayTime.MinTime);
    return FMath::RandRange(local_6, FMath::Max(local_6, StayTime.MaxTime));
}
bool TryGetPreparedTarget(const FECSEntity &inout Entity, FC_NPCDailyRouteRuntime &out OutRuntime)
{
    bool local_39 = !(Entity.IsValid());
    if (local_39)
    {
        return false;
    }
    Get local_44;
    const FC_NPCDailyRouteRuntime& local_46 = local_44.opCall();
    if (local_46)
    {
        if (local_46.bHasPreparedTarget && local_46.RouteConfig.IsSet() && local_39 && !(local_46.TargetPointId.IsNone()))
        {
            return true;
        }
    }
    return false;
}
void ClearPreparedRuntime(FC_NPCDailyRouteRuntime &inout Runtime)
{
    Runtime.PendingTargetNodeIndex = -1;
    Runtime.TargetPointId = NAME_None;
    Runtime.TargetAcceptRadius = 100.0f;
    Runtime.SelectedStayTime = 0.0f;
    Runtime.ActivePathPoints.Empty(0);
    Runtime.ActivePathPointIndex = 0;
    Runtime.bHasPreparedTarget = false;
    return;
}
void ClearPreparedTarget(const FECSEntity &inout Entity)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    Modify local_6;
    FC_NPCDailyRouteRuntime& local_8 = local_6.opCall();
    if (local_8)
    {
        FNPCDailyRouteUtils::ClearPreparedRuntime(local_8);
    }
    return;
}
void AdvancePreparedTarget(const FECSEntity &inout Entity)
{
    bool local_9 = false;
    if (!(Entity.IsValid()))
    {
        return;
    }
    Modify local_6;
    FC_NPCDailyRouteRuntime& local_8 = local_6.opCall();
    if (local_8)
    {
        bool local_1 = !(local_8.bHasPreparedTarget) || !(local_8.RouteConfig.IsSet());
        if (local_1)
        {
            local_1 = true;
        }
        else
        {
            int local_10 = int(local_8.PendingTargetNodeIndex);
            local_9 = !local_9;
            local_1 = local_9;
        }
        local_1 = local_1 || local_8.TargetPointId.IsNone();
        if (local_1)
        {
            FNPCDailyRouteUtils::ClearPreparedRuntime(local_8);
            return;
        }
        local_8.CurrentNodeIndex = int(local_8.PendingTargetNodeIndex);
        local_8.CurrentPointId = local_8.TargetPointId;
        FNPCDailyRouteUtils::ClearPreparedRuntime(local_8);
    }
    return;
}
}
namespace FNPCIdentityUtils
{
ENPCCombatPriority GetCombatPriority(const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_NPCIdentity& local_6 = local_4.opCall();
    if (local_6)
    {
        return local_6.GetCombatPriority();
    }
    return ENPCCombatPriority(0);
}
void SetCombatPriority(const FECSEntity &inout Entity, const ENPCCombatPriority Priority)
{
    Modify local_4;
    FC_NPCIdentity& local_6 = local_4.opCall();
    if (local_6)
    {
        local_6.SetCombatPriority(ENPCCombatPriority(Priority));
    }
    return;
}
FECSEntity FindEntityByNPCMainConfig(const TDataObjectPtr<FNPCMainConfig> &inout NPCConfig)
{
    if (!(NPCConfig.IsSet()))
    {
        return FECSEntity();
    }
    FECSRuntimeView local_46 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
    Include local_50;
    local_50.opCall();
    FECSRuntimeViewIterator local_84 = local_46.Iterator();
    for (; local_84.CanProceed;)
    {
        const FECSEntity& local_120 = local_84.Proceed();
        Get local_124;
        const FC_NPCInfo& local_126 = local_124.opCall();
        if (local_126)
        {
            TDataObjectPtr<FNPCMainConfig> local_150;
            local_150 = local_126.GetMainConfig();
            if ((local_150 == NPCConfig.opImplConv()))
            {
                return local_120;
            }
        }
    }
    return FECSEntity();
}
bool TryFindEntitiesByNPCMainConfig(const TDataObjectPtr<FNPCMainConfig> &inout NPCConfig, TArray<FECSEntity> &out OutEntities)
{
    TArray<FECSEntity> local_4;
    OutEntities = local_4;
    OutEntities.Empty(0);
    if (!(NPCConfig.IsSet()))
    {
        return false;
    }
    FECSRuntimeView local_46 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
    Include local_50;
    local_50.opCall();
    FECSRuntimeViewIterator local_84 = local_46.Iterator();
    for (; local_84.CanProceed;)
    {
        const FECSEntity& local_120 = local_84.Proceed();
        Get local_124;
        const FC_NPCInfo& local_126 = local_124.opCall();
        if (local_126)
        {
            TDataObjectPtr<FNPCMainConfig> local_150;
            local_150 = local_126.GetMainConfig();
            if ((local_150 == NPCConfig.opImplConv()))
            {
                OutEntities.Add(local_120);
            }
        }
    }
    return (OutEntities.Num() > 0);
}
bool TryGetNPCSpawnLocationFromLevelConfig(const TDataObjectPtr<FNPCMainConfig> &inout NPCConfig, const FName &inout SceneName, const FName &inout DataLayerName, FVector &out OutLocation)
{
    FVector local_6;
    OutLocation = local_6;
    if (!(NPCConfig.IsSet()))
    {
        return false;
    }
    const FLevelGroupConfig& local_10 = LevelConfig::FindLevelGroupConfigByName(SceneName, DataLayerName);
    if (!(local_10.GUID.IsValid()))
    {
        return false;
    }
    const TArray<FConfigGUID>& local_12 = LevelConfig::GetGroupChildUnitIds(local_10.GUID);
    FInstancedStruct::GetPtr local_40;
    for (auto& local_26 : local_12)
    {
        const FLevelConfigInstance& local_28 = LevelConfig::FindLevelUnitConfig(local_26);
        if (!(FInstancedStruct::GetPtr(local_28.GetConfigData()).opCall()))
        {
            continue;
        }
        if (!(local_40.opCall()))
        {
            continue;
        }
        TDataObjectPtr<FNPCMainConfig> local_68;
        if ((local_68 == NPCConfig.opImplConv()))
        {
            FVector local_122;
            OutLocation = local_122;
            return true;
        }
    }
    return false;
}
bool TryGetNPCSpawnLocationFromLevelConfig(const TDataObjectPtr<FNPCMainConfig> &inout NPCConfig, const FName &inout DataLayerName, FVector &out OutLocation)
{
    FVector local_6;
    int local_14 = 0;
    OutLocation = local_6;
    FECSWorldPtr local_8 = ECS::GetECSWorld();
    if (!(local_14))
    {
        return false;
    }
    return FNPCIdentityUtils::TryGetNPCSpawnLocationFromLevelConfig(NPCConfig, local_14.LevelName, DataLayerName, OutLocation);
}
}
namespace FNPCWatchPlayerLookUtils
{
void SetWatchPlayerLookModeOverride(const FECSEntity &inout Entity, const ENPCWatchPlayerLookMode Mode)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    FC_NPCWatchPlayerLookModeOverride local_8;
    Assign local_6;
    local_6.opCall(local_8).SetMode();
    return;
}
void ClearWatchPlayerLookModeOverride(const FECSEntity &inout Entity)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    Remove local_6;
    local_6.opCall();
    return;
}
void SetWatchPlayerLookMode(const FECSEntity &inout Entity, const ENPCWatchPlayerLookMode Mode)
{
    FNPCWatchPlayerLookUtils::SetWatchPlayerLookModeOverride(Entity, ENPCWatchPlayerLookMode(Mode));
    return;
}
void ResetWatchPlayerLookMode(const FECSEntity &inout Entity)
{
    FNPCWatchPlayerLookUtils::ClearWatchPlayerLookModeOverride(Entity);
    return;
}
void SetWatchPlayerLookDialogueActive(const FECSEntity &inout Entity, const bool bActive)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    if (bActive)
    {
        FC_NPCWatchPlayerLookDialogueTag local_8;
        Assign local_6;
        local_6.opCall(local_8);
        return;
    }
    Remove local_12;
    local_12.opCall();
    return;
}
ENPCWatchPlayerLookMode ResolveWatchPlayerLookMode(const FECSEntity &inout Entity, const FNPCWatchPlayerLookPresetConfig &inout Preset)
{
    Get local_4;
    const FC_NPCWatchPlayerLookModeOverride& local_6 = local_4.opCall();
    if (local_6)
    {
        return local_6.GetMode();
    }
    return Preset.WatchPlayerLookMode;
}
bool ShouldWatchPlayerNow(const FECSEntity &inout Entity, const ENPCWatchPlayerLookMode Mode)
{
    if (int(Mode) == 0)
    {
        return true;
    }
    if (int(Mode) == 2)
    {
        Has local_8;
        return local_8.opCall();
    }
    return false;
}
}
namespace ECSFunc_FC_NPCIdentity
{
UFUNCTION()
bool HasNPCIdentity(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_NPCIdentity);
}
FC_NPCIdentity& AssignNPCIdentity(const FECSEntity &inout Entity, const FC_NPCIdentity &inout DefaultValue = FC_NPCIdentity())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_NPCIdentity, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignNPCIdentity_BP(const FECSEntity &inout Entity, const FC_NPCIdentity &inout DefaultValue = FC_NPCIdentity())
{
    ECSFunc_FC_NPCIdentity::AssignNPCIdentity(Entity, DefaultValue);
    return;
}
FC_NPCIdentity& ModifyNPCIdentity(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_NPCIdentity));
    return local_12.GetComp();
}
FC_NPCIdentity& ModifyOrAddNPCIdentity(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_NPCIdentity));
    return local_12.GetComp();
}
const FC_NPCIdentity& GetNPCIdentity(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_NPCIdentity));
    return local_12.GetComp();
}
UFUNCTION()
FC_NPCIdentity GetNPCIdentity_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_NPCIdentity& local_4 = ECSFunc_FC_NPCIdentity::GetNPCIdentity(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_NPCIdentity();
}
const FC_NPCIdentity GetDefaultedNPCIdentity(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_NPCIdentity __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_NPCIdentity);
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
FC_NPCIdentity GetDefaultedNPCIdentity_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_NPCIdentity::GetDefaultedNPCIdentity(Entity);
}
UFUNCTION()
bool RemoveNPCIdentity(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_NPCIdentity);
}
}
FECSMonitorRuntimeView __GetMonitorNPCIdentityOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_NPCIdentity, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNPCIdentityOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_NPCIdentity, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNPCIdentityOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_NPCIdentity, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNPCIdentityOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_NPCIdentity, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNPCIdentityOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_NPCIdentity, bFixedFrame, bMustHandleAll);
}
void __MonitorNPCIdentityLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_NPCIdentity, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNPCIdentityActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_NPCIdentity, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNPCIdentityModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_NPCIdentity, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_NPCInfo
{
UFUNCTION()
bool HasNPCInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_NPCInfo);
}
FC_NPCInfo& AssignNPCInfo(const FECSEntity &inout Entity, const FC_NPCInfo &inout DefaultValue = FC_NPCInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_NPCInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignNPCInfo_BP(const FECSEntity &inout Entity, const FC_NPCInfo &inout DefaultValue = FC_NPCInfo())
{
    ECSFunc_FC_NPCInfo::AssignNPCInfo(Entity, DefaultValue);
    return;
}
FC_NPCInfo& ModifyNPCInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_NPCInfo));
    return local_12.GetComp();
}
FC_NPCInfo& ModifyOrAddNPCInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_NPCInfo));
    return local_12.GetComp();
}
const FC_NPCInfo& GetNPCInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_NPCInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_NPCInfo GetNPCInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_NPCInfo& local_4 = ECSFunc_FC_NPCInfo::GetNPCInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_NPCInfo();
}
const FC_NPCInfo GetDefaultedNPCInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_NPCInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_NPCInfo);
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
FC_NPCInfo GetDefaultedNPCInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_NPCInfo::GetDefaultedNPCInfo(Entity);
}
UFUNCTION()
bool RemoveNPCInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_NPCInfo);
}
}
FECSMonitorRuntimeView __GetMonitorNPCInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_NPCInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNPCInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_NPCInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNPCInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_NPCInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNPCInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_NPCInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNPCInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_NPCInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorNPCInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_NPCInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNPCInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_NPCInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNPCInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_NPCInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_NPCWatchPlayerLookModeOverride
{
UFUNCTION()
bool HasNPCWatchPlayerLookModeOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_NPCWatchPlayerLookModeOverride);
}
FC_NPCWatchPlayerLookModeOverride& AssignNPCWatchPlayerLookModeOverride(const FECSEntity &inout Entity, const FC_NPCWatchPlayerLookModeOverride &inout DefaultValue = FC_NPCWatchPlayerLookModeOverride())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_NPCWatchPlayerLookModeOverride, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignNPCWatchPlayerLookModeOverride_BP(const FECSEntity &inout Entity, const FC_NPCWatchPlayerLookModeOverride &inout DefaultValue = FC_NPCWatchPlayerLookModeOverride())
{
    ECSFunc_FC_NPCWatchPlayerLookModeOverride::AssignNPCWatchPlayerLookModeOverride(Entity, DefaultValue);
    return;
}
FC_NPCWatchPlayerLookModeOverride& ModifyNPCWatchPlayerLookModeOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_NPCWatchPlayerLookModeOverride));
    return local_12.GetComp();
}
FC_NPCWatchPlayerLookModeOverride& ModifyOrAddNPCWatchPlayerLookModeOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_NPCWatchPlayerLookModeOverride));
    return local_12.GetComp();
}
const FC_NPCWatchPlayerLookModeOverride& GetNPCWatchPlayerLookModeOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_NPCWatchPlayerLookModeOverride));
    return local_12.GetComp();
}
UFUNCTION()
FC_NPCWatchPlayerLookModeOverride GetNPCWatchPlayerLookModeOverride_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_NPCWatchPlayerLookModeOverride& local_4 = ECSFunc_FC_NPCWatchPlayerLookModeOverride::GetNPCWatchPlayerLookModeOverride(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_NPCWatchPlayerLookModeOverride();
}
const FC_NPCWatchPlayerLookModeOverride GetDefaultedNPCWatchPlayerLookModeOverride(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_NPCWatchPlayerLookModeOverride __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_NPCWatchPlayerLookModeOverride);
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
FC_NPCWatchPlayerLookModeOverride GetDefaultedNPCWatchPlayerLookModeOverride_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_NPCWatchPlayerLookModeOverride::GetDefaultedNPCWatchPlayerLookModeOverride(Entity);
}
UFUNCTION()
bool RemoveNPCWatchPlayerLookModeOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_NPCWatchPlayerLookModeOverride);
}
}
FECSMonitorRuntimeView __GetMonitorNPCWatchPlayerLookModeOverrideOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_NPCWatchPlayerLookModeOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNPCWatchPlayerLookModeOverrideOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_NPCWatchPlayerLookModeOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNPCWatchPlayerLookModeOverrideOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_NPCWatchPlayerLookModeOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNPCWatchPlayerLookModeOverrideOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_NPCWatchPlayerLookModeOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNPCWatchPlayerLookModeOverrideOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_NPCWatchPlayerLookModeOverride, bFixedFrame, bMustHandleAll);
}
void __MonitorNPCWatchPlayerLookModeOverrideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_NPCWatchPlayerLookModeOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNPCWatchPlayerLookModeOverrideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_NPCWatchPlayerLookModeOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNPCWatchPlayerLookModeOverrideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_NPCWatchPlayerLookModeOverride, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_NPCWatchPlayerLookDialogueTag
{
UFUNCTION()
bool HasNPCWatchPlayerLookDialogueTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_NPCWatchPlayerLookDialogueTag);
}
FC_NPCWatchPlayerLookDialogueTag& AssignNPCWatchPlayerLookDialogueTag(const FECSEntity &inout Entity, const FC_NPCWatchPlayerLookDialogueTag &inout DefaultValue = FC_NPCWatchPlayerLookDialogueTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_NPCWatchPlayerLookDialogueTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignNPCWatchPlayerLookDialogueTag_BP(const FECSEntity &inout Entity, const FC_NPCWatchPlayerLookDialogueTag &inout DefaultValue = FC_NPCWatchPlayerLookDialogueTag())
{
    ECSFunc_FC_NPCWatchPlayerLookDialogueTag::AssignNPCWatchPlayerLookDialogueTag(Entity, DefaultValue);
    return;
}
FC_NPCWatchPlayerLookDialogueTag& ModifyNPCWatchPlayerLookDialogueTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_NPCWatchPlayerLookDialogueTag));
    return local_12.GetComp();
}
FC_NPCWatchPlayerLookDialogueTag& ModifyOrAddNPCWatchPlayerLookDialogueTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_NPCWatchPlayerLookDialogueTag));
    return local_12.GetComp();
}
const FC_NPCWatchPlayerLookDialogueTag& GetNPCWatchPlayerLookDialogueTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_NPCWatchPlayerLookDialogueTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_NPCWatchPlayerLookDialogueTag GetNPCWatchPlayerLookDialogueTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_NPCWatchPlayerLookDialogueTag& local_4 = ECSFunc_FC_NPCWatchPlayerLookDialogueTag::GetNPCWatchPlayerLookDialogueTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_NPCWatchPlayerLookDialogueTag();
}
const FC_NPCWatchPlayerLookDialogueTag GetDefaultedNPCWatchPlayerLookDialogueTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_NPCWatchPlayerLookDialogueTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_NPCWatchPlayerLookDialogueTag);
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
FC_NPCWatchPlayerLookDialogueTag GetDefaultedNPCWatchPlayerLookDialogueTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_NPCWatchPlayerLookDialogueTag::GetDefaultedNPCWatchPlayerLookDialogueTag(Entity);
}
UFUNCTION()
bool RemoveNPCWatchPlayerLookDialogueTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_NPCWatchPlayerLookDialogueTag);
}
}
FECSMonitorRuntimeView __GetMonitorNPCWatchPlayerLookDialogueTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_NPCWatchPlayerLookDialogueTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNPCWatchPlayerLookDialogueTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_NPCWatchPlayerLookDialogueTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNPCWatchPlayerLookDialogueTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_NPCWatchPlayerLookDialogueTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNPCWatchPlayerLookDialogueTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_NPCWatchPlayerLookDialogueTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNPCWatchPlayerLookDialogueTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_NPCWatchPlayerLookDialogueTag, bFixedFrame, bMustHandleAll);
}
void __MonitorNPCWatchPlayerLookDialogueTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_NPCWatchPlayerLookDialogueTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNPCWatchPlayerLookDialogueTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_NPCWatchPlayerLookDialogueTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNPCWatchPlayerLookDialogueTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_NPCWatchPlayerLookDialogueTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_NPCReadyTag
{
UFUNCTION()
bool HasNPCReadyTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_NPCReadyTag);
}
FC_NPCReadyTag& AssignNPCReadyTag(const FECSEntity &inout Entity, const FC_NPCReadyTag &inout DefaultValue = FC_NPCReadyTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_NPCReadyTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignNPCReadyTag_BP(const FECSEntity &inout Entity, const FC_NPCReadyTag &inout DefaultValue = FC_NPCReadyTag())
{
    ECSFunc_FC_NPCReadyTag::AssignNPCReadyTag(Entity, DefaultValue);
    return;
}
FC_NPCReadyTag& ModifyNPCReadyTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_NPCReadyTag));
    return local_12.GetComp();
}
FC_NPCReadyTag& ModifyOrAddNPCReadyTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_NPCReadyTag));
    return local_12.GetComp();
}
const FC_NPCReadyTag& GetNPCReadyTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_NPCReadyTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_NPCReadyTag GetNPCReadyTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_NPCReadyTag& local_4 = ECSFunc_FC_NPCReadyTag::GetNPCReadyTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_NPCReadyTag();
}
const FC_NPCReadyTag GetDefaultedNPCReadyTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_NPCReadyTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_NPCReadyTag);
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
FC_NPCReadyTag GetDefaultedNPCReadyTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_NPCReadyTag::GetDefaultedNPCReadyTag(Entity);
}
UFUNCTION()
bool RemoveNPCReadyTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_NPCReadyTag);
}
}
FECSMonitorRuntimeView __GetMonitorNPCReadyTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_NPCReadyTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNPCReadyTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_NPCReadyTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNPCReadyTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_NPCReadyTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNPCReadyTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_NPCReadyTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNPCReadyTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_NPCReadyTag, bFixedFrame, bMustHandleAll);
}
void __MonitorNPCReadyTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_NPCReadyTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNPCReadyTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_NPCReadyTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNPCReadyTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_NPCReadyTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_NPCDailyRouteRuntime
{
UFUNCTION()
bool HasNPCDailyRouteRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_NPCDailyRouteRuntime);
}
FC_NPCDailyRouteRuntime& AssignNPCDailyRouteRuntime(const FECSEntity &inout Entity, const FC_NPCDailyRouteRuntime &inout DefaultValue = FC_NPCDailyRouteRuntime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_NPCDailyRouteRuntime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignNPCDailyRouteRuntime_BP(const FECSEntity &inout Entity, const FC_NPCDailyRouteRuntime &inout DefaultValue = FC_NPCDailyRouteRuntime())
{
    ECSFunc_FC_NPCDailyRouteRuntime::AssignNPCDailyRouteRuntime(Entity, DefaultValue);
    return;
}
FC_NPCDailyRouteRuntime& ModifyNPCDailyRouteRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_NPCDailyRouteRuntime));
    return local_12.GetComp();
}
FC_NPCDailyRouteRuntime& ModifyOrAddNPCDailyRouteRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_NPCDailyRouteRuntime));
    return local_12.GetComp();
}
const FC_NPCDailyRouteRuntime& GetNPCDailyRouteRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_NPCDailyRouteRuntime));
    return local_12.GetComp();
}
UFUNCTION()
FC_NPCDailyRouteRuntime GetNPCDailyRouteRuntime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_NPCDailyRouteRuntime __r;
    bValid = false;
    bValid = ECSFunc_FC_NPCDailyRouteRuntime::GetNPCDailyRouteRuntime(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_NPCDailyRouteRuntime GetDefaultedNPCDailyRouteRuntime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_NPCDailyRouteRuntime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_NPCDailyRouteRuntime);
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
FC_NPCDailyRouteRuntime GetDefaultedNPCDailyRouteRuntime_BP(const FECSEntity &inout Entity)
{
    FC_NPCDailyRouteRuntime __r;
    return __r;
}
UFUNCTION()
bool RemoveNPCDailyRouteRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_NPCDailyRouteRuntime);
}
}
FECSMonitorRuntimeView __GetMonitorNPCDailyRouteRuntimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_NPCDailyRouteRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNPCDailyRouteRuntimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_NPCDailyRouteRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNPCDailyRouteRuntimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_NPCDailyRouteRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNPCDailyRouteRuntimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_NPCDailyRouteRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNPCDailyRouteRuntimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_NPCDailyRouteRuntime, bFixedFrame, bMustHandleAll);
}
void __MonitorNPCDailyRouteRuntimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_NPCDailyRouteRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNPCDailyRouteRuntimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_NPCDailyRouteRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNPCDailyRouteRuntimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_NPCDailyRouteRuntime, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_NPCIdentity &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_NPCIdentity &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_NPCIdentity &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_NPCIdentity
{
int __IndexOf_NPCId()
{
    return 0;
}
int __IndexOf_RoleId()
{
    return 1;
}
int __IndexOf_CombatPriority()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_NPCInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_NPCInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_NPCInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_NPCInfo
{
int __IndexOf_MainConfig()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_NPCWatchPlayerLookModeOverride &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_NPCWatchPlayerLookModeOverride &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_NPCWatchPlayerLookModeOverride &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_NPCWatchPlayerLookModeOverride
{
int __IndexOf_Mode()
{
    return 0;
}
}
