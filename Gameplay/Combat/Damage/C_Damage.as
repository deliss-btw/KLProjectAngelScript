
enum EDamageValueModifyType
{
    Additive,
    Override,
    Multiply,
}

enum EDamageFinalValueType
{
    DamageToHP,
    PostureDamage,
    AbnormalStateAccumulation,
}

enum EBaseDamagePartType
{
    HPDamage,
    HPDamage_MaxPercent,
    PostureDamage,
    EcologyPostureDamage,
    AbnormalStateAccumulation,
}

enum EHitStateType
{
    None,
    DefenseState,
    PostureStagger,
    AbnormalOtherHitState,
    BodyPartDestroy,
    MutualClash,
    AbnormalElectrifiedWeakness,
    AbnormalFreezeWeakness,
    PostureBreak,
}

enum EHPChangeType
{
    Damage,
    Heal,
    LifeDrain,
}

namespace FDamageUtils
{
    const int DEFAULT_PRIORITY = 0;
    const int HIGHEST_PRIORITY = 99;
    const FString HitNotBreakingStateName = FString();
    const FString HitLightlyStateName = FString();
    const FString HitHeavyStateName = FString();
    const FString HitBlowStateName = FString();
    const FString HitStaggerStateName = FString();
    const FString HitBreakStateName = FString();
    const FString LieDownHitStateName = FString();
    const FString KnockDownHitStateName = FString();
    const FString HeadDestroyStateName = FString();
    const FString HitMutualClashStateName = FString();
    const FString HitBurningStateName = FString();
    const FString HitDoomedStateName = FString();
    const FString HitLightStateName = FString();
    const FString HitDarkStateName = FString();
    const FString HitFreezeStateName = FString();
    const FString HitElectrifiedStateName = FString();
    const TMap<FName, int> HitStatePriorityMap = TMap<FName, int>();
}
namespace __INTENRAL_FCS_DamageToCalculateFrame_NS
{
    const TECSComponentDerivedPtr<FCS_DamageToCalculateFrame> DerivedPtr = TECSComponentDerivedPtr<FCS_DamageToCalculateFrame>();
    const FCS_DamageToCalculateFrame DefaultValue = FCS_DamageToCalculateFrame();
}
namespace __INTENRAL_FC_TakeDamageWaitingCalculation_NS
{
    const TECSComponentDerivedPtr<FC_TakeDamageWaitingCalculation> DerivedPtr = TECSComponentDerivedPtr<FC_TakeDamageWaitingCalculation>();
    const FC_TakeDamageWaitingCalculation DefaultValue = FC_TakeDamageWaitingCalculation();
}
namespace __INTENRAL_FC_DealDamageFrame_NS
{
    const TECSComponentDerivedPtr<FC_DealDamageFrame> DerivedPtr = TECSComponentDerivedPtr<FC_DealDamageFrame>();
    const FC_DealDamageFrame DefaultValue = FC_DealDamageFrame();
}
namespace __INTENRAL_FC_TakeDamageToCalculateFrame_NS
{
    const TECSComponentDerivedPtr<FC_TakeDamageToCalculateFrame> DerivedPtr = TECSComponentDerivedPtr<FC_TakeDamageToCalculateFrame>();
    const FC_TakeDamageToCalculateFrame DefaultValue = FC_TakeDamageToCalculateFrame();
}
namespace __INTENRAL_FC_DamageToApplyFrame_NS
{
    const TECSComponentDerivedPtr<FC_DamageToApplyFrame> DerivedPtr = TECSComponentDerivedPtr<FC_DamageToApplyFrame>();
    const FC_DamageToApplyFrame DefaultValue = FC_DamageToApplyFrame();
}
namespace __INTENRAL_FC_HitStateTypeFrame_NS
{
    const TECSComponentDerivedPtr<FC_HitStateTypeFrame> DerivedPtr = TECSComponentDerivedPtr<FC_HitStateTypeFrame>();
    const FC_HitStateTypeFrame DefaultValue = FC_HitStateTypeFrame();
}
namespace __INTENRAL_FC_HPPreChange_NS
{
    const TECSComponentDerivedPtr<FC_HPPreChange> DerivedPtr = TECSComponentDerivedPtr<FC_HPPreChange>();
    const FC_HPPreChange DefaultValue = FC_HPPreChange();
}
namespace __INTENRAL_FC_PosturePreChange_NS
{
    const TECSComponentDerivedPtr<FC_PosturePreChange> DerivedPtr = TECSComponentDerivedPtr<FC_PosturePreChange>();
    const FC_PosturePreChange DefaultValue = FC_PosturePreChange();
}
namespace __INTENRAL_FC_BodyPartPreChange_NS
{
    const TECSComponentDerivedPtr<FC_BodyPartPreChange> DerivedPtr = TECSComponentDerivedPtr<FC_BodyPartPreChange>();
    const FC_BodyPartPreChange DefaultValue = FC_BodyPartPreChange();
}
namespace __INTENRAL_FC_AbnormalValuePreChange_NS
{
    const TECSComponentDerivedPtr<FC_AbnormalValuePreChange> DerivedPtr = TECSComponentDerivedPtr<FC_AbnormalValuePreChange>();
    const FC_AbnormalValuePreChange DefaultValue = FC_AbnormalValuePreChange();
}
namespace __INTENRAL_FC_MutualClashPreChange_NS
{
    const TECSComponentDerivedPtr<FC_MutualClashPreChange> DerivedPtr = TECSComponentDerivedPtr<FC_MutualClashPreChange>();
    const FC_MutualClashPreChange DefaultValue = FC_MutualClashPreChange();
}
namespace __INTENRAL_FC_DefensePreChange_NS
{
    const TECSComponentDerivedPtr<FC_DefensePreChange> DerivedPtr = TECSComponentDerivedPtr<FC_DefensePreChange>();
    const FC_DefensePreChange DefaultValue = FC_DefensePreChange();
}
namespace __INTENRAL_FC_HitStateFrame_NS
{
    const TECSComponentDerivedPtr<FC_HitStateFrame> DerivedPtr = TECSComponentDerivedPtr<FC_HitStateFrame>();
    const FC_HitStateFrame DefaultValue = FC_HitStateFrame();
}
namespace __INTENRAL_FC_DamageNumFrame_NS
{
    const TECSComponentDerivedPtr<FC_DamageNumFrame> DerivedPtr = TECSComponentDerivedPtr<FC_DamageNumFrame>();
    const FC_DamageNumFrame DefaultValue = FC_DamageNumFrame();
}
namespace __INTENRAL_FC_PotentialDamage_NS
{
    const TECSComponentDerivedPtr<FC_PotentialDamage> DerivedPtr = TECSComponentDerivedPtr<FC_PotentialDamage>();
    const FC_PotentialDamage DefaultValue = FC_PotentialDamage();
}
namespace __INTENRAL_FC_NewDamageResolvedTag_NS
{
    const TECSComponentDerivedPtr<FC_NewDamageResolvedTag> DerivedPtr = TECSComponentDerivedPtr<FC_NewDamageResolvedTag>();
    const FC_NewDamageResolvedTag DefaultValue = FC_NewDamageResolvedTag();
}
namespace __INTENRAL_FC_WeakDamageTypeInfo_NS
{
    const TECSComponentDerivedPtr<FC_WeakDamageTypeInfo> DerivedPtr = TECSComponentDerivedPtr<FC_WeakDamageTypeInfo>();
    const FC_WeakDamageTypeInfo DefaultValue = FC_WeakDamageTypeInfo();
}
namespace __INTENRAL_FC_DamageReceiverTransfer_NS
{
    const TECSComponentDerivedPtr<FC_DamageReceiverTransfer> DerivedPtr = TECSComponentDerivedPtr<FC_DamageReceiverTransfer>();
    const FC_DamageReceiverTransfer DefaultValue = FC_DamageReceiverTransfer();
}
namespace __INTENRAL_FC_DamageStatisticFrame_NS
{
    const TECSComponentDerivedPtr<FC_DamageStatisticFrame> DerivedPtr = TECSComponentDerivedPtr<FC_DamageStatisticFrame>();
    const FC_DamageStatisticFrame DefaultValue = FC_DamageStatisticFrame();
}
namespace __INTENRAL_FC_DamageReceivedStatistic_NS
{
    const TECSComponentDerivedPtr<FC_DamageReceivedStatistic> DerivedPtr = TECSComponentDerivedPtr<FC_DamageReceivedStatistic>();
    const FC_DamageReceivedStatistic DefaultValue = FC_DamageReceivedStatistic();
}
namespace __INTENRAL_FC_EcologyPostureProtect_NS
{
    const TECSComponentDerivedPtr<FC_EcologyPostureProtect> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyPostureProtect>();
    const FC_EcologyPostureProtect DefaultValue = FC_EcologyPostureProtect();
}
namespace __INTENRAL_FC_LockHP_NS
{
    const TECSComponentDerivedPtr<FC_LockHP> DerivedPtr = TECSComponentDerivedPtr<FC_LockHP>();
    const FC_LockHP DefaultValue = FC_LockHP();
}
namespace __INTENRAL_FC_ComboHitReductionRecord_NS
{
    const TECSComponentDerivedPtr<FC_ComboHitReductionRecord> DerivedPtr = TECSComponentDerivedPtr<FC_ComboHitReductionRecord>();
    const FC_ComboHitReductionRecord DefaultValue = FC_ComboHitReductionRecord();
}
namespace __INTENRAL_FC_SimulateHit_NS
{
    const TECSComponentDerivedPtr<FC_SimulateHit> DerivedPtr = TECSComponentDerivedPtr<FC_SimulateHit>();
    const FC_SimulateHit DefaultValue = FC_SimulateHit();
}
namespace __INTENRAL_FCE_ServerToClientDamageEvent_NS
{
    const TECSEventDerivedPtr<FCE_ServerToClientDamageEvent> DerivedPtr = TECSEventDerivedPtr<FCE_ServerToClientDamageEvent>();
}
namespace __INTENRAL_FCE_TriggerLockHPEvent_NS
{
    const TECSEventDerivedPtr<FCE_TriggerLockHPEvent> DerivedPtr = TECSEventDerivedPtr<FCE_TriggerLockHPEvent>();

}
struct FDamageDataToState
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FName m_Name;
    UPROPERTY()
    TDataObjectPtr<FAttackData> m_AttackData;
    UPROPERTY()
    bool m_bCustomState;
    UPROPERTY()
    bool m_bOverridePriority;
    UPROPERTY()
    int m_OverridePriority;

    FDamageDataToState()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FDamageDataToState(const FDamageDataToState &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FDamageDataToState opAssign(const FDamageDataToState &inout Other)
    {
        FDamageDataToState __r;
        this.SetName(Other.GetName());
        this.SetAttackData(Other.GetAttackData());
        this.SetbCustomState(Other.GetbCustomState());
        this.SetbOverridePriority(Other.GetbOverridePriority());
        this.SetOverridePriority(Other.GetOverridePriority());
        return __r;
    }
    FName GetName() const property
    {
        return this.m_Name;
    }
    void SetName(const FName &inout __Value) property
    {
        if ((this.m_Name == __Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Name = __Value;
        return;
    }
    const TDataObjectPtr<FAttackData> GetAttackData() const property
    {
        const TDataObjectPtr<FAttackData> __r;
        return __r;
    }
    TDataObjectPtr<FAttackData> GetModify_AttackData() property
    {
        TDataObjectPtr<FAttackData> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetAttackData(const TDataObjectPtr<FAttackData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_AttackData = __Value;
        return;
    }
    bool GetbCustomState() const property
    {
        return this.m_bCustomState;
    }
    void SetbCustomState(const bool __Value) property
    {
        if (!(this.m_bCustomState) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bCustomState = __Value;
        return;
    }
    bool GetbOverridePriority() const property
    {
        return this.m_bOverridePriority;
    }
    void SetbOverridePriority(const bool __Value) property
    {
        if (!(this.m_bOverridePriority) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bOverridePriority = __Value;
        return;
    }
    int GetOverridePriority() const property
    {
        return this.m_OverridePriority;
    }
    void SetOverridePriority(const int __Value) property
    {
        if (this.m_OverridePriority == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_OverridePriority = __Value;
        return;
    }
}

struct FDamageAttributeModData
{
    UPROPERTY()
    FGameAttributeModificationValue ModValue;

    FDamageAttributeModData()
    {
        return;
    }
}

struct FDamageBeforeCalculationData
{
    UPROPERTY()
    int DamageId = 0;
    UPROPERTY()
    FFPTime Time = 0;
    UPROPERTY()
    EDamageProcedureType DamageProcedureType = EDamageProcedureType(0);
    UPROPERTY()
    EDamageCalculationType DamageCalculationType = EDamageCalculationType(0);
    UPROPERTY()
    bool bLatencyCompensation = false;
    UPROPERTY()
    FECSEntity DamageTarget;
    UPROPERTY()
    FECSEntity FinalDamageSource;
    UPROPERTY()
    FECSEntity DirectDamageSource;
    UPROPERTY()
    FECSEntity AttackerAttributeProvider;
    UPROPERTY()
    TDataObjectPtr<FAttackData> AttackData;
    UPROPERTY()
    EHitRecordType HitType = EHitRecordType(0);
    UPROPERTY()
    EDamageType DamageType = EDamageType(0);
    UPROPERTY()
    EHitBreakLevel HitBreakLevel = EHitBreakLevel(0);
    UPROPERTY()
    EAbnormalState AbnormalState = EAbnormalState(0);
    UPROPERTY()
    bool bIsWeakness = false;
    UPROPERTY()
    bool bIsAttenuated = false;
    UPROPERTY()
    float32 ExternalCoefficient = 1.0f;
    UPROPERTY()
    FName StrikeKey;
    UPROPERTY()
    FName DamageBodyPart;
    UPROPERTY()
    FVector AttackFromPosition;
    UPROPERTY()
    FVector Position;
    UPROPERTY()
    FVector Direction;
    UPROPERTY()
    FAttackBaseDamageValue BaseDamage;
    UPROPERTY()
    FAttackRecoverEnergyValue RecoverEnergyValue;
    UPROPERTY()
    FGameplayTagBisSetWrapper AttackTags;
    UPROPERTY()
    TMap<FGameAttributeRef, FDamageAttributeModData> AttributeModifications;


}

struct FCS_DamageToCalculateFrame : FECSSingleton
{
    UPROPERTY()
    TArray<FDamageBeforeCalculationData> DamageDatas;

    FCS_DamageToCalculateFrame()
    {
        return;
    }
}

struct FC_TakeDamageWaitingCalculation : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFPTime m_EarliestDamageTime;
    UPROPERTY()
    TArray<FDamageBeforeCalculationData> m_DamageDatas;

    FC_TakeDamageWaitingCalculation()
    {
        this.m_EarliestDamageTime = -1;
        this.__InitDirtyFlags();
        return;
    }
    FC_TakeDamageWaitingCalculation(const FC_TakeDamageWaitingCalculation &inout Other)
    {
        this.m_EarliestDamageTime = -1;
        this.__InitDirtyFlags();
        this.m_EarliestDamageTime = Other.m_EarliestDamageTime;
        this.m_DamageDatas = Other.m_DamageDatas;
        return;
    }
    FC_TakeDamageWaitingCalculation opAssign(const FC_TakeDamageWaitingCalculation &inout Other)
    {
        FC_TakeDamageWaitingCalculation __r;
        this.SetEarliestDamageTime(Other.GetEarliestDamageTime());
        this.SetDamageDatas(Other.GetDamageDatas());
        return __r;
    }
    void AddDamageData(const FDamageBeforeCalculationData &inout NewData)
    {
        int local_1 = 0;
        int local_2 = this.GetDamageDatas().Num();
        for (; local_1 < local_2; ++local_1)
        {
            FFPTime local_8 = this.GetDamageDatas()[local_1].Time;
            if (local_8.opCmp(NewData.Time) <= 0)
            {
                break;
            }
        }
        if (local_1 == local_2)
        {
            this.SetEarliestDamageTime(NewData.Time);
        }
        this.GetModify_DamageDatas().Insert(NewData, local_1);
        return;
    }
    const FFPTime GetEarliestDamageTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_EarliestDamageTime() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetEarliestDamageTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_EarliestDamageTime = __Value;
        return;
    }
    const TArray<FDamageBeforeCalculationData> GetDamageDatas() const property
    {
        const TArray<FDamageBeforeCalculationData> __r;
        return __r;
    }
    TArray<FDamageBeforeCalculationData> GetModify_DamageDatas() property
    {
        TArray<FDamageBeforeCalculationData> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetDamageDatas(const TArray<FDamageBeforeCalculationData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_DamageDatas = __Value;
        return;
    }
}

struct FDamageToCalculateRecordData
{
    UPROPERTY()
    int Index = -1;
    UPROPERTY()
    EDamageProcedureType DamageProcedureType = EDamageProcedureType(0);


}

struct FDealDamageToApplyData
{
    UPROPERTY()
    FECSEntity DamageTarget;
    UPROPERTY()
    int DamageToApplyIndex;


}

struct FC_DealDamageFrame : FECSComponent
{
    UPROPERTY()
    TArray<FDamageToCalculateRecordData> DamageToCalculateRecord;
    UPROPERTY()
    TArray<FDealDamageToApplyData> DamageToApply;

    FC_DealDamageFrame()
    {
        return;
    }
}

struct FC_TakeDamageToCalculateFrame : FECSComponent
{
    UPROPERTY()
    TArray<FDamageToCalculateRecordData> DamageToCalculateRecord;

    FC_TakeDamageToCalculateFrame()
    {
        return;
    }
}

struct FAttackerDamageAccumulation
{
    UPROPERTY()
    float32 DamageAddRatio = 0.0f;
    UPROPERTY()
    float32 DamageTypeAddRatio = 0.0f;
    UPROPERTY()
    float32 TeamDamageAddRatio = 0.0f;


    float32 GetTotalDamageAddRatio() const
    {
        return FMath::Max(0.0f, (((this.DamageAddRatio + 1.0f) + this.DamageTypeAddRatio) + this.TeamDamageAddRatio));
    }
}

struct FAttackerDamageMultiplication
{
    UPROPERTY()
    float32 FinalDamageRatio = 1.0f;


    float32 GetTotalDamageMultiplication() const
    {
        return FMath::Max(0.0f, this.FinalDamageRatio);
    }
}

struct FDefenderDamageAccumulation
{
    UPROPERTY()
    float32 VulnerableRatio = 0.0f;
    UPROPERTY()
    float32 TeamVulnerableRatio = 0.0f;


    float32 GetTotalVulnerableRatio() const
    {
        return FMath::Max(0.0f, ((this.VulnerableRatio + 1.0f) + this.TeamVulnerableRatio));
    }
}

struct FDefenderDamageMultiplication
{
    UPROPERTY()
    float32 DamageRatio = 1.0f;
    UPROPERTY()
    float32 DamageTypeRatio = 1.0f;
    UPROPERTY()
    float32 InnateDamageReduceRatio = 1.0f;
    UPROPERTY()
    float32 IndependentDamageRatio = 1.0f;
    UPROPERTY()
    float32 DefenseValueRatio = 1.0f;
    UPROPERTY()
    float32 DefenseStateRatio = 1.0f;
    UPROPERTY()
    float32 BodyPartRatio = 1.0f;


    float32 GetTotalDamageMultiplication() const
    {
        return FMath::Max(0.0f, ((((((this.DamageRatio * this.DamageTypeRatio) * this.InnateDamageReduceRatio) * this.IndependentDamageRatio) * this.DefenseValueRatio) * this.DefenseStateRatio) * this.BodyPartRatio));
    }
}

struct FDamageFinalValues
{
    UPROPERTY()
    float32 HPDamage = 0.0f;
    UPROPERTY()
    bool bUseEcologyPosture = false;
    UPROPERTY()
    float32 PostureDamage = 0.0f;
    UPROPERTY()
    bool bCritical = false;
    UPROPERTY()
    bool bHitWeakness = false;
    UPROPERTY()
    bool bAbnormalEnhanced = false;
    UPROPERTY()
    EAbnormalState AbnormalState = EAbnormalState(0);
    UPROPERTY()
    float32 AbnormalStateAccumulation = 0.0f;
    UPROPERTY()
    FName DamageBodyPart = NAME_None;
    UPROPERTY()
    float32 EnvBreakDamage = 0.0f;


}

struct FDamageHitData
{
    UPROPERTY()
    EHitBreakLevel HitBreakLevel = EHitBreakLevel(0);
    UPROPERTY()
    EHitRecordType HitType = EHitRecordType(1);
    UPROPERTY()
    FVector Position;
    UPROPERTY()
    FVector AttackFromPosition;
    UPROPERTY()
    FVector Direction;
    UPROPERTY()
    bool bHitWeakness = false;
    UPROPERTY()
    bool bAttenuated = false;
    UPROPERTY()
    FName StrikeKey;
    UPROPERTY()
    FName HitBodyPart;


}

struct FDamageApplyData
{
    UPROPERTY()
    FECSEntity FinalDamageSource;
    UPROPERTY()
    FECSEntity DirectDamageCauser;
    UPROPERTY()
    FAttackBaseDamageValue BaseDamage;
    UPROPERTY()
    FAttackerDamageAccumulation AttackerAccumulationValues;
    UPROPERTY()
    FAttackerDamageMultiplication AttackerMultiplicationValues;
    UPROPERTY()
    FDefenderDamageAccumulation DefenderAccumulationValues;
    UPROPERTY()
    FDefenderDamageMultiplication DefenderMultiplicationValues;
    UPROPERTY()
    float32 DealPostureDamageRatio = 1.0f;
    UPROPERTY()
    float32 TakePostureDamageRatio = 1.0f;
    UPROPERTY()
    float32 CriticalRating = 0.0f;
    UPROPERTY()
    float32 CriticalDamage = 0.0f;
    UPROPERTY()
    float32 ComboDamageReductionRatio = 1.0f;
    UPROPERTY()
    float32 ContinuouslyHitProtectRatio = 1.0f;
    UPROPERTY()
    float32 GameModeCoefficient = 1.0f;
    UPROPERTY()
    float32 ExternalCoefficient = 1.0f;
    UPROPERTY()
    bool bDefenseSuccess = false;
    UPROPERTY()
    EDamageProcedureType DamageProcedureType = EDamageProcedureType(0);
    UPROPERTY()
    EDamageCalculationType DamageCalculationType = EDamageCalculationType(0);
    UPROPERTY()
    EDamageType DamageType = EDamageType(0);
    UPROPERTY()
    FDamageHitData HitData;
    UPROPERTY()
    TDataObjectPtr<FAttackData> AttackData;
    UPROPERTY()
    TMap<FGameAttributeRef, float32> RecoverAttributeValues;
    UPROPERTY()
    FDamageFinalValues FinalValues;


}

struct FC_DamageToApplyFrame : FECSComponent
{
    UPROPERTY()
    TArray<FDamageApplyData> Datas;

    FC_DamageToApplyFrame()
    {
        return;
    }
}

struct FC_HitStateTypeFrame : FECSComponent
{
    UPROPERTY()
    EHitStateType HitStateType = EHitStateType(0);


}

struct FHPChangeData
{
    UPROPERTY()
    FECSEntity SourceEntity;
    UPROPERTY()
    float32 DeltaValue = 0.0f;
    UPROPERTY()
    EHPChangeType ChangeType = EHPChangeType(0);
    UPROPERTY()
    int DamageEventId = -1;


}

struct FC_HPPreChange : FECSComponent
{
    UPROPERTY()
    bool bLock = false;
    UPROPERTY()
    TArray<FHPChangeData> Changes;


}

struct FPostureChangeData
{
    UPROPERTY()
    FECSEntity SourceEntity;
    UPROPERTY()
    float32 DeltaValue = 0.0f;
    UPROPERTY()
    EHitBreakLevel HitBreakLevel = EHitBreakLevel(0);
    UPROPERTY()
    bool bUseEcologyPosture = false;
    UPROPERTY()
    int DamageEventId = -1;


}

struct FC_PosturePreChange : FECSComponent
{
    UPROPERTY()
    bool bLockStagger = false;
    UPROPERTY()
    bool bLockBreak = false;
    UPROPERTY()
    TArray<FPostureChangeData> Changes;


}

struct FDamageBodyPartChangeData
{
    UPROPERTY()
    FECSEntity SourceEntity;
    UPROPERTY()
    FName BodyPartName;
    UPROPERTY()
    float32 Damage = 0.0f;
    UPROPERTY()
    int DamageEventId = -1;


}

struct FC_BodyPartPreChange : FECSComponent
{
    UPROPERTY()
    bool bLock = false;
    UPROPERTY()
    TArray<FDamageBodyPartChangeData> Changes;


}

struct FDamageAbnormalChangeData
{
    UPROPERTY()
    FECSEntity SourceEntity;
    UPROPERTY()
    EAbnormalState AbnormalState;
    UPROPERTY()
    bool bEnhanced = false;
    UPROPERTY()
    float32 DeltaValue = 0.0f;
    UPROPERTY()
    int DamageEventId = -1;


}

struct FC_AbnormalValuePreChange : FECSComponent
{
    UPROPERTY()
    TArray<FDamageAbnormalChangeData> Changes;

    FC_AbnormalValuePreChange()
    {
        return;
    }
}

struct FC_MutualClashPreChange : FECSComponent
{
    UPROPERTY()
    bool bLock = false;
    UPROPERTY()
    bool bConsumeAttacker = false;
    UPROPERTY()
    FECSEntity AttackerEntity;
    UPROPERTY()
    FECSEntity DefenderEntity;
    UPROPERTY()
    float32 DeltaValue = 0.0f;
    UPROPERTY()
    int DamageEventId = -1;


}

struct FDamageDefenseData
{
    UPROPERTY()
    bool bSuccess = false;


}

struct FC_DefensePreChange : FECSComponent
{
    UPROPERTY()
    bool bSuccess = false;
    UPROPERTY()
    float32 DeltaValue = 0.0f;
    UPROPERTY()
    int DamageEventId = -1;


}

struct FC_HitStateFrame : FECSComponent
{
    UPROPERTY()
    bool bUseNewHitStateTransit = false;
    UPROPERTY()
    FDamageDataToState State;
    UPROPERTY()
    bool bUseHitLevelESMTransitInfo = false;
    UPROPERTY()
    FHitLevelESMTransitInfo HitLevelESMTransitInfo;


    bool TrySetHitState(const FECSEntity &inout Entity, const FName &inout Name, const TDataObjectPtr<FAttackData> &inout AttackData, const bool bCustomState = false, const int OverridePriority = FDamageUtils::DEFAULT_PRIORITY)
    {
        if (Entity.MatchGameplayTag(GameplayTags::CombatState_BlockAllHitReaction))
        {
            return false;
        }
        FName local_3 = Name;
        if (!(this.bUseNewHitStateTransit))
        {
            if ((local_3 == FName("HitNotBreaking")))
            {
                local_3 = FName("HitLight");
            }
            else
            {
                if ((local_3 == FName("HitLightly")))
                {
                    local_3 = FName("HitHeavy");
                }
                else
                {
                    if ((local_3 == FName("HitHeavy")))
                    {
                        local_3 = FName("HitRetreat");
                    }
                    else
                    {
                        if ((local_3 == FName("KnockDownHit")))
                        {
                            local_3 = FName("LieDownHit");
                        }
                    }
                }
            }
        }
        FDamageDataToState local_36;
        local_36.SetName(local_3);
        local_36.SetbCustomState(bCustomState);
        local_36.SetAttackData(AttackData);
        if (OverridePriority != 0)
        {
            local_36.SetbOverridePriority(true);
            local_36.SetOverridePriority(OverridePriority);
        }
        if (this.State.GetName().IsNone() || ::FDamageUtils::ComparePriorityBetweenStates(local_36, this.State))
        {
            this.bUseHitLevelESMTransitInfo = false;
            this.State = local_36;
            return true;
        }
        return false;
    }
    void SetHitStateByHitLevelESMTransitInfo(const FHitLevelESMTransitInfo &inout InHitLevelESMTransitInfo)
    {
        FName local_9;
        if (this.bUseHitLevelESMTransitInfo)
        {
            local_9 = this.HitLevelESMTransitInfo.GetESMTransitName();
        }
        else
        {
            local_9 = this.State.GetName();
        }
        if (::FDamageUtils::GetHitStatePriority(InHitLevelESMTransitInfo.GetESMTransitName()) >= ::FDamageUtils::GetHitStatePriority(local_9))
        {
            this.bUseHitLevelESMTransitInfo = true;
            this.HitLevelESMTransitInfo = InHitLevelESMTransitInfo;
        }
        return;
    }
    bool HasOverrideStrike() const
    {
        return this.bUseHitLevelESMTransitInfo && (this.HitLevelESMTransitInfo.GetbOverrideStrikeX() || this.HitLevelESMTransitInfo.GetbOverrideStrikeZ());
    }
    FName GetToStateName() const
    {
        FName local_7;
        if (this.bUseHitLevelESMTransitInfo)
        {
            local_7 = this.HitLevelESMTransitInfo.GetESMTransitName();
        }
        else
        {
            local_7 = this.State.GetName();
        }
        return local_7;
    }
}

struct FDamageNumShowData
{
    UPROPERTY()
    FECSEntity Attacker;
    UPROPERTY()
    FFPTime DamageTime;
    UPROPERTY()
    bool bCritical = false;
    UPROPERTY()
    bool bHitWeakness = false;
    UPROPERTY()
    bool bAttenuated = false;
    UPROPERTY()
    float32 DamageValue = 0.0f;
    UPROPERTY()
    EDamageType DamageType = EDamageType(0);
    UPROPERTY()
    FVector Position;
    UPROPERTY()
    FName StrikeKey;
    UPROPERTY()
    bool bAdjustPresentationHitPos = true;
    UPROPERTY()
    TDataObjectPtr<FAttackData> AttackData;


}

struct FC_DamageNumFrame : FECSComponent
{
    UPROPERTY()
    TArray<FDamageNumShowData> Datas;

    FC_DamageNumFrame()
    {
        return;
    }
}

struct FPotentialDamageData
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_DamagerCasuer;
    UPROPERTY()
    EDamageProcedureType m_DamageProcedureType;
    UPROPERTY()
    TDataObjectPtr<FAttackData> m_AttackData;
    UPROPERTY()
    FAttackBaseDamageValue m_BaseDamage;
    UPROPERTY()
    FFPTime m_ExpireTime;

    FPotentialDamageData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FPotentialDamageData(const FPotentialDamageData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FPotentialDamageData opAssign(const FPotentialDamageData &inout Other)
    {
        FPotentialDamageData __r;
        this.SetDamagerCasuer(Other.GetDamagerCasuer());
        this.SetDamageProcedureType(Other.GetDamageProcedureType());
        this.SetAttackData(Other.GetAttackData());
        this.SetBaseDamage(Other.GetBaseDamage());
        this.SetExpireTime(Other.GetExpireTime());
        return __r;
    }
    const FECSEntity GetDamagerCasuer() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_DamagerCasuer() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetDamagerCasuer(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_DamagerCasuer = __Value;
        return;
    }
    EDamageProcedureType GetDamageProcedureType() const property
    {
        return this.m_DamageProcedureType;
    }
    void SetDamageProcedureType(const EDamageProcedureType __Value) property
    {
        if (int(this.m_DamageProcedureType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_DamageProcedureType = __Value;
        return;
    }
    const TDataObjectPtr<FAttackData> GetAttackData() const property
    {
        const TDataObjectPtr<FAttackData> __r;
        return __r;
    }
    TDataObjectPtr<FAttackData> GetModify_AttackData() property
    {
        TDataObjectPtr<FAttackData> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetAttackData(const TDataObjectPtr<FAttackData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_AttackData = __Value;
        return;
    }
    const FAttackBaseDamageValue GetBaseDamage() const property
    {
        const FAttackBaseDamageValue __r;
        return __r;
    }
    FAttackBaseDamageValue GetBaseDamage() property
    {
        FAttackBaseDamageValue __r;
        return __r;
    }
    void SetBaseDamage(const FAttackBaseDamageValue &inout __Value) property
    {
        this.m_BaseDamage = __Value;
        return;
    }
    FFPTime GetExpireTime() const property
    {
        FFPTime __r;
        return __r;
    }
    FFPTime GetModify_ExpireTime() property
    {
        FFPTime __r;
        this.__MarkDirty(9);
        return __r;
    }
    void SetExpireTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_ExpireTime = __Value;
        return;
    }
}

struct FC_PotentialDamage : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_IndexAcc;
    UPROPERTY()
    FFPTime m_CheckTime;
    UPROPERTY()
    TMap<int, FPotentialDamageData> m_DataByIndex;

    FC_PotentialDamage()
    {
        this.m_IndexAcc = 0;
        this.__InitDirtyFlags();
        return;
    }
    FC_PotentialDamage(const FC_PotentialDamage &inout Other)
    {
        this.m_IndexAcc = 0;
        this.__InitDirtyFlags();
        this.m_IndexAcc = int(Other.m_IndexAcc);
        this.m_CheckTime = Other.m_CheckTime;
        this.m_DataByIndex = Other.m_DataByIndex;
        return;
    }
    FC_PotentialDamage opAssign(const FC_PotentialDamage &inout Other)
    {
        FC_PotentialDamage __r;
        this.SetIndexAcc(Other.GetIndexAcc());
        this.SetCheckTime(Other.GetCheckTime());
        this.SetDataByIndex(Other.GetDataByIndex());
        return __r;
    }
    int GetIndexAcc() const property
    {
        return this.m_IndexAcc;
    }
    void SetIndexAcc(const int __Value) property
    {
        if (this.m_IndexAcc == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_IndexAcc = __Value;
        return;
    }
    const FFPTime GetCheckTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_CheckTime() property
    {
        FFPTime __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetCheckTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_CheckTime = __Value;
        return;
    }
    const TMap<int, FPotentialDamageData> GetDataByIndex() const property
    {
        const TMap<int, FPotentialDamageData> __r;
        return __r;
    }
    TMap<int, FPotentialDamageData> GetModify_DataByIndex() property
    {
        TMap<int, FPotentialDamageData> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetDataByIndex(const TMap<int, FPotentialDamageData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_DataByIndex = __Value;
        return;
    }
}

struct FC_NewDamageResolvedTag : FECSComponent
{
    FC_NewDamageResolvedTag()
    {
        return;
    }
}

struct FC_WeakDamageTypeInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    uint8 m_KnownWeakDamageType;

    FC_WeakDamageTypeInfo()
    {
        this.m_KnownWeakDamageType = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_WeakDamageTypeInfo(const FC_WeakDamageTypeInfo &inout Other)
    {
        this.m_KnownWeakDamageType = false;
        this.__InitDirtyFlags();
        this.m_KnownWeakDamageType = (int(Other.m_KnownWeakDamageType) != 0);
        return;
    }
    FC_WeakDamageTypeInfo opAssign(const FC_WeakDamageTypeInfo &inout Other)
    {
        FC_WeakDamageTypeInfo __r;
        this.SetKnownWeakDamageType(uint8(Other.GetKnownWeakDamageType()));
        return __r;
    }
    uint8 GetKnownWeakDamageType() const property
    {
        return this.m_KnownWeakDamageType;
    }
    void SetKnownWeakDamageType(const uint8 __Value) property
    {
        if (this.m_KnownWeakDamageType == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_KnownWeakDamageType = (__Value != 0);
        return;
    }
}

struct FC_DamageReceiverTransfer : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_DamageValueToEntity;
    UPROPERTY()
    bool m_bTransferDamageToHp;
    UPROPERTY()
    bool m_bTransferDamageToPosture;

    FC_DamageReceiverTransfer()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_DamageReceiverTransfer(const FC_DamageReceiverTransfer &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_DamageReceiverTransfer opAssign(const FC_DamageReceiverTransfer &inout Other)
    {
        FC_DamageReceiverTransfer __r;
        this.SetDamageValueToEntity(Other.GetDamageValueToEntity());
        this.SetbTransferDamageToHp(Other.GetbTransferDamageToHp());
        this.SetbTransferDamageToPosture(Other.GetbTransferDamageToPosture());
        return __r;
    }
    const FECSEntity GetDamageValueToEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_DamageValueToEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetDamageValueToEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_DamageValueToEntity = __Value;
        return;
    }
    bool GetbTransferDamageToHp() const property
    {
        return this.m_bTransferDamageToHp;
    }
    void SetbTransferDamageToHp(const bool __Value) property
    {
        if (!(this.m_bTransferDamageToHp) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bTransferDamageToHp = __Value;
        return;
    }
    bool GetbTransferDamageToPosture() const property
    {
        return this.m_bTransferDamageToPosture;
    }
    void SetbTransferDamageToPosture(const bool __Value) property
    {
        if (!(this.m_bTransferDamageToPosture) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bTransferDamageToPosture = __Value;
        return;
    }
}

struct FDamageStatData
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FECSEntityId m_AttackerEntityId;
    UPROPERTY()
    FECSEntityId m_ReceiverEntityId;
    UPROPERTY()
    FECSEntityId m_AttackerPlayerEntityId;
    UPROPERTY()
    FECSEntityId m_ReceiverPlayerEntityId;
    UPROPERTY()
    float m_Time;
    UPROPERTY()
    FName m_AttackDataName;
    UPROPERTY()
    float32 m_DamageToHp;
    UPROPERTY()
    float32 m_DamageToPosture;

    FDamageStatData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FDamageStatData(const FDamageStatData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FDamageStatData opAssign(const FDamageStatData &inout Other)
    {
        FDamageStatData __r;
        this.SetAttackerEntityId(Other.GetAttackerEntityId());
        this.SetReceiverEntityId(Other.GetReceiverEntityId());
        this.SetAttackerPlayerEntityId(Other.GetAttackerPlayerEntityId());
        this.SetReceiverPlayerEntityId(Other.GetReceiverPlayerEntityId());
        this.SetTime(Other.GetTime());
        this.SetAttackDataName(Other.GetAttackDataName());
        this.SetDamageToHp(Other.GetDamageToHp());
        this.SetDamageToPosture(Other.GetDamageToPosture());
        return __r;
    }
    const FECSEntityId GetAttackerEntityId() const property
    {
        const FECSEntityId __r;
        return __r;
    }
    FECSEntityId GetModify_AttackerEntityId() property
    {
        FECSEntityId __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetAttackerEntityId(const FECSEntityId &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_AttackerEntityId = __Value;
        return;
    }
    const FECSEntityId GetReceiverEntityId() const property
    {
        const FECSEntityId __r;
        return __r;
    }
    FECSEntityId GetModify_ReceiverEntityId() property
    {
        FECSEntityId __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetReceiverEntityId(const FECSEntityId &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_ReceiverEntityId = __Value;
        return;
    }
    const FECSEntityId GetAttackerPlayerEntityId() const property
    {
        const FECSEntityId __r;
        return __r;
    }
    FECSEntityId GetModify_AttackerPlayerEntityId() property
    {
        FECSEntityId __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetAttackerPlayerEntityId(const FECSEntityId &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_AttackerPlayerEntityId = __Value;
        return;
    }
    const FECSEntityId GetReceiverPlayerEntityId() const property
    {
        const FECSEntityId __r;
        return __r;
    }
    FECSEntityId GetModify_ReceiverPlayerEntityId() property
    {
        FECSEntityId __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetReceiverPlayerEntityId(const FECSEntityId &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_ReceiverPlayerEntityId = __Value;
        return;
    }
    float GetTime() const property
    {
        return this.m_Time;
    }
    void SetTime(const float __Value) property
    {
        if (this.m_Time == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_Time = __Value;
        return;
    }
    FName GetAttackDataName() const property
    {
        return this.m_AttackDataName;
    }
    void SetAttackDataName(const FName &inout __Value) property
    {
        if ((this.m_AttackDataName == __Value))
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_AttackDataName = __Value;
        return;
    }
    float32 GetDamageToHp() const property
    {
        return this.m_DamageToHp;
    }
    void SetDamageToHp(const float32 __Value) property
    {
        if (this.m_DamageToHp == __Value)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_DamageToHp = __Value;
        return;
    }
    float32 GetDamageToPosture() const property
    {
        return this.m_DamageToPosture;
    }
    void SetDamageToPosture(const float32 __Value) property
    {
        if (this.m_DamageToPosture == __Value)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_DamageToPosture = __Value;
        return;
    }
}

struct FC_DamageStatisticFrame : FECSComponent
{
    UPROPERTY()
    TArray<FDamageStatisticData> DamageStats;
    UPROPERTY()
    TMap<FECSEntityId, FName> EntityIdToName;

    FC_DamageStatisticFrame()
    {
        return;
    }
}

struct FCE_ServerToClientDamageEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TArray<FDamageStatisticData> damages;
    UPROPERTY()
    TMap<FECSEntityId, FName> EntityIdToName;
    UPROPERTY()
    float32 DamageToHp;
    UPROPERTY()
    float32 DmgTime;


}

struct FDamageReceivedRecord
{
    UPROPERTY()
    FFPTime Time;
    UPROPERTY()
    float32 DamageAmount;
    UPROPERTY()
    FECSEntity DamageSource;


}

struct FC_DamageReceivedStatistic : FECSComponent
{
    UPROPERTY()
    TArray<FDamageReceivedRecord> DamageRecords;

    FC_DamageReceivedStatistic()
    {
        return;
    }
    float32 GetDamageAmountInDuration(const FFPTime &inout CurrentTime, const float32 DurationSeconds) const
    {
        float32 local_1 = 0.0f;
        FFPTime local_10 = (CurrentTime - FFPTime(DurationSeconds));
        int local_14 = this.Num() - 1;
        for (; local_14 >= 0; --local_14)
        {
            if (FFPTime(this[local_14].Time).opCmp(local_10) >= 0)
            {
                local_1 = local_1 + this[local_14].DamageAmount;
                continue;
            }
            break;
        }
        return local_1;
    }
    void AddRecord(const FFPTime &inout CurrentTime, const float32 DamageAmount, const FECSEntity &inout DamageSource)
    {
        FFPTime local_8 = (CurrentTime - FFPTime(120.0));
        int local_9 = 0;
        int local_11 = 0;
        for (; local_11 < this.Num(); ++local_11)
        {
            if (FFPTime(this[local_11].Time).opCmp(local_8) < 0)
            {
                ++local_9;
                continue;
            }
            break;
        }
        if (local_9 > 0)
        {
            this.RemoveAt(0, local_9);
        }
        FDamageReceivedRecord local_22;
        local_22.Time = CurrentTime;
        local_22.DamageAmount = DamageAmount;
        local_22.DamageSource = DamageSource;
        this.Add(local_22);
        return;
    }
}

struct FC_EcologyPostureProtect : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFPTime m_RemoveTime;

    FC_EcologyPostureProtect()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_EcologyPostureProtect(const FC_EcologyPostureProtect &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_RemoveTime = Other.m_RemoveTime;
        return;
    }
    FC_EcologyPostureProtect opAssign(const FC_EcologyPostureProtect &inout Other)
    {
        FC_EcologyPostureProtect __r;
        this.SetRemoveTime(Other.GetRemoveTime());
        return __r;
    }
    const FFPTime GetRemoveTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_RemoveTime() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetRemoveTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_RemoveTime = __Value;
        return;
    }
}

struct FLockHPInfo
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FName m_KeyName;
    UPROPERTY()
    bool m_bLockByHpAmount;
    UPROPERTY()
    float32 m_LockHpAmount;
    UPROPERTY()
    float32 m_LockHpRatio;

    FLockHPInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FLockHPInfo(const FLockHPInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FLockHPInfo opAssign(const FLockHPInfo &inout Other)
    {
        FLockHPInfo __r;
        this.SetKeyName(Other.GetKeyName());
        this.SetbLockByHpAmount(Other.GetbLockByHpAmount());
        this.SetLockHpAmount(Other.GetLockHpAmount());
        this.SetLockHpRatio(Other.GetLockHpRatio());
        return __r;
    }
    FName GetKeyName() const property
    {
        return this.m_KeyName;
    }
    void SetKeyName(const FName &inout __Value) property
    {
        if ((this.m_KeyName == __Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_KeyName = __Value;
        return;
    }
    bool GetbLockByHpAmount() const property
    {
        return this.m_bLockByHpAmount;
    }
    void SetbLockByHpAmount(const bool __Value) property
    {
        if (!(this.m_bLockByHpAmount) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bLockByHpAmount = __Value;
        return;
    }
    float32 GetLockHpAmount() const property
    {
        return this.m_LockHpAmount;
    }
    void SetLockHpAmount(const float32 __Value) property
    {
        if (this.m_LockHpAmount == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_LockHpAmount = __Value;
        return;
    }
    float32 GetLockHpRatio() const property
    {
        return this.m_LockHpRatio;
    }
    void SetLockHpRatio(const float32 __Value) property
    {
        if (this.m_LockHpRatio == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_LockHpRatio = __Value;
        return;
    }
}

struct FC_LockHP : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FLockHPInfo> m_LockHPInfos;

    FC_LockHP()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_LockHP(const FC_LockHP &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_LockHPInfos = Other.m_LockHPInfos;
        return;
    }
    FC_LockHP opAssign(const FC_LockHP &inout Other)
    {
        FC_LockHP __r;
        this.SetLockHPInfos(Other.GetLockHPInfos());
        return __r;
    }
    bool AddNewLockHPInfo(const FName &inout KeyName, const bool bLockByHpAmount, const float32 LockHpAmount, const float32 LockHpRatio)
    {
        for (auto& local_16 : this.GetLockHPInfos())
        {
            if ((local_16.GetKeyName() == KeyName))
            {
                return false;
            }
        }
        FLockHPInfo local_24;
        local_24.SetKeyName(KeyName);
        local_24.SetbLockByHpAmount(bLockByHpAmount);
        local_24.SetLockHpAmount(LockHpAmount);
        local_24.SetLockHpRatio(LockHpRatio);
        this.GetModify_LockHPInfos().Add(local_24);
        return true;
    }
    bool RemoveLockHPInfo(const FName &inout KeyName)
    {
        int local_1 = 0;
        for (; local_1 < this.GetLockHPInfos().Num(); ++local_1)
        {
            if ((this.GetLockHPInfos()[local_1].GetKeyName() == KeyName))
            {
                this.GetModify_LockHPInfos().RemoveAt(local_1);
                return true;
            }
        }
        return false;
    }
    const TArray<FLockHPInfo> GetLockHPInfos() const property
    {
        const TArray<FLockHPInfo> __r;
        return __r;
    }
    TArray<FLockHPInfo> GetModify_LockHPInfos() property
    {
        TArray<FLockHPInfo> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetLockHPInfos(const TArray<FLockHPInfo> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_LockHPInfos = __Value;
        return;
    }
}

struct FCE_TriggerLockHPEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName KeyName;
    UPROPERTY()
    FECSEntity DamageCauser;

    FCE_TriggerLockHPEvent()
    {
        return;
    }
}

struct FComboHitReductionKey
{
    UPROPERTY()
    TDataObjectPtr<FComboHitDamageReduction> m_ComboHitConfig;
    UPROPERTY()
    FECSEntity m_DamageCaster;

    FComboHitReductionKey()
    {
        return;
    }
    bool opEquals(const FComboHitReductionKey &inout Other) const
    {
        TDataObjectPtr<FComboHitDamageReduction> local_24;
        local_24 = this.GetComboHitConfig();
        FDataObjectPtr local_72;
        local_72;
        return (local_24 == local_72) && (FECSEntity(this.GetDamageCaster()) == Other.GetDamageCaster());
    }
    uint Hash() const
    {
        int local_4 = this.GetComboHitConfig().GetUniqueID() & 4294967295;
        int local_2 = local_4;
        int local_1 = HashCombineFast(0, local_2);
        int local_7 = 32;
        local_1 = HashCombineFast(local_1, (this.GetComboHitConfig().GetUniqueID() >> local_7 & 4294967295));
        local_1 = HashCombineFast(local_1, this.GetDamageCaster().GetIdValue());
        return local_1;
    }
    const TDataObjectPtr<FComboHitDamageReduction> GetComboHitConfig() const property
    {
        const TDataObjectPtr<FComboHitDamageReduction> __r;
        return __r;
    }
    TDataObjectPtr<FComboHitDamageReduction> GetComboHitConfig() property
    {
        TDataObjectPtr<FComboHitDamageReduction> __r;
        return __r;
    }
    void SetComboHitConfig(const TDataObjectPtr<FComboHitDamageReduction> &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    const FECSEntity GetDamageCaster() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetDamageCaster() property
    {
        FECSEntity __r;
        return __r;
    }
    void SetDamageCaster(const FECSEntity &inout __Value) property
    {
        this.m_DamageCaster = __Value;
        return;
    }
}

struct FComboHitReductionInfo
{
    UPROPERTY()
    FFPTime m_LastHitTime;
    UPROPERTY()
    int m_ComboCount;


    const FFPTime GetLastHitTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetLastHitTime() property
    {
        FFPTime __r;
        return __r;
    }
    void SetLastHitTime(const FFPTime &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    int GetComboCount() const property
    {
        return this.m_ComboCount;
    }
    void SetComboCount(const int __Value) property
    {
        this.m_ComboCount = __Value;
        return;
    }
}

struct FC_ComboHitReductionRecord : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<FComboHitReductionKey, FComboHitReductionInfo> m_HitRecord;

    FC_ComboHitReductionRecord()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_ComboHitReductionRecord(const FC_ComboHitReductionRecord &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_HitRecord = Other.m_HitRecord;
        return;
    }
    FC_ComboHitReductionRecord opAssign(const FC_ComboHitReductionRecord &inout Other)
    {
        FC_ComboHitReductionRecord __r;
        this.SetHitRecord(Other.GetHitRecord());
        return __r;
    }
    const TMap<FComboHitReductionKey, FComboHitReductionInfo> GetHitRecord() const property
    {
        const TMap<FComboHitReductionKey, FComboHitReductionInfo> __r;
        return __r;
    }
    TMap<FComboHitReductionKey, FComboHitReductionInfo> GetModify_HitRecord() property
    {
        TMap<FComboHitReductionKey, FComboHitReductionInfo> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetHitRecord(const TMap<FComboHitReductionKey, FComboHitReductionInfo> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_HitRecord = __Value;
        return;
    }
}

struct FC_SimulateHit : FECSComponent
{
    UPROPERTY()
    float32 HitFromAngle = 0.0f;
    UPROPERTY()
    float32 HitAngle = 0.0f;
    UPROPERTY()
    int EHitDirection = 0;
    UPROPERTY()
    FVector CenterPos = FVector::ZeroVector;
    UPROPERTY()
    FVector CasterForward = FVector::ZeroVector;
    UPROPERTY()
    float32 HitStunDuration = 0.5f;
    UPROPERTY()
    int HitLevel = 0;
    UPROPERTY()
    int HitBreakLevel = 0;
    UPROPERTY()
    float32 HitImpulseX = 0.0f;
    UPROPERTY()
    float32 HitImpulseZ = 0.0f;


}

namespace FDamageUtils
{
bool ComparePriorityBetweenStates(const FDamageDataToState &inout LState, const FDamageDataToState &inout RState)
{
    int local_4 = FDamageUtils::GetHitStatePriority(LState.GetName());
    if (LState.GetbOverridePriority())
    {
        local_4 = LState.GetOverridePriority();
    }
    int local_1 = FDamageUtils::GetHitStatePriority(RState.GetName());
    if (RState.GetbOverridePriority())
    {
        local_1 = RState.GetOverridePriority();
    }
    return (local_4 >= local_1);
}
int GetHitStatePriority(const FName &inout StateName)
{
    int local_2;
    if (FDamageUtils::HitStatePriorityMap.Contains(StateName))
    {
        local_2 = FDamageUtils::HitStatePriorityMap[StateName];
    }
    else
    {
        local_2 = 0;
    }
    return local_2;
}
}
namespace ECSFunc_FCS_DamageToCalculateFrame
{
UFUNCTION()
bool HasDamageToCalculateFrame(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_DamageToCalculateFrame);
}
FCS_DamageToCalculateFrame& AssignDamageToCalculateFrame(const FECSWorldPtr &inout World, const FCS_DamageToCalculateFrame &inout DefaultValue = FCS_DamageToCalculateFrame())
{
    UScriptStruct local_6 = FCS_DamageToCalculateFrame;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignDamageToCalculateFrame_BP(const FECSWorldPtr &inout World, const FCS_DamageToCalculateFrame &inout DefaultValue = FCS_DamageToCalculateFrame())
{
    ECSFunc_FCS_DamageToCalculateFrame::AssignDamageToCalculateFrame(World, DefaultValue);
    return;
}
FCS_DamageToCalculateFrame& ModifyDamageToCalculateFrame(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_DamageToCalculateFrame;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_DamageToCalculateFrame& ModifyOrAddDamageToCalculateFrame(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_DamageToCalculateFrame;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_DamageToCalculateFrame& GetDamageToCalculateFrame(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_DamageToCalculateFrame;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_DamageToCalculateFrame GetDamageToCalculateFrame_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_DamageToCalculateFrame __r;
    bValid = false;
    bValid = ECSFunc_FCS_DamageToCalculateFrame::GetDamageToCalculateFrame(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_DamageToCalculateFrame GetDefaultedDamageToCalculateFrame(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_DamageToCalculateFrame __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_DamageToCalculateFrame);
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
FCS_DamageToCalculateFrame GetDefaultedDamageToCalculateFrame_BP(const FECSWorldPtr &inout World)
{
    FCS_DamageToCalculateFrame __r;
    return __r;
}
UFUNCTION()
bool RemoveDamageToCalculateFrame(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_DamageToCalculateFrame);
}
}
void __MonitorDamageToCalculateFrameLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_DamageToCalculateFrame, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDamageToCalculateFrameActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_DamageToCalculateFrame, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDamageToCalculateFrameModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_DamageToCalculateFrame, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_TakeDamageWaitingCalculation
{
UFUNCTION()
bool HasTakeDamageWaitingCalculation(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TakeDamageWaitingCalculation);
}
FC_TakeDamageWaitingCalculation& AssignTakeDamageWaitingCalculation(const FECSEntity &inout Entity, const FC_TakeDamageWaitingCalculation &inout DefaultValue = FC_TakeDamageWaitingCalculation())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TakeDamageWaitingCalculation, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTakeDamageWaitingCalculation_BP(const FECSEntity &inout Entity, const FC_TakeDamageWaitingCalculation &inout DefaultValue = FC_TakeDamageWaitingCalculation())
{
    ECSFunc_FC_TakeDamageWaitingCalculation::AssignTakeDamageWaitingCalculation(Entity, DefaultValue);
    return;
}
FC_TakeDamageWaitingCalculation& ModifyTakeDamageWaitingCalculation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TakeDamageWaitingCalculation));
    return local_12.GetComp();
}
FC_TakeDamageWaitingCalculation& ModifyOrAddTakeDamageWaitingCalculation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TakeDamageWaitingCalculation));
    return local_12.GetComp();
}
const FC_TakeDamageWaitingCalculation& GetTakeDamageWaitingCalculation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TakeDamageWaitingCalculation));
    return local_12.GetComp();
}
UFUNCTION()
FC_TakeDamageWaitingCalculation GetTakeDamageWaitingCalculation_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_TakeDamageWaitingCalculation& local_4 = ECSFunc_FC_TakeDamageWaitingCalculation::GetTakeDamageWaitingCalculation(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_TakeDamageWaitingCalculation();
}
const FC_TakeDamageWaitingCalculation GetDefaultedTakeDamageWaitingCalculation(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TakeDamageWaitingCalculation __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TakeDamageWaitingCalculation);
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
FC_TakeDamageWaitingCalculation GetDefaultedTakeDamageWaitingCalculation_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_TakeDamageWaitingCalculation::GetDefaultedTakeDamageWaitingCalculation(Entity);
}
UFUNCTION()
bool RemoveTakeDamageWaitingCalculation(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TakeDamageWaitingCalculation);
}
}
FECSMonitorRuntimeView __GetMonitorTakeDamageWaitingCalculationOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TakeDamageWaitingCalculation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTakeDamageWaitingCalculationOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TakeDamageWaitingCalculation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTakeDamageWaitingCalculationOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TakeDamageWaitingCalculation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTakeDamageWaitingCalculationOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TakeDamageWaitingCalculation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTakeDamageWaitingCalculationOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TakeDamageWaitingCalculation, bFixedFrame, bMustHandleAll);
}
void __MonitorTakeDamageWaitingCalculationLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TakeDamageWaitingCalculation, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTakeDamageWaitingCalculationActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TakeDamageWaitingCalculation, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTakeDamageWaitingCalculationModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TakeDamageWaitingCalculation, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DealDamageFrame
{
UFUNCTION()
bool HasDealDamageFrame(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DealDamageFrame);
}
FC_DealDamageFrame& AssignDealDamageFrame(const FECSEntity &inout Entity, const FC_DealDamageFrame &inout DefaultValue = FC_DealDamageFrame())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DealDamageFrame, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDealDamageFrame_BP(const FECSEntity &inout Entity, const FC_DealDamageFrame &inout DefaultValue = FC_DealDamageFrame())
{
    ECSFunc_FC_DealDamageFrame::AssignDealDamageFrame(Entity, DefaultValue);
    return;
}
FC_DealDamageFrame& ModifyDealDamageFrame(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DealDamageFrame));
    return local_12.GetComp();
}
FC_DealDamageFrame& ModifyOrAddDealDamageFrame(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DealDamageFrame));
    return local_12.GetComp();
}
const FC_DealDamageFrame& GetDealDamageFrame(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DealDamageFrame));
    return local_12.GetComp();
}
UFUNCTION()
FC_DealDamageFrame GetDealDamageFrame_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_DealDamageFrame __r;
    bValid = false;
    bValid = ECSFunc_FC_DealDamageFrame::GetDealDamageFrame(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_DealDamageFrame GetDefaultedDealDamageFrame(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DealDamageFrame __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DealDamageFrame);
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
FC_DealDamageFrame GetDefaultedDealDamageFrame_BP(const FECSEntity &inout Entity)
{
    FC_DealDamageFrame __r;
    return __r;
}
UFUNCTION()
bool RemoveDealDamageFrame(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DealDamageFrame);
}
}
FECSMonitorRuntimeView __GetMonitorDealDamageFrameOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DealDamageFrame, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDealDamageFrameOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DealDamageFrame, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDealDamageFrameOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DealDamageFrame, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDealDamageFrameOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DealDamageFrame, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDealDamageFrameOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DealDamageFrame, bFixedFrame, bMustHandleAll);
}
void __MonitorDealDamageFrameLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DealDamageFrame, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDealDamageFrameActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DealDamageFrame, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDealDamageFrameModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DealDamageFrame, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_TakeDamageToCalculateFrame
{
UFUNCTION()
bool HasTakeDamageToCalculateFrame(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TakeDamageToCalculateFrame);
}
FC_TakeDamageToCalculateFrame& AssignTakeDamageToCalculateFrame(const FECSEntity &inout Entity, const FC_TakeDamageToCalculateFrame &inout DefaultValue = FC_TakeDamageToCalculateFrame())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TakeDamageToCalculateFrame, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTakeDamageToCalculateFrame_BP(const FECSEntity &inout Entity, const FC_TakeDamageToCalculateFrame &inout DefaultValue = FC_TakeDamageToCalculateFrame())
{
    ECSFunc_FC_TakeDamageToCalculateFrame::AssignTakeDamageToCalculateFrame(Entity, DefaultValue);
    return;
}
FC_TakeDamageToCalculateFrame& ModifyTakeDamageToCalculateFrame(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TakeDamageToCalculateFrame));
    return local_12.GetComp();
}
FC_TakeDamageToCalculateFrame& ModifyOrAddTakeDamageToCalculateFrame(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TakeDamageToCalculateFrame));
    return local_12.GetComp();
}
const FC_TakeDamageToCalculateFrame& GetTakeDamageToCalculateFrame(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TakeDamageToCalculateFrame));
    return local_12.GetComp();
}
UFUNCTION()
FC_TakeDamageToCalculateFrame GetTakeDamageToCalculateFrame_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_TakeDamageToCalculateFrame __r;
    bValid = false;
    bValid = ECSFunc_FC_TakeDamageToCalculateFrame::GetTakeDamageToCalculateFrame(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_TakeDamageToCalculateFrame GetDefaultedTakeDamageToCalculateFrame(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TakeDamageToCalculateFrame __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TakeDamageToCalculateFrame);
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
FC_TakeDamageToCalculateFrame GetDefaultedTakeDamageToCalculateFrame_BP(const FECSEntity &inout Entity)
{
    FC_TakeDamageToCalculateFrame __r;
    return __r;
}
UFUNCTION()
bool RemoveTakeDamageToCalculateFrame(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TakeDamageToCalculateFrame);
}
}
FECSMonitorRuntimeView __GetMonitorTakeDamageToCalculateFrameOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TakeDamageToCalculateFrame, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTakeDamageToCalculateFrameOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TakeDamageToCalculateFrame, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTakeDamageToCalculateFrameOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TakeDamageToCalculateFrame, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTakeDamageToCalculateFrameOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TakeDamageToCalculateFrame, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTakeDamageToCalculateFrameOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TakeDamageToCalculateFrame, bFixedFrame, bMustHandleAll);
}
void __MonitorTakeDamageToCalculateFrameLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TakeDamageToCalculateFrame, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTakeDamageToCalculateFrameActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TakeDamageToCalculateFrame, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTakeDamageToCalculateFrameModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TakeDamageToCalculateFrame, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DamageToApplyFrame
{
UFUNCTION()
bool HasDamageToApplyFrame(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DamageToApplyFrame);
}
FC_DamageToApplyFrame& AssignDamageToApplyFrame(const FECSEntity &inout Entity, const FC_DamageToApplyFrame &inout DefaultValue = FC_DamageToApplyFrame())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DamageToApplyFrame, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDamageToApplyFrame_BP(const FECSEntity &inout Entity, const FC_DamageToApplyFrame &inout DefaultValue = FC_DamageToApplyFrame())
{
    ECSFunc_FC_DamageToApplyFrame::AssignDamageToApplyFrame(Entity, DefaultValue);
    return;
}
FC_DamageToApplyFrame& ModifyDamageToApplyFrame(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DamageToApplyFrame));
    return local_12.GetComp();
}
FC_DamageToApplyFrame& ModifyOrAddDamageToApplyFrame(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DamageToApplyFrame));
    return local_12.GetComp();
}
const FC_DamageToApplyFrame& GetDamageToApplyFrame(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DamageToApplyFrame));
    return local_12.GetComp();
}
UFUNCTION()
FC_DamageToApplyFrame GetDamageToApplyFrame_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_DamageToApplyFrame __r;
    bValid = false;
    bValid = ECSFunc_FC_DamageToApplyFrame::GetDamageToApplyFrame(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_DamageToApplyFrame GetDefaultedDamageToApplyFrame(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DamageToApplyFrame __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DamageToApplyFrame);
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
FC_DamageToApplyFrame GetDefaultedDamageToApplyFrame_BP(const FECSEntity &inout Entity)
{
    FC_DamageToApplyFrame __r;
    return __r;
}
UFUNCTION()
bool RemoveDamageToApplyFrame(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DamageToApplyFrame);
}
}
FECSMonitorRuntimeView __GetMonitorDamageToApplyFrameOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DamageToApplyFrame, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDamageToApplyFrameOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DamageToApplyFrame, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDamageToApplyFrameOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DamageToApplyFrame, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDamageToApplyFrameOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DamageToApplyFrame, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDamageToApplyFrameOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DamageToApplyFrame, bFixedFrame, bMustHandleAll);
}
void __MonitorDamageToApplyFrameLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DamageToApplyFrame, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDamageToApplyFrameActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DamageToApplyFrame, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDamageToApplyFrameModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DamageToApplyFrame, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_HitStateTypeFrame
{
UFUNCTION()
bool HasHitStateTypeFrame(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_HitStateTypeFrame);
}
FC_HitStateTypeFrame& AssignHitStateTypeFrame(const FECSEntity &inout Entity, const FC_HitStateTypeFrame &inout DefaultValue = FC_HitStateTypeFrame())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_HitStateTypeFrame, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignHitStateTypeFrame_BP(const FECSEntity &inout Entity, const FC_HitStateTypeFrame &inout DefaultValue = FC_HitStateTypeFrame())
{
    ECSFunc_FC_HitStateTypeFrame::AssignHitStateTypeFrame(Entity, DefaultValue);
    return;
}
FC_HitStateTypeFrame& ModifyHitStateTypeFrame(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_HitStateTypeFrame));
    return local_12.GetComp();
}
FC_HitStateTypeFrame& ModifyOrAddHitStateTypeFrame(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_HitStateTypeFrame));
    return local_12.GetComp();
}
const FC_HitStateTypeFrame& GetHitStateTypeFrame(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_HitStateTypeFrame));
    return local_12.GetComp();
}
UFUNCTION()
FC_HitStateTypeFrame GetHitStateTypeFrame_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_HitStateTypeFrame& local_4 = ECSFunc_FC_HitStateTypeFrame::GetHitStateTypeFrame(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_HitStateTypeFrame();
}
const FC_HitStateTypeFrame GetDefaultedHitStateTypeFrame(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_HitStateTypeFrame __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_HitStateTypeFrame);
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
FC_HitStateTypeFrame GetDefaultedHitStateTypeFrame_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_HitStateTypeFrame::GetDefaultedHitStateTypeFrame(Entity);
}
UFUNCTION()
bool RemoveHitStateTypeFrame(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_HitStateTypeFrame);
}
}
FECSMonitorRuntimeView __GetMonitorHitStateTypeFrameOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_HitStateTypeFrame, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitStateTypeFrameOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_HitStateTypeFrame, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitStateTypeFrameOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_HitStateTypeFrame, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitStateTypeFrameOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_HitStateTypeFrame, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitStateTypeFrameOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_HitStateTypeFrame, bFixedFrame, bMustHandleAll);
}
void __MonitorHitStateTypeFrameLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_HitStateTypeFrame, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHitStateTypeFrameActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_HitStateTypeFrame, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHitStateTypeFrameModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_HitStateTypeFrame, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_HPPreChange
{
UFUNCTION()
bool HasHPPreChange(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_HPPreChange);
}
FC_HPPreChange& AssignHPPreChange(const FECSEntity &inout Entity, const FC_HPPreChange &inout DefaultValue = FC_HPPreChange())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_HPPreChange, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignHPPreChange_BP(const FECSEntity &inout Entity, const FC_HPPreChange &inout DefaultValue = FC_HPPreChange())
{
    ECSFunc_FC_HPPreChange::AssignHPPreChange(Entity, DefaultValue);
    return;
}
FC_HPPreChange& ModifyHPPreChange(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_HPPreChange));
    return local_12.GetComp();
}
FC_HPPreChange& ModifyOrAddHPPreChange(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_HPPreChange));
    return local_12.GetComp();
}
const FC_HPPreChange& GetHPPreChange(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_HPPreChange));
    return local_12.GetComp();
}
UFUNCTION()
FC_HPPreChange GetHPPreChange_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_HPPreChange __r;
    bValid = false;
    bValid = ECSFunc_FC_HPPreChange::GetHPPreChange(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_HPPreChange GetDefaultedHPPreChange(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_HPPreChange __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_HPPreChange);
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
FC_HPPreChange GetDefaultedHPPreChange_BP(const FECSEntity &inout Entity)
{
    FC_HPPreChange __r;
    return __r;
}
UFUNCTION()
bool RemoveHPPreChange(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_HPPreChange);
}
}
FECSMonitorRuntimeView __GetMonitorHPPreChangeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_HPPreChange, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHPPreChangeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_HPPreChange, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHPPreChangeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_HPPreChange, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHPPreChangeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_HPPreChange, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHPPreChangeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_HPPreChange, bFixedFrame, bMustHandleAll);
}
void __MonitorHPPreChangeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_HPPreChange, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHPPreChangeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_HPPreChange, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHPPreChangeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_HPPreChange, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PosturePreChange
{
UFUNCTION()
bool HasPosturePreChange(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PosturePreChange);
}
FC_PosturePreChange& AssignPosturePreChange(const FECSEntity &inout Entity, const FC_PosturePreChange &inout DefaultValue = FC_PosturePreChange())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PosturePreChange, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPosturePreChange_BP(const FECSEntity &inout Entity, const FC_PosturePreChange &inout DefaultValue = FC_PosturePreChange())
{
    ECSFunc_FC_PosturePreChange::AssignPosturePreChange(Entity, DefaultValue);
    return;
}
FC_PosturePreChange& ModifyPosturePreChange(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PosturePreChange));
    return local_12.GetComp();
}
FC_PosturePreChange& ModifyOrAddPosturePreChange(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PosturePreChange));
    return local_12.GetComp();
}
const FC_PosturePreChange& GetPosturePreChange(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PosturePreChange));
    return local_12.GetComp();
}
UFUNCTION()
FC_PosturePreChange GetPosturePreChange_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PosturePreChange __r;
    bValid = false;
    bValid = ECSFunc_FC_PosturePreChange::GetPosturePreChange(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PosturePreChange GetDefaultedPosturePreChange(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PosturePreChange __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PosturePreChange);
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
FC_PosturePreChange GetDefaultedPosturePreChange_BP(const FECSEntity &inout Entity)
{
    FC_PosturePreChange __r;
    return __r;
}
UFUNCTION()
bool RemovePosturePreChange(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PosturePreChange);
}
}
FECSMonitorRuntimeView __GetMonitorPosturePreChangeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PosturePreChange, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPosturePreChangeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PosturePreChange, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPosturePreChangeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PosturePreChange, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPosturePreChangeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PosturePreChange, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPosturePreChangeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PosturePreChange, bFixedFrame, bMustHandleAll);
}
void __MonitorPosturePreChangeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PosturePreChange, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPosturePreChangeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PosturePreChange, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPosturePreChangeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PosturePreChange, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_BodyPartPreChange
{
UFUNCTION()
bool HasBodyPartPreChange(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_BodyPartPreChange);
}
FC_BodyPartPreChange& AssignBodyPartPreChange(const FECSEntity &inout Entity, const FC_BodyPartPreChange &inout DefaultValue = FC_BodyPartPreChange())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_BodyPartPreChange, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignBodyPartPreChange_BP(const FECSEntity &inout Entity, const FC_BodyPartPreChange &inout DefaultValue = FC_BodyPartPreChange())
{
    ECSFunc_FC_BodyPartPreChange::AssignBodyPartPreChange(Entity, DefaultValue);
    return;
}
FC_BodyPartPreChange& ModifyBodyPartPreChange(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_BodyPartPreChange));
    return local_12.GetComp();
}
FC_BodyPartPreChange& ModifyOrAddBodyPartPreChange(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_BodyPartPreChange));
    return local_12.GetComp();
}
const FC_BodyPartPreChange& GetBodyPartPreChange(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_BodyPartPreChange));
    return local_12.GetComp();
}
UFUNCTION()
FC_BodyPartPreChange GetBodyPartPreChange_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_BodyPartPreChange __r;
    bValid = false;
    bValid = ECSFunc_FC_BodyPartPreChange::GetBodyPartPreChange(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_BodyPartPreChange GetDefaultedBodyPartPreChange(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_BodyPartPreChange __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_BodyPartPreChange);
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
FC_BodyPartPreChange GetDefaultedBodyPartPreChange_BP(const FECSEntity &inout Entity)
{
    FC_BodyPartPreChange __r;
    return __r;
}
UFUNCTION()
bool RemoveBodyPartPreChange(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_BodyPartPreChange);
}
}
FECSMonitorRuntimeView __GetMonitorBodyPartPreChangeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_BodyPartPreChange, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBodyPartPreChangeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_BodyPartPreChange, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBodyPartPreChangeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_BodyPartPreChange, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBodyPartPreChangeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_BodyPartPreChange, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBodyPartPreChangeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_BodyPartPreChange, bFixedFrame, bMustHandleAll);
}
void __MonitorBodyPartPreChangeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_BodyPartPreChange, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBodyPartPreChangeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_BodyPartPreChange, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBodyPartPreChangeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_BodyPartPreChange, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AbnormalValuePreChange
{
UFUNCTION()
bool HasAbnormalValuePreChange(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AbnormalValuePreChange);
}
FC_AbnormalValuePreChange& AssignAbnormalValuePreChange(const FECSEntity &inout Entity, const FC_AbnormalValuePreChange &inout DefaultValue = FC_AbnormalValuePreChange())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AbnormalValuePreChange, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAbnormalValuePreChange_BP(const FECSEntity &inout Entity, const FC_AbnormalValuePreChange &inout DefaultValue = FC_AbnormalValuePreChange())
{
    ECSFunc_FC_AbnormalValuePreChange::AssignAbnormalValuePreChange(Entity, DefaultValue);
    return;
}
FC_AbnormalValuePreChange& ModifyAbnormalValuePreChange(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AbnormalValuePreChange));
    return local_12.GetComp();
}
FC_AbnormalValuePreChange& ModifyOrAddAbnormalValuePreChange(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AbnormalValuePreChange));
    return local_12.GetComp();
}
const FC_AbnormalValuePreChange& GetAbnormalValuePreChange(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AbnormalValuePreChange));
    return local_12.GetComp();
}
UFUNCTION()
FC_AbnormalValuePreChange GetAbnormalValuePreChange_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AbnormalValuePreChange __r;
    bValid = false;
    bValid = ECSFunc_FC_AbnormalValuePreChange::GetAbnormalValuePreChange(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AbnormalValuePreChange GetDefaultedAbnormalValuePreChange(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AbnormalValuePreChange __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AbnormalValuePreChange);
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
FC_AbnormalValuePreChange GetDefaultedAbnormalValuePreChange_BP(const FECSEntity &inout Entity)
{
    FC_AbnormalValuePreChange __r;
    return __r;
}
UFUNCTION()
bool RemoveAbnormalValuePreChange(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AbnormalValuePreChange);
}
}
FECSMonitorRuntimeView __GetMonitorAbnormalValuePreChangeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AbnormalValuePreChange, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAbnormalValuePreChangeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AbnormalValuePreChange, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAbnormalValuePreChangeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AbnormalValuePreChange, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAbnormalValuePreChangeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AbnormalValuePreChange, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAbnormalValuePreChangeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AbnormalValuePreChange, bFixedFrame, bMustHandleAll);
}
void __MonitorAbnormalValuePreChangeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AbnormalValuePreChange, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAbnormalValuePreChangeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AbnormalValuePreChange, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAbnormalValuePreChangeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AbnormalValuePreChange, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_MutualClashPreChange
{
UFUNCTION()
bool HasMutualClashPreChange(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MutualClashPreChange);
}
FC_MutualClashPreChange& AssignMutualClashPreChange(const FECSEntity &inout Entity, const FC_MutualClashPreChange &inout DefaultValue = FC_MutualClashPreChange())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MutualClashPreChange, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMutualClashPreChange_BP(const FECSEntity &inout Entity, const FC_MutualClashPreChange &inout DefaultValue = FC_MutualClashPreChange())
{
    ECSFunc_FC_MutualClashPreChange::AssignMutualClashPreChange(Entity, DefaultValue);
    return;
}
FC_MutualClashPreChange& ModifyMutualClashPreChange(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MutualClashPreChange));
    return local_12.GetComp();
}
FC_MutualClashPreChange& ModifyOrAddMutualClashPreChange(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MutualClashPreChange));
    return local_12.GetComp();
}
const FC_MutualClashPreChange& GetMutualClashPreChange(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MutualClashPreChange));
    return local_12.GetComp();
}
UFUNCTION()
FC_MutualClashPreChange GetMutualClashPreChange_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_MutualClashPreChange __r;
    bValid = false;
    bValid = ECSFunc_FC_MutualClashPreChange::GetMutualClashPreChange(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_MutualClashPreChange GetDefaultedMutualClashPreChange(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MutualClashPreChange __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MutualClashPreChange);
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
FC_MutualClashPreChange GetDefaultedMutualClashPreChange_BP(const FECSEntity &inout Entity)
{
    FC_MutualClashPreChange __r;
    return __r;
}
UFUNCTION()
bool RemoveMutualClashPreChange(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MutualClashPreChange);
}
}
FECSMonitorRuntimeView __GetMonitorMutualClashPreChangeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MutualClashPreChange, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMutualClashPreChangeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MutualClashPreChange, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMutualClashPreChangeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MutualClashPreChange, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMutualClashPreChangeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MutualClashPreChange, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMutualClashPreChangeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MutualClashPreChange, bFixedFrame, bMustHandleAll);
}
void __MonitorMutualClashPreChangeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MutualClashPreChange, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMutualClashPreChangeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MutualClashPreChange, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMutualClashPreChangeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MutualClashPreChange, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DefensePreChange
{
UFUNCTION()
bool HasDefensePreChange(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DefensePreChange);
}
FC_DefensePreChange& AssignDefensePreChange(const FECSEntity &inout Entity, const FC_DefensePreChange &inout DefaultValue = FC_DefensePreChange())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DefensePreChange, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDefensePreChange_BP(const FECSEntity &inout Entity, const FC_DefensePreChange &inout DefaultValue = FC_DefensePreChange())
{
    ECSFunc_FC_DefensePreChange::AssignDefensePreChange(Entity, DefaultValue);
    return;
}
FC_DefensePreChange& ModifyDefensePreChange(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DefensePreChange));
    return local_12.GetComp();
}
FC_DefensePreChange& ModifyOrAddDefensePreChange(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DefensePreChange));
    return local_12.GetComp();
}
const FC_DefensePreChange& GetDefensePreChange(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DefensePreChange));
    return local_12.GetComp();
}
UFUNCTION()
FC_DefensePreChange GetDefensePreChange_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DefensePreChange& local_4 = ECSFunc_FC_DefensePreChange::GetDefensePreChange(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DefensePreChange();
}
const FC_DefensePreChange GetDefaultedDefensePreChange(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DefensePreChange __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DefensePreChange);
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
FC_DefensePreChange GetDefaultedDefensePreChange_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DefensePreChange::GetDefaultedDefensePreChange(Entity);
}
UFUNCTION()
bool RemoveDefensePreChange(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DefensePreChange);
}
}
FECSMonitorRuntimeView __GetMonitorDefensePreChangeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DefensePreChange, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDefensePreChangeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DefensePreChange, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDefensePreChangeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DefensePreChange, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDefensePreChangeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DefensePreChange, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDefensePreChangeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DefensePreChange, bFixedFrame, bMustHandleAll);
}
void __MonitorDefensePreChangeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DefensePreChange, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDefensePreChangeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DefensePreChange, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDefensePreChangeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DefensePreChange, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_HitStateFrame
{
UFUNCTION()
bool HasHitStateFrame(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_HitStateFrame);
}
FC_HitStateFrame& AssignHitStateFrame(const FECSEntity &inout Entity, const FC_HitStateFrame &inout DefaultValue = FC_HitStateFrame())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_HitStateFrame, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignHitStateFrame_BP(const FECSEntity &inout Entity, const FC_HitStateFrame &inout DefaultValue = FC_HitStateFrame())
{
    ECSFunc_FC_HitStateFrame::AssignHitStateFrame(Entity, DefaultValue);
    return;
}
FC_HitStateFrame& ModifyHitStateFrame(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_HitStateFrame));
    return local_12.GetComp();
}
FC_HitStateFrame& ModifyOrAddHitStateFrame(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_HitStateFrame));
    return local_12.GetComp();
}
const FC_HitStateFrame& GetHitStateFrame(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_HitStateFrame));
    return local_12.GetComp();
}
UFUNCTION()
FC_HitStateFrame GetHitStateFrame_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_HitStateFrame __r;
    bValid = false;
    bValid = ECSFunc_FC_HitStateFrame::GetHitStateFrame(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_HitStateFrame GetDefaultedHitStateFrame(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_HitStateFrame __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_HitStateFrame);
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
FC_HitStateFrame GetDefaultedHitStateFrame_BP(const FECSEntity &inout Entity)
{
    FC_HitStateFrame __r;
    return __r;
}
UFUNCTION()
bool RemoveHitStateFrame(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_HitStateFrame);
}
}
FECSMonitorRuntimeView __GetMonitorHitStateFrameOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_HitStateFrame, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitStateFrameOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_HitStateFrame, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitStateFrameOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_HitStateFrame, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitStateFrameOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_HitStateFrame, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitStateFrameOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_HitStateFrame, bFixedFrame, bMustHandleAll);
}
void __MonitorHitStateFrameLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_HitStateFrame, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHitStateFrameActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_HitStateFrame, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHitStateFrameModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_HitStateFrame, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DamageNumFrame
{
UFUNCTION()
bool HasDamageNumFrame(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DamageNumFrame);
}
FC_DamageNumFrame& AssignDamageNumFrame(const FECSEntity &inout Entity, const FC_DamageNumFrame &inout DefaultValue = FC_DamageNumFrame())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DamageNumFrame, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDamageNumFrame_BP(const FECSEntity &inout Entity, const FC_DamageNumFrame &inout DefaultValue = FC_DamageNumFrame())
{
    ECSFunc_FC_DamageNumFrame::AssignDamageNumFrame(Entity, DefaultValue);
    return;
}
FC_DamageNumFrame& ModifyDamageNumFrame(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DamageNumFrame));
    return local_12.GetComp();
}
FC_DamageNumFrame& ModifyOrAddDamageNumFrame(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DamageNumFrame));
    return local_12.GetComp();
}
const FC_DamageNumFrame& GetDamageNumFrame(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DamageNumFrame));
    return local_12.GetComp();
}
UFUNCTION()
FC_DamageNumFrame GetDamageNumFrame_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_DamageNumFrame __r;
    bValid = false;
    bValid = ECSFunc_FC_DamageNumFrame::GetDamageNumFrame(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_DamageNumFrame GetDefaultedDamageNumFrame(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DamageNumFrame __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DamageNumFrame);
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
FC_DamageNumFrame GetDefaultedDamageNumFrame_BP(const FECSEntity &inout Entity)
{
    FC_DamageNumFrame __r;
    return __r;
}
UFUNCTION()
bool RemoveDamageNumFrame(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DamageNumFrame);
}
}
FECSMonitorRuntimeView __GetMonitorDamageNumFrameOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DamageNumFrame, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDamageNumFrameOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DamageNumFrame, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDamageNumFrameOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DamageNumFrame, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDamageNumFrameOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DamageNumFrame, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDamageNumFrameOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DamageNumFrame, bFixedFrame, bMustHandleAll);
}
void __MonitorDamageNumFrameLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DamageNumFrame, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDamageNumFrameActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DamageNumFrame, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDamageNumFrameModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DamageNumFrame, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PotentialDamage
{
UFUNCTION()
bool HasPotentialDamage(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PotentialDamage);
}
FC_PotentialDamage& AssignPotentialDamage(const FECSEntity &inout Entity, const FC_PotentialDamage &inout DefaultValue = FC_PotentialDamage())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PotentialDamage, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPotentialDamage_BP(const FECSEntity &inout Entity, const FC_PotentialDamage &inout DefaultValue = FC_PotentialDamage())
{
    ECSFunc_FC_PotentialDamage::AssignPotentialDamage(Entity, DefaultValue);
    return;
}
FC_PotentialDamage& ModifyPotentialDamage(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PotentialDamage));
    return local_12.GetComp();
}
FC_PotentialDamage& ModifyOrAddPotentialDamage(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PotentialDamage));
    return local_12.GetComp();
}
const FC_PotentialDamage& GetPotentialDamage(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PotentialDamage));
    return local_12.GetComp();
}
UFUNCTION()
FC_PotentialDamage GetPotentialDamage_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PotentialDamage& local_4 = ECSFunc_FC_PotentialDamage::GetPotentialDamage(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PotentialDamage();
}
const FC_PotentialDamage GetDefaultedPotentialDamage(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PotentialDamage __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PotentialDamage);
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
FC_PotentialDamage GetDefaultedPotentialDamage_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PotentialDamage::GetDefaultedPotentialDamage(Entity);
}
UFUNCTION()
bool RemovePotentialDamage(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PotentialDamage);
}
}
FECSMonitorRuntimeView __GetMonitorPotentialDamageOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PotentialDamage, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPotentialDamageOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PotentialDamage, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPotentialDamageOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PotentialDamage, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPotentialDamageOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PotentialDamage, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPotentialDamageOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PotentialDamage, bFixedFrame, bMustHandleAll);
}
void __MonitorPotentialDamageLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PotentialDamage, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPotentialDamageActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PotentialDamage, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPotentialDamageModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PotentialDamage, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_NewDamageResolvedTag
{
UFUNCTION()
bool HasNewDamageResolvedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_NewDamageResolvedTag);
}
FC_NewDamageResolvedTag& AssignNewDamageResolvedTag(const FECSEntity &inout Entity, const FC_NewDamageResolvedTag &inout DefaultValue = FC_NewDamageResolvedTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_NewDamageResolvedTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignNewDamageResolvedTag_BP(const FECSEntity &inout Entity, const FC_NewDamageResolvedTag &inout DefaultValue = FC_NewDamageResolvedTag())
{
    ECSFunc_FC_NewDamageResolvedTag::AssignNewDamageResolvedTag(Entity, DefaultValue);
    return;
}
FC_NewDamageResolvedTag& ModifyNewDamageResolvedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_NewDamageResolvedTag));
    return local_12.GetComp();
}
FC_NewDamageResolvedTag& ModifyOrAddNewDamageResolvedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_NewDamageResolvedTag));
    return local_12.GetComp();
}
const FC_NewDamageResolvedTag& GetNewDamageResolvedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_NewDamageResolvedTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_NewDamageResolvedTag GetNewDamageResolvedTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_NewDamageResolvedTag& local_4 = ECSFunc_FC_NewDamageResolvedTag::GetNewDamageResolvedTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_NewDamageResolvedTag();
}
const FC_NewDamageResolvedTag GetDefaultedNewDamageResolvedTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_NewDamageResolvedTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_NewDamageResolvedTag);
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
FC_NewDamageResolvedTag GetDefaultedNewDamageResolvedTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_NewDamageResolvedTag::GetDefaultedNewDamageResolvedTag(Entity);
}
UFUNCTION()
bool RemoveNewDamageResolvedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_NewDamageResolvedTag);
}
}
FECSMonitorRuntimeView __GetMonitorNewDamageResolvedTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_NewDamageResolvedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNewDamageResolvedTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_NewDamageResolvedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNewDamageResolvedTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_NewDamageResolvedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNewDamageResolvedTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_NewDamageResolvedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNewDamageResolvedTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_NewDamageResolvedTag, bFixedFrame, bMustHandleAll);
}
void __MonitorNewDamageResolvedTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_NewDamageResolvedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNewDamageResolvedTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_NewDamageResolvedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNewDamageResolvedTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_NewDamageResolvedTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_WeakDamageTypeInfo
{
UFUNCTION()
bool HasWeakDamageTypeInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_WeakDamageTypeInfo);
}
FC_WeakDamageTypeInfo& AssignWeakDamageTypeInfo(const FECSEntity &inout Entity, const FC_WeakDamageTypeInfo &inout DefaultValue = FC_WeakDamageTypeInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_WeakDamageTypeInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignWeakDamageTypeInfo_BP(const FECSEntity &inout Entity, const FC_WeakDamageTypeInfo &inout DefaultValue = FC_WeakDamageTypeInfo())
{
    ECSFunc_FC_WeakDamageTypeInfo::AssignWeakDamageTypeInfo(Entity, DefaultValue);
    return;
}
FC_WeakDamageTypeInfo& ModifyWeakDamageTypeInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_WeakDamageTypeInfo));
    return local_12.GetComp();
}
FC_WeakDamageTypeInfo& ModifyOrAddWeakDamageTypeInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_WeakDamageTypeInfo));
    return local_12.GetComp();
}
const FC_WeakDamageTypeInfo& GetWeakDamageTypeInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_WeakDamageTypeInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_WeakDamageTypeInfo GetWeakDamageTypeInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_WeakDamageTypeInfo& local_4 = ECSFunc_FC_WeakDamageTypeInfo::GetWeakDamageTypeInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_WeakDamageTypeInfo();
}
const FC_WeakDamageTypeInfo GetDefaultedWeakDamageTypeInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_WeakDamageTypeInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_WeakDamageTypeInfo);
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
FC_WeakDamageTypeInfo GetDefaultedWeakDamageTypeInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_WeakDamageTypeInfo::GetDefaultedWeakDamageTypeInfo(Entity);
}
UFUNCTION()
bool RemoveWeakDamageTypeInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_WeakDamageTypeInfo);
}
}
FECSMonitorRuntimeView __GetMonitorWeakDamageTypeInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_WeakDamageTypeInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeakDamageTypeInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_WeakDamageTypeInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeakDamageTypeInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_WeakDamageTypeInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeakDamageTypeInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_WeakDamageTypeInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeakDamageTypeInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_WeakDamageTypeInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorWeakDamageTypeInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_WeakDamageTypeInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorWeakDamageTypeInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_WeakDamageTypeInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorWeakDamageTypeInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_WeakDamageTypeInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DamageReceiverTransfer
{
UFUNCTION()
bool HasDamageReceiverTransfer(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DamageReceiverTransfer);
}
FC_DamageReceiverTransfer& AssignDamageReceiverTransfer(const FECSEntity &inout Entity, const FC_DamageReceiverTransfer &inout DefaultValue = FC_DamageReceiverTransfer())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DamageReceiverTransfer, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDamageReceiverTransfer_BP(const FECSEntity &inout Entity, const FC_DamageReceiverTransfer &inout DefaultValue = FC_DamageReceiverTransfer())
{
    ECSFunc_FC_DamageReceiverTransfer::AssignDamageReceiverTransfer(Entity, DefaultValue);
    return;
}
FC_DamageReceiverTransfer& ModifyDamageReceiverTransfer(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DamageReceiverTransfer));
    return local_12.GetComp();
}
FC_DamageReceiverTransfer& ModifyOrAddDamageReceiverTransfer(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DamageReceiverTransfer));
    return local_12.GetComp();
}
const FC_DamageReceiverTransfer& GetDamageReceiverTransfer(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DamageReceiverTransfer));
    return local_12.GetComp();
}
UFUNCTION()
FC_DamageReceiverTransfer GetDamageReceiverTransfer_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DamageReceiverTransfer& local_4 = ECSFunc_FC_DamageReceiverTransfer::GetDamageReceiverTransfer(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DamageReceiverTransfer();
}
const FC_DamageReceiverTransfer GetDefaultedDamageReceiverTransfer(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DamageReceiverTransfer __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DamageReceiverTransfer);
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
FC_DamageReceiverTransfer GetDefaultedDamageReceiverTransfer_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DamageReceiverTransfer::GetDefaultedDamageReceiverTransfer(Entity);
}
UFUNCTION()
bool RemoveDamageReceiverTransfer(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DamageReceiverTransfer);
}
}
FECSMonitorRuntimeView __GetMonitorDamageReceiverTransferOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DamageReceiverTransfer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDamageReceiverTransferOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DamageReceiverTransfer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDamageReceiverTransferOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DamageReceiverTransfer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDamageReceiverTransferOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DamageReceiverTransfer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDamageReceiverTransferOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DamageReceiverTransfer, bFixedFrame, bMustHandleAll);
}
void __MonitorDamageReceiverTransferLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DamageReceiverTransfer, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDamageReceiverTransferActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DamageReceiverTransfer, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDamageReceiverTransferModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DamageReceiverTransfer, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DamageStatisticFrame
{
UFUNCTION()
bool HasDamageStatisticFrame(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DamageStatisticFrame);
}
FC_DamageStatisticFrame& AssignDamageStatisticFrame(const FECSEntity &inout Entity, const FC_DamageStatisticFrame &inout DefaultValue = FC_DamageStatisticFrame())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DamageStatisticFrame, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDamageStatisticFrame_BP(const FECSEntity &inout Entity, const FC_DamageStatisticFrame &inout DefaultValue = FC_DamageStatisticFrame())
{
    ECSFunc_FC_DamageStatisticFrame::AssignDamageStatisticFrame(Entity, DefaultValue);
    return;
}
FC_DamageStatisticFrame& ModifyDamageStatisticFrame(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DamageStatisticFrame));
    return local_12.GetComp();
}
FC_DamageStatisticFrame& ModifyOrAddDamageStatisticFrame(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DamageStatisticFrame));
    return local_12.GetComp();
}
const FC_DamageStatisticFrame& GetDamageStatisticFrame(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DamageStatisticFrame));
    return local_12.GetComp();
}
UFUNCTION()
FC_DamageStatisticFrame GetDamageStatisticFrame_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_DamageStatisticFrame __r;
    bValid = false;
    bValid = ECSFunc_FC_DamageStatisticFrame::GetDamageStatisticFrame(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_DamageStatisticFrame GetDefaultedDamageStatisticFrame(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DamageStatisticFrame __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DamageStatisticFrame);
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
FC_DamageStatisticFrame GetDefaultedDamageStatisticFrame_BP(const FECSEntity &inout Entity)
{
    FC_DamageStatisticFrame __r;
    return __r;
}
UFUNCTION()
bool RemoveDamageStatisticFrame(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DamageStatisticFrame);
}
}
FECSMonitorRuntimeView __GetMonitorDamageStatisticFrameOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DamageStatisticFrame, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDamageStatisticFrameOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DamageStatisticFrame, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDamageStatisticFrameOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DamageStatisticFrame, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDamageStatisticFrameOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DamageStatisticFrame, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDamageStatisticFrameOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DamageStatisticFrame, bFixedFrame, bMustHandleAll);
}
void __MonitorDamageStatisticFrameLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DamageStatisticFrame, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDamageStatisticFrameActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DamageStatisticFrame, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDamageStatisticFrameModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DamageStatisticFrame, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DamageReceivedStatistic
{
UFUNCTION()
bool HasDamageReceivedStatistic(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DamageReceivedStatistic);
}
FC_DamageReceivedStatistic& AssignDamageReceivedStatistic(const FECSEntity &inout Entity, const FC_DamageReceivedStatistic &inout DefaultValue = FC_DamageReceivedStatistic())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DamageReceivedStatistic, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDamageReceivedStatistic_BP(const FECSEntity &inout Entity, const FC_DamageReceivedStatistic &inout DefaultValue = FC_DamageReceivedStatistic())
{
    ECSFunc_FC_DamageReceivedStatistic::AssignDamageReceivedStatistic(Entity, DefaultValue);
    return;
}
FC_DamageReceivedStatistic& ModifyDamageReceivedStatistic(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DamageReceivedStatistic));
    return local_12.GetComp();
}
FC_DamageReceivedStatistic& ModifyOrAddDamageReceivedStatistic(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DamageReceivedStatistic));
    return local_12.GetComp();
}
const FC_DamageReceivedStatistic& GetDamageReceivedStatistic(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DamageReceivedStatistic));
    return local_12.GetComp();
}
UFUNCTION()
FC_DamageReceivedStatistic GetDamageReceivedStatistic_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_DamageReceivedStatistic __r;
    bValid = false;
    bValid = ECSFunc_FC_DamageReceivedStatistic::GetDamageReceivedStatistic(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_DamageReceivedStatistic GetDefaultedDamageReceivedStatistic(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DamageReceivedStatistic __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DamageReceivedStatistic);
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
FC_DamageReceivedStatistic GetDefaultedDamageReceivedStatistic_BP(const FECSEntity &inout Entity)
{
    FC_DamageReceivedStatistic __r;
    return __r;
}
UFUNCTION()
bool RemoveDamageReceivedStatistic(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DamageReceivedStatistic);
}
}
FECSMonitorRuntimeView __GetMonitorDamageReceivedStatisticOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DamageReceivedStatistic, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDamageReceivedStatisticOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DamageReceivedStatistic, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDamageReceivedStatisticOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DamageReceivedStatistic, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDamageReceivedStatisticOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DamageReceivedStatistic, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDamageReceivedStatisticOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DamageReceivedStatistic, bFixedFrame, bMustHandleAll);
}
void __MonitorDamageReceivedStatisticLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DamageReceivedStatistic, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDamageReceivedStatisticActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DamageReceivedStatistic, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDamageReceivedStatisticModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DamageReceivedStatistic, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcologyPostureProtect
{
UFUNCTION()
bool HasEcologyPostureProtect(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyPostureProtect);
}
FC_EcologyPostureProtect& AssignEcologyPostureProtect(const FECSEntity &inout Entity, const FC_EcologyPostureProtect &inout DefaultValue = FC_EcologyPostureProtect())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyPostureProtect, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyPostureProtect_BP(const FECSEntity &inout Entity, const FC_EcologyPostureProtect &inout DefaultValue = FC_EcologyPostureProtect())
{
    ECSFunc_FC_EcologyPostureProtect::AssignEcologyPostureProtect(Entity, DefaultValue);
    return;
}
FC_EcologyPostureProtect& ModifyEcologyPostureProtect(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyPostureProtect));
    return local_12.GetComp();
}
FC_EcologyPostureProtect& ModifyOrAddEcologyPostureProtect(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyPostureProtect));
    return local_12.GetComp();
}
const FC_EcologyPostureProtect& GetEcologyPostureProtect(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyPostureProtect));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyPostureProtect GetEcologyPostureProtect_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EcologyPostureProtect& local_4 = ECSFunc_FC_EcologyPostureProtect::GetEcologyPostureProtect(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EcologyPostureProtect();
}
const FC_EcologyPostureProtect GetDefaultedEcologyPostureProtect(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyPostureProtect __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyPostureProtect);
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
FC_EcologyPostureProtect GetDefaultedEcologyPostureProtect_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EcologyPostureProtect::GetDefaultedEcologyPostureProtect(Entity);
}
UFUNCTION()
bool RemoveEcologyPostureProtect(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyPostureProtect);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyPostureProtectOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyPostureProtect, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyPostureProtectOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyPostureProtect, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyPostureProtectOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyPostureProtect, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyPostureProtectOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyPostureProtect, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyPostureProtectOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyPostureProtect, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyPostureProtectLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyPostureProtect, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyPostureProtectActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyPostureProtect, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyPostureProtectModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyPostureProtect, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LockHP
{
UFUNCTION()
bool HasLockHP(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LockHP);
}
FC_LockHP& AssignLockHP(const FECSEntity &inout Entity, const FC_LockHP &inout DefaultValue = FC_LockHP())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LockHP, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLockHP_BP(const FECSEntity &inout Entity, const FC_LockHP &inout DefaultValue = FC_LockHP())
{
    ECSFunc_FC_LockHP::AssignLockHP(Entity, DefaultValue);
    return;
}
FC_LockHP& ModifyLockHP(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LockHP));
    return local_12.GetComp();
}
FC_LockHP& ModifyOrAddLockHP(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LockHP));
    return local_12.GetComp();
}
const FC_LockHP& GetLockHP(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LockHP));
    return local_12.GetComp();
}
UFUNCTION()
FC_LockHP GetLockHP_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LockHP& local_4 = ECSFunc_FC_LockHP::GetLockHP(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LockHP();
}
const FC_LockHP GetDefaultedLockHP(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LockHP __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LockHP);
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
FC_LockHP GetDefaultedLockHP_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LockHP::GetDefaultedLockHP(Entity);
}
UFUNCTION()
bool RemoveLockHP(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LockHP);
}
}
FECSMonitorRuntimeView __GetMonitorLockHPOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LockHP, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLockHPOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LockHP, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLockHPOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LockHP, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLockHPOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LockHP, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLockHPOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LockHP, bFixedFrame, bMustHandleAll);
}
void __MonitorLockHPLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LockHP, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLockHPActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LockHP, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLockHPModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LockHP, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ComboHitReductionRecord
{
UFUNCTION()
bool HasComboHitReductionRecord(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ComboHitReductionRecord);
}
FC_ComboHitReductionRecord& AssignComboHitReductionRecord(const FECSEntity &inout Entity, const FC_ComboHitReductionRecord &inout DefaultValue = FC_ComboHitReductionRecord())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ComboHitReductionRecord, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignComboHitReductionRecord_BP(const FECSEntity &inout Entity, const FC_ComboHitReductionRecord &inout DefaultValue = FC_ComboHitReductionRecord())
{
    ECSFunc_FC_ComboHitReductionRecord::AssignComboHitReductionRecord(Entity, DefaultValue);
    return;
}
FC_ComboHitReductionRecord& ModifyComboHitReductionRecord(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ComboHitReductionRecord));
    return local_12.GetComp();
}
FC_ComboHitReductionRecord& ModifyOrAddComboHitReductionRecord(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ComboHitReductionRecord));
    return local_12.GetComp();
}
const FC_ComboHitReductionRecord& GetComboHitReductionRecord(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ComboHitReductionRecord));
    return local_12.GetComp();
}
UFUNCTION()
FC_ComboHitReductionRecord GetComboHitReductionRecord_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ComboHitReductionRecord& local_4 = ECSFunc_FC_ComboHitReductionRecord::GetComboHitReductionRecord(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ComboHitReductionRecord();
}
const FC_ComboHitReductionRecord GetDefaultedComboHitReductionRecord(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ComboHitReductionRecord __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ComboHitReductionRecord);
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
FC_ComboHitReductionRecord GetDefaultedComboHitReductionRecord_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ComboHitReductionRecord::GetDefaultedComboHitReductionRecord(Entity);
}
UFUNCTION()
bool RemoveComboHitReductionRecord(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ComboHitReductionRecord);
}
}
FECSMonitorRuntimeView __GetMonitorComboHitReductionRecordOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ComboHitReductionRecord, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorComboHitReductionRecordOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ComboHitReductionRecord, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorComboHitReductionRecordOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ComboHitReductionRecord, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorComboHitReductionRecordOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ComboHitReductionRecord, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorComboHitReductionRecordOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ComboHitReductionRecord, bFixedFrame, bMustHandleAll);
}
void __MonitorComboHitReductionRecordLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ComboHitReductionRecord, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorComboHitReductionRecordActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ComboHitReductionRecord, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorComboHitReductionRecordModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ComboHitReductionRecord, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SimulateHit
{
UFUNCTION()
bool HasSimulateHit(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SimulateHit);
}
FC_SimulateHit& AssignSimulateHit(const FECSEntity &inout Entity, const FC_SimulateHit &inout DefaultValue = FC_SimulateHit())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SimulateHit, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSimulateHit_BP(const FECSEntity &inout Entity, const FC_SimulateHit &inout DefaultValue = FC_SimulateHit())
{
    ECSFunc_FC_SimulateHit::AssignSimulateHit(Entity, DefaultValue);
    return;
}
FC_SimulateHit& ModifySimulateHit(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SimulateHit));
    return local_12.GetComp();
}
FC_SimulateHit& ModifyOrAddSimulateHit(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SimulateHit));
    return local_12.GetComp();
}
const FC_SimulateHit& GetSimulateHit(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SimulateHit));
    return local_12.GetComp();
}
UFUNCTION()
FC_SimulateHit GetSimulateHit_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SimulateHit& local_4 = ECSFunc_FC_SimulateHit::GetSimulateHit(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SimulateHit();
}
const FC_SimulateHit GetDefaultedSimulateHit(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SimulateHit __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SimulateHit);
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
FC_SimulateHit GetDefaultedSimulateHit_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SimulateHit::GetDefaultedSimulateHit(Entity);
}
UFUNCTION()
bool RemoveSimulateHit(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SimulateHit);
}
}
FECSMonitorRuntimeView __GetMonitorSimulateHitOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SimulateHit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimulateHitOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SimulateHit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimulateHitOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SimulateHit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimulateHitOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SimulateHit, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSimulateHitOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SimulateHit, bFixedFrame, bMustHandleAll);
}
void __MonitorSimulateHitLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SimulateHit, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSimulateHitActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SimulateHit, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSimulateHitModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SimulateHit, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FDamageDataToState &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FDamageDataToState &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FDamageDataToState
{
int __IndexOf_Name()
{
    return 0;
}
int __IndexOf_AttackData()
{
    return 1;
}
int __IndexOf_bCustomState()
{
    return 2;
}
int __IndexOf_bOverridePriority()
{
    return 3;
}
int __IndexOf_OverridePriority()
{
    return 4;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_TakeDamageWaitingCalculation &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_TakeDamageWaitingCalculation &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_TakeDamageWaitingCalculation &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_TakeDamageWaitingCalculation
{
int __IndexOf_EarliestDamageTime()
{
    return 0;
}
int __IndexOf_DamageDatas()
{
    return 1;
}
}
namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FPotentialDamageData &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FPotentialDamageData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FPotentialDamageData
{
int __IndexOf_DamagerCasuer()
{
    return 0;
}
int __IndexOf_DamageProcedureType()
{
    return 1;
}
int __IndexOf_AttackData()
{
    return 2;
}
int __IndexOf_BaseDamage()
{
    return 3;
}
int __IndexOf_ExpireTime()
{
    return 9;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PotentialDamage &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PotentialDamage &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PotentialDamage &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PotentialDamage
{
int __IndexOf_IndexAcc()
{
    return 0;
}
int __IndexOf_CheckTime()
{
    return 1;
}
int __IndexOf_DataByIndex()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_WeakDamageTypeInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_WeakDamageTypeInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_WeakDamageTypeInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_WeakDamageTypeInfo
{
int __IndexOf_KnownWeakDamageType()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_DamageReceiverTransfer &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_DamageReceiverTransfer &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_DamageReceiverTransfer &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_DamageReceiverTransfer
{
int __IndexOf_DamageValueToEntity()
{
    return 0;
}
int __IndexOf_bTransferDamageToHp()
{
    return 1;
}
int __IndexOf_bTransferDamageToPosture()
{
    return 2;
}
}
namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FDamageStatData &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FDamageStatData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FDamageStatData
{
int __IndexOf_AttackerEntityId()
{
    return 0;
}
int __IndexOf_ReceiverEntityId()
{
    return 1;
}
int __IndexOf_AttackerPlayerEntityId()
{
    return 2;
}
int __IndexOf_ReceiverPlayerEntityId()
{
    return 3;
}
int __IndexOf_Time()
{
    return 4;
}
int __IndexOf_AttackDataName()
{
    return 5;
}
int __IndexOf_DamageToHp()
{
    return 6;
}
int __IndexOf_DamageToPosture()
{
    return 7;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_EcologyPostureProtect &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_EcologyPostureProtect &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_EcologyPostureProtect &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_EcologyPostureProtect
{
int __IndexOf_RemoveTime()
{
    return 0;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FLockHPInfo &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FLockHPInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FLockHPInfo
{
int __IndexOf_KeyName()
{
    return 0;
}
int __IndexOf_bLockByHpAmount()
{
    return 1;
}
int __IndexOf_LockHpAmount()
{
    return 2;
}
int __IndexOf_LockHpRatio()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_LockHP &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_LockHP &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_LockHP &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_LockHP
{
int __IndexOf_LockHPInfos()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ComboHitReductionRecord &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ComboHitReductionRecord &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ComboHitReductionRecord &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ComboHitReductionRecord
{
int __IndexOf_HitRecord()
{
    return 0;
}
}
