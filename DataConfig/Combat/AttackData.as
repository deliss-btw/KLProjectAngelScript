
enum EAttackFXConfigType
{
    ImpactFX,
    HitFX,
    HitFXAndImpactFX,
}

enum EAttackCategory
{
    Normal,
    Special,
    Charge,
    UltraSkill,
    Switch,
    SimpleSkill,
}

enum EAttackType
{
    Default,
    GroundHit,
    Catch,
    HeavyStrike,
    Dot,
    Ranged,
    Execution,
    Areal,
}

enum EAbnormalState
{
    None,
    Burning,
    Poisoning,
    Doomed,
    Dizzy,
    HotSpring,
    Freeze,
    Electrified,
    Light,
    Dark,
    LeylineMiasma,
    MAX,
}

enum EAttackDataHitState
{
    None,
    NotBreaking,
    Lightly,
    Heavy,
    Retreat,
    Blow,
    BlowHeavy,
    KnockDown,
}

enum EHitReactionState
{
    None,
    Light,
    Heavy,
    Retreat,
    Blow,
    BlowHeavy,
    KnockDown,
    Stagger,
    BodypartDestroy,
    Break,
    BreakExecutedDown,
    BreakRecover,
    MutualClash,
    Abnormal,
}

enum EHitDirection
{
    FromCaster,
    FromDamageCenter,
    CasterForward,
    StrikeDirection,
}

enum ECombatFactionRelation
{
    Hostile,
    All,
}

enum EHitReactionType
{
    Default,
    Boss,
}

enum EHitReactionPrefabBodyType
{
    None,
    Character,
    CommonMonster,
    StraughtMonster,
    WoodpileMonster,
    Creature,
    FlyingCharacter,
}

enum EBeHitCheckDirectionType
{
    FrontBack,
    AllDirection,
    SingleDirection,
    Custom,
}

enum EAirHitReactionType
{
    KeepAirStateHit,
    ToAirFallStateHit,
    ForcedToGroundStateHit,
    Custom,
}

enum EHitTurnType
{
    NoTurn,
    TurnToDamageCaster,
}

enum EExecutionState
{
    None,
    Break,
    Waiting,
    Executed,
}

enum EDamageToTargetDirection
{
    SourceToTarget,
    TangentLeftToRight,
    TangentRightToLeft,
    TopToDown,
}

enum EDamageTargetDeathType
{
    Default,
    DirectDestroyTarget,
}

enum EDamageProcedureType
{
    Hit,
    Direct,
    Absolute,
}

enum EDamageCalculationType
{
    Normal,
    Item,
    Abnormal,
    Execution,
    Special,
}

enum EImpactStrength
{
    Default,
    Light,
    Moderate,
    High,
}

enum EHitStunDuration
{
    Default,
    Custom,
}

enum EEnvBreakDamage
{
    None,
    VeryLow,
    Low,
    Medium,
    High,
    VeryHigh,
    Custom,
}

enum EEcologyPostureDamageRatioType
{
    UseDamageRatio,
    Custom,
}


