
namespace __INTENRAL_FCE_RefreshFlockSpawnerSlot_NS
{
    const TECSEventDerivedPtr<FCE_RefreshFlockSpawnerSlot> DerivedPtr = TECSEventDerivedPtr<FCE_RefreshFlockSpawnerSlot>();
}
namespace __INTENRAL_FCE_FlockClaimNewResourceEvent_NS
{
    const TECSEventDerivedPtr<FCE_FlockClaimNewResourceEvent> DerivedPtr = TECSEventDerivedPtr<FCE_FlockClaimNewResourceEvent>();
}
namespace __INTENRAL_FCE_CreatureChangeAreaHintMessage_NS
{
    const TECSEventDerivedPtr<FCE_CreatureChangeAreaHintMessage> DerivedPtr = TECSEventDerivedPtr<FCE_CreatureChangeAreaHintMessage>();
}
namespace __INTENRAL_FCE_CreatureForceUpdateChangeArea_NS
{
    const TECSEventDerivedPtr<FCE_CreatureForceUpdateChangeArea> DerivedPtr = TECSEventDerivedPtr<FCE_CreatureForceUpdateChangeArea>();
}
namespace __INTENRAL_FCE_SetupBossBattleForAreaInstance_NS
{
    const TECSEventDerivedPtr<FCE_SetupBossBattleForAreaInstance> DerivedPtr = TECSEventDerivedPtr<FCE_SetupBossBattleForAreaInstance>();
}
namespace __INTENRAL_FCE_BattleForAreaChangeToInBattleNotify_NS
{
    const TECSEventDerivedPtr<FCE_BattleForAreaChangeToInBattleNotify> DerivedPtr = TECSEventDerivedPtr<FCE_BattleForAreaChangeToInBattleNotify>();
}
namespace __INTENRAL_FCE_NeedReAllocateBehaviorRequest_NS
{
    const TECSEventDerivedPtr<FCE_NeedReAllocateBehaviorRequest> DerivedPtr = TECSEventDerivedPtr<FCE_NeedReAllocateBehaviorRequest>();
}
namespace __INTENRAL_FCE_FlockClaimNewResourceLevelEvent_NS
{
    const TECSEventDerivedPtr<FCE_FlockClaimNewResourceLevelEvent> DerivedPtr = TECSEventDerivedPtr<FCE_FlockClaimNewResourceLevelEvent>();
}
namespace __INTENRAL_FCE_OnFlockStateChangeLevelEvent_NS
{
    const TECSEventDerivedPtr<FCE_OnFlockStateChangeLevelEvent> DerivedPtr = TECSEventDerivedPtr<FCE_OnFlockStateChangeLevelEvent>();
}
namespace __INTENRAL_FCE_FlockLeaderReachedTargetResourceLevelEvent_NS
{
    const TECSEventDerivedPtr<FCE_FlockLeaderReachedTargetResourceLevelEvent> DerivedPtr = TECSEventDerivedPtr<FCE_FlockLeaderReachedTargetResourceLevelEvent>();
}
namespace __INTENRAL_FCE_EcologySpawnerCreateEntityInited_NS
{
    const TECSEventDerivedPtr<FCE_EcologySpawnerCreateEntityInited> DerivedPtr = TECSEventDerivedPtr<FCE_EcologySpawnerCreateEntityInited>();
}
namespace __INTENRAL_FCE_RequestRefreshSpawnerEvent_NS
{
    const TECSEventDerivedPtr<FCE_RequestRefreshSpawnerEvent> DerivedPtr = TECSEventDerivedPtr<FCE_RequestRefreshSpawnerEvent>();
}
namespace __INTENRAL_FCE_BossChangeAreaCandidateReport_NS
{
    const TECSEventDerivedPtr<FCE_BossChangeAreaCandidateReport> DerivedPtr = TECSEventDerivedPtr<FCE_BossChangeAreaCandidateReport>();
}
namespace __INTENRAL_FCE_BossChangeAreaStartReport_NS
{
    const TECSEventDerivedPtr<FCE_BossChangeAreaStartReport> DerivedPtr = TECSEventDerivedPtr<FCE_BossChangeAreaStartReport>();

}
struct FCE_RefreshFlockSpawnerSlot : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity FlockSpanwer;
    UPROPERTY()
    int Slot;


}

