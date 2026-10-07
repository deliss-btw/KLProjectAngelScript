
enum EAIExternalTargetPriority
{
    Low,
    Medium,
    High,
}

enum EAITargetingQuerySourceType
{
    Default,
    UpdateLock,
    OverrideLock,
    External,
}

enum EDamageTraceMode
{
    TraceByTime,
    TraceAll,
    TraceLatest,
}

enum EMultiTagScoreMode
{
    Accumulate,
    MaxAbsolute,
}

namespace __INTENRAL_FC_AITargetingQueryDataCache_NS
{
    const TECSComponentDerivedPtr<FC_AITargetingQueryDataCache> DerivedPtr = TECSComponentDerivedPtr<FC_AITargetingQueryDataCache>();
    const FC_AITargetingQueryDataCache DefaultValue = FC_AITargetingQueryDataCache();
}
namespace __INTENRAL_FC_AITargetingV2_NS
{
    const TECSComponentDerivedPtr<FC_AITargetingV2> DerivedPtr = TECSComponentDerivedPtr<FC_AITargetingV2>();
    const FC_AITargetingV2 DefaultValue = FC_AITargetingV2();
}
namespace __INTENRAL_FC_AITargetingSync_NS
{
    const TECSComponentDerivedPtr<FC_AITargetingSync> DerivedPtr = TECSComponentDerivedPtr<FC_AITargetingSync>();
    const FC_AITargetingSync DefaultValue = FC_AITargetingSync();
}
namespace __INTENRAL_FCE_AITargetChangedV2_NS
{
    const TECSEventDerivedPtr<FCE_AITargetChangedV2> DerivedPtr = TECSEventDerivedPtr<FCE_AITargetChangedV2>();
}
namespace __INTENRAL_FCE_AITargetListChanged_NS
{
    const TECSEventDerivedPtr<FCE_AITargetListChanged> DerivedPtr = TECSEventDerivedPtr<FCE_AITargetListChanged>();

// NOTE: class defaults are not authored in this module: FAITargetingFilter_FactionRelation (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

}
struct FAISmartEntityIdRecord
{
    UPROPERTY()
    FAISmart_EntityId Target;
    UPROPERTY()
    FECSEntityId Value;
    UPROPERTY()
    FFPTime UpdateTime;

    FAISmartEntityIdRecord()
    {
        return;
    }
}

struct FAIExternalTargetInfo
{
    UPROPERTY()
    EAIExternalTargetPriority Priority;
    UPROPERTY()
    FTargetEntity Target;
    UPROPERTY()
    FName SourceName;


}

struct FAINavPathLengthCache
{
    UPROPERTY()
    float32 PathLength = -1.0f;
    UPROPERTY()
    FFPTime LastUpdateTime = -1;


}

struct FC_AITargetingQueryDataCache : FECSComponent
{
    UPROPERTY()
    TMap<FTargetEntity, FAINavPathLengthCache> NavPathLengthCache;

    FC_AITargetingQueryDataCache()
    {
        return;
    }
}

struct FAISmartEntityScore
{
    UPROPERTY()
    FAISmart_EntityId Entity;
    UPROPERTY()
    float32 Score = 0.0f;


}

struct FAISmartEntityValue
{
    UPROPERTY()
    FAISmart_EntityId m_TargetId;
    UPROPERTY()
    FECSEntityId m_Value;

    FAISmartEntityValue()
    {
        return;
    }
    FAISmart_EntityId GetTargetId() const property
    {
        FAISmart_EntityId __r;
        return __r;
    }
    FAISmart_EntityId GetTargetId() property
    {
        FAISmart_EntityId __r;
        return __r;
    }
    void SetTargetId(const FAISmart_EntityId &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FECSEntityId GetValue() const property
    {
        FECSEntityId __r;
        return __r;
    }
    FECSEntityId GetValue() property
    {
        FECSEntityId __r;
        return __r;
    }
    void SetValue(const FECSEntityId &inout __Value) property
    {
        this.m_Value = __Value;
        return;
    }
}

struct FAITargetingQueryInstance
{
    UPROPERTY()
    EAITargetingQuerySourceType EntryType = EAITargetingQuerySourceType(1);
    UPROPERTY()
    TDataObjectPtr<FAITargetingQueryConfig> QueryConfig;
    UPROPERTY()
    TArray<FAISmart_EntityId> TargetIDs;
    UPROPERTY()
    int64 Handle = 0;
    UPROPERTY()
    FName SourceName;


}

struct FC_AITargetingV2 : FECSComponent
{
    UPROPERTY()
    float32 AlertnessMax = 100.0f;
    UPROPERTY()
    float32 SightMaxDistance;
    UPROPERTY()
    FFPTime NextTargetingUpdateTime;
    UPROPERTY()
    FFPTime LastUpdateAlertTime = -1;
    UPROPERTY()
    TMap<FTargetEntity, FAIKnowledgeAlertness> EntityAlertnessMap;
    UPROPERTY()
    TSet<FTargetEntity> AlertBroadcastSources;
    UPROPERTY()
    TMap<FTargetEntity, FTargetHostilityInfo> TargetsHostilityMap;
    UPROPERTY()
    TArray<FAIExternalTargetInfo> ExternalTargets;
    UPROPERTY()
    TSet<FTargetEntity> AllTargets;
    UPROPERTY()
    TArray<FAISmartEntityIdRecord> QueryOutputRecords;
    UPROPERTY()
    TArray<FAITargetingQueryInstance> QueryInstanceStack;
    UPROPERTY()
    TArray<FAISmartEntityValue> CurrentQueryOutput;
    UPROPERTY()
    FAITargetingQueryResult CurrentTopQueryResult;
    UPROPERTY()
    TSet<int> SelectedMarks;
    UPROPERTY()
    FDelayTaskHandle UpdateTargetingTaskHandle;
    UPROPERTY()
    int HoldTargetRefCount = 0;
    UPROPERTY()
    int64 NextQueryHandle = 0;


}

struct FC_AITargetingSync : FECSComponent
{
    UPROPERTY()
    FECSEntity MasterEntity;

