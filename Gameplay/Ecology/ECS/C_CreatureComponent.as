
enum EFlockAllocatorType
{
    SimpleFlock,
    PerCreature,
}

enum ENoResourcePivotLocationPolicy
{
    LastActivityPivotOrBornLocation,
    ForceBornLocation,
    FlockLocation,
}

enum EFlockNoResourceUpdatePolicy
{
    DoNotUpdate,
    UseLeaderPos,
}

enum EFlockBehaviorState
{
    Idle,
    Activity,
    ChangeArea,
    Reaction,
    NoResource,
}

enum EBossBattleForAreaState
{
    None,
    Marked,
    Prepare,
    InBattle,
    FinishChangeArea,
    FinishStay,
}

namespace __INTENRAL_FC_EcologyFlockComponent_NS
{
    const TECSComponentDerivedPtr<FC_EcologyFlockComponent> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyFlockComponent>();
    const FC_EcologyFlockComponent DefaultValue = FC_EcologyFlockComponent();
}
namespace __INTENRAL_FC_EcologyFlockBossBattleForAreaComponent_NS
{
    const TECSComponentDerivedPtr<FC_EcologyFlockBossBattleForAreaComponent> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyFlockBossBattleForAreaComponent>();
    const FC_EcologyFlockBossBattleForAreaComponent DefaultValue = FC_EcologyFlockBossBattleForAreaComponent();
}
namespace __INTENRAL_FC_EcologyFlockBehaviorComponent_NS
{
    const TECSComponentDerivedPtr<FC_EcologyFlockBehaviorComponent> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyFlockBehaviorComponent>();
    const FC_EcologyFlockBehaviorComponent DefaultValue = FC_EcologyFlockBehaviorComponent();
}
namespace __INTENRAL_FC_EcologyFlockChildSpawnComponent_NS
{
    const TECSComponentDerivedPtr<FC_EcologyFlockChildSpawnComponent> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyFlockChildSpawnComponent>();
    const FC_EcologyFlockChildSpawnComponent DefaultValue = FC_EcologyFlockChildSpawnComponent();
}
namespace __INTENRAL_FC_CreatureEcologyState_NS
{
    const TECSComponentDerivedPtr<FC_CreatureEcologyState> DerivedPtr = TECSComponentDerivedPtr<FC_CreatureEcologyState>();
    const FC_CreatureEcologyState DefaultValue = FC_CreatureEcologyState();
}
namespace __INTENRAL_FC_FlockMember_NS
{
    const TECSComponentDerivedPtr<FC_FlockMember> DerivedPtr = TECSComponentDerivedPtr<FC_FlockMember>();
    const FC_FlockMember DefaultValue = FC_FlockMember();
}
namespace __INTENRAL_FC_CreatureMeta_NS
{
    const TECSComponentDerivedPtr<FC_CreatureMeta> DerivedPtr = TECSComponentDerivedPtr<FC_CreatureMeta>();
    const FC_CreatureMeta DefaultValue = FC_CreatureMeta();
}
namespace __INTENRAL_FCE_SpawnerNotify_NS
{
    const TECSEventDerivedPtr<FCE_SpawnerNotify> DerivedPtr = TECSEventDerivedPtr<FCE_SpawnerNotify>();

}
struct FRuntimeSpawnerReference
{
    UPROPERTY()
    FECSEntityId SpawnerEntity;
    UPROPERTY()
    int SubIndex;


}

struct FRuntimeSlotData
{
    UPROPERTY()
    FECSEntityId TargetResourceId;
    UPROPERTY()
    int SlotIndex;
    UPROPERTY()
    bool bRandomPosition;
    UPROPERTY()
    bool bHasSlotConfig;
    UPROPERTY()
    bool bWaitDelayReallocated = false;
    UPROPERTY()
    TDataObjectPtr<FEcologyActivityDefinitionRow> BehaviorRef;
    UPROPERTY()
    FVector TargetPosition;
    UPROPERTY()
    FVector TargetLookAt;


    bool WaitReallocated() const
    {
        return this.bWaitDelayReallocated;
    }
    bool HasSlotConfig() const
    {
        return this.bHasSlotConfig;
    }
    TObjectPtr<UEcologyBehaviorDefine> GetBehaviorDefine() const
    {
        TObjectPtr<UEcologyBehaviorDefine> __return;
        if (this.BehaviorRef)
        {
        }
        else
        {
            __return = TObjectPtr<UEcologyBehaviorDefine>(nullptr);
        }
        return __return;
    }
}

