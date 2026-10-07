
enum EAICombatState
{
    Idle,
    Alert,
    Combat,
}

enum EAIMoveAbilityType
{
    None,
    Upstairs,
    Mantle,
    LeapOff,
    GroundTurnInplace,
    GroundTurnAside,
    AirTurnInplace,
    AirTurnToAside,
}

enum EAINonCombatBehavior
{
    Wait,
    Wander,
    LieDown,
    WaitForLevelEvent,
}

namespace __INTENRAL_FC_AICombatTag_NS
{
    const TECSComponentDerivedPtr<FC_AICombatTag> DerivedPtr = TECSComponentDerivedPtr<FC_AICombatTag>();
    const FC_AICombatTag DefaultValue = FC_AICombatTag();
}
namespace __INTENRAL_FC_AICombatStateWithDelay_NS
{
    const TECSComponentDerivedPtr<FC_AICombatStateWithDelay> DerivedPtr = TECSComponentDerivedPtr<FC_AICombatStateWithDelay>();
    const FC_AICombatStateWithDelay DefaultValue = FC_AICombatStateWithDelay();
}
namespace __INTENRAL_FC_AINeedBroadcastAlertTargetsTag_NS
{
    const TECSComponentDerivedPtr<FC_AINeedBroadcastAlertTargetsTag> DerivedPtr = TECSComponentDerivedPtr<FC_AINeedBroadcastAlertTargetsTag>();
    const FC_AINeedBroadcastAlertTargetsTag DefaultValue = FC_AINeedBroadcastAlertTargetsTag();
}
namespace __INTENRAL_FC_AIKnowledge_NS
{
    const TECSComponentDerivedPtr<FC_AIKnowledge> DerivedPtr = TECSComponentDerivedPtr<FC_AIKnowledge>();
    const FC_AIKnowledge DefaultValue = FC_AIKnowledge();
}
namespace __INTENRAL_FCS_FactionTargetableEntities_NS
{
    const TECSComponentDerivedPtr<FCS_FactionTargetableEntities> DerivedPtr = TECSComponentDerivedPtr<FCS_FactionTargetableEntities>();
    const FCS_FactionTargetableEntities DefaultValue = FCS_FactionTargetableEntities();
}
namespace __INTENRAL_FC_AIBehaviorConfig_NS
{
    const TECSComponentDerivedPtr<FC_AIBehaviorConfig> DerivedPtr = TECSComponentDerivedPtr<FC_AIBehaviorConfig>();
    const FC_AIBehaviorConfig DefaultValue = FC_AIBehaviorConfig();
}
namespace __INTENRAL_FC_AIPathFollowAddContext_NS
{
    const TECSComponentDerivedPtr<FC_AIPathFollowAddContext> DerivedPtr = TECSComponentDerivedPtr<FC_AIPathFollowAddContext>();
    const FC_AIPathFollowAddContext DefaultValue = FC_AIPathFollowAddContext();
}
namespace __INTENRAL_FC_AIPathFollowRequestTeleport_NS
{
    const TECSComponentDerivedPtr<FC_AIPathFollowRequestTeleport> DerivedPtr = TECSComponentDerivedPtr<FC_AIPathFollowRequestTeleport>();
    const FC_AIPathFollowRequestTeleport DefaultValue = FC_AIPathFollowRequestTeleport();
}
namespace __INTENRAL_FC_AINeedUpdateAIKnowledgeTag_NS
{
    const TECSComponentDerivedPtr<FC_AINeedUpdateAIKnowledgeTag> DerivedPtr = TECSComponentDerivedPtr<FC_AINeedUpdateAIKnowledgeTag>();
    const FC_AINeedUpdateAIKnowledgeTag DefaultValue = FC_AINeedUpdateAIKnowledgeTag();
}
namespace __INTENRAL_FC_AINeedUpdateCombatGroupTag_NS
{
    const TECSComponentDerivedPtr<FC_AINeedUpdateCombatGroupTag> DerivedPtr = TECSComponentDerivedPtr<FC_AINeedUpdateCombatGroupTag>();
    const FC_AINeedUpdateCombatGroupTag DefaultValue = FC_AINeedUpdateCombatGroupTag();
}
namespace __INTENRAL_FC_AINeedUpdateAITargetingTag_NS
{
    const TECSComponentDerivedPtr<FC_AINeedUpdateAITargetingTag> DerivedPtr = TECSComponentDerivedPtr<FC_AINeedUpdateAITargetingTag>();
    const FC_AINeedUpdateAITargetingTag DefaultValue = FC_AINeedUpdateAITargetingTag();
}
namespace __INTENRAL_FC_AITargetingPreferUnSelectedTag_NS
{
    const TECSComponentDerivedPtr<FC_AITargetingPreferUnSelectedTag> DerivedPtr = TECSComponentDerivedPtr<FC_AITargetingPreferUnSelectedTag>();
    const FC_AITargetingPreferUnSelectedTag DefaultValue = FC_AITargetingPreferUnSelectedTag();
}
namespace __INTENRAL_FC_AITmpLockCurrentAttackTargetTag_NS
{
    const TECSComponentDerivedPtr<FC_AITmpLockCurrentAttackTargetTag> DerivedPtr = TECSComponentDerivedPtr<FC_AITmpLockCurrentAttackTargetTag>();
    const FC_AITmpLockCurrentAttackTargetTag DefaultValue = FC_AITmpLockCurrentAttackTargetTag();
}
namespace __INTENRAL_FC_AITmpChangeToNextTargetTag_NS
{
    const TECSComponentDerivedPtr<FC_AITmpChangeToNextTargetTag> DerivedPtr = TECSComponentDerivedPtr<FC_AITmpChangeToNextTargetTag>();
    const FC_AITmpChangeToNextTargetTag DefaultValue = FC_AITmpChangeToNextTargetTag();
}
namespace __INTENRAL_FC_AITargetableTag_NS
{
    const TECSComponentDerivedPtr<FC_AITargetableTag> DerivedPtr = TECSComponentDerivedPtr<FC_AITargetableTag>();
    const FC_AITargetableTag DefaultValue = FC_AITargetableTag();
}
namespace __INTENRAL_FCS_AIAttackTargetCount_NS
{
    const TECSComponentDerivedPtr<FCS_AIAttackTargetCount> DerivedPtr = TECSComponentDerivedPtr<FCS_AIAttackTargetCount>();
    const FCS_AIAttackTargetCount DefaultValue = FCS_AIAttackTargetCount();
}
namespace __INTENRAL_FC_AISimpleMovementOptimizeTag_NS
{
    const TECSComponentDerivedPtr<FC_AISimpleMovementOptimizeTag> DerivedPtr = TECSComponentDerivedPtr<FC_AISimpleMovementOptimizeTag>();
    const FC_AISimpleMovementOptimizeTag DefaultValue = FC_AISimpleMovementOptimizeTag();
}
namespace __INTENRAL_FC_AISimpleMovementNeedEnableTag_NS
{
    const TECSComponentDerivedPtr<FC_AISimpleMovementNeedEnableTag> DerivedPtr = TECSComponentDerivedPtr<FC_AISimpleMovementNeedEnableTag>();
    const FC_AISimpleMovementNeedEnableTag DefaultValue = FC_AISimpleMovementNeedEnableTag();
}
namespace __INTENRAL_FCS_AIForceRefreshTargetingByTarget_NS
{
    const TECSComponentDerivedPtr<FCS_AIForceRefreshTargetingByTarget> DerivedPtr = TECSComponentDerivedPtr<FCS_AIForceRefreshTargetingByTarget>();
    const FCS_AIForceRefreshTargetingByTarget DefaultValue = FCS_AIForceRefreshTargetingByTarget();
}
namespace __INTENRAL_FCS_AITargetAvailableWatcher_NS
{
    const TECSComponentDerivedPtr<FCS_AITargetAvailableWatcher> DerivedPtr = TECSComponentDerivedPtr<FCS_AITargetAvailableWatcher>();
    const FCS_AITargetAvailableWatcher DefaultValue = FCS_AITargetAvailableWatcher();

}
struct FEntitySet
{
    UPROPERTY()
    TSet<FECSEntity> Set;

    FEntitySet()
    {
        return;
    }
}

struct FC_AICombatTag : FECSComponent
{
    FC_AICombatTag()
    {
        return;
    }
}

