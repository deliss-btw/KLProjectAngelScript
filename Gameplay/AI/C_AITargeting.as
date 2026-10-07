
namespace FCS_AITargetingPlayerNoiseSensor
{
    const int CellSize = 256;
    const int SenseUnitRadius = 4;
}
namespace FAIPlayerDistLODSchedule
{
    const float32 AIUPDATE_INTERVAL_LOD0 = 0.25f;
    const float32 AIUPDATE_INTERVAL_LOD1 = 1f;
    const float32 AIUPDATE_INTERVAL_LOD2PLUS = 4f;
    const float32 AIUPDATE_INTERVAL_FAR = 1f;
}
namespace __INTENRAL_FC_AITargeting_NS
{
    const TECSComponentDerivedPtr<FC_AITargeting> DerivedPtr = TECSComponentDerivedPtr<FC_AITargeting>();
    const FC_AITargeting DefaultValue = FC_AITargeting();
}
namespace __INTENRAL_FC_PlayerBeTargeted_NS
{
    const TECSComponentDerivedPtr<FC_PlayerBeTargeted> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerBeTargeted>();
    const FC_PlayerBeTargeted DefaultValue = FC_PlayerBeTargeted();
}
namespace __INTENRAL_FC_AITargetingTaunting_NS
{
    const TECSComponentDerivedPtr<FC_AITargetingTaunting> DerivedPtr = TECSComponentDerivedPtr<FC_AITargetingTaunting>();
    const FC_AITargetingTaunting DefaultValue = FC_AITargetingTaunting();
}
namespace __INTENRAL_FC_AITargetingBeTaunted_NS
{
    const TECSComponentDerivedPtr<FC_AITargetingBeTaunted> DerivedPtr = TECSComponentDerivedPtr<FC_AITargetingBeTaunted>();
    const FC_AITargetingBeTaunted DefaultValue = FC_AITargetingBeTaunted();
}
namespace __INTENRAL_FC_AIForceLockTarget_NS
{
    const TECSComponentDerivedPtr<FC_AIForceLockTarget> DerivedPtr = TECSComponentDerivedPtr<FC_AIForceLockTarget>();
    const FC_AIForceLockTarget DefaultValue = FC_AIForceLockTarget();
}
namespace __INTENRAL_FC_BeTauntedFX_NS
{
    const TECSComponentDerivedPtr<FC_BeTauntedFX> DerivedPtr = TECSComponentDerivedPtr<FC_BeTauntedFX>();
    const FC_BeTauntedFX DefaultValue = FC_BeTauntedFX();
}
namespace __INTENRAL_FC_AITargetingPlayerNoise_NS
{
    const TECSComponentDerivedPtr<FC_AITargetingPlayerNoise> DerivedPtr = TECSComponentDerivedPtr<FC_AITargetingPlayerNoise>();
    const FC_AITargetingPlayerNoise DefaultValue = FC_AITargetingPlayerNoise();
}
namespace __INTENRAL_FCS_AITargetingPlayerNoiseSensor_NS
{
    const TECSComponentDerivedPtr<FCS_AITargetingPlayerNoiseSensor> DerivedPtr = TECSComponentDerivedPtr<FCS_AITargetingPlayerNoiseSensor>();
    const FCS_AITargetingPlayerNoiseSensor DefaultValue = FCS_AITargetingPlayerNoiseSensor();
}
namespace __INTENRAL_FC_AIPlayerDistanceLOD_NS
{
    const TECSComponentDerivedPtr<FC_AIPlayerDistanceLOD> DerivedPtr = TECSComponentDerivedPtr<FC_AIPlayerDistanceLOD>();
    const FC_AIPlayerDistanceLOD DefaultValue = FC_AIPlayerDistanceLOD();
}
namespace __INTENRAL_FCS_AIPlayerDistanceLODManager_NS
{
    const TECSComponentDerivedPtr<FCS_AIPlayerDistanceLODManager> DerivedPtr = TECSComponentDerivedPtr<FCS_AIPlayerDistanceLODManager>();
    const FCS_AIPlayerDistanceLODManager DefaultValue = FCS_AIPlayerDistanceLODManager();
}
namespace __INTENRAL_FCE_ForceClearAITargeting_NS
{
    const TECSEventDerivedPtr<FCE_ForceClearAITargeting> DerivedPtr = TECSEventDerivedPtr<FCE_ForceClearAITargeting>();
}
namespace __INTENRAL_FCE_AIAttackTargetChanged_NS
{
    const TECSEventDerivedPtr<FCE_AIAttackTargetChanged> DerivedPtr = TECSEventDerivedPtr<FCE_AIAttackTargetChanged>();
}
namespace __INTENRAL_FCE_AIPlayerDistLODChanged_NS
{
    const TECSEventDerivedPtr<FCE_AIPlayerDistLODChanged> DerivedPtr = TECSEventDerivedPtr<FCE_AIPlayerDistLODChanged>();

}
struct FTargetSelectingStruct
{
    UPROPERTY()
    FTargetEntity AITargetEntity;
    UPROPERTY()
    float Score;


}