struct FCreatureActivityData
{
    UPROPERTY()
    FRuntimeSlotData RuntimeSlotData;
    UPROPERTY()
    TDataObjectPtr<FEcologyActivityDefinitionRow> ActivityRowData;
    UPROPERTY()
    TObjectPtr<UEcologyBehaviorDefine> BehaviorDefine;
    UPROPERTY()
    FFPTime StartTime;
    UPROPERTY()
    int GenBehaviorCount = 0;
    UPROPERTY()
    bool bForceResetBehavior = false;
    UPROPERTY()
    bool bNeedReAllocate = false;
    UPROPERTY()
    bool bNeedDoDefaultBehavior = false;
    UPROPERTY()
    TArray<TDataObjectPtr<FEcologyActivityDefinitionRow>> PreferActivityList;
    UPROPERTY()
    FVector BornLocation;
    UPROPERTY()
    bool bHasLastActivityPivot = false;
    UPROPERTY()
    FVector LastActivityPivot;
    UPROPERTY()
    bool bHasInitOverResourceActivityArray = false;
    UPROPERTY()
    TArray<TDataObjectPtr<FEcologyActivityDefinitionRow>> OverResourceActivityArray;


    bool IsValid() const
    {
        return (!((this.TargetResourceId == ENTITY_ID_NULL)));
    }
    bool IsWaitReallocate() const
    {
        return this.WaitReallocated();
    }
    void SetActivity(const TDataObjectPtr<FEcologyActivityDefinitionRow> &inout InActivityRowData)
    {
        this.ActivityRowData = InActivityRowData;
        TObjectPtr<UEcologyBehaviorDefine> local_30;
        if (this.ActivityRowData)
        {
        }
        else
        {
            local_30 = TObjectPtr<UEcologyBehaviorDefine>();
        }
        this.BehaviorDefine = local_30;
        return;
    }
}

struct FResourceSlotAllocator
{
    UPROPERTY()
    FECSEntityId TargetResource;
    UPROPERTY()
    int BaseSlotOffset;
    UPROPERTY()
    TMap<FECSEntityId, FRuntimeSlotData> SlotAllocMap;
    UPROPERTY()
    FFPTime LastAllocateTime;
    UPROPERTY()
    EFlockAllocatorType AllocatorType = EFlockAllocatorType(0);
    UPROPERTY()
    bool bLazyAllocate = true;


}

struct FFlockChangeAreaData
{
    UPROPERTY()
    FECSEntityId TargetAreaResource;
    UPROPERTY()
    FVector TargetPosition;
    UPROPERTY()
    FGameplayTag LastReason;
    UPROPERTY()
    FGameplayTag LastSource;
    UPROPERTY()
    float32 ArrivalDistance = 100.0f;
    UPROPERTY()
    bool bNeedChangeAreaMessage;
    UPROPERTY()
    bool bNeedPathConnectedCheckBeforeChangeArea;
    UPROPERTY()
    FChangeAreaMessageInfo MessageInfo;
    UPROPERTY()
    bool bForceUpdateTargetResource;
    UPROPERTY()
    TArray<AECSRegionVolume> CandidateCombatVolumes;


}

struct FFlockNoResourceActivityData
{
    UPROPERTY()
    ENoResourcePivotLocationPolicy PivotPolicy;
    UPROPERTY()
    bool bAllowNoResourceWanderMove;
    UPROPERTY()
    bool bAllowAutoSearchResource;
    UPROPERTY()
    EFlockNoResourceUpdatePolicy FlockUpdatePolicy = EFlockNoResourceUpdatePolicy(0);


}

struct FC_EcologyFlockComponent : FECSComponent
{
    UPROPERTY()
    TArray<FECSEntityId> CreatureEntities;
    UPROPERTY()
    FEcologyFlockActivityTarget ActivityTarget;
    UPROPERTY()
    FEcologyFlockActivityTarget LastActivityTarget;
    UPROPERTY()
    TDataObjectPtr<FEcologyCreatureDefinitionRow> FlockMainCreature;
    UPROPERTY()
    FRuntimeSpawnerReference SpawnerDataRef;
    UPROPERTY()
    FECSEntityId LeaderEntity;
    UPROPERTY()
    bool bLimitedByActivityVolume = false;
    UPROPERTY()
    TArray<TSoftObjectPtr<AECSRegionVolume>> ActivityVolumes;


    FECSEntityId GetMainTargetResource() const
    {
        return this.ActivityTarget.MainTargetResource;
    }
}