struct FCE_FlockClaimNewResourceEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity FlockEntity;
    UPROPERTY()
    FECSEntity TargetResource;

    FCE_FlockClaimNewResourceEvent()
    {
        return;
    }
}

struct FCE_CreatureChangeAreaHintMessage : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TArray<FECSEntity> PlayerEntityList;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> MessageConfig;

    FCE_CreatureChangeAreaHintMessage()
    {
        return;
    }
}

struct FCE_CreatureForceUpdateChangeArea : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity FlockEntity;
    UPROPERTY()
    TArray<FECSEntityId> ChildEntityList;

    FCE_CreatureForceUpdateChangeArea()
    {
        return;
    }
}

struct FCE_SetupBossBattleForAreaInstance : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity AttackerFlock;
    UPROPERTY()
    FECSEntity AttackerCreature;
    UPROPERTY()
    FEcologyBossBattleForAreaInfo AttackerBattleInfo;
    UPROPERTY()
    FECSEntity DefenderFlock;
    UPROPERTY()
    FECSEntity DefenderCreature;
    UPROPERTY()
    FEcologyBossBattleForAreaInfo DefenderBattleInfo;

    FCE_SetupBossBattleForAreaInstance()
    {
        return;
    }
}

struct FCE_BattleForAreaChangeToInBattleNotify : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity AttackerFlock;
    UPROPERTY()
    FECSEntity AttackerBoss;
    UPROPERTY()
    FECSEntity DefenderFlock;
    UPROPERTY()
    FECSEntity DefenderBoss;

    FCE_BattleForAreaChangeToInBattleNotify()
    {
        return;
    }
}

struct FCE_NeedReAllocateBehaviorRequest : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity Entity;
    UPROPERTY()
    FECSEntity FlockEntity;

    FCE_NeedReAllocateBehaviorRequest()
    {
        return;
    }
}

struct FCE_FlockClaimNewResourceLevelEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity LeaderEntity;
    UPROPERTY()
    TDataObjectPtr<FEcologyCreatureDefinitionRow> LeaderCreautreRowData;
    UPROPERTY()
    FECSEntity TargetResource;
    UPROPERTY()
    FVector TargetLocation;

    FCE_FlockClaimNewResourceLevelEvent()
    {
        return;
    }
}

struct FCE_OnFlockStateChangeLevelEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity FlockEntity;
    UPROPERTY()
    FECSEntity LeaderEntity;
    UPROPERTY()
    TDataObjectPtr<FEcologyCreatureDefinitionRow> LeaderCreatureRowData;
    UPROPERTY()
    EFlockBehaviorState NewState;
    UPROPERTY()
    EFlockBehaviorState OldState;


}

struct FCE_FlockLeaderReachedTargetResourceLevelEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity FlockEntity;
    UPROPERTY()
    FECSEntity LeaderEntity;
    UPROPERTY()
    TDataObjectPtr<FEcologyCreatureDefinitionRow> LeaderCreatureRowData;

    FCE_FlockLeaderReachedTargetResourceLevelEvent()
    {
        return;
    }
}

struct FCE_EcologySpawnerCreateEntityInited : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity CreatureEntity;
    UPROPERTY()
    TDataObjectPtr<FEcologyCreatureDefinitionRow> CreatureRowData;
    UPROPERTY()
    FCreatureConfigProxy CreatureConfigProxy;
    UPROPERTY()
    bool bLazyLoad;


}

struct FCE_RequestRefreshSpawnerEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TArray<FECSEntityId> Spawners;

    FCE_RequestRefreshSpawnerEvent()
    {
        return;
    }
}

struct FCE_BossChangeAreaCandidateReport : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_BossChangeAreaCandidateReport()
    {
        return;
    }
}

struct FCE_BossChangeAreaStartReport : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity FlockEntity;
    UPROPERTY()
    FECSEntityId TargetResourceId;

    FCE_BossChangeAreaStartReport()
    {
        return;
    }
}