    FC_AITargetingSync()
    {
        return;
    }
}

struct FCE_AITargetChangedV2 : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FTargetEntity OldTarget;
    UPROPERTY()
    FTargetEntity NewTarget;
    UPROPERTY()
    FAISmart_EntityId TargetId;

    FCE_AITargetChangedV2()
    {
        return;
    }
}

struct FCE_AITargetListChanged : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TArray<FTargetEntity> AddedTargets;
    UPROPERTY()
    TArray<FTargetEntity> RemovedTargets;

    FCE_AITargetListChanged()
    {
        return;
    }
}

struct FAITargetingFilter_FactionRelation : FAITargetingFilter
{
    FAITargetingFilter _base_FAITargetingFilter;
    UPROPERTY()
    uint8 FactionRelation;

    FAITargetingFilter_FactionRelation()
    {
        this.FactionRelation = (2 != 0);
        this.__InitDefaults();
        return;
    }
    TArray<FECSEntity> Filter_Implementation(const FECSEntity &inout SourceEntity, const TArray<FECSEntity> &inout InTargetEntities, const FAISmartValueContext &inout Context) const
    {
        TArray<FECSEntity> local_4;
        for (auto& local_20 : InTargetEntities)
        {
            if (!(local_20.IsValid()))
            {
                continue;
            }
            EFactionRelation local_22 = ::FASCommonUtils::GetEntityFactionRelation(SourceEntity, local_20);
            int local_23 = int(local_22);
            if ((this.FactionRelation & local_23) != 0)
            {
                local_4.Add(local_20);
            }
        }
        return local_4;
    }
}

struct FAITargetingFilter_Distance : FAITargetingFilter
{
    FAITargetingFilter _base_FAITargetingFilter;
    UPROPERTY()
    float32 DistanceXY;
    UPROPERTY()
    float32 DistanceZ;

    FAITargetingFilter_Distance()
    {
        this.DistanceXY = -1.0f;
        this.DistanceZ = -1.0f;
        this.__InitDefaults();
        return;
    }
    TArray<FECSEntity> Filter_Implementation(const FECSEntity &inout SourceEntity, const TArray<FECSEntity> &inout InTargetEntities, const FAISmartValueContext &inout Context) const
    {
        if (!(SourceEntity.IsValid()) || (this.DistanceXY <= 0.0f && (this.DistanceZ <= 0.0f)))
        {
            return InTargetEntities;
        }
        Get local_16;
        FVector local_12 = local_16.opCall().GetPosition();
        TArray<FECSEntity> local_20;
        for (auto& local_34 : InTargetEntities)
        {
            if (!(local_34.IsValid()))
            {
                continue;
            }
            FVector local_40 = local_16.opCall().GetPosition();
            if (this.DistanceXY > 0.0f)
            {
                if (local_40.DistSquaredXY(local_12) > FMath::Square(this.DistanceXY))
                {
                    continue;
                }
            }
            if (this.DistanceZ > 0.0f)
            {
                if (FMath::Abs((local_40.Z - local_12.Z)) > this.DistanceZ)
                {
                    continue;
                }
            }
            local_20.Add(local_34);
        }
        return local_20;
    }
}

struct FAITargetingFilter_ExcludeTargets : FAITargetingFilter
{
    FAITargetingFilter _base_FAITargetingFilter;
    UPROPERTY()
    TArray<FAISmart_EntityId> ExcludeTargets;

    FAITargetingFilter_ExcludeTargets()
    {
        this.__InitDefaults();
        return;
    }
    TArray<FECSEntity> Filter_Implementation(const FECSEntity &inout SourceEntity, const TArray<FECSEntity> &inout InTargetEntities, const FAISmartValueContext &inout Context) const
    {
        TSet<FECSEntityId> local_20;
        for (auto& local_36 : this.ExcludeTargets)
        {
            FECSEntityId local_38 = local_36.GetValue(Context);
            if ((!((local_38 == ENTITY_ID_NULL))))
            {
                local_20.Add(local_38);
            }
        }
        TArray<FECSEntity> local_42;
        for (auto& local_56 : InTargetEntities)
        {
            if (!(local_56.IsValid()))
            {
                continue;
            }
            if (!(local_20.Contains(local_56.GetId())))
            {
                local_42.Add(local_56);
            }
        }
        return local_42;
    }
}

struct FAITargetingFilter_HasBuff : FAITargetingFilter
{
    FAITargetingFilter _base_FAITargetingFilter;
    UPROPERTY()
    FBuffConfigRef BuffConfig;
    UPROPERTY()
    bool bRequireHasBuff;

    FAITargetingFilter_HasBuff()
    {
        this.bRequireHasBuff = true;
        this.__InitDefaults();
        return;
    }
    TArray<FECSEntity> Filter_Implementation(const FECSEntity &inout SourceEntity, const TArray<FECSEntity> &inout InTargetEntities, const FAISmartValueContext &inout Context) const
    {
        TArray<FECSEntity> local_4;
        for (auto& local_20 : InTargetEntities)
        {
            if (!(local_20.IsValid()))
            {
                continue;
            }
            bool local_17 = FBuffUtils::HasBuff(local_20, this.BuffConfig);
            if (!(local_17) == !(this.bRequireHasBuff))
            {
                local_4.Add(local_20);
            }
        }
        return local_4;
    }
}

struct FAITargetingFilter_TargetType : FAITargetingFilter
{
    FAITargetingFilter _base_FAITargetingFilter;
    UPROPERTY()
    bool bIncludePlayer;
    UPROPERTY()
    bool bIncludeNPC;
    UPROPERTY()
    TArray<ENPCCombatPriority> AllowedNPCCombatPriorities;
    UPROPERTY()
    bool bIncludeMonster;
    UPROPERTY()
    TArray<EMonsterRank> AllowedMonsterRanks;
    UPROPERTY()
    bool bIncludeFallback;