struct FEcologyBossBattleInstanceContext
{
    UPROPERTY()
    FFPTime InBattleStartTime;
    UPROPERTY()
    float32 EndTimeLimit = 45.0f;
    UPROPERTY()
    FECSEntity AttackerBoss;
    UPROPERTY()
    FECSEntity AttackerFlock;
    UPROPERTY()
    FECSEntity DefenderBoss;
    UPROPERTY()
    FECSEntity DefenderFlock;
    UPROPERTY()
    float32 AttackerStartHpPercent;
    UPROPERTY()
    float32 AttackerHPLimit = 0.15f;
    UPROPERTY()
    float32 DefenderStartHpPercent;
    UPROPERTY()
    float32 DefenderHPLimit = 0.15f;
    UPROPERTY()
    FECSEntity BattleTargetFlock;


    void Reset()
    {
        this.EndTimeLimit = 45.0f;
        this.AttackerBoss = ENTITY_NULL;
        this.DefenderBoss = ENTITY_NULL;
        this.AttackerFlock = ENTITY_NULL;
        this.DefenderFlock = ENTITY_NULL;
        this.AttackerStartHpPercent = 0.0f;
        this.AttackerHPLimit = 0.15f;
        this.DefenderStartHpPercent = 0.0f;
        this.DefenderHPLimit = 0.15f;
        this.BattleTargetFlock = ENTITY_NULL;
        return;
    }
}

struct FC_EcologyFlockBossBattleForAreaComponent : FECSComponent
{
    UPROPERTY()
    EBossBattleForAreaState BattleForAreaState = EBossBattleForAreaState(0);
    UPROPERTY()
    FFPTime EnterStateTime;
    UPROPERTY()
    FEcologyBossBattleForAreaInfo BossBattleForAreaInfo;
    UPROPERTY()
    FEcologyBossBattleInstanceContext InstanceContext;
    UPROPERTY()
    float32 FinishEndDistance = 12000.0f;
    UPROPERTY()
    int BattleChangeAreaPriority = 80;


}

struct FEcologyBehaviorSubTask
{
    UPROPERTY()
    FFPTime LastUpdateTime;
    UPROPERTY()
    bool bUpdatePosition = false;
    UPROPERTY()
    bool bUpdateChangeAreaProgress = false;
    UPROPERTY()
    bool bNeedCheckCombatStateForEmergence = false;
    UPROPERTY()
    float32 EmergencyHandleTimer = 0.0f;
    UPROPERTY()
    FFPTime EmergencyHandleLastUpdateTime;
    UPROPERTY()
    TArray<FEcologyTaskInstance> SubTaskInstances;


    void RemoveAllSubTaskInstances()
    {
        this.SubTaskInstances.Empty(0);
        return;
    }
    void Reset()
    {
        this.bUpdatePosition = false;
        this.bUpdateChangeAreaProgress = false;
        this.bNeedCheckCombatStateForEmergence = false;
        this.EmergencyHandleTimer = 0.0f;
        return;
    }
    void ResetEmergency()
    {
        this.bNeedCheckCombatStateForEmergence = false;
        this.EmergencyHandleTimer = 0.0f;
        return;
    }
}

struct FFlockChangeAreaTaskInstance
{
    UPROPERTY()
    TObjectPtr<UCommonChangeAreaTriggerDefinitionAsset> Definition;
    UPROPERTY()
    int SuccessCount;
    UPROPERTY()
    FFPTime LastTriggerTime;

    FFlockChangeAreaTaskInstance()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    bool IsValid() const
    {
        UCommonChangeAreaTriggerDefinitionAsset local_2;
        UResourceRequestFilterConfigAsset local_8;
        if ((!((local_2 != nullptr))))
        {
            return false;
        }
        if ((!((local_8 != nullptr))))
        {
            UCommonChangeAreaTriggerDefinitionAsset local_6;
            XLog(ELog(30), FString().Append("FFlockChangeAreaTaskInstance::IsValid - ChangeAreaRequestFilter is null. ").Append(local_6.ChangeAreaRequestFilter.ToString()));
            return false;
        }
        return true;
    }
}