struct FC_AICombatStateWithDelay : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFPTime m_DelayToTime;

    FC_AICombatStateWithDelay()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_AICombatStateWithDelay(const FC_AICombatStateWithDelay &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_DelayToTime = Other.m_DelayToTime;
        return;
    }
    FC_AICombatStateWithDelay opAssign(const FC_AICombatStateWithDelay &inout Other)
    {
        FC_AICombatStateWithDelay __r;
        this.SetDelayToTime(Other.GetDelayToTime());
        return __r;
    }
    const FFPTime GetDelayToTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_DelayToTime() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetDelayToTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_DelayToTime = __Value;
        return;
    }
}

struct FSightPerceptionView
{
    UPROPERTY()
    float32 SightPerceptionDistance = 5000.0f;
    UPROPERTY()
    float32 SightPerceptionAngleOffset = 60.0f;


}

struct FSightPerceptionConfig
{
    UPROPERTY()
    TArray<FSightPerceptionView> SightPerceptionViewList;
    UPROPERTY()
    bool bCheckSightBlock = true;


}

struct FAIAlertnessCurveConfig
{
    UPROPERTY()
    FRuntimeFloatCurve AlertnessRatioCurveByDistance;
    UPROPERTY()
    FRuntimeFloatCurve AlertnessRatioCurveByAngleOffset;

    FAIAlertnessCurveConfig()
    {
        FRuntimeCurveUtils::CreateLinear(0.0f, 1.0f, 1.0f, 0.1f);
        this.AlertnessRatioCurveByAngleOffset = FRuntimeCurveUtils::CreateLinear(0.0f, 1.0f, 90.0f, 0.1f);
        return;
    }
}

class UAIAlertnessConfigDataAsset : UDataAsset
{
    UPROPERTY()
    float32 AlertnessIncreaseSpeed = 10.0f;
    UPROPERTY()
    float32 AlertnessDecreaseSpeed = 10.0f;
    UPROPERTY()
    TMap<EAIThreatType, FAIAlertnessCurveConfig> AlertnessRatioMap;


}

struct FAIKnowledgeAlertness
{
    UPROPERTY()
    float32 AlertnessValue = 0.0f;
    UPROPERTY()
    FFPTime OutOfRangeStartTime = -1;


}

struct FC_AINeedBroadcastAlertTargetsTag : FECSComponent
{
    FC_AINeedBroadcastAlertTargetsTag()
    {
        return;
    }
}

struct FC_AIKnowledge : FECSComponent
{
    UPROPERTY()
    FVector HomeLocation;
    UPROPERTY()
    EAICombatState AICombatState = EAICombatState(0);
    UPROPERTY()
    float32 SightMaxDistance;
    UPROPERTY()
    FName CurrentOverrideSightConfigKey;
    UPROPERTY()
    FName CurrentOverrideAlertConfigKey;
    UPROPERTY()
    bool bNeedControlledByLevel;
    UPROPERTY()
    bool bIsInCombatArea;
    UPROPERTY()
    float32 OutOfCombatDistanceOverride = -1.0f;
    UPROPERTY()
    float32 OutOfCombatMaxDistanceOverride = -1.0f;
    UPROPERTY()
    FFPTime NextKnowledgeUpdateTime;


}

struct FFactionTargetableContainer
{
    UPROPERTY()
    TArray<FECSEntity> Entities;

    FFactionTargetableContainer()
    {
        return;
    }
    void Reset()
    {
        this.Reset(0);
        return;
    }
}

struct FCS_FactionTargetableEntities : FECSSingleton
{
    UPROPERTY()
    FFactionTargetableContainer NeutralEntities;
    UPROPERTY()
    TArray<FFactionTargetableContainer> FactionEntities;
    UPROPERTY()
    FFactionTargetableContainer CollectItemEntities;

    FCS_FactionTargetableEntities()
    {
        return;
    }
}

struct FC_AIBehaviorConfig : FECSComponent
{
    UPROPERTY()
    EAINonCombatBehavior NonCombatBehavior = EAINonCombatBehavior(0);
    UPROPERTY()
    ECharacterMoveStance DefaultMoveStance = ECharacterMoveStance(1);


}

struct FC_AIPathFollowAddContext : FECSComponent
{
    UPROPERTY()
    float NextIdxRatio;


}

struct FC_AIPathFollowRequestTeleport : FECSComponent
{
    UPROPERTY()
    FVector Location;
    UPROPERTY()
    FQuat Rotation;
    UPROPERTY()
    bool bUseRotation = false;


}

struct FC_AINeedUpdateAIKnowledgeTag : FECSComponent
{
    FC_AINeedUpdateAIKnowledgeTag()
    {
        return;
    }
}

struct FC_AINeedUpdateCombatGroupTag : FECSComponent
{
    FC_AINeedUpdateCombatGroupTag()
    {
        return;
    }
}

struct FC_AINeedUpdateAITargetingTag : FECSComponent
{
    FC_AINeedUpdateAITargetingTag()
    {
        return;
    }
}

struct FC_AITargetingPreferUnSelectedTag : FECSComponent
{
    FC_AITargetingPreferUnSelectedTag()
    {
        return;
    }
}

struct FC_AITmpLockCurrentAttackTargetTag : FECSComponent
{
    FC_AITmpLockCurrentAttackTargetTag()
    {
        return;
    }
}

struct FC_AITmpChangeToNextTargetTag : FECSComponent
{
    FC_AITmpChangeToNextTargetTag()
    {
        return;
    }
}

struct FC_AITargetableTag : FECSComponent
{
    FC_AITargetableTag()
    {
        return;
    }
}

struct FAIAttackTargetInfo
{
    UPROPERTY()
    TSet<FTargetEntity> AttackTargetSet;

    FAIAttackTargetInfo()
    {
        return;
    }
}

struct FCS_AIAttackTargetCount : FECSSingleton
{
    UPROPERTY()
    TMap<FTargetEntity, FAIAttackTargetInfo> AttackerCountMap;
    UPROPERTY()
    TMap<FTargetEntity, FAIAttackTargetInfo> BeEngagingedTargetCountMap;

    FCS_AIAttackTargetCount()
    {
        return;
    }
}

struct FC_AISimpleMovementOptimizeTag : FECSComponent
{
    FC_AISimpleMovementOptimizeTag()
    {
        return;
    }
}

struct FC_AISimpleMovementNeedEnableTag : FECSComponent
{
    FC_AISimpleMovementNeedEnableTag()
    {
        return;
    }
}

struct FCS_AIForceRefreshTargetingByTarget : FECSSingleton
{
    UPROPERTY()
    TSet<FTargetEntity> RefreshByTargetSet;

    FCS_AIForceRefreshTargetingByTarget()
    {
        return;
    }
}

struct FAIWatcherEntityIdSet
{
    UPROPERTY()
    TSet<FECSEntityId> Set;

    FAIWatcherEntityIdSet()
    {
        return;
    }
}

struct FCS_AITargetAvailableWatcher : FECSSingleton
{
    UPROPERTY()
    TMap<FECSEntityId, FAIWatcherEntityIdSet> Watchers;

    FCS_AITargetAvailableWatcher()
    {
        return;
    }
    void Register(const FECSEntityId &inout TargetId, const FECSEntityId &inout WatcherId)
    {
        this.FindOrAdd(TargetId).Set.Add(WatcherId);
        return;
    }
    void Unregister(const FECSEntityId &inout TargetId, const FECSEntityId &inout WatcherId)
    {
        if (this.Contains(TargetId))
        {
            if (this[TargetId].Set.Num() == 0)
            {
            }
        }
        return;
    }
}