    FAITargetingFilter_TargetType()
    {
        this.bIncludePlayer = true;
        this.bIncludeNPC = true;
        this.bIncludeMonster = true;
        this.bIncludeFallback = true;
        this.__InitDefaults();
        return;
    }
    TArray<FECSEntity> Filter_Implementation(const FECSEntity &inout SourceEntity, const TArray<FECSEntity> &inout InTargetEntities, const FAISmartValueContext &inout Context) const
    {
        bool local_21;
        TArray<FECSEntity> local_4;
        for (auto& local_20 : InTargetEntities)
        {
            if (!(local_20.IsValid()))
            {
                continue;
            }
            local_21 = false;
            Has local_26;
            bool local_17 = local_26.opCall();
            if (local_17)
            {
                local_21 = this.bIncludePlayer;
            }
            else
            {
                Get local_30;
                const FC_NPCIdentity& local_32 = local_30.opCall();
                if (local_32)
                {
                    if (this.bIncludeNPC)
                    {
                        local_21 = this.AllowedNPCCombatPriorities.Num() == 0 || this.AllowedNPCCombatPriorities.Contains(ENPCCombatPriority(local_32.GetCombatPriority()));
                    }
                }
                else
                {
                    Get local_40;
                    const FC_MonsterInfo& local_42 = local_40.opCall();
                    if (local_42)
                    {
                        if (this.bIncludeMonster)
                        {
                            local_21 = this.AllowedMonsterRanks.Num() == 0 || this.AllowedMonsterRanks.Contains(EMonsterRank(local_42.GetMonsterRank()));
                        }
                    }
                    else
                    {
                        local_21 = this.bIncludeFallback;
                    }
                }
            }
            if (local_21)
            {
                local_4.Add(local_20);
            }
        }
        return local_4;
    }
}

struct FAITargetingFilter_CaptainTarget : FAITargetingFilter
{
    FAITargetingFilter _base_FAITargetingFilter;

    FAITargetingFilter_CaptainTarget()
    {
        this.__InitDefaults();
        return;
    }
    TArray<FECSEntity> Filter_Implementation(const FECSEntity &inout SourceEntity, const TArray<FECSEntity> &inout InTargetEntities, const FAISmartValueContext &inout Context) const
    {
        bool local_1;
        bool local_55;
        TArray<FECSEntity> __return;
        if (!(SourceEntity.IsValid()))
        {
            return InTargetEntities;
        }
        Get local_6;
        const FC_EcosimAIV2TeamMember& local_8 = local_6.opCall();
        if (local_8)
        {
            if (!(FECSEntity(local_8.TeamEntity).IsValid()))
            {
                return InTargetEntities;
            }
            Get local_16;
            const FC_EcosimAIV2Team& local_18 = local_16.opCall();
            if (local_18)
            {
                FECSEntity local_22 = FECSEntity(local_18.LeaderEntity);
                if (!(local_22.IsValid()))
                {
                    local_1 = true;
                }
                else
                {
                    Has local_26;
                    local_1 = local_26.opCall();
                }
                if (local_1)
                {
                    return InTargetEntities;
                }
                if ((local_22 == SourceEntity))
                {
                    return InTargetEntities;
                }
                Get local_32;
                const FC_SpawnFakeCharacterResultComponent& local_34 = local_32.opCall();
                if (local_34)
                {
                    if (local_34.FakeEntity.IsValid())
                    {
                        local_22 = local_34.FakeEntity;
                    }
                }
                FECSEntityId local_36 = local_22.GetId();
                TArray<FECSEntity> local_40;
                for (auto& local_54 : InTargetEntities)
                {
                    if (!(local_54.IsValid()))
                    {
                        continue;
                    }
                    local_55 = false;
                    TSet<FTargetEntity> local_76 = ::FAITargetingUtils::GetEntityCombatTargets(local_54);
                    for (auto& local_114 : local_76)
                    {
                        if (local_114.GetEntity().IsValid() && (local_114.GetEntity().GetId() == local_36))
                        {
                            local_55 = true;
                            break;
                        }
                    }
                    if (local_55)
                    {
                        local_40.Add(local_54);
                    }
                }
                __return = local_40;
            }
            else
            {
            }
        }
        __return = InTargetEntities;
        return __return;
    }
}

struct FAITargetingScorer_Distance : FAITargetingScorer
{
    FAITargetingScorer _base_FAITargetingScorer;
    UPROPERTY()
    FRuntimeFloatCurve BaseScoreByDistance;
    UPROPERTY()
    bool bUseMultiplierCurve;
    UPROPERTY()
    float32 Multiplier;
    UPROPERTY()
    FRuntimeFloatCurve MultiplierByDistance;
    UPROPERTY()
    bool bUseNavDistance;
    UPROPERTY()
    float32 NavDistanceUpdateInterval;