struct FC_EcologyFlockBehaviorComponent : FECSComponent
{
    UPROPERTY()
    EFlockBehaviorState MainState = EFlockBehaviorState(0);
    UPROPERTY()
    FFPTime EnterMainStateTime;
    UPROPERTY()
    FGameplayTagContainer SubState;
    UPROPERTY()
    FEcologyBehaviorSubTask BehaviorSubTask;
    UPROPERTY()
    bool bIsInEmergency = false;
    UPROPERTY()
    FResourceSlotAllocator SlotAllocator;
    UPROPERTY()
    FFlockChangeAreaData ChangeAreaData;
    UPROPERTY()
    FFlockNoResourceActivityData NoResourceData;
    UPROPERTY()
    TArray<FFlockChangeAreaRequest> ChangeAreaRequest;
    UPROPERTY()
    TArray<FFlockChangeAreaTaskInstance> ChangeAreaTriggers;
    UPROPERTY()
    TArray<FECSEntityId> VisitedCombatRegion;


}

struct FC_EcologyFlockChildSpawnComponent : FECSComponent
{
    UPROPERTY()
    int DefaultSpawnNum;
    UPROPERTY()
    bool bAcceptSpawnRatio = true;
    UPROPERTY()
    FCreatureConfigProxy CreatureDefinition;


}

struct FChangeAreaTaskConditionContext
{
    UPROPERTY()
    FECSEntity Entity;
    UPROPERTY()
    float32 HPPercent = 2.0f;
    UPROPERTY()
    float32 BattleTime = 0.0f;
    UPROPERTY()
    float32 ActivityTime = 0.0f;
    UPROPERTY()
    float32 HPLostInCombat = 0.0f;


    void Setup(const FECSEntity &inout OuterEntity, const FCS_FixedTime &inout FixedTime, const FC_EcologyFlockBehaviorComponent &inout BehaviorComponent, const FC_EcologyFlockComponent &inout FlockComponent)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FCommonChangeAreaCondition
{
    UPROPERTY()
    FString Description;
    UPROPERTY()
    bool bCheckCombatState;
    UPROPERTY()
    bool bExpectCombatState;
    UPROPERTY()
    bool bCheckHPPercent;
    UPROPERTY()
    FVector2D HPPercent;
    UPROPERTY()
    bool bCheckBattleTime;
    UPROPERTY()
    float32 CheckBattleTimeMoreThan;
    UPROPERTY()
    bool bCheckActivityTime;
    UPROPERTY()
    float32 ActivityTimeMoreThan;
    UPROPERTY()
    bool bCheckHPLostInCombat;
    UPROPERTY()
    float32 HPLostInCombatMoreThan;


    bool IsTrue(const FChangeAreaTaskConditionContext &inout Context) const
    {
        bool local_1;
        if (this.bCheckHPPercent)
        {
            if (Context.HPPercent < this.HPPercent.X || (Context.HPPercent > this.HPPercent.Y))
            {
                return false;
            }
        }
        if (this.bCheckBattleTime)
        {
            if (Context.BattleTime <= this.CheckBattleTimeMoreThan)
            {
                return false;
            }
        }
        if (this.bCheckActivityTime)
        {
            if (Context.ActivityTime <= this.ActivityTimeMoreThan)
            {
                return false;
            }
        }
        if (this.bCheckCombatState)
        {
            local_1 = (Context.BattleTime > 0.0f);
            bool local_7 = !(this.bExpectCombatState);
            if (!(local_1) != local_7)
            {
                return false;
            }
        }
        if (this.bCheckHPLostInCombat)
        {
            if (Context.HPLostInCombat <= this.HPLostInCombatMoreThan)
            {
                return false;
            }
        }
        return true;
    }
}

struct FC_CreatureEcologyState : FECSComponent
{
    UPROPERTY()
    TDataObjectPtr<FEcologyCreatureDefinitionRow> Creature;
    UPROPERTY()
    TSet<FString> CreatureAdditionalStates;
    UPROPERTY()
    bool bFlyingMovement;
    UPROPERTY()
    FVector BornPos;
    UPROPERTY()
    bool bCanNaviWalk;
    UPROPERTY()
    bool bCanFly;
    UPROPERTY()
    float32 OverSlotWanderInnerRadius;
    UPROPERTY()
    float32 OverSlotWanderOuterRadius;
    UPROPERTY()
    ECreatureMoveStance ForceMoveStanceWithoutEmergency = ECreatureMoveStance(2);
    UPROPERTY()
    float32 RunMoveStanceDistanceWithoutEmergency = 2000.0f;
    UPROPERTY()
    ECreatureMoveStance ForceMoveStanceEmergency = ECreatureMoveStance(1);
    UPROPERTY()
    float32 RunMoveStanceDistanceWithEmergency = 2000.0f;
    UPROPERTY()
    FECSEntityId FlockProxyEntity;
    UPROPERTY()
    float32 RunMoveStanceByTargetDistance = -1.0f;
    UPROPERTY()
    FVector LevelTargetAirLocation;
    UPROPERTY()
    bool bNeedAirMoveToLevelTargetAirLocation;
    UPROPERTY()
    FCreatureActivityData ActivityData;
    UPROPERTY()
    bool bForceUpdateTargetResource = false;
    UPROPERTY()
    bool ForceMuteCombatInChangeArea = false;


}

struct FC_FlockMember : FECSComponent
{
    UPROPERTY()
    FECSEntityId FlockProxyEntity;
    UPROPERTY()
    bool bIsLeader = false;


}

struct FC_CreatureMeta : FECSComponent
{
    UPROPERTY()
    TDataObjectPtr<FEcologyCreatureDefinitionRow> CreatureType;
    UPROPERTY()
    FECSEntityId SpawnerConfigRef;
    UPROPERTY()
    FECSEntityId RuntimeSpawnerEntity;
    UPROPERTY()
    bool bLazyLoad = false;
    UPROPERTY()
    TSubclassOf<AECSPrefab> ViewPrefab;
    UPROPERTY()
    FCreatureConfigProxy CreatureConfigProxy;
    UPROPERTY()
    int Level = 0;
    UPROPERTY()
    UDataTable DifficultyLevelConfig = nullptr;


}

struct FCE_SpawnerNotify : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntityId SpawnerId;

