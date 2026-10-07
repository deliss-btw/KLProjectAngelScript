
enum EBossChangeAreaEventType
{
    FlockDecision,
    BossMove,
    FlockOver,
}

namespace __INTENRAL_FCS_BossChangeAreaDebugger_NS
{
    const TECSComponentDerivedPtr<FCS_BossChangeAreaDebugger> DerivedPtr = TECSComponentDerivedPtr<FCS_BossChangeAreaDebugger>();
    const FCS_BossChangeAreaDebugger DefaultValue = FCS_BossChangeAreaDebugger();

}
struct FCombatAreaResourceEntry
{
    UPROPERTY()
    FECSEntityId ResourceId;
    UPROPERTY()
    TDataObjectPtr<FEcologyResourceDefinitionRow> ResourceType;
    UPROPERTY()
    FECSEntityId OccupantFlockId;
    UPROPERTY()
    FECSEntityId OccupantLeaderId;
    UPROPERTY()
    FName OccupantMainCreatureName;
    UPROPERTY()
    bool bAvailableCreatureIsBoss = false;
    UPROPERTY()
    FName LevelGroupName;


}

struct FCombatAreaRecord
{
    UPROPERTY()
    FECSEntityId RegionEntityId;
    UPROPERTY()
    FName RegionActorName;
    UPROPERTY()
    FName RegionName;
    UPROPERTY()
    FBox Bounds;
    UPROPERTY()
    FVector Center;
    UPROPERTY()
    TMap<FECSEntityId, FCombatAreaResourceEntry> Resources;

    FCombatAreaRecord()
    {
        return;
    }
}

struct FBossChangeAreaEvent
{
    UPROPERTY()
    EBossChangeAreaEventType EventType = EBossChangeAreaEventType(0);
    UPROPERTY()
    FFPTime Time;
    UPROPERTY()
    int Frame = 0;
    UPROPERTY()
    FGameplayTag ReasonTag;
    UPROPERTY()
    FGameplayTag SourceTag;
    UPROPERTY()
    FECSEntityId FromAreaId;
    UPROPERTY()
    FName FromAreaName;
    UPROPERTY()
    FECSEntityId ToAreaId;
    UPROPERTY()
    FName ToAreaName;
    UPROPERTY()
    FECSEntityId TargetResourceId;
    UPROPERTY()
    TArray<FECSEntityId> CandidateAreaIds;
    UPROPERTY()
    FVector StartPos = FVector::ZeroVector;
    UPROPERTY()
    FVector EndPos = FVector::ZeroVector;
    UPROPERTY()
    bool bMoveSucceed = false;
    UPROPERTY()
    TArray<FVector> MovePathPoints;
    UPROPERTY()
    FVector ArrivePos = FVector::ZeroVector;


}

struct FBossChangeAreaRecord
{
    UPROPERTY()
    FECSEntityId FlockEntityId;
    UPROPERTY()
    FECSEntityId LeaderEntityId;
    UPROPERTY()
    FName BossName;
    UPROPERTY()
    FECSEntityId CurrentAreaId;
    UPROPERTY()
    int MaxNum = 128;
    UPROPERTY()
    TArray<FBossChangeAreaEvent> History;


}

struct FBossChangeAreaCandidateList
{
    UPROPERTY()
    TArray<FECSEntityId> AreaIds;

    FBossChangeAreaCandidateList()
    {
        return;
    }
}

struct FCS_BossChangeAreaDebugger : FECSSingleton
{
    UPROPERTY()
    TMap<FECSEntityId, FCombatAreaRecord> CombatAreas;
    UPROPERTY()
    TMap<FECSEntityId, FBossChangeAreaRecord> Bosses;
    UPROPERTY()
    bool bDebugDrawBounds = false;
    UPROPERTY()
    TArray<FECSEntityId> DebugDrawAreaIds;
    UPROPERTY()
    TMap<FECSEntityId, FBossChangeAreaCandidateList> PendingCandidateAreas;
    UPROPERTY()
    TArray<FCombatAreaResourceEntry> NonAreaResources;
    UPROPERTY()
    bool bResourceSnapshotActive = false;
    UPROPERTY()
    bool bResourceCacheBuilt = false;


}

namespace ECSFunc_FCS_BossChangeAreaDebugger
{
UFUNCTION()
bool HasBossChangeAreaDebugger(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_BossChangeAreaDebugger);
}
FCS_BossChangeAreaDebugger& AssignBossChangeAreaDebugger(const FECSWorldPtr &inout World, const FCS_BossChangeAreaDebugger &inout DefaultValue = FCS_BossChangeAreaDebugger())
{
    UScriptStruct local_6 = FCS_BossChangeAreaDebugger;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignBossChangeAreaDebugger_BP(const FECSWorldPtr &inout World, const FCS_BossChangeAreaDebugger &inout DefaultValue = FCS_BossChangeAreaDebugger())
{
    ECSFunc_FCS_BossChangeAreaDebugger::AssignBossChangeAreaDebugger(World, DefaultValue);
    return;
}
FCS_BossChangeAreaDebugger& ModifyBossChangeAreaDebugger(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_BossChangeAreaDebugger;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_BossChangeAreaDebugger& ModifyOrAddBossChangeAreaDebugger(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_BossChangeAreaDebugger;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_BossChangeAreaDebugger& GetBossChangeAreaDebugger(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_BossChangeAreaDebugger;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_BossChangeAreaDebugger GetBossChangeAreaDebugger_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_BossChangeAreaDebugger __r;
    bValid = false;
    bValid = ECSFunc_FCS_BossChangeAreaDebugger::GetBossChangeAreaDebugger(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_BossChangeAreaDebugger GetDefaultedBossChangeAreaDebugger(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_BossChangeAreaDebugger __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_BossChangeAreaDebugger);
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
FCS_BossChangeAreaDebugger GetDefaultedBossChangeAreaDebugger_BP(const FECSWorldPtr &inout World)
{
    FCS_BossChangeAreaDebugger __r;
    return __r;
}
UFUNCTION()
bool RemoveBossChangeAreaDebugger(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_BossChangeAreaDebugger);
}
}
void __MonitorBossChangeAreaDebuggerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_BossChangeAreaDebugger, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBossChangeAreaDebuggerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_BossChangeAreaDebugger, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBossChangeAreaDebuggerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_BossChangeAreaDebugger, bFixedFrame, Details);
    return;
}