struct FAttackRecoverEnergyValue
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_HitRecoverCustomSkillEnergy;
    UPROPERTY()
    float32 m_HitRecoverCustomSkillEnergy_2;
    UPROPERTY()
    float32 m_HitRecoverCustomSkillEnergy_3;
    UPROPERTY()
    float32 m_HitRecoverCustomSkillEnergy_4;
    UPROPERTY()
    float32 m_HitRecoverSwitchPlayerEnergy;
    UPROPERTY()
    float32 m_HitRecoverUltraSkillEnergy;

    FAttackRecoverEnergyValue()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FAttackRecoverEnergyValue(const FAttackRecoverEnergyValue &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FAttackRecoverEnergyValue opAssign(const FAttackRecoverEnergyValue &inout Other)
    {
        FAttackRecoverEnergyValue __r;
        this.SetHitRecoverCustomSkillEnergy(Other.GetHitRecoverCustomSkillEnergy());
        this.SetHitRecoverCustomSkillEnergy_2(Other.GetHitRecoverCustomSkillEnergy_2());
        this.SetHitRecoverCustomSkillEnergy_3(Other.GetHitRecoverCustomSkillEnergy_3());
        this.SetHitRecoverCustomSkillEnergy_4(Other.GetHitRecoverCustomSkillEnergy_4());
        this.SetHitRecoverSwitchPlayerEnergy(Other.GetHitRecoverSwitchPlayerEnergy());
        this.SetHitRecoverUltraSkillEnergy(Other.GetHitRecoverUltraSkillEnergy());
        return __r;
    }
    TMap<FGameAttributeRef, float32> GetRecoverAttributeValues() const
    {
        TMap<FGameAttributeRef, float32> local_20;
        if (this.GetHitRecoverCustomSkillEnergy() > 0.0f)
        {
            local_20.Add(Attribute::CustomSkillEnergy, this.GetHitRecoverCustomSkillEnergy());
        }
        if (this.GetHitRecoverCustomSkillEnergy_2() > 0.0f)
        {
            local_20.Add(Attribute::CustomSkillEnergy_2, this.GetHitRecoverCustomSkillEnergy_2());
        }
        if (this.GetHitRecoverCustomSkillEnergy_3() > 0.0f)
        {
            local_20.Add(Attribute::CustomSkillEnergy_3, this.GetHitRecoverCustomSkillEnergy_3());
        }
        if (this.GetHitRecoverCustomSkillEnergy_4() > 0.0f)
        {
            local_20.Add(Attribute::CustomSkillEnergy_4, this.GetHitRecoverCustomSkillEnergy_4());
        }
        if (this.GetHitRecoverSwitchPlayerEnergy() > 0.0f)
        {
            local_20.Add(Attribute::SwitchPlayerEnergy, this.GetHitRecoverSwitchPlayerEnergy());
        }
        if (this.GetHitRecoverUltraSkillEnergy() > 0.0f)
        {
            local_20.Add(Attribute::UltraSkillEnergy, this.GetHitRecoverUltraSkillEnergy());
        }
        return local_20;
    }
    float32 GetHitRecoverCustomSkillEnergy() const property
    {
        return this.m_HitRecoverCustomSkillEnergy;
    }
    void SetHitRecoverCustomSkillEnergy(const float32 __Value) property
    {
        if (this.m_HitRecoverCustomSkillEnergy == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_HitRecoverCustomSkillEnergy = __Value;
        return;
    }
    float32 GetHitRecoverCustomSkillEnergy_2() const property
    {
        return this.m_HitRecoverCustomSkillEnergy_2;
    }
    void SetHitRecoverCustomSkillEnergy_2(const float32 __Value) property
    {
        if (this.m_HitRecoverCustomSkillEnergy_2 == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_HitRecoverCustomSkillEnergy_2 = __Value;
        return;
    }
    float32 GetHitRecoverCustomSkillEnergy_3() const property
    {
        return this.m_HitRecoverCustomSkillEnergy_3;
    }
    void SetHitRecoverCustomSkillEnergy_3(const float32 __Value) property
    {
        if (this.m_HitRecoverCustomSkillEnergy_3 == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_HitRecoverCustomSkillEnergy_3 = __Value;
        return;
    }
    float32 GetHitRecoverCustomSkillEnergy_4() const property
    {
        return this.m_HitRecoverCustomSkillEnergy_4;
    }
    void SetHitRecoverCustomSkillEnergy_4(const float32 __Value) property
    {
        if (this.m_HitRecoverCustomSkillEnergy_4 == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_HitRecoverCustomSkillEnergy_4 = __Value;
        return;
    }
    float32 GetHitRecoverSwitchPlayerEnergy() const property
    {
        return this.m_HitRecoverSwitchPlayerEnergy;
    }
    void SetHitRecoverSwitchPlayerEnergy(const float32 __Value) property
    {
        if (this.m_HitRecoverSwitchPlayerEnergy == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_HitRecoverSwitchPlayerEnergy = __Value;
        return;
    }
    float32 GetHitRecoverUltraSkillEnergy() const property
    {
        return this.m_HitRecoverUltraSkillEnergy;
    }
    void SetHitRecoverUltraSkillEnergy(const float32 __Value) property
    {
        if (this.m_HitRecoverUltraSkillEnergy == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_HitRecoverUltraSkillEnergy = __Value;
        return;
    }
}

struct FComboHitDamageReduction : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    float32 ReduceRatio;
    UPROPERTY()
    float32 MinDamageRatio;
    UPROPERTY()
    float32 Duration = 0.5f;


}

struct FAttackData : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FName AttackTag;
    UPROPERTY()
    FGameplayTag SpecialHitType;
    UPROPERTY()
    EDamageCalculationType DamageCalculationType = EDamageCalculationType(0);
    UPROPERTY()
    FAttackDataFloatVariant DamageRatio;
    UPROPERTY()
    FAttackDataFloatVariant DamageConstVal;
    UPROPERTY()
    FAttackDataFloatVariant PercentDamage;
    UPROPERTY()
    FGameAttributeCompositeCoefficient DamageAttributeCoefficient;
    UPROPERTY()
    FAttackDataFloatVariant PostureDamageRatio;
    UPROPERTY()
    FAttackDataFloatVariant PostureDamageConstVal;
    UPROPERTY()
    EEcologyPostureDamageRatioType EcologyPostureDamageRatioType = EEcologyPostureDamageRatioType(0);
    UPROPERTY()
    float32 EcologyPostureDamageRatio;
    UPROPERTY()
    float32 EcologyPostureDamageConstVal = 0.0f;
    UPROPERTY()
    FGameplayTagContainer AttackCalculationTags;
    UPROPERTY()
    FDataObjectPtr m_ComboDamageReduction;
    UPROPERTY()
    uint8 AffectFactionRelation = (3 != 0);
    UPROPERTY()
    int AttackCategory = 0;
    UPROPERTY()
    EAttackType AttackType = EAttackType(0);
    UPROPERTY()
    EHitBreakLevel HitBreakLevel = EHitBreakLevel(1);
    UPROPERTY()
    EAttackDataHitState HitLevel = EAttackDataHitState(0);
    UPROPERTY()
    EHitStunDuration HitStunDurationConfigType = EHitStunDuration(0);
    UPROPERTY()
    float32 CustomHitStunDuration = 0.0f;
    UPROPERTY()
    float32 CustomHitStunDetach = 0.0f;
    UPROPERTY()
    float32 LightlyHitImpulseX = 150.0f;
    UPROPERTY()
    float32 HeavyHitImpulseX = 250.0f;
    UPROPERTY()
    float32 RetreatHitImpulseX = 350.0f;
    UPROPERTY()
    float32 BlowHitImpulseX = 250.0f;
    UPROPERTY()
    float32 BlowHeavyHitImpulseX = 450.0f;
    UPROPERTY()
    float32 KnockDownHitImpulseX = 100.0f;
    UPROPERTY()
    float32 BlowHitImpulseZ = 80.0f;
    UPROPERTY()
    float32 BlowHeavyHitImpulseZ = 130.0f;
    UPROPERTY()
    EHitDirection HitDirection = EHitDirection(0);
    UPROPERTY()
    EDamageType DamageType = EDamageType(0);
    UPROPERTY()
    EAbnormalState AbnormalState = EAbnormalState(0);
    UPROPERTY()
    bool bIsAbnormalEnhanced = false;
    UPROPERTY()
    FCapability_Float AbnormalStateAccumulation;
    UPROPERTY()
    bool bHitRecoverSkillEnergyEffectByExternalCoefficient = true;
    UPROPERTY()
    FCapability_Float HitRecoverCustomSkillEnergy;
    UPROPERTY()
    FCapability_Float HitRecoverCustomSkillEnergy_2;
    UPROPERTY()
    FCapability_Float HitRecoverCustomSkillEnergy_3;
    UPROPERTY()
    FCapability_Float HitRecoverCustomSkillEnergy_4;
    UPROPERTY()
    float32 HitRecoverSwitchPlayerEnergy;
    UPROPERTY()
    FCapability_Float HitRecoverUltraSkillEnergy;
    UPROPERTY()
    FBuffConfigRef HitApplyBuffToTarget;
    UPROPERTY()
    FBuffConfigRef HitApplyBuffToSelf;
    UPROPERTY()
    FNameHandle_EntityBBVarInt HitAddEntityBB;
    UPROPERTY()
    int HitAddEntityBBValue = 0;
    UPROPERTY()
    FVector2D HitAddEntityBBValueMinMax = FVector2D(0.0, 9999.0);
    UPROPERTY()
    EDamageTargetDeathType TargetDeathType = EDamageTargetDeathType(0);
    UPROPERTY()
    float32 FreezeFrameTime;
    UPROPERTY()
    FFPTime FreezeUpdateTime = FECSWorld::FixedFrameInterval;
    UPROPERTY()
    EFreezeFrameCurve FreezeCurve = EFreezeFrameCurve(15);
    UPROPERTY()
    bool bUseFreezeAttenuationCurve = false;
    UPROPERTY()
    float32 BeHitFreezeFrameTime;
    UPROPERTY()
    FFPTime BeHitFreezeUpdateTime = FECSWorld::FixedFrameInterval;
    UPROPERTY()
    EFreezeFrameCurve BeHitFreezeCurve = EFreezeFrameCurve(15);
    UPROPERTY()
    bool bUseDefaultFreezeAttenuationCurve = true;
    UPROPERTY()
    UCurveFloat FreezeAttenuationCurve = nullptr;
    UPROPERTY()
    bool bEnableBeHitShakePause = false;
    UPROPERTY()
    float32 BeHitShakePauseTime = 0.2f;
    UPROPERTY()
    float32 HitShakePauseStartPercent = 0.05f;
    UPROPERTY()
    float32 HitShakeTime = 1.0f;
    UPROPERTY()
    float32 HitShakeRatio = 1.0f;
    UPROPERTY()
    float32 DynamicShakeStrengthScale = 1.0f;
    UPROPERTY()
    float32 DynamicShakeTimeScale = 1.0f;
    UPROPERTY()
    bool bForceShowDamageNumber = false;
    UPROPERTY()
    FDataObjectPtr m_SpecialDamageTextConfig;
    UPROPERTY()
    float32 DamageNumberRandomRatio = 1.0f;
    UPROPERTY()
    FDataObjectPtr HitCameraShakeSelf;
    UPROPERTY()
    FDataObjectPtr HitCameraShakeTarget;
    UPROPERTY()
    float32 HitWeaknessCameraShakeRatio = 1.4f;
    UPROPERTY()
    FName HitCameraShakeToSelf = NAME_None;
    UPROPERTY()
    FName HitCameraShakeToTarget = NAME_None;
    UPROPERTY()
    bool bEnableImpactVFX = true;
    UPROPERTY()
    bool bEnableImpactSFX = true;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> ImpactSFXEvent;
    UPROPERTY()
    EAttackFXConfigType FXConfigType = EAttackFXConfigType(0);
    UPROPERTY()
    FFXConfig HitFXConfig;
    UPROPERTY()
    bool bUseDefaultHitWeaknessFX = true;
    UPROPERTY()
    FSoftClassPath HitWeaknessFXAsset;
    UPROPERTY()
    EImpactType ImpactType = EImpactType(0);
    UPROPERTY()
    EImpactStrength ImpactStrengthValue = EImpactStrength(0);
    UPROPERTY()
    EEnvBreakDamage EnvBreakDamage = EEnvBreakDamage(0);
    UPROPERTY()
    float32 CustomEnvBreakDamage;
    UPROPERTY()
    bool bOverridePrefabDestructDamageLevel = false;
    UPROPERTY()
    EDestructibleClassLevel CustomDestructibleDamageLevel = EDestructibleClassLevel(0);


    float32 GetHitImpulseX() const
    {
        float32 local_4 = 0.0f;
        switch (int(this.HitLevel))
        {
        case 2:
        {
            return this.LightlyHitImpulseX;
        }
        case 3:
        {
            return this.HeavyHitImpulseX;
        }
        case 4:
        {
            return this.RetreatHitImpulseX;
        }
        case 5:
        {
            return this.BlowHitImpulseX;
        }
        case 6:
        {
            return this.BlowHeavyHitImpulseX;
        }
        case 7:
        {
            return this.KnockDownHitImpulseX;
        }
        default:
        {
            local_4 = 0.0f;
        }
        }
        return local_4;
    }
    float32 GetHitImpulseZ() const
    {
        int local_2 = int(this.HitLevel);
        if (local_2 <= 6)
        {
            if (local_2 != 5)
            {
                if (local_2 != 6)
                {
                }
            }
            else
            {
                return this.BlowHitImpulseZ;
            }
        }
        return 0.0f;
    }
    UCurveFloat GetFreezeAttenuationCurve() const
    {
        UCurveFloat local_6;
        if (this.bUseFreezeAttenuationCurve)
        {
            if (this.bUseDefaultFreezeAttenuationCurve)
            {
                local_6 = ::UCombatGlobalSettings::Get().DefaultFreezeAttenuationCurve;
            }
            else
            {
                local_6 = this.FreezeAttenuationCurve;
            }
            return local_6;
        }
        return nullptr;
    }
    bool HasHitPresentation() const
    {
        return !(!(this.HitCameraShakeSelf.IsValid()) && !(this.HitCameraShakeTarget.IsValid()) && this.HitCameraShakeToSelf.IsNone() && this.HitCameraShakeToTarget.IsNone() && !(this.HitFXConfig.IsValid()));
    }
    float32 GetEnvBreakDamageValue() const
    {
        switch (int(this.EnvBreakDamage))
        {
        case 0:
        {
            return 0.0f;
        }
        case 1:
        {
            return 10.0f;
        }
        case 2:
        {
            return 20.0f;
        }
        case 3:
        {
            return 40.0f;
        }
        case 4:
        {
            return 80.0f;
        }
        case 5:
        {
            return 120.0f;
        }
        case 6:
        {
            return this.CustomEnvBreakDamage;
        }
        default:
        {
        }
        }
        return 0.0f;
    }
    EDestructibleClassLevel GetDestructibleClassLevelFromDamage(const FECSEntity &inout Entity) const
    {
        if (!(this.bOverridePrefabDestructDamageLevel))
        {
            Get local_6;
            const FC_DestructibleDamageDefaultConfig& local_8 = local_6.opCall();
            if (local_8)
            {
                return local_8.AttackDestructibleDamageLevel;
            }
            return EDestructibleClassLevel(0);
        }
        return this.CustomDestructibleDamageLevel;
    }
    const TDataObjectPtr<FComboHitDamageReduction> GetComboDamageReduction() const property
    {
        const TDataObjectPtr<FComboHitDamageReduction> __r;
        return __r;
    }
    void SetComboDamageReduction(const TDataObjectPtr<FComboHitDamageReduction> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FComboHitDamageReduction>> local_2;
        this.m_ComboDamageReduction = local_2;
        return;
    }
    const TDataObjectPtr<FSpecialDamageTextConfig> GetSpecialDamageTextConfig() const property
    {
        const TDataObjectPtr<FSpecialDamageTextConfig> __r;
        return __r;
    }
    void SetSpecialDamageTextConfig(const TDataObjectPtr<FSpecialDamageTextConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FSpecialDamageTextConfig>> local_2;
        this.m_SpecialDamageTextConfig = local_2;
        return;
    }
}

namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FAttackRecoverEnergyValue &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FAttackRecoverEnergyValue &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FAttackRecoverEnergyValue
{
int __IndexOf_HitRecoverCustomSkillEnergy()
{
    return 0;
}
int __IndexOf_HitRecoverCustomSkillEnergy_2()
{
    return 1;
}
int __IndexOf_HitRecoverCustomSkillEnergy_3()
{
    return 2;
}
int __IndexOf_HitRecoverCustomSkillEnergy_4()
{
    return 3;
}
int __IndexOf_HitRecoverSwitchPlayerEnergy()
{
    return 4;
}
int __IndexOf_HitRecoverUltraSkillEnergy()
{
    return 5;
}
}