    FAITargetingScorer_Distance()
    {
        this.BaseScoreByDistance = FRuntimeCurveUtils::CreateLinear(0.0f, 10.0f, 4000.0f, -10.0f);
        this.bUseMultiplierCurve = false;
        this.Multiplier = 1.0f;
        this.MultiplierByDistance = FRuntimeCurveUtils::CreateLinear(0.0f, 1.0f, 4000.0f, 1.0f);
        this.bUseNavDistance = false;
        this.NavDistanceUpdateInterval = 1.0f;
        this.__InitDefaults();
        return;
    }
    float32 CalculateScore_Implementation(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity, const FAISmartValueContext &inout Context) const
    {
        float32 local_26;
        if (!(SourceEntity.IsValid()) || !(TargetEntity.IsValid()))
        {
            return 0.0f;
        }
        float32 local_4 = 0.0f;
        if (this.bUseNavDistance)
        {
            local_4 = this.GetNavDistance(SourceEntity, TargetEntity);
        }
        else
        {
            Get local_14;
            FVector local_20 = local_14.opCall().GetPosition();
            local_4 = float32(local_20.DistXY(FVector(local_14.opCall().GetPosition())));
        }
        float32 local_24 = this.BaseScoreByDistance.GetFloatValue(local_4, 0.0f);
        if (this.bUseMultiplierCurve)
        {
            local_26 = this.MultiplierByDistance.GetFloatValue(local_4, 0.0f);
        }
        else
        {
            local_26 = this.Multiplier;
        }
        return local_24 * local_26;
    }
    float32 GetNavDistance(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity) const
    {
        int local_14 = 0;
        int local_46 = 0;
        float32 local_49;
        FTargetEntity local_4 = FTargetEntity(TargetEntity);
        FFPTime local_8 = ECS::GetContextTime();
        if (local_14)
        {
            FAINavPathLengthCache local_20;
            if (local_14.NavPathLengthCache.Find(local_4, local_20))
            {
                FFPTime local_6 = local_20.LastUpdateTime;
                if ((local_6.opCmp(0.0) >= 0 && (((local_8 - local_20.LastUpdateTime).ToSeconds()) < this.NavDistanceUpdateInterval)))
                {
                    return local_20.PathLength;
                }
            }
        }
        Get local_38;
        FVector local_34 = local_38.opCall().GetPosition();
        float32 local_24 = FAINavigationUtils::EstimateGroundPathLengthTo(SourceEntity, local_34);
        if (local_24 < 0.0f)
        {
            local_24 = FAINavigationUtils::EstimateAirPathLengthTo(SourceEntity, local_34);
        }
        FAINavPathLengthCache& local_48 = local_46.NavPathLengthCache.FindOrAdd(local_4);
        local_48.PathLength = local_24;
        local_48.LastUpdateTime = local_8;
        if (local_24 > 0.0f)
        {
            local_49 = local_24;
        }
        else
        {
            local_49 = float32(local_38.opCall().GetPosition().DistXY(local_34));
        }
        return local_49;
    }
}

struct FAITargetingScorer_HP : FAITargetingScorer
{
    FAITargetingScorer _base_FAITargetingScorer;
    UPROPERTY()
    FRuntimeFloatCurve BaseScoreByHP;
    UPROPERTY()
    bool bUseMultiplierCurve;
    UPROPERTY()
    float32 Multiplier;
    UPROPERTY()
    FRuntimeFloatCurve MultiplierByHP;
    UPROPERTY()
    bool bUsePercentageHP;

    FAITargetingScorer_HP()
    {
        this.bUseMultiplierCurve = false;
        this.Multiplier = 1.0f;
        this.bUsePercentageHP = true;
        this.__InitDefaults();
        return;
    }
    float32 CalculateScore_Implementation(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity, const FAISmartValueContext &inout Context) const
    {
        int local_10 = 0;
        float32 local_12;
        if (!(SourceEntity.IsValid()) || !(TargetEntity.IsValid()))
        {
            return 0.0f;
        }
        if (!(local_10))
        {
            return 0.0f;
        }
        float32 local_11 = 0.0f;
        if (this.bUsePercentageHP)
        {
            float32 local_25 = FGameAttributeUtils::GetAttributeValue(TargetEntity, Attribute::HPMax, ECS::GetContextTime(), false, 0.0f, false, FGameAttributeModificationValue());
            if (local_25 > 0.0f)
            {
                local_11 = (FGameAttributeUtils::GetAttributeValue(TargetEntity, Attribute::HP, ECS::GetContextTime(), false, 0.0f, false, FGameAttributeModificationValue()) * 100.0f) / local_25;
            }
        }
        else
        {
            local_11 = FGameAttributeUtils::GetAttributeValue(TargetEntity, Attribute::HP, ECS::GetContextTime(), false, 0.0f, false, FGameAttributeModificationValue());
        }
        float32 local_3 = this.BaseScoreByHP.GetFloatValue(local_11, 0.0f);
        if (this.bUseMultiplierCurve)
        {
            local_12 = this.MultiplierByHP.GetFloatValue(local_11, 0.0f);
        }
        else
        {
            local_12 = this.Multiplier;
        }
        return local_3 * local_12;
    }
}

struct FAITargetingScorer_HealHP : FAITargetingScorer
{
    FAITargetingScorer _base_FAITargetingScorer;
    UPROPERTY()
    FRuntimeFloatCurve BaseScoreByHealHP;
    UPROPERTY()
    bool bUseMultiplierCurve;
    UPROPERTY()
    float32 Multiplier;
    UPROPERTY()
    FRuntimeFloatCurve MultiplierByHealHP;
    UPROPERTY()
    float32 StatisticTime;

    FAITargetingScorer_HealHP()
    {
        this.bUseMultiplierCurve = false;
        this.Multiplier = 1.0f;
        this.StatisticTime = 10.0f;
        this.__InitDefaults();
        return;
    }
    float32 CalculateScore_Implementation(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity, const FAISmartValueContext &inout Context) const
    {
        int local_10 = 0;
        float32 local_18;
        if (!(SourceEntity.IsValid()) || !(TargetEntity.IsValid()))
        {
            return 0.0f;
        }
        if (!(local_10))
        {
            return 0.0f;
        }
        float32 local_15 = local_10.GetHealAmountInDuration(ECS::GetContextTime(), this.StatisticTime);
        float32 local_11 = this.BaseScoreByHealHP.GetFloatValue(local_15, 0.0f);
        if (this.bUseMultiplierCurve)
        {
            local_18 = this.MultiplierByHealHP.GetFloatValue(local_15, 0.0f);
        }
        else
        {
            local_18 = this.Multiplier;
        }
        return local_11 * local_18;
    }
}

struct FAITargetingScorer_DamageReceived : FAITargetingScorer
{
    FAITargetingScorer _base_FAITargetingScorer;
    UPROPERTY()
    FRuntimeFloatCurve BaseScoreByDamage;
    UPROPERTY()
    bool bUseMultiplierCurve;
    UPROPERTY()
    float32 Multiplier;
    UPROPERTY()
    FRuntimeFloatCurve MultiplierByDamage;
    UPROPERTY()
    EDamageTraceMode TraceMode;
    UPROPERTY()
    float32 StatisticTime;
    UPROPERTY()
    bool bUsePercentageDamage;