    FCE_SpawnerNotify()
    {
        return;
    }
}

namespace ECSFunc_FC_EcologyFlockComponent
{
UFUNCTION()
bool HasEcologyFlockComponent(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyFlockComponent);
}
FC_EcologyFlockComponent& AssignEcologyFlockComponent(const FECSEntity &inout Entity, const FC_EcologyFlockComponent &inout DefaultValue = FC_EcologyFlockComponent())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyFlockComponent, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyFlockComponent_BP(const FECSEntity &inout Entity, const FC_EcologyFlockComponent &inout DefaultValue = FC_EcologyFlockComponent())
{
    ECSFunc_FC_EcologyFlockComponent::AssignEcologyFlockComponent(Entity, DefaultValue);
    return;
}
FC_EcologyFlockComponent& ModifyEcologyFlockComponent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyFlockComponent));
    return local_12.GetComp();
}
FC_EcologyFlockComponent& ModifyOrAddEcologyFlockComponent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyFlockComponent));
    return local_12.GetComp();
}
const FC_EcologyFlockComponent& GetEcologyFlockComponent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyFlockComponent));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyFlockComponent GetEcologyFlockComponent_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcologyFlockComponent __r;
    bValid = false;
    bValid = ECSFunc_FC_EcologyFlockComponent::GetEcologyFlockComponent(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcologyFlockComponent GetDefaultedEcologyFlockComponent(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyFlockComponent __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyFlockComponent);
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
FC_EcologyFlockComponent GetDefaultedEcologyFlockComponent_BP(const FECSEntity &inout Entity)
{
    FC_EcologyFlockComponent __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyFlockComponent(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyFlockComponent);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyFlockComponentOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyFlockComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyFlockComponentOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyFlockComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyFlockComponentOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyFlockComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyFlockComponentOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyFlockComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyFlockComponentOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyFlockComponent, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyFlockComponentLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyFlockComponent, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyFlockComponentActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyFlockComponent, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyFlockComponentModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyFlockComponent, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcologyFlockBossBattleForAreaComponent
{
UFUNCTION()
bool HasEcologyFlockBossBattleForAreaComponent(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyFlockBossBattleForAreaComponent);
}
FC_EcologyFlockBossBattleForAreaComponent& AssignEcologyFlockBossBattleForAreaComponent(const FECSEntity &inout Entity, const FC_EcologyFlockBossBattleForAreaComponent &inout DefaultValue = FC_EcologyFlockBossBattleForAreaComponent())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyFlockBossBattleForAreaComponent, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyFlockBossBattleForAreaComponent_BP(const FECSEntity &inout Entity, const FC_EcologyFlockBossBattleForAreaComponent &inout DefaultValue = FC_EcologyFlockBossBattleForAreaComponent())
{
    ECSFunc_FC_EcologyFlockBossBattleForAreaComponent::AssignEcologyFlockBossBattleForAreaComponent(Entity, DefaultValue);
    return;
}
FC_EcologyFlockBossBattleForAreaComponent& ModifyEcologyFlockBossBattleForAreaComponent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyFlockBossBattleForAreaComponent));
    return local_12.GetComp();
}
FC_EcologyFlockBossBattleForAreaComponent& ModifyOrAddEcologyFlockBossBattleForAreaComponent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyFlockBossBattleForAreaComponent));
    return local_12.GetComp();
}
const FC_EcologyFlockBossBattleForAreaComponent& GetEcologyFlockBossBattleForAreaComponent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyFlockBossBattleForAreaComponent));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyFlockBossBattleForAreaComponent GetEcologyFlockBossBattleForAreaComponent_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcologyFlockBossBattleForAreaComponent __r;
    bValid = false;
    bValid = ECSFunc_FC_EcologyFlockBossBattleForAreaComponent::GetEcologyFlockBossBattleForAreaComponent(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcologyFlockBossBattleForAreaComponent GetDefaultedEcologyFlockBossBattleForAreaComponent(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyFlockBossBattleForAreaComponent __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyFlockBossBattleForAreaComponent);
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
FC_EcologyFlockBossBattleForAreaComponent GetDefaultedEcologyFlockBossBattleForAreaComponent_BP(const FECSEntity &inout Entity)
{
    FC_EcologyFlockBossBattleForAreaComponent __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyFlockBossBattleForAreaComponent(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyFlockBossBattleForAreaComponent);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyFlockBossBattleForAreaComponentOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyFlockBossBattleForAreaComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyFlockBossBattleForAreaComponentOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyFlockBossBattleForAreaComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyFlockBossBattleForAreaComponentOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyFlockBossBattleForAreaComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyFlockBossBattleForAreaComponentOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyFlockBossBattleForAreaComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyFlockBossBattleForAreaComponentOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyFlockBossBattleForAreaComponent, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyFlockBossBattleForAreaComponentLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyFlockBossBattleForAreaComponent, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyFlockBossBattleForAreaComponentActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyFlockBossBattleForAreaComponent, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyFlockBossBattleForAreaComponentModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyFlockBossBattleForAreaComponent, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcologyFlockBehaviorComponent
{
UFUNCTION()
bool HasEcologyFlockBehaviorComponent(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyFlockBehaviorComponent);
}
FC_EcologyFlockBehaviorComponent& AssignEcologyFlockBehaviorComponent(const FECSEntity &inout Entity, const FC_EcologyFlockBehaviorComponent &inout DefaultValue = FC_EcologyFlockBehaviorComponent())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyFlockBehaviorComponent, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyFlockBehaviorComponent_BP(const FECSEntity &inout Entity, const FC_EcologyFlockBehaviorComponent &inout DefaultValue = FC_EcologyFlockBehaviorComponent())
{
    ECSFunc_FC_EcologyFlockBehaviorComponent::AssignEcologyFlockBehaviorComponent(Entity, DefaultValue);
    return;
}
FC_EcologyFlockBehaviorComponent& ModifyEcologyFlockBehaviorComponent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyFlockBehaviorComponent));
    return local_12.GetComp();
}
FC_EcologyFlockBehaviorComponent& ModifyOrAddEcologyFlockBehaviorComponent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyFlockBehaviorComponent));
    return local_12.GetComp();
}
const FC_EcologyFlockBehaviorComponent& GetEcologyFlockBehaviorComponent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyFlockBehaviorComponent));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyFlockBehaviorComponent GetEcologyFlockBehaviorComponent_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcologyFlockBehaviorComponent __r;
    bValid = false;
    bValid = ECSFunc_FC_EcologyFlockBehaviorComponent::GetEcologyFlockBehaviorComponent(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcologyFlockBehaviorComponent GetDefaultedEcologyFlockBehaviorComponent(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyFlockBehaviorComponent __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyFlockBehaviorComponent);
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
FC_EcologyFlockBehaviorComponent GetDefaultedEcologyFlockBehaviorComponent_BP(const FECSEntity &inout Entity)
{
    FC_EcologyFlockBehaviorComponent __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyFlockBehaviorComponent(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyFlockBehaviorComponent);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyFlockBehaviorComponentOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyFlockBehaviorComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyFlockBehaviorComponentOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyFlockBehaviorComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyFlockBehaviorComponentOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyFlockBehaviorComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyFlockBehaviorComponentOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyFlockBehaviorComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyFlockBehaviorComponentOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyFlockBehaviorComponent, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyFlockBehaviorComponentLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyFlockBehaviorComponent, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyFlockBehaviorComponentActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyFlockBehaviorComponent, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyFlockBehaviorComponentModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyFlockBehaviorComponent, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcologyFlockChildSpawnComponent
{
UFUNCTION()
bool HasEcologyFlockChildSpawnComponent(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyFlockChildSpawnComponent);
}
FC_EcologyFlockChildSpawnComponent& AssignEcologyFlockChildSpawnComponent(const FECSEntity &inout Entity, const FC_EcologyFlockChildSpawnComponent &inout DefaultValue = FC_EcologyFlockChildSpawnComponent())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyFlockChildSpawnComponent, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyFlockChildSpawnComponent_BP(const FECSEntity &inout Entity, const FC_EcologyFlockChildSpawnComponent &inout DefaultValue = FC_EcologyFlockChildSpawnComponent())
{
    ECSFunc_FC_EcologyFlockChildSpawnComponent::AssignEcologyFlockChildSpawnComponent(Entity, DefaultValue);
    return;
}
FC_EcologyFlockChildSpawnComponent& ModifyEcologyFlockChildSpawnComponent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyFlockChildSpawnComponent));
    return local_12.GetComp();
}
FC_EcologyFlockChildSpawnComponent& ModifyOrAddEcologyFlockChildSpawnComponent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyFlockChildSpawnComponent));
    return local_12.GetComp();
}
const FC_EcologyFlockChildSpawnComponent& GetEcologyFlockChildSpawnComponent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyFlockChildSpawnComponent));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyFlockChildSpawnComponent GetEcologyFlockChildSpawnComponent_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcologyFlockChildSpawnComponent __r;
    bValid = false;
    bValid = ECSFunc_FC_EcologyFlockChildSpawnComponent::GetEcologyFlockChildSpawnComponent(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcologyFlockChildSpawnComponent GetDefaultedEcologyFlockChildSpawnComponent(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyFlockChildSpawnComponent __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyFlockChildSpawnComponent);
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
FC_EcologyFlockChildSpawnComponent GetDefaultedEcologyFlockChildSpawnComponent_BP(const FECSEntity &inout Entity)
{
    FC_EcologyFlockChildSpawnComponent __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyFlockChildSpawnComponent(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyFlockChildSpawnComponent);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyFlockChildSpawnComponentOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyFlockChildSpawnComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyFlockChildSpawnComponentOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyFlockChildSpawnComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyFlockChildSpawnComponentOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyFlockChildSpawnComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyFlockChildSpawnComponentOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyFlockChildSpawnComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyFlockChildSpawnComponentOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyFlockChildSpawnComponent, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyFlockChildSpawnComponentLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyFlockChildSpawnComponent, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyFlockChildSpawnComponentActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyFlockChildSpawnComponent, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyFlockChildSpawnComponentModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyFlockChildSpawnComponent, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CreatureEcologyState
{
UFUNCTION()
bool HasCreatureEcologyState(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CreatureEcologyState);
}
FC_CreatureEcologyState& AssignCreatureEcologyState(const FECSEntity &inout Entity, const FC_CreatureEcologyState &inout DefaultValue = FC_CreatureEcologyState())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CreatureEcologyState, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCreatureEcologyState_BP(const FECSEntity &inout Entity, const FC_CreatureEcologyState &inout DefaultValue = FC_CreatureEcologyState())
{
    ECSFunc_FC_CreatureEcologyState::AssignCreatureEcologyState(Entity, DefaultValue);
    return;
}
FC_CreatureEcologyState& ModifyCreatureEcologyState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CreatureEcologyState));
    return local_12.GetComp();
}
FC_CreatureEcologyState& ModifyOrAddCreatureEcologyState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CreatureEcologyState));
    return local_12.GetComp();
}
const FC_CreatureEcologyState& GetCreatureEcologyState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CreatureEcologyState));
    return local_12.GetComp();
}
UFUNCTION()
FC_CreatureEcologyState GetCreatureEcologyState_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CreatureEcologyState __r;
    bValid = false;
    bValid = ECSFunc_FC_CreatureEcologyState::GetCreatureEcologyState(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CreatureEcologyState GetDefaultedCreatureEcologyState(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CreatureEcologyState __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CreatureEcologyState);
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
FC_CreatureEcologyState GetDefaultedCreatureEcologyState_BP(const FECSEntity &inout Entity)
{
    FC_CreatureEcologyState __r;
    return __r;
}
UFUNCTION()
bool RemoveCreatureEcologyState(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CreatureEcologyState);
}
}
FECSMonitorRuntimeView __GetMonitorCreatureEcologyStateOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CreatureEcologyState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCreatureEcologyStateOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CreatureEcologyState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCreatureEcologyStateOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CreatureEcologyState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCreatureEcologyStateOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CreatureEcologyState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCreatureEcologyStateOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CreatureEcologyState, bFixedFrame, bMustHandleAll);
}
void __MonitorCreatureEcologyStateLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CreatureEcologyState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCreatureEcologyStateActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CreatureEcologyState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCreatureEcologyStateModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CreatureEcologyState, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_FlockMember
{
UFUNCTION()
bool HasFlockMember(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_FlockMember);
}
FC_FlockMember& AssignFlockMember(const FECSEntity &inout Entity, const FC_FlockMember &inout DefaultValue = FC_FlockMember())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_FlockMember, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignFlockMember_BP(const FECSEntity &inout Entity, const FC_FlockMember &inout DefaultValue = FC_FlockMember())
{
    ECSFunc_FC_FlockMember::AssignFlockMember(Entity, DefaultValue);
    return;
}
FC_FlockMember& ModifyFlockMember(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_FlockMember));
    return local_12.GetComp();
}
FC_FlockMember& ModifyOrAddFlockMember(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_FlockMember));
    return local_12.GetComp();
}
const FC_FlockMember& GetFlockMember(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_FlockMember));
    return local_12.GetComp();
}
UFUNCTION()
FC_FlockMember GetFlockMember_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_FlockMember __r;
    bValid = false;
    bValid = ECSFunc_FC_FlockMember::GetFlockMember(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_FlockMember GetDefaultedFlockMember(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_FlockMember __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_FlockMember);
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
FC_FlockMember GetDefaultedFlockMember_BP(const FECSEntity &inout Entity)
{
    FC_FlockMember __r;
    return __r;
}
UFUNCTION()
bool RemoveFlockMember(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_FlockMember);
}
}
FECSMonitorRuntimeView __GetMonitorFlockMemberOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_FlockMember, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFlockMemberOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_FlockMember, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFlockMemberOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_FlockMember, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFlockMemberOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_FlockMember, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFlockMemberOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_FlockMember, bFixedFrame, bMustHandleAll);
}
void __MonitorFlockMemberLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_FlockMember, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFlockMemberActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_FlockMember, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFlockMemberModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_FlockMember, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CreatureMeta
{
UFUNCTION()
bool HasCreatureMeta(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CreatureMeta);
}
FC_CreatureMeta& AssignCreatureMeta(const FECSEntity &inout Entity, const FC_CreatureMeta &inout DefaultValue = FC_CreatureMeta())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CreatureMeta, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCreatureMeta_BP(const FECSEntity &inout Entity, const FC_CreatureMeta &inout DefaultValue = FC_CreatureMeta())
{
    ECSFunc_FC_CreatureMeta::AssignCreatureMeta(Entity, DefaultValue);
    return;
}
FC_CreatureMeta& ModifyCreatureMeta(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CreatureMeta));
    return local_12.GetComp();
}
FC_CreatureMeta& ModifyOrAddCreatureMeta(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CreatureMeta));
    return local_12.GetComp();
}
const FC_CreatureMeta& GetCreatureMeta(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CreatureMeta));
    return local_12.GetComp();
}
UFUNCTION()
FC_CreatureMeta GetCreatureMeta_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CreatureMeta __r;
    bValid = false;
    bValid = ECSFunc_FC_CreatureMeta::GetCreatureMeta(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CreatureMeta GetDefaultedCreatureMeta(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CreatureMeta __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CreatureMeta);
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
FC_CreatureMeta GetDefaultedCreatureMeta_BP(const FECSEntity &inout Entity)
{
    FC_CreatureMeta __r;
    return __r;
}
UFUNCTION()
bool RemoveCreatureMeta(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CreatureMeta);
}
}
FECSMonitorRuntimeView __GetMonitorCreatureMetaOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CreatureMeta, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCreatureMetaOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CreatureMeta, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCreatureMetaOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CreatureMeta, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCreatureMetaOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CreatureMeta, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCreatureMetaOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CreatureMeta, bFixedFrame, bMustHandleAll);
}
void __MonitorCreatureMetaLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CreatureMeta, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCreatureMetaActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CreatureMeta, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCreatureMetaModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CreatureMeta, bFixedFrame, Details);
    return;
}