struct FHostilityDamageRecord
{
    UPROPERTY()
    float32 HostilityDamage;
    UPROPERTY()
    FFPTime Time;

    FHostilityDamageRecord()
    {
        return;
    }
    FHostilityDamageRecord(const float32 InHostilityDamage, const FFPTime &inout InTime)
    {
        this.HostilityDamage = InHostilityDamage;
        this.Time = InTime;
        return;
    }
}

struct FTargetHostilityInfo
{
    UPROPERTY()
    float32 Hostility = 0.0f;
    UPROPERTY()
    TArray<FHostilityDamageRecord> Records;
    UPROPERTY()
    FFPTime OutOfRangeStartTime = -1;


}

struct FC_AITargeting : FECSComponent
{
    UPROPERTY()
    TMap<FTargetEntity, FTargetHostilityInfo> TargetsHostilityMap;
    UPROPERTY()
    TArray<FTargetSelectingStruct> TargetsScoringList;
    UPROPERTY()
    FTargetEntity BestScoredAttackTarget;
    UPROPERTY()
    FTargetEntity CurrentAttackTarget;
    UPROPERTY()
    float ScoreSum;
    UPROPERTY()
    FECSEntity ForceLockEntity;
    UPROPERTY()
    FTargetEntity BlackboardLockedTargetEntity;
    UPROPERTY()
    TArray<FTargetSelectingStruct> OrderedTargetList;
    UPROPERTY()
    TArray<int> SelectedMark;
    UPROPERTY()
    FTargetEntity ForceOnlyCombatWithTarget;
    UPROPERTY()
    TSet<FTargetEntity> ForceCombatTargetList;


}

struct FC_PlayerBeTargeted : FECSComponent
{
    UPROPERTY()
    TSet<FTargetEntity> CombatTargets;
    UPROPERTY()
    float32 BeTargetedStress = 0.0f;


}

struct FCE_ForceClearAITargeting : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    bool bClearSelfTargeting = false;
    UPROPERTY()
    FFPTime ForceClearEndTime;


}

struct FCE_AIAttackTargetChanged : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FTargetEntity OldAttackTarget;
    UPROPERTY()
    FTargetEntity NewAttackTarget;

    FCE_AIAttackTargetChanged()
    {
        return;
    }
}