    FAITargetingScorer_DamageReceived()
    {
        this.bUseMultiplierCurve = false;
        this.Multiplier = 1.0f;
        this.TraceMode = EDamageTraceMode(0);
        this.StatisticTime = 10.0f;
        this.bUsePercentageDamage = false;
        this.__InitDefaults();
        return;
    }
    float32 CalculateScore_Implementation(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity, const FAISmartValueContext &inout Context) const
    {
        int local_10 = 0;
        int local_18 = 0;
        float32 local_35;
        if (!(SourceEntity.IsValid()) || !(TargetEntity.IsValid()))
        {
            return 0.0f;
        }
        if (!(local_10))
        {
            return 0.0f;
        }
        float32 local_3 = this.GetDamageAmount(local_10, TargetEntity);
        if (this.bUsePercentageDamage)
        {
            if (!(local_18))
            {
                return 0.0f;
            }
            float32 local_33 = FGameAttributeUtils::GetAttributeValue(SourceEntity, Attribute::HPMax, ECS::GetContextTime(), false, 0.0f, false, FGameAttributeModificationValue());
            if (local_33 > 0.0f)
            {
                local_3 = (local_3 / local_33) * 100.0f;
            }
            else
            {
                return 0.0f;
            }
        }
        float32 local_19 = this.BaseScoreByDamage.GetFloatValue(local_3, 0.0f);
        if (this.bUseMultiplierCurve)
        {
            local_35 = this.MultiplierByDamage.GetFloatValue(local_3, 0.0f);
        }
        else
        {
            local_35 = this.Multiplier;
        }
        return local_19 * local_35;
    }
    float32 GetDamageAmount(const FC_DamageReceivedStatistic &inout DamageStatistic, const FECSEntity &inout DamageSourceEntity) const
    {
        if (int(this.TraceMode) == 0)
        {
            float32 local_5 = 0.0f;
            FFPTime local_16 = (ECS::GetContextTime() - FFPTime(this.StatisticTime));
            int local_18 = DamageStatistic.DamageRecords.Num() - 1;
            for (; local_18 >= 0; --local_18)
            {
                if (FFPTime(DamageStatistic.DamageRecords[local_18].Time).opCmp(local_16) < 0)
                {
                    break;
                }
                if ((FECSEntity(DamageStatistic.DamageRecords[local_18].DamageSource) == DamageSourceEntity))
                {
                    local_5 = local_5 + DamageStatistic.DamageRecords[local_18].DamageAmount;
                }
            }
            return local_5;
        }
        else
        {
            if (int(this.TraceMode) == 1)
            {
                float32 local_5_2 = 0.0f;
                int local_18_2 = 0;
                while (local_18_2 < 0)
                {
                    if ((FECSEntity(DamageStatistic.DamageRecords[local_18_2].DamageSource) == DamageSourceEntity))
                    {
                        local_5_2 = local_5_2 + DamageStatistic.DamageRecords[local_18_2].DamageAmount;
                    }
                    ++local_18_2;
                }
                return local_5_2;
            }
            else
            {
                int local_17 = DamageStatistic.DamageRecords.Num() - 1;
                for (; local_17 >= 0; --local_17)
                {
                    if ((FECSEntity(DamageStatistic.DamageRecords[local_17].DamageSource) == DamageSourceEntity))
                    {
                        return DamageStatistic.DamageRecords[local_17].DamageAmount;
                    }
                }
                return 0.0f;
            }
        }
    }
}

struct FAITargetingScorer_Hostility : FAITargetingScorer
{
    FAITargetingScorer _base_FAITargetingScorer;
    UPROPERTY()
    FRuntimeFloatCurve RatingByHostility;
    UPROPERTY()
    bool bUseMultiplierCurve;
    UPROPERTY()
    float32 Multiplier;
    UPROPERTY()
    FRuntimeFloatCurve MultiplierByHostility;

    FAITargetingScorer_Hostility()
    {
        this.RatingByHostility = FRuntimeCurveUtils::CreateLinear(0.0f, 0.0f, 0.5f, 40.0f);
        this.bUseMultiplierCurve = false;
        this.Multiplier = 1.0f;
        this.__InitDefaults();
        return;
    }
    float32 CalculateScore_Implementation(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity, const FAISmartValueContext &inout Context) const
    {
        float32 local_24;
        if (!(SourceEntity.IsValid()) || !(TargetEntity.IsValid()))
        {
            return 0.0f;
        }
        float32 local_4 = 0.0f;
        Get local_8;
        const FC_AITargetingV2& local_10 = local_8.opCall();
        if (local_10)
        {
            FTargetHostilityInfo local_18;
            if (local_10.TargetsHostilityMap.Find(FTargetEntity(TargetEntity), local_18))
            {
                local_4 = local_18.Hostility;
            }
        }
        float32 local_22 = this.RatingByHostility.GetFloatValue(local_4, 0.0f);
        if (this.bUseMultiplierCurve)
        {
            local_24 = this.MultiplierByHostility.GetFloatValue(local_4, 0.0f);
        }
        else
        {
            local_24 = this.Multiplier;
        }
        return local_22 * local_24;
    }
}

struct FAITargetingScorer_BaseHatred : FAITargetingScorer
{
    FAITargetingScorer _base_FAITargetingScorer;
    UPROPERTY()
    bool bUseMultiplierCurve;
    UPROPERTY()
    float32 Multiplier;
    UPROPERTY()
    FRuntimeFloatCurve MultiplierByBaseHatred;