namespace ECSFunc_FC_AICombatTag
{
UFUNCTION()
bool HasAICombatTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AICombatTag);
}
FC_AICombatTag& AssignAICombatTag(const FECSEntity &inout Entity, const FC_AICombatTag &inout DefaultValue = FC_AICombatTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AICombatTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAICombatTag_BP(const FECSEntity &inout Entity, const FC_AICombatTag &inout DefaultValue = FC_AICombatTag())
{
    ECSFunc_FC_AICombatTag::AssignAICombatTag(Entity, DefaultValue);
    return;
}
FC_AICombatTag& ModifyAICombatTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AICombatTag));
    return local_12.GetComp();
}
FC_AICombatTag& ModifyOrAddAICombatTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AICombatTag));
    return local_12.GetComp();
}
const FC_AICombatTag& GetAICombatTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AICombatTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_AICombatTag GetAICombatTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AICombatTag& local_4 = ECSFunc_FC_AICombatTag::GetAICombatTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AICombatTag();
}
const FC_AICombatTag GetDefaultedAICombatTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AICombatTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AICombatTag);
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
FC_AICombatTag GetDefaultedAICombatTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AICombatTag::GetDefaultedAICombatTag(Entity);
}
UFUNCTION()
bool RemoveAICombatTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AICombatTag);
}
}
FECSMonitorRuntimeView __GetMonitorAICombatTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AICombatTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAICombatTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AICombatTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAICombatTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AICombatTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAICombatTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AICombatTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAICombatTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AICombatTag, bFixedFrame, bMustHandleAll);
}
void __MonitorAICombatTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AICombatTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAICombatTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AICombatTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAICombatTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AICombatTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AICombatStateWithDelay
{
UFUNCTION()
bool HasAICombatStateWithDelay(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AICombatStateWithDelay);
}
FC_AICombatStateWithDelay& AssignAICombatStateWithDelay(const FECSEntity &inout Entity, const FC_AICombatStateWithDelay &inout DefaultValue = FC_AICombatStateWithDelay())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AICombatStateWithDelay, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAICombatStateWithDelay_BP(const FECSEntity &inout Entity, const FC_AICombatStateWithDelay &inout DefaultValue = FC_AICombatStateWithDelay())
{
    ECSFunc_FC_AICombatStateWithDelay::AssignAICombatStateWithDelay(Entity, DefaultValue);
    return;
}
FC_AICombatStateWithDelay& ModifyAICombatStateWithDelay(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AICombatStateWithDelay));
    return local_12.GetComp();
}
FC_AICombatStateWithDelay& ModifyOrAddAICombatStateWithDelay(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AICombatStateWithDelay));
    return local_12.GetComp();
}
const FC_AICombatStateWithDelay& GetAICombatStateWithDelay(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AICombatStateWithDelay));
    return local_12.GetComp();
}
UFUNCTION()
FC_AICombatStateWithDelay GetAICombatStateWithDelay_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AICombatStateWithDelay& local_4 = ECSFunc_FC_AICombatStateWithDelay::GetAICombatStateWithDelay(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AICombatStateWithDelay();
}
const FC_AICombatStateWithDelay GetDefaultedAICombatStateWithDelay(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AICombatStateWithDelay __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AICombatStateWithDelay);
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
FC_AICombatStateWithDelay GetDefaultedAICombatStateWithDelay_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AICombatStateWithDelay::GetDefaultedAICombatStateWithDelay(Entity);
}
UFUNCTION()
bool RemoveAICombatStateWithDelay(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AICombatStateWithDelay);
}
}
FECSMonitorRuntimeView __GetMonitorAICombatStateWithDelayOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AICombatStateWithDelay, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAICombatStateWithDelayOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AICombatStateWithDelay, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAICombatStateWithDelayOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AICombatStateWithDelay, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAICombatStateWithDelayOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AICombatStateWithDelay, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAICombatStateWithDelayOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AICombatStateWithDelay, bFixedFrame, bMustHandleAll);
}
void __MonitorAICombatStateWithDelayLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AICombatStateWithDelay, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAICombatStateWithDelayActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AICombatStateWithDelay, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAICombatStateWithDelayModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AICombatStateWithDelay, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AINeedBroadcastAlertTargetsTag
{
UFUNCTION()
bool HasAINeedBroadcastAlertTargetsTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AINeedBroadcastAlertTargetsTag);
}
FC_AINeedBroadcastAlertTargetsTag& AssignAINeedBroadcastAlertTargetsTag(const FECSEntity &inout Entity, const FC_AINeedBroadcastAlertTargetsTag &inout DefaultValue = FC_AINeedBroadcastAlertTargetsTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AINeedBroadcastAlertTargetsTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAINeedBroadcastAlertTargetsTag_BP(const FECSEntity &inout Entity, const FC_AINeedBroadcastAlertTargetsTag &inout DefaultValue = FC_AINeedBroadcastAlertTargetsTag())
{
    ECSFunc_FC_AINeedBroadcastAlertTargetsTag::AssignAINeedBroadcastAlertTargetsTag(Entity, DefaultValue);
    return;
}
FC_AINeedBroadcastAlertTargetsTag& ModifyAINeedBroadcastAlertTargetsTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AINeedBroadcastAlertTargetsTag));
    return local_12.GetComp();
}
FC_AINeedBroadcastAlertTargetsTag& ModifyOrAddAINeedBroadcastAlertTargetsTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AINeedBroadcastAlertTargetsTag));
    return local_12.GetComp();
}
const FC_AINeedBroadcastAlertTargetsTag& GetAINeedBroadcastAlertTargetsTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AINeedBroadcastAlertTargetsTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_AINeedBroadcastAlertTargetsTag GetAINeedBroadcastAlertTargetsTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AINeedBroadcastAlertTargetsTag& local_4 = ECSFunc_FC_AINeedBroadcastAlertTargetsTag::GetAINeedBroadcastAlertTargetsTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AINeedBroadcastAlertTargetsTag();
}
const FC_AINeedBroadcastAlertTargetsTag GetDefaultedAINeedBroadcastAlertTargetsTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AINeedBroadcastAlertTargetsTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AINeedBroadcastAlertTargetsTag);
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
FC_AINeedBroadcastAlertTargetsTag GetDefaultedAINeedBroadcastAlertTargetsTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AINeedBroadcastAlertTargetsTag::GetDefaultedAINeedBroadcastAlertTargetsTag(Entity);
}
UFUNCTION()
bool RemoveAINeedBroadcastAlertTargetsTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AINeedBroadcastAlertTargetsTag);
}
}
FECSMonitorRuntimeView __GetMonitorAINeedBroadcastAlertTargetsTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AINeedBroadcastAlertTargetsTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAINeedBroadcastAlertTargetsTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AINeedBroadcastAlertTargetsTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAINeedBroadcastAlertTargetsTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AINeedBroadcastAlertTargetsTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAINeedBroadcastAlertTargetsTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AINeedBroadcastAlertTargetsTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAINeedBroadcastAlertTargetsTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AINeedBroadcastAlertTargetsTag, bFixedFrame, bMustHandleAll);
}
void __MonitorAINeedBroadcastAlertTargetsTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AINeedBroadcastAlertTargetsTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAINeedBroadcastAlertTargetsTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AINeedBroadcastAlertTargetsTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAINeedBroadcastAlertTargetsTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AINeedBroadcastAlertTargetsTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AIKnowledge
{
UFUNCTION()
bool HasAIKnowledge(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIKnowledge);
}
FC_AIKnowledge& AssignAIKnowledge(const FECSEntity &inout Entity, const FC_AIKnowledge &inout DefaultValue = FC_AIKnowledge())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIKnowledge, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIKnowledge_BP(const FECSEntity &inout Entity, const FC_AIKnowledge &inout DefaultValue = FC_AIKnowledge())
{
    ECSFunc_FC_AIKnowledge::AssignAIKnowledge(Entity, DefaultValue);
    return;
}
FC_AIKnowledge& ModifyAIKnowledge(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIKnowledge));
    return local_12.GetComp();
}
FC_AIKnowledge& ModifyOrAddAIKnowledge(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIKnowledge));
    return local_12.GetComp();
}
const FC_AIKnowledge& GetAIKnowledge(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIKnowledge));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIKnowledge GetAIKnowledge_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AIKnowledge __r;
    bValid = false;
    bValid = ECSFunc_FC_AIKnowledge::GetAIKnowledge(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AIKnowledge GetDefaultedAIKnowledge(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIKnowledge __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIKnowledge);
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
FC_AIKnowledge GetDefaultedAIKnowledge_BP(const FECSEntity &inout Entity)
{
    FC_AIKnowledge __r;
    return __r;
}
UFUNCTION()
bool RemoveAIKnowledge(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIKnowledge);
}
}
FECSMonitorRuntimeView __GetMonitorAIKnowledgeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIKnowledge, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIKnowledgeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIKnowledge, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIKnowledgeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIKnowledge, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIKnowledgeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIKnowledge, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIKnowledgeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIKnowledge, bFixedFrame, bMustHandleAll);
}
void __MonitorAIKnowledgeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIKnowledge, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIKnowledgeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIKnowledge, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIKnowledgeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIKnowledge, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_FactionTargetableEntities
{
UFUNCTION()
bool HasFactionTargetableEntities(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_FactionTargetableEntities);
}
FCS_FactionTargetableEntities& AssignFactionTargetableEntities(const FECSWorldPtr &inout World, const FCS_FactionTargetableEntities &inout DefaultValue = FCS_FactionTargetableEntities())
{
    UScriptStruct local_6 = FCS_FactionTargetableEntities;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignFactionTargetableEntities_BP(const FECSWorldPtr &inout World, const FCS_FactionTargetableEntities &inout DefaultValue = FCS_FactionTargetableEntities())
{
    ECSFunc_FCS_FactionTargetableEntities::AssignFactionTargetableEntities(World, DefaultValue);
    return;
}
FCS_FactionTargetableEntities& ModifyFactionTargetableEntities(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_FactionTargetableEntities;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_FactionTargetableEntities& ModifyOrAddFactionTargetableEntities(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_FactionTargetableEntities;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_FactionTargetableEntities& GetFactionTargetableEntities(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_FactionTargetableEntities;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_FactionTargetableEntities GetFactionTargetableEntities_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_FactionTargetableEntities __r;
    bValid = false;
    bValid = ECSFunc_FCS_FactionTargetableEntities::GetFactionTargetableEntities(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_FactionTargetableEntities GetDefaultedFactionTargetableEntities(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_FactionTargetableEntities __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_FactionTargetableEntities);
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
FCS_FactionTargetableEntities GetDefaultedFactionTargetableEntities_BP(const FECSWorldPtr &inout World)
{
    FCS_FactionTargetableEntities __r;
    return __r;
}
UFUNCTION()
bool RemoveFactionTargetableEntities(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_FactionTargetableEntities);
}
}
void __MonitorFactionTargetableEntitiesLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_FactionTargetableEntities, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFactionTargetableEntitiesActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_FactionTargetableEntities, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFactionTargetableEntitiesModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_FactionTargetableEntities, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AIBehaviorConfig
{
UFUNCTION()
bool HasAIBehaviorConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIBehaviorConfig);
}
FC_AIBehaviorConfig& AssignAIBehaviorConfig(const FECSEntity &inout Entity, const FC_AIBehaviorConfig &inout DefaultValue = FC_AIBehaviorConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIBehaviorConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIBehaviorConfig_BP(const FECSEntity &inout Entity, const FC_AIBehaviorConfig &inout DefaultValue = FC_AIBehaviorConfig())
{
    ECSFunc_FC_AIBehaviorConfig::AssignAIBehaviorConfig(Entity, DefaultValue);
    return;
}
FC_AIBehaviorConfig& ModifyAIBehaviorConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIBehaviorConfig));
    return local_12.GetComp();
}
FC_AIBehaviorConfig& ModifyOrAddAIBehaviorConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIBehaviorConfig));
    return local_12.GetComp();
}
const FC_AIBehaviorConfig& GetAIBehaviorConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIBehaviorConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIBehaviorConfig GetAIBehaviorConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AIBehaviorConfig& local_4 = ECSFunc_FC_AIBehaviorConfig::GetAIBehaviorConfig(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AIBehaviorConfig();
}
const FC_AIBehaviorConfig GetDefaultedAIBehaviorConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIBehaviorConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIBehaviorConfig);
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
FC_AIBehaviorConfig GetDefaultedAIBehaviorConfig_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AIBehaviorConfig::GetDefaultedAIBehaviorConfig(Entity);
}
UFUNCTION()
bool RemoveAIBehaviorConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIBehaviorConfig);
}
}
FECSMonitorRuntimeView __GetMonitorAIBehaviorConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIBehaviorConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIBehaviorConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIBehaviorConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIBehaviorConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIBehaviorConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIBehaviorConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIBehaviorConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIBehaviorConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIBehaviorConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorAIBehaviorConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIBehaviorConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIBehaviorConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIBehaviorConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIBehaviorConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIBehaviorConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AIPathFollowAddContext
{
UFUNCTION()
bool HasAIPathFollowAddContext(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIPathFollowAddContext);
}
FC_AIPathFollowAddContext& AssignAIPathFollowAddContext(const FECSEntity &inout Entity, const FC_AIPathFollowAddContext &inout DefaultValue = FC_AIPathFollowAddContext())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIPathFollowAddContext, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIPathFollowAddContext_BP(const FECSEntity &inout Entity, const FC_AIPathFollowAddContext &inout DefaultValue = FC_AIPathFollowAddContext())
{
    ECSFunc_FC_AIPathFollowAddContext::AssignAIPathFollowAddContext(Entity, DefaultValue);
    return;
}
FC_AIPathFollowAddContext& ModifyAIPathFollowAddContext(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIPathFollowAddContext));
    return local_12.GetComp();
}
FC_AIPathFollowAddContext& ModifyOrAddAIPathFollowAddContext(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIPathFollowAddContext));
    return local_12.GetComp();
}
const FC_AIPathFollowAddContext& GetAIPathFollowAddContext(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIPathFollowAddContext));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIPathFollowAddContext GetAIPathFollowAddContext_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AIPathFollowAddContext& local_4 = ECSFunc_FC_AIPathFollowAddContext::GetAIPathFollowAddContext(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AIPathFollowAddContext();
}
const FC_AIPathFollowAddContext GetDefaultedAIPathFollowAddContext(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIPathFollowAddContext __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIPathFollowAddContext);
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
FC_AIPathFollowAddContext GetDefaultedAIPathFollowAddContext_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AIPathFollowAddContext::GetDefaultedAIPathFollowAddContext(Entity);
}
UFUNCTION()
bool RemoveAIPathFollowAddContext(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIPathFollowAddContext);
}
}
FECSMonitorRuntimeView __GetMonitorAIPathFollowAddContextOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIPathFollowAddContext, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathFollowAddContextOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIPathFollowAddContext, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathFollowAddContextOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIPathFollowAddContext, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathFollowAddContextOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIPathFollowAddContext, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathFollowAddContextOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIPathFollowAddContext, bFixedFrame, bMustHandleAll);
}
void __MonitorAIPathFollowAddContextLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIPathFollowAddContext, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIPathFollowAddContextActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIPathFollowAddContext, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIPathFollowAddContextModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIPathFollowAddContext, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AIPathFollowRequestTeleport
{
UFUNCTION()
bool HasAIPathFollowRequestTeleport(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIPathFollowRequestTeleport);
}
FC_AIPathFollowRequestTeleport& AssignAIPathFollowRequestTeleport(const FECSEntity &inout Entity, const FC_AIPathFollowRequestTeleport &inout DefaultValue = FC_AIPathFollowRequestTeleport())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIPathFollowRequestTeleport, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIPathFollowRequestTeleport_BP(const FECSEntity &inout Entity, const FC_AIPathFollowRequestTeleport &inout DefaultValue = FC_AIPathFollowRequestTeleport())
{
    ECSFunc_FC_AIPathFollowRequestTeleport::AssignAIPathFollowRequestTeleport(Entity, DefaultValue);
    return;
}
FC_AIPathFollowRequestTeleport& ModifyAIPathFollowRequestTeleport(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIPathFollowRequestTeleport));
    return local_12.GetComp();
}
FC_AIPathFollowRequestTeleport& ModifyOrAddAIPathFollowRequestTeleport(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIPathFollowRequestTeleport));
    return local_12.GetComp();
}
const FC_AIPathFollowRequestTeleport& GetAIPathFollowRequestTeleport(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIPathFollowRequestTeleport));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIPathFollowRequestTeleport GetAIPathFollowRequestTeleport_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AIPathFollowRequestTeleport& local_4 = ECSFunc_FC_AIPathFollowRequestTeleport::GetAIPathFollowRequestTeleport(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AIPathFollowRequestTeleport();
}
const FC_AIPathFollowRequestTeleport GetDefaultedAIPathFollowRequestTeleport(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIPathFollowRequestTeleport __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIPathFollowRequestTeleport);
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
FC_AIPathFollowRequestTeleport GetDefaultedAIPathFollowRequestTeleport_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AIPathFollowRequestTeleport::GetDefaultedAIPathFollowRequestTeleport(Entity);
}
UFUNCTION()
bool RemoveAIPathFollowRequestTeleport(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIPathFollowRequestTeleport);
}
}
FECSMonitorRuntimeView __GetMonitorAIPathFollowRequestTeleportOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIPathFollowRequestTeleport, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathFollowRequestTeleportOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIPathFollowRequestTeleport, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathFollowRequestTeleportOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIPathFollowRequestTeleport, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathFollowRequestTeleportOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIPathFollowRequestTeleport, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathFollowRequestTeleportOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIPathFollowRequestTeleport, bFixedFrame, bMustHandleAll);
}
void __MonitorAIPathFollowRequestTeleportLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIPathFollowRequestTeleport, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIPathFollowRequestTeleportActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIPathFollowRequestTeleport, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIPathFollowRequestTeleportModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIPathFollowRequestTeleport, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AINeedUpdateAIKnowledgeTag
{
UFUNCTION()
bool HasAINeedUpdateAIKnowledgeTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AINeedUpdateAIKnowledgeTag);
}
FC_AINeedUpdateAIKnowledgeTag& AssignAINeedUpdateAIKnowledgeTag(const FECSEntity &inout Entity, const FC_AINeedUpdateAIKnowledgeTag &inout DefaultValue = FC_AINeedUpdateAIKnowledgeTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AINeedUpdateAIKnowledgeTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAINeedUpdateAIKnowledgeTag_BP(const FECSEntity &inout Entity, const FC_AINeedUpdateAIKnowledgeTag &inout DefaultValue = FC_AINeedUpdateAIKnowledgeTag())
{
    ECSFunc_FC_AINeedUpdateAIKnowledgeTag::AssignAINeedUpdateAIKnowledgeTag(Entity, DefaultValue);
    return;
}
FC_AINeedUpdateAIKnowledgeTag& ModifyAINeedUpdateAIKnowledgeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AINeedUpdateAIKnowledgeTag));
    return local_12.GetComp();
}
FC_AINeedUpdateAIKnowledgeTag& ModifyOrAddAINeedUpdateAIKnowledgeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AINeedUpdateAIKnowledgeTag));
    return local_12.GetComp();
}
const FC_AINeedUpdateAIKnowledgeTag& GetAINeedUpdateAIKnowledgeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AINeedUpdateAIKnowledgeTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_AINeedUpdateAIKnowledgeTag GetAINeedUpdateAIKnowledgeTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AINeedUpdateAIKnowledgeTag& local_4 = ECSFunc_FC_AINeedUpdateAIKnowledgeTag::GetAINeedUpdateAIKnowledgeTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AINeedUpdateAIKnowledgeTag();
}
const FC_AINeedUpdateAIKnowledgeTag GetDefaultedAINeedUpdateAIKnowledgeTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AINeedUpdateAIKnowledgeTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AINeedUpdateAIKnowledgeTag);
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
FC_AINeedUpdateAIKnowledgeTag GetDefaultedAINeedUpdateAIKnowledgeTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AINeedUpdateAIKnowledgeTag::GetDefaultedAINeedUpdateAIKnowledgeTag(Entity);
}
UFUNCTION()
bool RemoveAINeedUpdateAIKnowledgeTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AINeedUpdateAIKnowledgeTag);
}
}
FECSMonitorRuntimeView __GetMonitorAINeedUpdateAIKnowledgeTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AINeedUpdateAIKnowledgeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAINeedUpdateAIKnowledgeTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AINeedUpdateAIKnowledgeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAINeedUpdateAIKnowledgeTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AINeedUpdateAIKnowledgeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAINeedUpdateAIKnowledgeTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AINeedUpdateAIKnowledgeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAINeedUpdateAIKnowledgeTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AINeedUpdateAIKnowledgeTag, bFixedFrame, bMustHandleAll);
}
void __MonitorAINeedUpdateAIKnowledgeTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AINeedUpdateAIKnowledgeTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAINeedUpdateAIKnowledgeTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AINeedUpdateAIKnowledgeTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAINeedUpdateAIKnowledgeTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AINeedUpdateAIKnowledgeTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AINeedUpdateCombatGroupTag
{
UFUNCTION()
bool HasAINeedUpdateCombatGroupTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AINeedUpdateCombatGroupTag);
}
FC_AINeedUpdateCombatGroupTag& AssignAINeedUpdateCombatGroupTag(const FECSEntity &inout Entity, const FC_AINeedUpdateCombatGroupTag &inout DefaultValue = FC_AINeedUpdateCombatGroupTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AINeedUpdateCombatGroupTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAINeedUpdateCombatGroupTag_BP(const FECSEntity &inout Entity, const FC_AINeedUpdateCombatGroupTag &inout DefaultValue = FC_AINeedUpdateCombatGroupTag())
{
    ECSFunc_FC_AINeedUpdateCombatGroupTag::AssignAINeedUpdateCombatGroupTag(Entity, DefaultValue);
    return;
}
FC_AINeedUpdateCombatGroupTag& ModifyAINeedUpdateCombatGroupTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AINeedUpdateCombatGroupTag));
    return local_12.GetComp();
}
FC_AINeedUpdateCombatGroupTag& ModifyOrAddAINeedUpdateCombatGroupTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AINeedUpdateCombatGroupTag));
    return local_12.GetComp();
}
const FC_AINeedUpdateCombatGroupTag& GetAINeedUpdateCombatGroupTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AINeedUpdateCombatGroupTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_AINeedUpdateCombatGroupTag GetAINeedUpdateCombatGroupTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AINeedUpdateCombatGroupTag& local_4 = ECSFunc_FC_AINeedUpdateCombatGroupTag::GetAINeedUpdateCombatGroupTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AINeedUpdateCombatGroupTag();
}
const FC_AINeedUpdateCombatGroupTag GetDefaultedAINeedUpdateCombatGroupTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AINeedUpdateCombatGroupTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AINeedUpdateCombatGroupTag);
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
FC_AINeedUpdateCombatGroupTag GetDefaultedAINeedUpdateCombatGroupTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AINeedUpdateCombatGroupTag::GetDefaultedAINeedUpdateCombatGroupTag(Entity);
}
UFUNCTION()
bool RemoveAINeedUpdateCombatGroupTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AINeedUpdateCombatGroupTag);
}
}
FECSMonitorRuntimeView __GetMonitorAINeedUpdateCombatGroupTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AINeedUpdateCombatGroupTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAINeedUpdateCombatGroupTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AINeedUpdateCombatGroupTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAINeedUpdateCombatGroupTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AINeedUpdateCombatGroupTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAINeedUpdateCombatGroupTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AINeedUpdateCombatGroupTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAINeedUpdateCombatGroupTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AINeedUpdateCombatGroupTag, bFixedFrame, bMustHandleAll);
}
void __MonitorAINeedUpdateCombatGroupTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AINeedUpdateCombatGroupTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAINeedUpdateCombatGroupTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AINeedUpdateCombatGroupTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAINeedUpdateCombatGroupTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AINeedUpdateCombatGroupTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AINeedUpdateAITargetingTag
{
UFUNCTION()
bool HasAINeedUpdateAITargetingTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AINeedUpdateAITargetingTag);
}
FC_AINeedUpdateAITargetingTag& AssignAINeedUpdateAITargetingTag(const FECSEntity &inout Entity, const FC_AINeedUpdateAITargetingTag &inout DefaultValue = FC_AINeedUpdateAITargetingTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AINeedUpdateAITargetingTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAINeedUpdateAITargetingTag_BP(const FECSEntity &inout Entity, const FC_AINeedUpdateAITargetingTag &inout DefaultValue = FC_AINeedUpdateAITargetingTag())
{
    ECSFunc_FC_AINeedUpdateAITargetingTag::AssignAINeedUpdateAITargetingTag(Entity, DefaultValue);
    return;
}
FC_AINeedUpdateAITargetingTag& ModifyAINeedUpdateAITargetingTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AINeedUpdateAITargetingTag));
    return local_12.GetComp();
}
FC_AINeedUpdateAITargetingTag& ModifyOrAddAINeedUpdateAITargetingTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AINeedUpdateAITargetingTag));
    return local_12.GetComp();
}
const FC_AINeedUpdateAITargetingTag& GetAINeedUpdateAITargetingTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AINeedUpdateAITargetingTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_AINeedUpdateAITargetingTag GetAINeedUpdateAITargetingTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AINeedUpdateAITargetingTag& local_4 = ECSFunc_FC_AINeedUpdateAITargetingTag::GetAINeedUpdateAITargetingTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AINeedUpdateAITargetingTag();
}
const FC_AINeedUpdateAITargetingTag GetDefaultedAINeedUpdateAITargetingTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AINeedUpdateAITargetingTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AINeedUpdateAITargetingTag);
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
FC_AINeedUpdateAITargetingTag GetDefaultedAINeedUpdateAITargetingTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AINeedUpdateAITargetingTag::GetDefaultedAINeedUpdateAITargetingTag(Entity);
}
UFUNCTION()
bool RemoveAINeedUpdateAITargetingTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AINeedUpdateAITargetingTag);
}
}
FECSMonitorRuntimeView __GetMonitorAINeedUpdateAITargetingTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AINeedUpdateAITargetingTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAINeedUpdateAITargetingTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AINeedUpdateAITargetingTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAINeedUpdateAITargetingTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AINeedUpdateAITargetingTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAINeedUpdateAITargetingTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AINeedUpdateAITargetingTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAINeedUpdateAITargetingTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AINeedUpdateAITargetingTag, bFixedFrame, bMustHandleAll);
}
void __MonitorAINeedUpdateAITargetingTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AINeedUpdateAITargetingTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAINeedUpdateAITargetingTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AINeedUpdateAITargetingTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAINeedUpdateAITargetingTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AINeedUpdateAITargetingTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AITargetingPreferUnSelectedTag
{
UFUNCTION()
bool HasAITargetingPreferUnSelectedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AITargetingPreferUnSelectedTag);
}
FC_AITargetingPreferUnSelectedTag& AssignAITargetingPreferUnSelectedTag(const FECSEntity &inout Entity, const FC_AITargetingPreferUnSelectedTag &inout DefaultValue = FC_AITargetingPreferUnSelectedTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AITargetingPreferUnSelectedTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAITargetingPreferUnSelectedTag_BP(const FECSEntity &inout Entity, const FC_AITargetingPreferUnSelectedTag &inout DefaultValue = FC_AITargetingPreferUnSelectedTag())
{
    ECSFunc_FC_AITargetingPreferUnSelectedTag::AssignAITargetingPreferUnSelectedTag(Entity, DefaultValue);
    return;
}
FC_AITargetingPreferUnSelectedTag& ModifyAITargetingPreferUnSelectedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AITargetingPreferUnSelectedTag));
    return local_12.GetComp();
}
FC_AITargetingPreferUnSelectedTag& ModifyOrAddAITargetingPreferUnSelectedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AITargetingPreferUnSelectedTag));
    return local_12.GetComp();
}
const FC_AITargetingPreferUnSelectedTag& GetAITargetingPreferUnSelectedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AITargetingPreferUnSelectedTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_AITargetingPreferUnSelectedTag GetAITargetingPreferUnSelectedTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AITargetingPreferUnSelectedTag& local_4 = ECSFunc_FC_AITargetingPreferUnSelectedTag::GetAITargetingPreferUnSelectedTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AITargetingPreferUnSelectedTag();
}
const FC_AITargetingPreferUnSelectedTag GetDefaultedAITargetingPreferUnSelectedTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AITargetingPreferUnSelectedTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AITargetingPreferUnSelectedTag);
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
FC_AITargetingPreferUnSelectedTag GetDefaultedAITargetingPreferUnSelectedTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AITargetingPreferUnSelectedTag::GetDefaultedAITargetingPreferUnSelectedTag(Entity);
}
UFUNCTION()
bool RemoveAITargetingPreferUnSelectedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AITargetingPreferUnSelectedTag);
}
}
FECSMonitorRuntimeView __GetMonitorAITargetingPreferUnSelectedTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AITargetingPreferUnSelectedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingPreferUnSelectedTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AITargetingPreferUnSelectedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingPreferUnSelectedTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AITargetingPreferUnSelectedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingPreferUnSelectedTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AITargetingPreferUnSelectedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingPreferUnSelectedTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AITargetingPreferUnSelectedTag, bFixedFrame, bMustHandleAll);
}
void __MonitorAITargetingPreferUnSelectedTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AITargetingPreferUnSelectedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAITargetingPreferUnSelectedTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AITargetingPreferUnSelectedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAITargetingPreferUnSelectedTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AITargetingPreferUnSelectedTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AITmpLockCurrentAttackTargetTag
{
UFUNCTION()
bool HasAITmpLockCurrentAttackTargetTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AITmpLockCurrentAttackTargetTag);
}
FC_AITmpLockCurrentAttackTargetTag& AssignAITmpLockCurrentAttackTargetTag(const FECSEntity &inout Entity, const FC_AITmpLockCurrentAttackTargetTag &inout DefaultValue = FC_AITmpLockCurrentAttackTargetTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AITmpLockCurrentAttackTargetTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAITmpLockCurrentAttackTargetTag_BP(const FECSEntity &inout Entity, const FC_AITmpLockCurrentAttackTargetTag &inout DefaultValue = FC_AITmpLockCurrentAttackTargetTag())
{
    ECSFunc_FC_AITmpLockCurrentAttackTargetTag::AssignAITmpLockCurrentAttackTargetTag(Entity, DefaultValue);
    return;
}
FC_AITmpLockCurrentAttackTargetTag& ModifyAITmpLockCurrentAttackTargetTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AITmpLockCurrentAttackTargetTag));
    return local_12.GetComp();
}
FC_AITmpLockCurrentAttackTargetTag& ModifyOrAddAITmpLockCurrentAttackTargetTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AITmpLockCurrentAttackTargetTag));
    return local_12.GetComp();
}
const FC_AITmpLockCurrentAttackTargetTag& GetAITmpLockCurrentAttackTargetTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AITmpLockCurrentAttackTargetTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_AITmpLockCurrentAttackTargetTag GetAITmpLockCurrentAttackTargetTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AITmpLockCurrentAttackTargetTag& local_4 = ECSFunc_FC_AITmpLockCurrentAttackTargetTag::GetAITmpLockCurrentAttackTargetTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AITmpLockCurrentAttackTargetTag();
}
const FC_AITmpLockCurrentAttackTargetTag GetDefaultedAITmpLockCurrentAttackTargetTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AITmpLockCurrentAttackTargetTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AITmpLockCurrentAttackTargetTag);
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
FC_AITmpLockCurrentAttackTargetTag GetDefaultedAITmpLockCurrentAttackTargetTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AITmpLockCurrentAttackTargetTag::GetDefaultedAITmpLockCurrentAttackTargetTag(Entity);
}
UFUNCTION()
bool RemoveAITmpLockCurrentAttackTargetTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AITmpLockCurrentAttackTargetTag);
}
}
FECSMonitorRuntimeView __GetMonitorAITmpLockCurrentAttackTargetTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AITmpLockCurrentAttackTargetTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITmpLockCurrentAttackTargetTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AITmpLockCurrentAttackTargetTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITmpLockCurrentAttackTargetTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AITmpLockCurrentAttackTargetTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITmpLockCurrentAttackTargetTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AITmpLockCurrentAttackTargetTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITmpLockCurrentAttackTargetTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AITmpLockCurrentAttackTargetTag, bFixedFrame, bMustHandleAll);
}
void __MonitorAITmpLockCurrentAttackTargetTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AITmpLockCurrentAttackTargetTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAITmpLockCurrentAttackTargetTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AITmpLockCurrentAttackTargetTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAITmpLockCurrentAttackTargetTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AITmpLockCurrentAttackTargetTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AITmpChangeToNextTargetTag
{
UFUNCTION()
bool HasAITmpChangeToNextTargetTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AITmpChangeToNextTargetTag);
}
FC_AITmpChangeToNextTargetTag& AssignAITmpChangeToNextTargetTag(const FECSEntity &inout Entity, const FC_AITmpChangeToNextTargetTag &inout DefaultValue = FC_AITmpChangeToNextTargetTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AITmpChangeToNextTargetTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAITmpChangeToNextTargetTag_BP(const FECSEntity &inout Entity, const FC_AITmpChangeToNextTargetTag &inout DefaultValue = FC_AITmpChangeToNextTargetTag())
{
    ECSFunc_FC_AITmpChangeToNextTargetTag::AssignAITmpChangeToNextTargetTag(Entity, DefaultValue);
    return;
}
FC_AITmpChangeToNextTargetTag& ModifyAITmpChangeToNextTargetTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AITmpChangeToNextTargetTag));
    return local_12.GetComp();
}
FC_AITmpChangeToNextTargetTag& ModifyOrAddAITmpChangeToNextTargetTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AITmpChangeToNextTargetTag));
    return local_12.GetComp();
}
const FC_AITmpChangeToNextTargetTag& GetAITmpChangeToNextTargetTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AITmpChangeToNextTargetTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_AITmpChangeToNextTargetTag GetAITmpChangeToNextTargetTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AITmpChangeToNextTargetTag& local_4 = ECSFunc_FC_AITmpChangeToNextTargetTag::GetAITmpChangeToNextTargetTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AITmpChangeToNextTargetTag();
}
const FC_AITmpChangeToNextTargetTag GetDefaultedAITmpChangeToNextTargetTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AITmpChangeToNextTargetTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AITmpChangeToNextTargetTag);
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
FC_AITmpChangeToNextTargetTag GetDefaultedAITmpChangeToNextTargetTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AITmpChangeToNextTargetTag::GetDefaultedAITmpChangeToNextTargetTag(Entity);
}
UFUNCTION()
bool RemoveAITmpChangeToNextTargetTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AITmpChangeToNextTargetTag);
}
}
FECSMonitorRuntimeView __GetMonitorAITmpChangeToNextTargetTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AITmpChangeToNextTargetTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITmpChangeToNextTargetTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AITmpChangeToNextTargetTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITmpChangeToNextTargetTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AITmpChangeToNextTargetTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITmpChangeToNextTargetTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AITmpChangeToNextTargetTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITmpChangeToNextTargetTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AITmpChangeToNextTargetTag, bFixedFrame, bMustHandleAll);
}
void __MonitorAITmpChangeToNextTargetTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AITmpChangeToNextTargetTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAITmpChangeToNextTargetTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AITmpChangeToNextTargetTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAITmpChangeToNextTargetTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AITmpChangeToNextTargetTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AITargetableTag
{
UFUNCTION()
bool HasAITargetableTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AITargetableTag);
}
FC_AITargetableTag& AssignAITargetableTag(const FECSEntity &inout Entity, const FC_AITargetableTag &inout DefaultValue = FC_AITargetableTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AITargetableTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAITargetableTag_BP(const FECSEntity &inout Entity, const FC_AITargetableTag &inout DefaultValue = FC_AITargetableTag())
{
    ECSFunc_FC_AITargetableTag::AssignAITargetableTag(Entity, DefaultValue);
    return;
}
FC_AITargetableTag& ModifyAITargetableTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AITargetableTag));
    return local_12.GetComp();
}
FC_AITargetableTag& ModifyOrAddAITargetableTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AITargetableTag));
    return local_12.GetComp();
}
const FC_AITargetableTag& GetAITargetableTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AITargetableTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_AITargetableTag GetAITargetableTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AITargetableTag& local_4 = ECSFunc_FC_AITargetableTag::GetAITargetableTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AITargetableTag();
}
const FC_AITargetableTag GetDefaultedAITargetableTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AITargetableTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AITargetableTag);
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
FC_AITargetableTag GetDefaultedAITargetableTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AITargetableTag::GetDefaultedAITargetableTag(Entity);
}
UFUNCTION()
bool RemoveAITargetableTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AITargetableTag);
}
}
FECSMonitorRuntimeView __GetMonitorAITargetableTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AITargetableTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetableTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AITargetableTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetableTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AITargetableTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetableTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AITargetableTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetableTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AITargetableTag, bFixedFrame, bMustHandleAll);
}
void __MonitorAITargetableTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AITargetableTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAITargetableTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AITargetableTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAITargetableTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AITargetableTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_AIAttackTargetCount
{
UFUNCTION()
bool HasAIAttackTargetCount(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_AIAttackTargetCount);
}
FCS_AIAttackTargetCount& AssignAIAttackTargetCount(const FECSWorldPtr &inout World, const FCS_AIAttackTargetCount &inout DefaultValue = FCS_AIAttackTargetCount())
{
    UScriptStruct local_6 = FCS_AIAttackTargetCount;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignAIAttackTargetCount_BP(const FECSWorldPtr &inout World, const FCS_AIAttackTargetCount &inout DefaultValue = FCS_AIAttackTargetCount())
{
    ECSFunc_FCS_AIAttackTargetCount::AssignAIAttackTargetCount(World, DefaultValue);
    return;
}
FCS_AIAttackTargetCount& ModifyAIAttackTargetCount(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AIAttackTargetCount;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_AIAttackTargetCount& ModifyOrAddAIAttackTargetCount(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AIAttackTargetCount;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_AIAttackTargetCount& GetAIAttackTargetCount(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AIAttackTargetCount;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_AIAttackTargetCount GetAIAttackTargetCount_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_AIAttackTargetCount __r;
    bValid = false;
    bValid = ECSFunc_FCS_AIAttackTargetCount::GetAIAttackTargetCount(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_AIAttackTargetCount GetDefaultedAIAttackTargetCount(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_AIAttackTargetCount __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_AIAttackTargetCount);
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
FCS_AIAttackTargetCount GetDefaultedAIAttackTargetCount_BP(const FECSWorldPtr &inout World)
{
    FCS_AIAttackTargetCount __r;
    return __r;
}
UFUNCTION()
bool RemoveAIAttackTargetCount(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_AIAttackTargetCount);
}
}
void __MonitorAIAttackTargetCountLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_AIAttackTargetCount, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIAttackTargetCountActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_AIAttackTargetCount, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIAttackTargetCountModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_AIAttackTargetCount, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AISimpleMovementOptimizeTag
{
UFUNCTION()
bool HasAISimpleMovementOptimizeTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AISimpleMovementOptimizeTag);
}
FC_AISimpleMovementOptimizeTag& AssignAISimpleMovementOptimizeTag(const FECSEntity &inout Entity, const FC_AISimpleMovementOptimizeTag &inout DefaultValue = FC_AISimpleMovementOptimizeTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AISimpleMovementOptimizeTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAISimpleMovementOptimizeTag_BP(const FECSEntity &inout Entity, const FC_AISimpleMovementOptimizeTag &inout DefaultValue = FC_AISimpleMovementOptimizeTag())
{
    ECSFunc_FC_AISimpleMovementOptimizeTag::AssignAISimpleMovementOptimizeTag(Entity, DefaultValue);
    return;
}
FC_AISimpleMovementOptimizeTag& ModifyAISimpleMovementOptimizeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AISimpleMovementOptimizeTag));
    return local_12.GetComp();
}
FC_AISimpleMovementOptimizeTag& ModifyOrAddAISimpleMovementOptimizeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AISimpleMovementOptimizeTag));
    return local_12.GetComp();
}
const FC_AISimpleMovementOptimizeTag& GetAISimpleMovementOptimizeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AISimpleMovementOptimizeTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_AISimpleMovementOptimizeTag GetAISimpleMovementOptimizeTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AISimpleMovementOptimizeTag& local_4 = ECSFunc_FC_AISimpleMovementOptimizeTag::GetAISimpleMovementOptimizeTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AISimpleMovementOptimizeTag();
}
const FC_AISimpleMovementOptimizeTag GetDefaultedAISimpleMovementOptimizeTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AISimpleMovementOptimizeTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AISimpleMovementOptimizeTag);
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
FC_AISimpleMovementOptimizeTag GetDefaultedAISimpleMovementOptimizeTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AISimpleMovementOptimizeTag::GetDefaultedAISimpleMovementOptimizeTag(Entity);
}
UFUNCTION()
bool RemoveAISimpleMovementOptimizeTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AISimpleMovementOptimizeTag);
}
}
FECSMonitorRuntimeView __GetMonitorAISimpleMovementOptimizeTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AISimpleMovementOptimizeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAISimpleMovementOptimizeTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AISimpleMovementOptimizeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAISimpleMovementOptimizeTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AISimpleMovementOptimizeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAISimpleMovementOptimizeTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AISimpleMovementOptimizeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAISimpleMovementOptimizeTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AISimpleMovementOptimizeTag, bFixedFrame, bMustHandleAll);
}
void __MonitorAISimpleMovementOptimizeTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AISimpleMovementOptimizeTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAISimpleMovementOptimizeTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AISimpleMovementOptimizeTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAISimpleMovementOptimizeTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AISimpleMovementOptimizeTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AISimpleMovementNeedEnableTag
{
UFUNCTION()
bool HasAISimpleMovementNeedEnableTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AISimpleMovementNeedEnableTag);
}
FC_AISimpleMovementNeedEnableTag& AssignAISimpleMovementNeedEnableTag(const FECSEntity &inout Entity, const FC_AISimpleMovementNeedEnableTag &inout DefaultValue = FC_AISimpleMovementNeedEnableTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AISimpleMovementNeedEnableTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAISimpleMovementNeedEnableTag_BP(const FECSEntity &inout Entity, const FC_AISimpleMovementNeedEnableTag &inout DefaultValue = FC_AISimpleMovementNeedEnableTag())
{
    ECSFunc_FC_AISimpleMovementNeedEnableTag::AssignAISimpleMovementNeedEnableTag(Entity, DefaultValue);
    return;
}
FC_AISimpleMovementNeedEnableTag& ModifyAISimpleMovementNeedEnableTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AISimpleMovementNeedEnableTag));
    return local_12.GetComp();
}
FC_AISimpleMovementNeedEnableTag& ModifyOrAddAISimpleMovementNeedEnableTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AISimpleMovementNeedEnableTag));
    return local_12.GetComp();
}
const FC_AISimpleMovementNeedEnableTag& GetAISimpleMovementNeedEnableTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AISimpleMovementNeedEnableTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_AISimpleMovementNeedEnableTag GetAISimpleMovementNeedEnableTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AISimpleMovementNeedEnableTag& local_4 = ECSFunc_FC_AISimpleMovementNeedEnableTag::GetAISimpleMovementNeedEnableTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AISimpleMovementNeedEnableTag();
}
const FC_AISimpleMovementNeedEnableTag GetDefaultedAISimpleMovementNeedEnableTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AISimpleMovementNeedEnableTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AISimpleMovementNeedEnableTag);
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
FC_AISimpleMovementNeedEnableTag GetDefaultedAISimpleMovementNeedEnableTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AISimpleMovementNeedEnableTag::GetDefaultedAISimpleMovementNeedEnableTag(Entity);
}
UFUNCTION()
bool RemoveAISimpleMovementNeedEnableTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AISimpleMovementNeedEnableTag);
}
}
FECSMonitorRuntimeView __GetMonitorAISimpleMovementNeedEnableTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AISimpleMovementNeedEnableTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAISimpleMovementNeedEnableTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AISimpleMovementNeedEnableTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAISimpleMovementNeedEnableTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AISimpleMovementNeedEnableTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAISimpleMovementNeedEnableTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AISimpleMovementNeedEnableTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAISimpleMovementNeedEnableTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AISimpleMovementNeedEnableTag, bFixedFrame, bMustHandleAll);
}
void __MonitorAISimpleMovementNeedEnableTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AISimpleMovementNeedEnableTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAISimpleMovementNeedEnableTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AISimpleMovementNeedEnableTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAISimpleMovementNeedEnableTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AISimpleMovementNeedEnableTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_AIForceRefreshTargetingByTarget
{
UFUNCTION()
bool HasAIForceRefreshTargetingByTarget(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_AIForceRefreshTargetingByTarget);
}
FCS_AIForceRefreshTargetingByTarget& AssignAIForceRefreshTargetingByTarget(const FECSWorldPtr &inout World, const FCS_AIForceRefreshTargetingByTarget &inout DefaultValue = FCS_AIForceRefreshTargetingByTarget())
{
    UScriptStruct local_6 = FCS_AIForceRefreshTargetingByTarget;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignAIForceRefreshTargetingByTarget_BP(const FECSWorldPtr &inout World, const FCS_AIForceRefreshTargetingByTarget &inout DefaultValue = FCS_AIForceRefreshTargetingByTarget())
{
    ECSFunc_FCS_AIForceRefreshTargetingByTarget::AssignAIForceRefreshTargetingByTarget(World, DefaultValue);
    return;
}
FCS_AIForceRefreshTargetingByTarget& ModifyAIForceRefreshTargetingByTarget(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AIForceRefreshTargetingByTarget;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_AIForceRefreshTargetingByTarget& ModifyOrAddAIForceRefreshTargetingByTarget(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AIForceRefreshTargetingByTarget;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_AIForceRefreshTargetingByTarget& GetAIForceRefreshTargetingByTarget(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AIForceRefreshTargetingByTarget;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_AIForceRefreshTargetingByTarget GetAIForceRefreshTargetingByTarget_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_AIForceRefreshTargetingByTarget __r;
    bValid = false;
    bValid = ECSFunc_FCS_AIForceRefreshTargetingByTarget::GetAIForceRefreshTargetingByTarget(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_AIForceRefreshTargetingByTarget GetDefaultedAIForceRefreshTargetingByTarget(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_AIForceRefreshTargetingByTarget __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_AIForceRefreshTargetingByTarget);
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
FCS_AIForceRefreshTargetingByTarget GetDefaultedAIForceRefreshTargetingByTarget_BP(const FECSWorldPtr &inout World)
{
    FCS_AIForceRefreshTargetingByTarget __r;
    return __r;
}
UFUNCTION()
bool RemoveAIForceRefreshTargetingByTarget(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_AIForceRefreshTargetingByTarget);
}
}
void __MonitorAIForceRefreshTargetingByTargetLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_AIForceRefreshTargetingByTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIForceRefreshTargetingByTargetActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_AIForceRefreshTargetingByTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIForceRefreshTargetingByTargetModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_AIForceRefreshTargetingByTarget, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_AITargetAvailableWatcher
{
UFUNCTION()
bool HasAITargetAvailableWatcher(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_AITargetAvailableWatcher);
}
FCS_AITargetAvailableWatcher& AssignAITargetAvailableWatcher(const FECSWorldPtr &inout World, const FCS_AITargetAvailableWatcher &inout DefaultValue = FCS_AITargetAvailableWatcher())
{
    UScriptStruct local_6 = FCS_AITargetAvailableWatcher;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignAITargetAvailableWatcher_BP(const FECSWorldPtr &inout World, const FCS_AITargetAvailableWatcher &inout DefaultValue = FCS_AITargetAvailableWatcher())
{
    ECSFunc_FCS_AITargetAvailableWatcher::AssignAITargetAvailableWatcher(World, DefaultValue);
    return;
}
FCS_AITargetAvailableWatcher& ModifyAITargetAvailableWatcher(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AITargetAvailableWatcher;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_AITargetAvailableWatcher& ModifyOrAddAITargetAvailableWatcher(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AITargetAvailableWatcher;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_AITargetAvailableWatcher& GetAITargetAvailableWatcher(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AITargetAvailableWatcher;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_AITargetAvailableWatcher GetAITargetAvailableWatcher_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_AITargetAvailableWatcher __r;
    bValid = false;
    bValid = ECSFunc_FCS_AITargetAvailableWatcher::GetAITargetAvailableWatcher(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_AITargetAvailableWatcher GetDefaultedAITargetAvailableWatcher(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_AITargetAvailableWatcher __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_AITargetAvailableWatcher);
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
FCS_AITargetAvailableWatcher GetDefaultedAITargetAvailableWatcher_BP(const FECSWorldPtr &inout World)
{
    FCS_AITargetAvailableWatcher __r;
    return __r;
}
UFUNCTION()
bool RemoveAITargetAvailableWatcher(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_AITargetAvailableWatcher);
}
}
void __MonitorAITargetAvailableWatcherLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_AITargetAvailableWatcher, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAITargetAvailableWatcherActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_AITargetAvailableWatcher, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAITargetAvailableWatcherModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_AITargetAvailableWatcher, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_AIKnowledge_AICombatState(const FECSEntity &inout Entity, uint8 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = (int(local_4.opCall().AICombatState) != 0);
    return;
}
void GetEntityBBVar_AIKnowledge_bNeedControlledByLevel(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().bNeedControlledByLevel;
    return;
}
void GetEntityBBVar_AIBehaviorConfig_NonCombatBehavior(const FECSEntity &inout Entity, uint8 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = (int(local_4.opCall().NonCombatBehavior) != 0);
    return;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AICombatStateWithDelay &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AICombatStateWithDelay &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AICombatStateWithDelay &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AICombatStateWithDelay
{
int __IndexOf_DelayToTime()
{
    return 0;
}
}