struct FC_AITargetingTaunting : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_TauntNum;
    UPROPERTY()
    FFPTime m_TauntStartTime;
    UPROPERTY()
    FFPTime m_TauntEndTime;

    FC_AITargetingTaunting()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AITargetingTaunting(const FC_AITargetingTaunting &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AITargetingTaunting opAssign(const FC_AITargetingTaunting &inout Other)
    {
        FC_AITargetingTaunting __r;
        this.SetTauntNum(Other.GetTauntNum());
        this.SetTauntStartTime(Other.GetTauntStartTime());
        this.SetTauntEndTime(Other.GetTauntEndTime());
        return __r;
    }
    int GetTauntNum() const property
    {
        return this.m_TauntNum;
    }
    void SetTauntNum(const int __Value) property
    {
        if (this.m_TauntNum == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TauntNum = __Value;
        return;
    }
    const FFPTime GetTauntStartTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_TauntStartTime() property
    {
        FFPTime __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetTauntStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_TauntStartTime = __Value;
        return;
    }
    const FFPTime GetTauntEndTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_TauntEndTime() property
    {
        FFPTime __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetTauntEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_TauntEndTime = __Value;
        return;
    }
}

struct FC_AITargetingBeTaunted : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_FromEntity;
    UPROPERTY()
    FFPTime m_TauntStartTime;
    UPROPERTY()
    FFPTime m_TauntEndTime;
    UPROPERTY()
    bool m_bShowArrow;

    FC_AITargetingBeTaunted()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AITargetingBeTaunted(const FC_AITargetingBeTaunted &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AITargetingBeTaunted opAssign(const FC_AITargetingBeTaunted &inout Other)
    {
        FC_AITargetingBeTaunted __r;
        this.SetFromEntity(Other.GetFromEntity());
        this.SetTauntStartTime(Other.GetTauntStartTime());
        this.SetTauntEndTime(Other.GetTauntEndTime());
        this.SetbShowArrow(Other.GetbShowArrow());
        return __r;
    }
    const FECSEntity GetFromEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_FromEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetFromEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_FromEntity = __Value;
        return;
    }
    const FFPTime GetTauntStartTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_TauntStartTime() property
    {
        FFPTime __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetTauntStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_TauntStartTime = __Value;
        return;
    }
    const FFPTime GetTauntEndTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_TauntEndTime() property
    {
        FFPTime __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetTauntEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_TauntEndTime = __Value;
        return;
    }
    bool GetbShowArrow() const property
    {
        return this.m_bShowArrow;
    }
    void SetbShowArrow(const bool __Value) property
    {
        if (!(this.m_bShowArrow) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bShowArrow = __Value;
        return;
    }
}

struct FC_AIForceLockTarget : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_RefCount;
    UPROPERTY()
    bool m_bShowArrow;

    FC_AIForceLockTarget()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AIForceLockTarget(const FC_AIForceLockTarget &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AIForceLockTarget opAssign(const FC_AIForceLockTarget &inout Other)
    {
        FC_AIForceLockTarget __r;
        this.SetRefCount(Other.GetRefCount());
        this.SetbShowArrow(Other.GetbShowArrow());
        return __r;
    }
    int GetRefCount() const property
    {
        return this.m_RefCount;
    }
    void SetRefCount(const int __Value) property
    {
        if (this.m_RefCount == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_RefCount = __Value;
        return;
    }
    bool GetbShowArrow() const property
    {
        return this.m_bShowArrow;
    }
    void SetbShowArrow(const bool __Value) property
    {
        if (!(this.m_bShowArrow) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bShowArrow = __Value;
        return;
    }
}

struct FC_BeTauntedFX : FECSComponent
{
    UPROPERTY()
    FECSEntity FXEntity;
    UPROPERTY()
    FFPTime StartTime;

    FC_BeTauntedFX()
    {
        return;
    }
}

struct FAITargetingPlayerSensorData
{
    UPROPERTY()
    FIntVector2 Location;
    UPROPERTY()
    FTargetEntity Target;

    FAITargetingPlayerSensorData()
    {
        return;
    }
}

struct FC_AITargetingPlayerNoise : FECSComponent
{
    UPROPERTY()
    FIntVector2 Location;

    FC_AITargetingPlayerNoise()
    {
        FIntVector2 local_2 = FIntVector2(-1, -1);
        return;
    }
}

struct FCS_AITargetingPlayerNoiseSensor : FECSSingleton
{
    UPROPERTY()
    TSet<FIntVector2> NoiseLocations;

    FCS_AITargetingPlayerNoiseSensor()
    {
        return;
    }
}

struct FCE_AIPlayerDistLODChanged : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    int OldLevel = -1;
    UPROPERTY()
    int NewLevel = -1;


}

struct FC_AIPlayerDistanceLOD : FECSComponent
{
    UPROPERTY()
    int LODLevel = -1;


}

struct FCS_AIPlayerDistanceLODManager : FECSSingleton
{
    UPROPERTY()
    TArray<FVector> PlayerPawnPositions;
    UPROPERTY()
    TArray<float32> LODDistances;
    UPROPERTY()
    float32 HysteresisBuffer = 3000.0f;


    float32 GetMinDistSqToPlayer(const FVector &inout Location) const
    {
        float32 local_1 = 3.4028235e38f;
        for (auto& local_18 : this)
        {
            float32 local_2 = float32(Location.DistSquared(local_18));
            if (local_2 < local_1)
            {
                local_1 = local_2;
            }
        }
        return local_1;
    }
    int ComputeLODLevel(const float32 MinDistSq, const int CurrentLevel) const
    {
        float32 local_5;
        int local_1 = 0;
        for (; local_1 < this.LODDistances.Num(); ++local_1)
        {
            local_5 = this.LODDistances[local_1];
            if ((CurrentLevel >= 0 && (CurrentLevel <= local_1)))
            {
                local_5 = local_5 + this.HysteresisBuffer;
            }
            if (MinDistSq <= FMath::Square(local_5))
            {
                return local_1;
            }
        }
        return this.LODDistances.Num();
    }
}

namespace FCS_AITargetingPlayerNoiseSensor
{
FIntVector2 PositionAsLocation(const FVector &inout Position)
{
    return FIntVector2(FMath::IntegerDivisionTrunc(int(Position.X), 256), (FMath::IntegerDivisionTrunc(int(Position.Y), 256)));
}
bool IsInNoiseRange(const FIntVector2 &inout Location, const FIntVector2 &inout NoiseLocation)
{
    int local_4;
    if (FMath::Abs((int(Location.X) - int(NoiseLocation.X))) >= 4)
    {
        local_4 = 0;
    }
    else
    {
        int local_1_2 = int(Location.Y);
        bool local_6 = (FMath::Abs((local_1_2 - int(NoiseLocation.Y))) < 4);
        local_4 = local_6;
    }
    return (local_4 != 0);
}
}
namespace FAIPlayerDistLODSchedule
{
float32 GetUpdateInterval(const int LODLevel)
{
    if (LODLevel == 0)
    {
        return 0.25f;
    }
    if (LODLevel == 1)
    {
        return 1.0f;
    }
    if (LODLevel >= 2)
    {
        return 4.0f;
    }
    return 1.0f;
}
float32 GetStaggeredInterval(const int LODLevel, const uint EntityIdValue)
{
    float32 local_2 = FAIPlayerDistLODSchedule::GetUpdateInterval(LODLevel);
    float32 local_1_2 = (((EntityIdValue % 16) / 16.0f) * local_2) * 0.5f;
    return local_2 + local_1_2;
}
}
namespace FAIPlayerDistLODUtils
{
bool HasLODAssignment(const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_AIPlayerDistanceLOD& local_6 = local_4.opCall();
    if (local_6)
    {
        return (int(local_6.LODLevel) >= 0);
    }
    return false;
}
int GetLODLevel(const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_AIPlayerDistanceLOD& local_6 = local_4.opCall();
    if (local_6)
    {
        return int(local_6.LODLevel);
    }
    return -1;
}
bool IsAtLODLevel(const FECSEntity &inout Entity, const int Level)
{
    return (FAIPlayerDistLODUtils::GetLODLevel(Entity) == Level);
}
bool CanEntityCombat(const FECSEntity &inout Entity)
{
    if (!(FAIPlayerDistLODUtils::HasLODAssignment(Entity)))
    {
        return true;
    }
    return (FAIPlayerDistLODUtils::GetLODLevel(Entity) == 0);
}
EVisibilityTier GetLODVisibilityTier(const FECSEntity &inout Entity)
{
    int local_2 = FAIPlayerDistLODUtils::GetLODLevel(Entity);
    if (local_2 <= 0)
    {
        return EVisibilityTier(0);
    }
    if (local_2 == 1)
    {
        return EVisibilityTier(1);
    }
    return EVisibilityTier(3);
}
}
namespace ECSFunc_FC_AITargeting
{
UFUNCTION()
bool HasAITargeting(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AITargeting);
}
FC_AITargeting& AssignAITargeting(const FECSEntity &inout Entity, const FC_AITargeting &inout DefaultValue = FC_AITargeting())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AITargeting, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAITargeting_BP(const FECSEntity &inout Entity, const FC_AITargeting &inout DefaultValue = FC_AITargeting())
{
    ECSFunc_FC_AITargeting::AssignAITargeting(Entity, DefaultValue);
    return;
}
FC_AITargeting& ModifyAITargeting(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AITargeting));
    return local_12.GetComp();
}
FC_AITargeting& ModifyOrAddAITargeting(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AITargeting));
    return local_12.GetComp();
}
const FC_AITargeting& GetAITargeting(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AITargeting));
    return local_12.GetComp();
}
UFUNCTION()
FC_AITargeting GetAITargeting_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AITargeting __r;
    bValid = false;
    bValid = ECSFunc_FC_AITargeting::GetAITargeting(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AITargeting GetDefaultedAITargeting(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AITargeting __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AITargeting);
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
FC_AITargeting GetDefaultedAITargeting_BP(const FECSEntity &inout Entity)
{
    FC_AITargeting __r;
    return __r;
}
UFUNCTION()
bool RemoveAITargeting(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AITargeting);
}
}
FECSMonitorRuntimeView __GetMonitorAITargetingOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AITargeting, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AITargeting, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AITargeting, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AITargeting, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AITargeting, bFixedFrame, bMustHandleAll);
}
void __MonitorAITargetingLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AITargeting, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAITargetingActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AITargeting, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAITargetingModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AITargeting, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PlayerBeTargeted
{
UFUNCTION()
bool HasPlayerBeTargeted(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerBeTargeted);
}
FC_PlayerBeTargeted& AssignPlayerBeTargeted(const FECSEntity &inout Entity, const FC_PlayerBeTargeted &inout DefaultValue = FC_PlayerBeTargeted())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerBeTargeted, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerBeTargeted_BP(const FECSEntity &inout Entity, const FC_PlayerBeTargeted &inout DefaultValue = FC_PlayerBeTargeted())
{
    ECSFunc_FC_PlayerBeTargeted::AssignPlayerBeTargeted(Entity, DefaultValue);
    return;
}
FC_PlayerBeTargeted& ModifyPlayerBeTargeted(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerBeTargeted));
    return local_12.GetComp();
}
FC_PlayerBeTargeted& ModifyOrAddPlayerBeTargeted(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerBeTargeted));
    return local_12.GetComp();
}
const FC_PlayerBeTargeted& GetPlayerBeTargeted(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerBeTargeted));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerBeTargeted GetPlayerBeTargeted_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PlayerBeTargeted __r;
    bValid = false;
    bValid = ECSFunc_FC_PlayerBeTargeted::GetPlayerBeTargeted(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PlayerBeTargeted GetDefaultedPlayerBeTargeted(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerBeTargeted __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerBeTargeted);
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
FC_PlayerBeTargeted GetDefaultedPlayerBeTargeted_BP(const FECSEntity &inout Entity)
{
    FC_PlayerBeTargeted __r;
    return __r;
}
UFUNCTION()
bool RemovePlayerBeTargeted(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerBeTargeted);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerBeTargetedOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerBeTargeted, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerBeTargetedOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerBeTargeted, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerBeTargetedOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerBeTargeted, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerBeTargetedOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerBeTargeted, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerBeTargetedOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerBeTargeted, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerBeTargetedLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerBeTargeted, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerBeTargetedActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerBeTargeted, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerBeTargetedModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerBeTargeted, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AITargetingTaunting
{
UFUNCTION()
bool HasAITargetingTaunting(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AITargetingTaunting);
}
FC_AITargetingTaunting& AssignAITargetingTaunting(const FECSEntity &inout Entity, const FC_AITargetingTaunting &inout DefaultValue = FC_AITargetingTaunting())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AITargetingTaunting, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAITargetingTaunting_BP(const FECSEntity &inout Entity, const FC_AITargetingTaunting &inout DefaultValue = FC_AITargetingTaunting())
{
    ECSFunc_FC_AITargetingTaunting::AssignAITargetingTaunting(Entity, DefaultValue);
    return;
}
FC_AITargetingTaunting& ModifyAITargetingTaunting(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AITargetingTaunting));
    return local_12.GetComp();
}
FC_AITargetingTaunting& ModifyOrAddAITargetingTaunting(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AITargetingTaunting));
    return local_12.GetComp();
}
const FC_AITargetingTaunting& GetAITargetingTaunting(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AITargetingTaunting));
    return local_12.GetComp();
}
UFUNCTION()
FC_AITargetingTaunting GetAITargetingTaunting_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AITargetingTaunting& local_4 = ECSFunc_FC_AITargetingTaunting::GetAITargetingTaunting(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AITargetingTaunting();
}
const FC_AITargetingTaunting GetDefaultedAITargetingTaunting(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AITargetingTaunting __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AITargetingTaunting);
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
FC_AITargetingTaunting GetDefaultedAITargetingTaunting_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AITargetingTaunting::GetDefaultedAITargetingTaunting(Entity);
}
UFUNCTION()
bool RemoveAITargetingTaunting(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AITargetingTaunting);
}
}
FECSMonitorRuntimeView __GetMonitorAITargetingTauntingOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AITargetingTaunting, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingTauntingOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AITargetingTaunting, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingTauntingOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AITargetingTaunting, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingTauntingOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AITargetingTaunting, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingTauntingOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AITargetingTaunting, bFixedFrame, bMustHandleAll);
}
void __MonitorAITargetingTauntingLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AITargetingTaunting, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAITargetingTauntingActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AITargetingTaunting, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAITargetingTauntingModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AITargetingTaunting, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AITargetingBeTaunted
{
UFUNCTION()
bool HasAITargetingBeTaunted(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AITargetingBeTaunted);
}
FC_AITargetingBeTaunted& AssignAITargetingBeTaunted(const FECSEntity &inout Entity, const FC_AITargetingBeTaunted &inout DefaultValue = FC_AITargetingBeTaunted())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AITargetingBeTaunted, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAITargetingBeTaunted_BP(const FECSEntity &inout Entity, const FC_AITargetingBeTaunted &inout DefaultValue = FC_AITargetingBeTaunted())
{
    ECSFunc_FC_AITargetingBeTaunted::AssignAITargetingBeTaunted(Entity, DefaultValue);
    return;
}
FC_AITargetingBeTaunted& ModifyAITargetingBeTaunted(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AITargetingBeTaunted));
    return local_12.GetComp();
}
FC_AITargetingBeTaunted& ModifyOrAddAITargetingBeTaunted(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AITargetingBeTaunted));
    return local_12.GetComp();
}
const FC_AITargetingBeTaunted& GetAITargetingBeTaunted(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AITargetingBeTaunted));
    return local_12.GetComp();
}
UFUNCTION()
FC_AITargetingBeTaunted GetAITargetingBeTaunted_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AITargetingBeTaunted& local_4 = ECSFunc_FC_AITargetingBeTaunted::GetAITargetingBeTaunted(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AITargetingBeTaunted();
}
const FC_AITargetingBeTaunted GetDefaultedAITargetingBeTaunted(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AITargetingBeTaunted __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AITargetingBeTaunted);
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
FC_AITargetingBeTaunted GetDefaultedAITargetingBeTaunted_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AITargetingBeTaunted::GetDefaultedAITargetingBeTaunted(Entity);
}
UFUNCTION()
bool RemoveAITargetingBeTaunted(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AITargetingBeTaunted);
}
}
FECSMonitorRuntimeView __GetMonitorAITargetingBeTauntedOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AITargetingBeTaunted, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingBeTauntedOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AITargetingBeTaunted, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingBeTauntedOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AITargetingBeTaunted, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingBeTauntedOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AITargetingBeTaunted, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingBeTauntedOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AITargetingBeTaunted, bFixedFrame, bMustHandleAll);
}
void __MonitorAITargetingBeTauntedLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AITargetingBeTaunted, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAITargetingBeTauntedActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AITargetingBeTaunted, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAITargetingBeTauntedModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AITargetingBeTaunted, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AIForceLockTarget
{
UFUNCTION()
bool HasAIForceLockTarget(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIForceLockTarget);
}
FC_AIForceLockTarget& AssignAIForceLockTarget(const FECSEntity &inout Entity, const FC_AIForceLockTarget &inout DefaultValue = FC_AIForceLockTarget())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIForceLockTarget, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIForceLockTarget_BP(const FECSEntity &inout Entity, const FC_AIForceLockTarget &inout DefaultValue = FC_AIForceLockTarget())
{
    ECSFunc_FC_AIForceLockTarget::AssignAIForceLockTarget(Entity, DefaultValue);
    return;
}
FC_AIForceLockTarget& ModifyAIForceLockTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIForceLockTarget));
    return local_12.GetComp();
}
FC_AIForceLockTarget& ModifyOrAddAIForceLockTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIForceLockTarget));
    return local_12.GetComp();
}
const FC_AIForceLockTarget& GetAIForceLockTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIForceLockTarget));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIForceLockTarget GetAIForceLockTarget_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AIForceLockTarget& local_4 = ECSFunc_FC_AIForceLockTarget::GetAIForceLockTarget(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AIForceLockTarget();
}
const FC_AIForceLockTarget GetDefaultedAIForceLockTarget(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIForceLockTarget __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIForceLockTarget);
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
FC_AIForceLockTarget GetDefaultedAIForceLockTarget_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AIForceLockTarget::GetDefaultedAIForceLockTarget(Entity);
}
UFUNCTION()
bool RemoveAIForceLockTarget(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIForceLockTarget);
}
}
FECSMonitorRuntimeView __GetMonitorAIForceLockTargetOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIForceLockTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIForceLockTargetOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIForceLockTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIForceLockTargetOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIForceLockTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIForceLockTargetOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIForceLockTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIForceLockTargetOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIForceLockTarget, bFixedFrame, bMustHandleAll);
}
void __MonitorAIForceLockTargetLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIForceLockTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIForceLockTargetActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIForceLockTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIForceLockTargetModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIForceLockTarget, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_BeTauntedFX
{
UFUNCTION()
bool HasBeTauntedFX(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_BeTauntedFX);
}
FC_BeTauntedFX& AssignBeTauntedFX(const FECSEntity &inout Entity, const FC_BeTauntedFX &inout DefaultValue = FC_BeTauntedFX())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_BeTauntedFX, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignBeTauntedFX_BP(const FECSEntity &inout Entity, const FC_BeTauntedFX &inout DefaultValue = FC_BeTauntedFX())
{
    ECSFunc_FC_BeTauntedFX::AssignBeTauntedFX(Entity, DefaultValue);
    return;
}
FC_BeTauntedFX& ModifyBeTauntedFX(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_BeTauntedFX));
    return local_12.GetComp();
}
FC_BeTauntedFX& ModifyOrAddBeTauntedFX(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_BeTauntedFX));
    return local_12.GetComp();
}
const FC_BeTauntedFX& GetBeTauntedFX(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_BeTauntedFX));
    return local_12.GetComp();
}
UFUNCTION()
FC_BeTauntedFX GetBeTauntedFX_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_BeTauntedFX __r;
    bValid = false;
    bValid = ECSFunc_FC_BeTauntedFX::GetBeTauntedFX(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_BeTauntedFX GetDefaultedBeTauntedFX(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_BeTauntedFX __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_BeTauntedFX);
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
FC_BeTauntedFX GetDefaultedBeTauntedFX_BP(const FECSEntity &inout Entity)
{
    FC_BeTauntedFX __r;
    return __r;
}
UFUNCTION()
bool RemoveBeTauntedFX(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_BeTauntedFX);
}
}
FECSMonitorRuntimeView __GetMonitorBeTauntedFXOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_BeTauntedFX, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeTauntedFXOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_BeTauntedFX, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeTauntedFXOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_BeTauntedFX, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeTauntedFXOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_BeTauntedFX, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeTauntedFXOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_BeTauntedFX, bFixedFrame, bMustHandleAll);
}
void __MonitorBeTauntedFXLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_BeTauntedFX, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBeTauntedFXActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_BeTauntedFX, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBeTauntedFXModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_BeTauntedFX, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AITargetingPlayerNoise
{
UFUNCTION()
bool HasAITargetingPlayerNoise(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AITargetingPlayerNoise);
}
FC_AITargetingPlayerNoise& AssignAITargetingPlayerNoise(const FECSEntity &inout Entity, const FC_AITargetingPlayerNoise &inout DefaultValue = FC_AITargetingPlayerNoise())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AITargetingPlayerNoise, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAITargetingPlayerNoise_BP(const FECSEntity &inout Entity, const FC_AITargetingPlayerNoise &inout DefaultValue = FC_AITargetingPlayerNoise())
{
    ECSFunc_FC_AITargetingPlayerNoise::AssignAITargetingPlayerNoise(Entity, DefaultValue);
    return;
}
FC_AITargetingPlayerNoise& ModifyAITargetingPlayerNoise(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AITargetingPlayerNoise));
    return local_12.GetComp();
}
FC_AITargetingPlayerNoise& ModifyOrAddAITargetingPlayerNoise(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AITargetingPlayerNoise));
    return local_12.GetComp();
}
const FC_AITargetingPlayerNoise& GetAITargetingPlayerNoise(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AITargetingPlayerNoise));
    return local_12.GetComp();
}
UFUNCTION()
FC_AITargetingPlayerNoise GetAITargetingPlayerNoise_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AITargetingPlayerNoise& local_4 = ECSFunc_FC_AITargetingPlayerNoise::GetAITargetingPlayerNoise(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AITargetingPlayerNoise();
}
const FC_AITargetingPlayerNoise GetDefaultedAITargetingPlayerNoise(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AITargetingPlayerNoise __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AITargetingPlayerNoise);
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
FC_AITargetingPlayerNoise GetDefaultedAITargetingPlayerNoise_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AITargetingPlayerNoise::GetDefaultedAITargetingPlayerNoise(Entity);
}
UFUNCTION()
bool RemoveAITargetingPlayerNoise(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AITargetingPlayerNoise);
}
}
FECSMonitorRuntimeView __GetMonitorAITargetingPlayerNoiseOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AITargetingPlayerNoise, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingPlayerNoiseOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AITargetingPlayerNoise, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingPlayerNoiseOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AITargetingPlayerNoise, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingPlayerNoiseOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AITargetingPlayerNoise, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingPlayerNoiseOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AITargetingPlayerNoise, bFixedFrame, bMustHandleAll);
}
void __MonitorAITargetingPlayerNoiseLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AITargetingPlayerNoise, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAITargetingPlayerNoiseActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AITargetingPlayerNoise, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAITargetingPlayerNoiseModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AITargetingPlayerNoise, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_AITargetingPlayerNoiseSensor
{
UFUNCTION()
bool HasAITargetingPlayerNoiseSensor(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_AITargetingPlayerNoiseSensor);
}
FCS_AITargetingPlayerNoiseSensor& AssignAITargetingPlayerNoiseSensor(const FECSWorldPtr &inout World, const FCS_AITargetingPlayerNoiseSensor &inout DefaultValue = FCS_AITargetingPlayerNoiseSensor())
{
    UScriptStruct local_6 = FCS_AITargetingPlayerNoiseSensor;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignAITargetingPlayerNoiseSensor_BP(const FECSWorldPtr &inout World, const FCS_AITargetingPlayerNoiseSensor &inout DefaultValue = FCS_AITargetingPlayerNoiseSensor())
{
    ECSFunc_FCS_AITargetingPlayerNoiseSensor::AssignAITargetingPlayerNoiseSensor(World, DefaultValue);
    return;
}
FCS_AITargetingPlayerNoiseSensor& ModifyAITargetingPlayerNoiseSensor(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AITargetingPlayerNoiseSensor;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_AITargetingPlayerNoiseSensor& ModifyOrAddAITargetingPlayerNoiseSensor(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AITargetingPlayerNoiseSensor;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_AITargetingPlayerNoiseSensor& GetAITargetingPlayerNoiseSensor(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AITargetingPlayerNoiseSensor;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_AITargetingPlayerNoiseSensor GetAITargetingPlayerNoiseSensor_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_AITargetingPlayerNoiseSensor __r;
    bValid = false;
    bValid = ECSFunc_FCS_AITargetingPlayerNoiseSensor::GetAITargetingPlayerNoiseSensor(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_AITargetingPlayerNoiseSensor GetDefaultedAITargetingPlayerNoiseSensor(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_AITargetingPlayerNoiseSensor __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_AITargetingPlayerNoiseSensor);
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
FCS_AITargetingPlayerNoiseSensor GetDefaultedAITargetingPlayerNoiseSensor_BP(const FECSWorldPtr &inout World)
{
    FCS_AITargetingPlayerNoiseSensor __r;
    return __r;
}
UFUNCTION()
bool RemoveAITargetingPlayerNoiseSensor(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_AITargetingPlayerNoiseSensor);
}
}
void __MonitorAITargetingPlayerNoiseSensorLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_AITargetingPlayerNoiseSensor, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAITargetingPlayerNoiseSensorActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_AITargetingPlayerNoiseSensor, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAITargetingPlayerNoiseSensorModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_AITargetingPlayerNoiseSensor, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AIPlayerDistanceLOD
{
UFUNCTION()
bool HasAIPlayerDistanceLOD(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIPlayerDistanceLOD);
}
FC_AIPlayerDistanceLOD& AssignAIPlayerDistanceLOD(const FECSEntity &inout Entity, const FC_AIPlayerDistanceLOD &inout DefaultValue = FC_AIPlayerDistanceLOD())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIPlayerDistanceLOD, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIPlayerDistanceLOD_BP(const FECSEntity &inout Entity, const FC_AIPlayerDistanceLOD &inout DefaultValue = FC_AIPlayerDistanceLOD())
{
    ECSFunc_FC_AIPlayerDistanceLOD::AssignAIPlayerDistanceLOD(Entity, DefaultValue);
    return;
}
FC_AIPlayerDistanceLOD& ModifyAIPlayerDistanceLOD(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIPlayerDistanceLOD));
    return local_12.GetComp();
}
FC_AIPlayerDistanceLOD& ModifyOrAddAIPlayerDistanceLOD(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIPlayerDistanceLOD));
    return local_12.GetComp();
}
const FC_AIPlayerDistanceLOD& GetAIPlayerDistanceLOD(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIPlayerDistanceLOD));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIPlayerDistanceLOD GetAIPlayerDistanceLOD_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AIPlayerDistanceLOD& local_4 = ECSFunc_FC_AIPlayerDistanceLOD::GetAIPlayerDistanceLOD(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AIPlayerDistanceLOD();
}
const FC_AIPlayerDistanceLOD GetDefaultedAIPlayerDistanceLOD(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIPlayerDistanceLOD __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIPlayerDistanceLOD);
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
FC_AIPlayerDistanceLOD GetDefaultedAIPlayerDistanceLOD_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AIPlayerDistanceLOD::GetDefaultedAIPlayerDistanceLOD(Entity);
}
UFUNCTION()
bool RemoveAIPlayerDistanceLOD(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIPlayerDistanceLOD);
}
}
FECSMonitorRuntimeView __GetMonitorAIPlayerDistanceLODOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIPlayerDistanceLOD, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPlayerDistanceLODOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIPlayerDistanceLOD, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPlayerDistanceLODOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIPlayerDistanceLOD, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPlayerDistanceLODOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIPlayerDistanceLOD, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPlayerDistanceLODOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIPlayerDistanceLOD, bFixedFrame, bMustHandleAll);
}
void __MonitorAIPlayerDistanceLODLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIPlayerDistanceLOD, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIPlayerDistanceLODActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIPlayerDistanceLOD, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIPlayerDistanceLODModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIPlayerDistanceLOD, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_AIPlayerDistanceLODManager
{
UFUNCTION()
bool HasAIPlayerDistanceLODManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_AIPlayerDistanceLODManager);
}
FCS_AIPlayerDistanceLODManager& AssignAIPlayerDistanceLODManager(const FECSWorldPtr &inout World, const FCS_AIPlayerDistanceLODManager &inout DefaultValue = FCS_AIPlayerDistanceLODManager())
{
    UScriptStruct local_6 = FCS_AIPlayerDistanceLODManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignAIPlayerDistanceLODManager_BP(const FECSWorldPtr &inout World, const FCS_AIPlayerDistanceLODManager &inout DefaultValue = FCS_AIPlayerDistanceLODManager())
{
    ECSFunc_FCS_AIPlayerDistanceLODManager::AssignAIPlayerDistanceLODManager(World, DefaultValue);
    return;
}
FCS_AIPlayerDistanceLODManager& ModifyAIPlayerDistanceLODManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AIPlayerDistanceLODManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_AIPlayerDistanceLODManager& ModifyOrAddAIPlayerDistanceLODManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AIPlayerDistanceLODManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_AIPlayerDistanceLODManager& GetAIPlayerDistanceLODManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AIPlayerDistanceLODManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_AIPlayerDistanceLODManager GetAIPlayerDistanceLODManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_AIPlayerDistanceLODManager __r;
    bValid = false;
    bValid = ECSFunc_FCS_AIPlayerDistanceLODManager::GetAIPlayerDistanceLODManager(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_AIPlayerDistanceLODManager GetDefaultedAIPlayerDistanceLODManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_AIPlayerDistanceLODManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_AIPlayerDistanceLODManager);
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
FCS_AIPlayerDistanceLODManager GetDefaultedAIPlayerDistanceLODManager_BP(const FECSWorldPtr &inout World)
{
    FCS_AIPlayerDistanceLODManager __r;
    return __r;
}
UFUNCTION()
bool RemoveAIPlayerDistanceLODManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_AIPlayerDistanceLODManager);
}
}
void __MonitorAIPlayerDistanceLODManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_AIPlayerDistanceLODManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIPlayerDistanceLODManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_AIPlayerDistanceLODManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIPlayerDistanceLODManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_AIPlayerDistanceLODManager, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AITargetingTaunting &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AITargetingTaunting &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AITargetingTaunting &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AITargetingTaunting
{
int __IndexOf_TauntNum()
{
    return 0;
}
int __IndexOf_TauntStartTime()
{
    return 1;
}
int __IndexOf_TauntEndTime()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AITargetingBeTaunted &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AITargetingBeTaunted &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AITargetingBeTaunted &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AITargetingBeTaunted
{
int __IndexOf_FromEntity()
{
    return 0;
}
int __IndexOf_TauntStartTime()
{
    return 1;
}
int __IndexOf_TauntEndTime()
{
    return 2;
}
int __IndexOf_bShowArrow()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AIForceLockTarget &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AIForceLockTarget &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AIForceLockTarget &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AIForceLockTarget
{
int __IndexOf_RefCount()
{
    return 0;
}
int __IndexOf_bShowArrow()
{
    return 1;
}
}