    FAITargetingScorer_BaseHatred()
    {
        this.bUseMultiplierCurve = false;
        this.Multiplier = 1.0f;
        this.__InitDefaults();
        return;
    }
    float32 CalculateScore_Implementation(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity, const FAISmartValueContext &inout Context) const
    {
        float32 local_26;
        if (!(SourceEntity.IsValid()) || !(TargetEntity.IsValid()))
        {
            return 0.0f;
        }
        float32 local_4 = 0.0f;
        Get local_8;
        const FC_GameAttribute& local_10 = local_8.opCall();
        if (local_10)
        {
            if (local_10.HasAttribute(Attribute::BaseHatred))
            {
                local_4 = FGameAttributeUtils::GetAttributeValue(TargetEntity, Attribute::BaseHatred, ECS::GetContextTime(), false, 0.0f, false, FGameAttributeModificationValue());
            }
        }
        if (this.bUseMultiplierCurve)
        {
            local_26 = this.MultiplierByBaseHatred.GetFloatValue(local_4, 0.0f);
        }
        else
        {
            local_26 = this.Multiplier;
        }
        return local_4 * local_26;
    }
}

struct FAITargetingScorer_GameplayTag : FAITargetingScorer
{
    FAITargetingScorer _base_FAITargetingScorer;
    UPROPERTY()
    TMap<FGameplayTag, float32> GameplayTagScoreMap;
    UPROPERTY()
    EMultiTagScoreMode MultiTagScoreMode;
    UPROPERTY()
    float32 Multiplier;

    FAITargetingScorer_GameplayTag()
    {
        this.MultiTagScoreMode = EMultiTagScoreMode(0);
        this.Multiplier = 1.0f;
        this.__InitDefaults();
        return;
    }
    float32 CalculateScore_Implementation(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity, const FAISmartValueContext &inout Context) const
    {
        float32 local_3 = 0.0f;
        float32 local_29;
        if (!(SourceEntity.IsValid()) || !(TargetEntity.IsValid()))
        {
            return 0.0f;
        }
        float32 local_4 = 0.0f;
        bool local_5 = false;
        for (auto& local_24 : this.GameplayTagScoreMap)
        {
            if (TargetEntity.MatchGameplayTag(local_24.GetKey()))
            {
                local_5 = true;
                if (int(this.MultiTagScoreMode) == 0)
                {
                    local_4 = local_4 + local_3;
                    continue;
                }
                local_3 = FMath::Abs(local_4);
                if (FMath::Abs(local_3) > local_3)
                {
                    local_4 = local_3;
                }
            }
        }
        if (local_5)
        {
            local_29 = local_4 * this.Multiplier;
        }
        else
        {
            local_29 = 0.0f;
        }
        return local_29;
    }
}

struct FAITargetingScorer_EBBEntity : FAITargetingScorer
{
    FAITargetingScorer _base_FAITargetingScorer;
    UPROPERTY()
    TArray<FAISmartEntityScore> SpecificTargetScoreMap;
    UPROPERTY()
    float32 Multiplier;

    FAITargetingScorer_EBBEntity()
    {
        this.Multiplier = 1.0f;
        this.__InitDefaults();
        return;
    }
    float32 CalculateScore_Implementation(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity, const FAISmartValueContext &inout Context) const
    {
        if (!(SourceEntity.IsValid()) || !(TargetEntity.IsValid()))
        {
            return 0.0f;
        }
        FECSEntityId local_5 = TargetEntity.GetId();
        for (auto& local_20 : this.SpecificTargetScoreMap)
        {
            FECSEntityId local_4 = local_20.Entity.GetValue(Context);
            if ((!((local_4 == ENTITY_ID_NULL)) && (local_4 == local_5)))
            {
                return (local_20.Score * this.Multiplier);
            }
        }
        return 0.0f;
    }
}

struct FAITargetingScorer_TargetType : FAITargetingScorer
{
    FAITargetingScorer _base_FAITargetingScorer;
    UPROPERTY()
    float32 PlayerScore;
    UPROPERTY()
    TMap<ENPCCombatPriority, float32> NPCCombatPriorityScoreMap;
    UPROPERTY()
    TMap<EMonsterRank, float32> MonsterRankScoreMap;
    UPROPERTY()
    float32 FallbackScore;
    UPROPERTY()
    float32 Multiplier;

    FAITargetingScorer_TargetType()
    {
        this.PlayerScore = 10.0f;
        this.FallbackScore = 1.0f;
        this.Multiplier = 1.0f;
        this.__InitDefaults();
        return;
    }
    float32 CalculateScore_Implementation(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity, const FAISmartValueContext &inout Context) const
    {
        float32 local_15;
        if (!(SourceEntity.IsValid()) || !(TargetEntity.IsValid()))
        {
            return 0.0f;
        }
        float32 local_4 = this.FallbackScore;
        Has local_8;
        bool local_2 = local_8.opCall();
        if (local_2)
        {
            local_4 = this.PlayerScore;
        }
        else
        {
            Get local_12;
            const FC_NPCIdentity& local_14 = local_12.opCall();
            if (local_14)
            {
                if (this.NPCCombatPriorityScoreMap.Find(local_14.GetCombatPriority(), local_15))
                {
                    local_4 = local_15;
                }
            }
            else
            {
                Get local_20;
                const FC_MonsterInfo& local_22 = local_20.opCall();
                if (local_22)
                {
                    if (this.MonsterRankScoreMap.Find(local_22.GetMonsterRank(), local_15))
                    {
                        local_4 = local_15;
                    }
                }
            }
        }
        return (local_4 * this.Multiplier);
    }
}

struct FAITargetingScorer_BeTaunted : FAITargetingScorer
{
    FAITargetingScorer _base_FAITargetingScorer;
    UPROPERTY()
    float32 TauntScore;
    UPROPERTY()
    float32 Multiplier;

    FAITargetingScorer_BeTaunted()
    {
        this.TauntScore = 100.0f;
        this.Multiplier = 1.0f;
        this.__InitDefaults();
        return;
    }
    float32 CalculateScore_Implementation(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity, const FAISmartValueContext &inout Context) const
    {
        int local_10 = 0;
        if (!(SourceEntity.IsValid()) || !(TargetEntity.IsValid()))
        {
            return 0.0f;
        }
        if (!(local_10))
        {
            return 0.0f;
        }
        FECSEntity local_18 = ::FASCommonUtils::GetControlledPawnEntity(local_10.GetFromEntity());
        if ((local_18 == TargetEntity))
        {
            return (this.TauntScore * this.Multiplier);
        }
        return 0.0f;
    }
}

struct FAITargetingScorer_ExternalTarget : FAITargetingScorer
{
    FAITargetingScorer _base_FAITargetingScorer;
    UPROPERTY()
    TMap<EAIExternalTargetPriority, float32> PriorityScoreMap;
    UPROPERTY()
    float32 Multiplier;

    FAITargetingScorer_ExternalTarget()
    {
        this.Multiplier = 1.0f;
        this.__InitDefaults();
        return;
    }
    float32 CalculateScore_Implementation(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity, const FAISmartValueContext &inout Context) const
    {
        int local_10 = 0;
        if (!(SourceEntity.IsValid()) || !(TargetEntity.IsValid()))
        {
            return 0.0f;
        }
        if (!(local_10))
        {
            return 0.0f;
        }
        FTargetEntity local_14 = FTargetEntity(TargetEntity);
        bool local_15 = false;
        EAIExternalTargetPriority local_16 = EAIExternalTargetPriority(0);
        for (auto& local_32 : local_10.ExternalTargets)
        {
            if (!((local_32.Target == local_14)))
            {
                continue;
            }
            if (!(local_15) || ((int(local_32.Priority) > int(local_16))))
            {
                local_16 = local_32.Priority;
                local_15 = true;
            }
        }
        if (!(local_15))
        {
            return 0.0f;
        }
        float32 local_35 = 0.0f;
        if (!(this.PriorityScoreMap.Find(local_16, local_35)))
        {
            return 0.0f;
        }
        return (local_35 * this.Multiplier);
    }
}

struct FAITargetingScorer_TimeAsTarget : FAITargetingScorer
{
    FAITargetingScorer _base_FAITargetingScorer;
    UPROPERTY()
    FRuntimeFloatCurve RatingByTimeAsTarget;
    UPROPERTY()
    bool bUseMultiplierCurve;
    UPROPERTY()
    float32 Multiplier;
    UPROPERTY()
    FRuntimeFloatCurve MultiplierByTimeAsTarget;

    FAITargetingScorer_TimeAsTarget()
    {
        this.bUseMultiplierCurve = false;
        this.Multiplier = 1.0f;
        this.__InitDefaults();
        return;
    }
    float32 CalculateScore_Implementation(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity, const FAISmartValueContext &inout Context) const
    {
        int local_10 = 0;
        float32 local_38;
        if (!(SourceEntity.IsValid()) || !(TargetEntity.IsValid()))
        {
            return 0.0f;
        }
        if (!(local_10))
        {
            return 0.0f;
        }
        FECSEntityId local_12 = TargetEntity.GetId();
        FFPTime local_16 = ECS::GetContextTime();
        for (auto& local_30 : local_10.QueryOutputRecords)
        {
            if ((local_30.Value == local_12))
            {
                float32 local_3 = float32(((local_16 - local_30.UpdateTime).ToSeconds()));
                float32 local_36 = this.RatingByTimeAsTarget.GetFloatValue(local_3, 0.0f);
                if (this.bUseMultiplierCurve)
                {
                    local_38 = this.MultiplierByTimeAsTarget.GetFloatValue(local_3, 0.0f);
                }
                else
                {
                    local_38 = this.Multiplier;
                }
                return local_36 * local_38;
            }
        }
        return 0.0f;
    }
}

struct FAITargetingScorer_SelectedTargets : FAITargetingScorer
{
    FAITargetingScorer _base_FAITargetingScorer;
    UPROPERTY()
    float32 Multiplier;
    UPROPERTY()
    float32 Score;

    FAITargetingScorer_SelectedTargets()
    {
        this.Multiplier = 1.0f;
        this.Score = 0.0f;
        this.__InitDefaults();
        return;
    }
    float32 CalculateScore_Implementation(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity, const FAISmartValueContext &inout Context) const
    {
        int local_10 = 0;
        if (!(SourceEntity.IsValid()) || !(TargetEntity.IsValid()))
        {
            return 0.0f;
        }
        if (!(local_10))
        {
            return 0.0f;
        }
        if (local_10.SelectedMarks.Contains(TargetEntity.GetId()))
        {
            return (this.Score * this.Multiplier);
        }
        return 0.0f;
    }
}

struct FAITargetingScorer_BeTargetedStress : FAITargetingScorer
{
    FAITargetingScorer _base_FAITargetingScorer;
    UPROPERTY()
    FRuntimeFloatCurve RatingByBeTargetedStress;
    UPROPERTY()
    float32 Multiplier;

    FAITargetingScorer_BeTargetedStress()
    {
        this.RatingByBeTargetedStress = FRuntimeCurveUtils::CreateAutoTangent(0.0f, 0.0f, 5.0f, -25.0f, 10.0f, -100.0f);
        this.Multiplier = 1.0f;
        this.__InitDefaults();
        return;
    }
    float32 CalculateScore_Implementation(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity, const FAISmartValueContext &inout Context) const
    {
        FC_PlayerBeTargeted local_10;
        if (!(SourceEntity.IsValid()) || !(TargetEntity.IsValid()))
        {
            return 0.0f;
        }
        if (!(local_10))
        {
            return 0.0f;
        }
        return this.RatingByBeTargetedStress.GetFloatValue(local_10.BeTargetedStress, 0.0f) * this.Multiplier;
    }
}

namespace ECSFunc_FC_AITargetingQueryDataCache
{
UFUNCTION()
bool HasAITargetingQueryDataCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AITargetingQueryDataCache);
}
FC_AITargetingQueryDataCache& AssignAITargetingQueryDataCache(const FECSEntity &inout Entity, const FC_AITargetingQueryDataCache &inout DefaultValue = FC_AITargetingQueryDataCache())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AITargetingQueryDataCache, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAITargetingQueryDataCache_BP(const FECSEntity &inout Entity, const FC_AITargetingQueryDataCache &inout DefaultValue = FC_AITargetingQueryDataCache())
{
    ECSFunc_FC_AITargetingQueryDataCache::AssignAITargetingQueryDataCache(Entity, DefaultValue);
    return;
}
FC_AITargetingQueryDataCache& ModifyAITargetingQueryDataCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AITargetingQueryDataCache));
    return local_12.GetComp();
}
FC_AITargetingQueryDataCache& ModifyOrAddAITargetingQueryDataCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AITargetingQueryDataCache));
    return local_12.GetComp();
}
const FC_AITargetingQueryDataCache& GetAITargetingQueryDataCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AITargetingQueryDataCache));
    return local_12.GetComp();
}
UFUNCTION()
FC_AITargetingQueryDataCache GetAITargetingQueryDataCache_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AITargetingQueryDataCache __r;
    bValid = false;
    bValid = ECSFunc_FC_AITargetingQueryDataCache::GetAITargetingQueryDataCache(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AITargetingQueryDataCache GetDefaultedAITargetingQueryDataCache(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AITargetingQueryDataCache __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AITargetingQueryDataCache);
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
FC_AITargetingQueryDataCache GetDefaultedAITargetingQueryDataCache_BP(const FECSEntity &inout Entity)
{
    FC_AITargetingQueryDataCache __r;
    return __r;
}
UFUNCTION()
bool RemoveAITargetingQueryDataCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AITargetingQueryDataCache);
}
}
FECSMonitorRuntimeView __GetMonitorAITargetingQueryDataCacheOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AITargetingQueryDataCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingQueryDataCacheOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AITargetingQueryDataCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingQueryDataCacheOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AITargetingQueryDataCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingQueryDataCacheOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AITargetingQueryDataCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingQueryDataCacheOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AITargetingQueryDataCache, bFixedFrame, bMustHandleAll);
}
void __MonitorAITargetingQueryDataCacheLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AITargetingQueryDataCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAITargetingQueryDataCacheActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AITargetingQueryDataCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAITargetingQueryDataCacheModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AITargetingQueryDataCache, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AITargetingV2
{
UFUNCTION()
bool HasAITargetingV2(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AITargetingV2);
}
FC_AITargetingV2& AssignAITargetingV2(const FECSEntity &inout Entity, const FC_AITargetingV2 &inout DefaultValue = FC_AITargetingV2())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AITargetingV2, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAITargetingV2_BP(const FECSEntity &inout Entity, const FC_AITargetingV2 &inout DefaultValue = FC_AITargetingV2())
{
    ECSFunc_FC_AITargetingV2::AssignAITargetingV2(Entity, DefaultValue);
    return;
}
FC_AITargetingV2& ModifyAITargetingV2(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AITargetingV2));
    return local_12.GetComp();
}
FC_AITargetingV2& ModifyOrAddAITargetingV2(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AITargetingV2));
    return local_12.GetComp();
}
const FC_AITargetingV2& GetAITargetingV2(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AITargetingV2));
    return local_12.GetComp();
}
UFUNCTION()
FC_AITargetingV2 GetAITargetingV2_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AITargetingV2 __r;
    bValid = false;
    bValid = ECSFunc_FC_AITargetingV2::GetAITargetingV2(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AITargetingV2 GetDefaultedAITargetingV2(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AITargetingV2 __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AITargetingV2);
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
FC_AITargetingV2 GetDefaultedAITargetingV2_BP(const FECSEntity &inout Entity)
{
    FC_AITargetingV2 __r;
    return __r;
}
UFUNCTION()
bool RemoveAITargetingV2(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AITargetingV2);
}
}
FECSMonitorRuntimeView __GetMonitorAITargetingV2OnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AITargetingV2, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingV2OnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AITargetingV2, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingV2OnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AITargetingV2, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingV2OnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AITargetingV2, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingV2OnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AITargetingV2, bFixedFrame, bMustHandleAll);
}
void __MonitorAITargetingV2Lifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AITargetingV2, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAITargetingV2Activity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AITargetingV2, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAITargetingV2Modification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AITargetingV2, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AITargetingSync
{
UFUNCTION()
bool HasAITargetingSync(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AITargetingSync);
}
FC_AITargetingSync& AssignAITargetingSync(const FECSEntity &inout Entity, const FC_AITargetingSync &inout DefaultValue = FC_AITargetingSync())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AITargetingSync, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAITargetingSync_BP(const FECSEntity &inout Entity, const FC_AITargetingSync &inout DefaultValue = FC_AITargetingSync())
{
    ECSFunc_FC_AITargetingSync::AssignAITargetingSync(Entity, DefaultValue);
    return;
}
FC_AITargetingSync& ModifyAITargetingSync(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AITargetingSync));
    return local_12.GetComp();
}
FC_AITargetingSync& ModifyOrAddAITargetingSync(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AITargetingSync));
    return local_12.GetComp();
}
const FC_AITargetingSync& GetAITargetingSync(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AITargetingSync));
    return local_12.GetComp();
}
UFUNCTION()
FC_AITargetingSync GetAITargetingSync_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AITargetingSync __r;
    bValid = false;
    bValid = ECSFunc_FC_AITargetingSync::GetAITargetingSync(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AITargetingSync GetDefaultedAITargetingSync(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AITargetingSync __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AITargetingSync);
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
FC_AITargetingSync GetDefaultedAITargetingSync_BP(const FECSEntity &inout Entity)
{
    FC_AITargetingSync __r;
    return __r;
}
UFUNCTION()
bool RemoveAITargetingSync(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AITargetingSync);
}
}
FECSMonitorRuntimeView __GetMonitorAITargetingSyncOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AITargetingSync, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingSyncOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AITargetingSync, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingSyncOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AITargetingSync, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingSyncOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AITargetingSync, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAITargetingSyncOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AITargetingSync, bFixedFrame, bMustHandleAll);
}
void __MonitorAITargetingSyncLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AITargetingSync, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAITargetingSyncActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AITargetingSync, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAITargetingSyncModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AITargetingSync, bFixedFrame, Details);
    return;
}
