
enum EHitStateInterruptBehaviourType
{
    Return,
    Override,
    AllExist,
}

namespace FDamageUtils
{
    const float32 DefenseConstant = 100f;

}
struct FHitStateInterruptBehaviour
{
    UPROPERTY()
    EHitStateInterruptBehaviourType InterruptBehaviour = EHitStateInterruptBehaviourType(2);
    UPROPERTY()
    bool bLock = false;

    FHitStateInterruptBehaviour()
    {
        this.InterruptBehaviour = EHitStateInterruptBehaviourType(2);
        this.bLock = false;
        return;
    }
    FHitStateInterruptBehaviour(const EHitStateInterruptBehaviourType Behaviour, const bool Lock)
    {
        this.InterruptBehaviour = Behaviour;
        this.bLock = Lock;
        return;
    }
    bool CanInterrupt() const
    {
        return (int(this.InterruptBehaviour) != 0);
    }
}

namespace FDamageUtils
{
FAttackBaseDamageValue CalcAttackBaseDamageValue(const FECSEntity &inout AttackerEntity, const FAttackData &inout AttackData, const FFPTime &inout Time, const bool bToAvatar, const FCapabilityInstanceId &inout CapabilityInstanceId)
{
    FAttackBaseDamageValue local_7;
    int local_24 = 0;
    int local_80 = 0;
    int local_90 = 0;
    float32 local_8 = 0.0f;
    float32 local_11 = 0.0f;
    float32 local_12 = 0.0f;
    if ((int(AttackData.DamageCalculationType) == 0 || (int(AttackData.DamageCalculationType) == 2)))
    {
        float32 local_72;
        float32 local_71;
        if (local_24)
        {
            local_8 = AttackData.DamageRatio.GetFloatValue(bToAvatar, local_24.Storage, CapabilityInstanceId);
            float32 local_9 = AttackData.DamageConstVal.GetFloatValue(bToAvatar, local_24.Storage, CapabilityInstanceId);
            FGameAttributeCompositeCoefficient local_28 = AttackData.DamageAttributeCoefficient;
            for (auto& local_42 : local_28.AccumulateElements)
            {
                local_42.Multiple.DefaultValue = local_9;
            }
            local_11 = AttackData.PostureDamageRatio.GetFloatValue(bToAvatar, local_24.Storage, CapabilityInstanceId);
            local_12 = AttackData.PostureDamageConstVal.GetFloatValue(bToAvatar, local_24.Storage, CapabilityInstanceId);
            local_7.SetHPDamage(FDamageUtils::CalcBaseDamage(AttackerEntity, local_8, local_9, local_28, Time));
            local_7.SetHPDamage_MaxPercent(AttackData.PercentDamage.GetFloatValue(bToAvatar, local_24.Storage, CapabilityInstanceId));
            local_9 = FDamageUtils::CalcBasePostureDamage(AttackerEntity, local_11, local_12, Time);
            local_7.SetPostureDamage(local_9);
            local_7.SetAbnormalStateAccumulation(local_9);
        }
        else
        {
            FCapability_Float local_70 = AttackData.DamageRatio.GetValue(bToAvatar);
            local_8 = local_70.DefaultValue;
            FCapability_Float local_70_2 = AttackData.DamageConstVal.GetValue(bToAvatar);
            float32 local_10_2 = local_70_2.DefaultValue;
            FCapability_Float local_70_3 = AttackData.PostureDamageRatio.GetValue(bToAvatar);
            local_11 = local_70_3.DefaultValue;
            FCapability_Float local_70_4 = AttackData.PostureDamageConstVal.GetValue(bToAvatar);
            local_12 = local_70_4.DefaultValue;
            local_7.SetHPDamage(FDamageUtils::CalcBaseDamage(AttackerEntity, local_8, local_10_2, AttackData.DamageAttributeCoefficient, Time));
            FCapability_Float local_70_5 = AttackData.PercentDamage.GetValue(bToAvatar);
            float32 local_9_2 = local_70_5.DefaultValue;
            local_7.SetHPDamage_MaxPercent(local_9_2);
            local_7.SetPostureDamage(FDamageUtils::CalcBasePostureDamage(AttackerEntity, local_11, local_12, Time));
            local_9_2 = AttackData.AbnormalStateAccumulation.DefaultValue;
            local_7.SetAbnormalStateAccumulation(local_9_2);
        }
        local_71 = AttackData.EcologyPostureDamageConstVal;
        local_72 = 0.0f;
        if (int(AttackData.EcologyPostureDamageRatioType) == 0)
        {
            local_72 = local_8;
        }
        else
        {
            local_72 = AttackData.EcologyPostureDamageRatio;
        }
        if (local_72 > 0.0f)
        {
            if (local_80 && local_80.HasAttribute(Attribute::EcologyPostureAttack))
            {
                local_71 = local_71 + ((local_80.GetAttributeValue(Attribute::EcologyPostureAttack, Time)) * local_72);
            }
        }
        local_7.SetEcologyPostureDamage(local_71);
        local_7.SetAttackRatio(local_8);
    }
    else
    {
        float32 local_72;
        float32 local_71;
        if (int(AttackData.DamageCalculationType) == 1)
        {
            int local_81;
            FCapability_Float local_70_6 = AttackData.DamageConstVal.GetValue(bToAvatar);
            local_71 = local_70_6.DefaultValue;
            FCapability_Float local_70_7 = AttackData.PostureDamageConstVal.GetValue(bToAvatar);
            local_72 = local_70_7.DefaultValue;
            local_81 = 1;
            FECSWorldPtr local_84 = AttackerEntity.GetWorld();
            if (local_90)
            {
                if (local_90.CommissionConfig)
                {
                    FCommissionConfig local_92;
                    local_81 = int(local_92.MonsterBaseLevel);
                }
            }
            TDataObjectIterator<FCommissionLevelAttackConfig> local_108;
            for (; local_108; )
            {
                if (local_108.GetData().CommissionLevel == local_81)
                {
                    FCapability_Float local_70_8 = AttackData.DamageRatio.GetValue(bToAvatar);
                    local_8 = local_70_8.DefaultValue;
                    local_70_8 = AttackData.PostureDamageRatio.GetValue(bToAvatar);
                    local_11 = local_70_8.DefaultValue;
                    float32 local_9_4 = local_108.GetData().Attack * local_8;
                    local_71 = local_71 + local_9_4;
                    local_9_4 = local_108.GetData().PostureAttack;
                    local_9_4 = local_9_4 * local_11;
                    local_72 = local_72 + local_9_4;
                    local_7.SetAttackRatio(local_8);
                    break;
                }
                local_108.opPreInc();
            }
            local_7.SetHPDamage(local_71);
            local_7.SetPostureDamage(local_72);
            FCapability_Float local_70_9 = AttackData.PercentDamage.GetValue(bToAvatar);
            float32 local_9_5 = local_70_9.DefaultValue;
            local_7.SetHPDamage_MaxPercent(local_9_5);
            local_9_5 = AttackData.AbnormalStateAccumulation.DefaultValue;
            local_7.SetAbnormalStateAccumulation(local_9_5);
        }
    }
    return local_7;
}
float32 CalcBaseDamage(const FECSEntity &inout AttackerEntity, const float32 DamageAttackRatio, const float32 ConstDamage, const FGameAttributeCompositeCoefficient &inout AttributeCoefficient, const FFPTime &inout Time)
{
    int local_10 = 0;
    if (DamageAttackRatio == 0.0f && AttributeCoefficient.AccumulateElements.IsEmpty())
    {
        return ConstDamage;
    }
    if (!(local_10))
    {
        return ConstDamage;
    }
    float32 local_11 = ConstDamage;
    if (DamageAttackRatio != 0.0f)
    {
        local_11 = local_11 + (local_10.GetAttributeValue(Attribute::Attack, Time) * DamageAttackRatio);
    }
    local_11 = local_11 + FGameAttributeUtils::GetValueByAttributeCoefficient(AttackerEntity, AttributeCoefficient, Time);
    return local_11;
}
float32 CalcBasePostureDamage(const FECSEntity &inout AttackerEntity, const float32 PostureAttackRatio, const float32 ConstDamage, const FFPTime &inout Time)
{
    int local_6 = 0;
    if (!(local_6))
    {
        return ConstDamage;
    }
    return (ConstDamage + float32(local_6.GetAttributeValue(Attribute::PostureAttack, Time) * PostureAttackRatio));
}
void ModifyBaseDamage(FAttackBaseDamageValue &inout BaseDamageValue, const EBaseDamagePartType BaseDamagePart, const EDamageValueModifyType ModifyType, const float32 Value)
{
    float32 local_1 = 0.0f;
    switch (int(BaseDamagePart))
    {
    case 0:
    {
        local_1 = BaseDamageValue.GetHPDamage();
        break;
    }
    case 1:
    {
        local_1 = BaseDamageValue.GetHPDamage_MaxPercent();
        break;
    }
    case 2:
    {
        local_1 = BaseDamageValue.GetPostureDamage();
        break;
    }
    case 3:
    {
        local_1 = BaseDamageValue.GetEcologyPostureDamage();
        break;
    }
    case 4:
    {
        local_1 = BaseDamageValue.GetAbnormalStateAccumulation();
        break;
    }
    }
    if (int(ModifyType) == 0)
    {
        local_1 = local_1 + Value;
    }
    else
    {
        if (int(ModifyType) == 2)
        {
            local_1 = local_1 * Value;
        }
        else
        {
            if (int(ModifyType) == 1)
            {
                local_1 = Value;
            }
        }
    }
    switch (int(BaseDamagePart))
    {
    case 0:
    {
        BaseDamageValue.SetHPDamage(local_1);
        return;
    }
    case 1:
    {
        BaseDamageValue.SetHPDamage_MaxPercent(local_1);
        return;
    }
    case 2:
    {
        BaseDamageValue.SetPostureDamage(local_1);
        return;
    }
    case 3:
    {
        BaseDamageValue.SetEcologyPostureDamage(local_1);
        return;
    }
    case 4:
    {
        BaseDamageValue.SetAbnormalStateAccumulation(local_1);
        return;
    }
    }
    return;
}
void SetBaseDamageZero(FAttackBaseDamageValue &inout BaseDamage)
{
    BaseDamage.SetHPDamage(0.0f);
    BaseDamage.SetHPDamage_MaxPercent(0.0f);
    BaseDamage.SetPostureDamage(0.0f);
    BaseDamage.SetEcologyPostureDamage(0.0f);
    BaseDamage.SetAbnormalStateAccumulation(0.0f);
    return;
}
FGameAttributeRef GetAttackerAttributeByDamageType(const EDamageType DamageType)
{
    switch (int(DamageType))
    {
    case 0:
    {
        return Attribute::PhysicalDamage;
    }
    case 1:
    {
        return Attribute::PowerDamage;
    }
    case 2:
    {
        return Attribute::FireDamage;
    }
    case 3:
    {
        return Attribute::ThunderDamage;
    }
    case 4:
    {
        return Attribute::IceDamage;
    }
    case 5:
    {
        return Attribute::LightDamage;
    }
    case 6:
    {
        return Attribute::ShadowDamage;
    }
    }
    return Attribute::PhysicalDamage;
}
FGameAttributeRef GetDefenderAttributeByDamageType(const EDamageType DamageType)
{
    switch (int(DamageType))
    {
    case 0:
    {
        return Attribute::TakePhysicalDamage;
    }
    case 1:
    {
        return Attribute::TakePowerDamage;
    }
    case 2:
    {
        return Attribute::TakeFireDamage;
    }
    case 3:
    {
        return Attribute::TakeThunderDamage;
    }
    case 4:
    {
        return Attribute::TakeIceDamage;
    }
    case 5:
    {
        return Attribute::TakeLightDamage;
    }
    case 6:
    {
        return Attribute::TakeShadowDamage;
    }
    }
    return Attribute::TakePhysicalDamage;
}
FAttackRecoverEnergyValue CalcAttackRecoverEnergyValue(const FECSEntity &inout AttackerEntity, const FAttackData &inout AttackData, const FFPTime &inout Time, const FCapabilityInstanceId &inout CapabilityInstanceId)
{
    FAttackRecoverEnergyValue local_8;
    int local_14 = 0;
    float32 local_16 = 0.0f;
    if (local_14)
    {
        local_8.SetHitRecoverCustomSkillEnergy(local_16);
        local_8.SetHitRecoverCustomSkillEnergy_2(local_16);
        local_8.SetHitRecoverCustomSkillEnergy_3(local_16);
        local_8.SetHitRecoverCustomSkillEnergy_4(local_16);
        local_16 = AttackData.HitRecoverSwitchPlayerEnergy;
        local_8.SetHitRecoverSwitchPlayerEnergy(local_16);
        local_8.SetHitRecoverUltraSkillEnergy(local_16);
    }
    else
    {
        local_8.SetHitRecoverCustomSkillEnergy(AttackData.HitRecoverCustomSkillEnergy.DefaultValue);
        local_8.SetHitRecoverCustomSkillEnergy_2(AttackData.HitRecoverCustomSkillEnergy_2.DefaultValue);
        local_8.SetHitRecoverCustomSkillEnergy_3(AttackData.HitRecoverCustomSkillEnergy_3.DefaultValue);
        local_8.SetHitRecoverCustomSkillEnergy_4(AttackData.HitRecoverCustomSkillEnergy_4.DefaultValue);
        local_8.SetHitRecoverSwitchPlayerEnergy(AttackData.HitRecoverSwitchPlayerEnergy);
        local_8.SetHitRecoverUltraSkillEnergy(AttackData.HitRecoverUltraSkillEnergy.DefaultValue);
    }
    return local_8;
}
FGameplayTagContainer ConvertAttackCategoryToTags(const int AttackCategory)
{
    FGameplayTagContainer local_12;
    int local_13 = AttackCategory & 1;
    if (local_13 != 0)
    {
        local_12.AddTag(GameplayTags::Attack_NormalAttack);
    }
    int local_14 = AttackCategory & 2;
    if (local_14 != 0)
    {
        local_12.AddTag(GameplayTags::Attack_SpecialAttack);
    }
    int local_13_2 = AttackCategory & 4;
    if (local_13_2 != 0)
    {
        local_12.AddTag(GameplayTags::Attack_ChargeAttack);
    }
    int local_16 = AttackCategory & 32;
    if (local_16 != 0)
    {
        local_12.AddTag(GameplayTags::Attack_SimpleSkill);
    }
    int local_14_2 = AttackCategory & 8;
    if (local_14_2 != 0)
    {
        local_12.AddTag(GameplayTags::Attack_UltraSkill);
    }
    int local_13_3 = AttackCategory & 16;
    if (local_13_3 != 0)
    {
        local_12.AddTag(GameplayTags::Attack_SwitchAttack);
    }
    return local_12;
}
void AddAttackCategoryTagsToBitSet(const int AttackCategory, FGameplayTagBisSetWrapper &inout BisSet)
{
    int local_1 = AttackCategory & 1;
    if (local_1 != 0)
    {
        BisSet.AddTag(GameplayTags::Attack_NormalAttack);
    }
    int local_2 = AttackCategory & 2;
    if (local_2 != 0)
    {
        BisSet.AddTag(GameplayTags::Attack_SpecialAttack);
    }
    int local_1_2 = AttackCategory & 4;
    if (local_1_2 != 0)
    {
        BisSet.AddTag(GameplayTags::Attack_ChargeAttack);
    }
    int local_4 = AttackCategory & 32;
    if (local_4 != 0)
    {
        BisSet.AddTag(GameplayTags::Attack_SimpleSkill);
    }
    int local_2_2 = AttackCategory & 8;
    if (local_2_2 != 0)
    {
        BisSet.AddTag(GameplayTags::Attack_UltraSkill);
    }
    int local_1_3 = AttackCategory & 16;
    if (local_1_3 != 0)
    {
        BisSet.AddTag(GameplayTags::Attack_SwitchAttack);
    }
    return;
}
float32 CalcDefenseRatio(const float32 DefenseValue)
{
    if (DefenseValue >= 0.0f)
    {
        float32 local_1 = -(DefenseValue / (DefenseValue + 100.0f));
        return local_1;
    }
    else
    {
        return (DefenseValue / (DefenseValue - 100.0f));
    }
}
float32 GetGameModeCoefficient(const FECSEntity &inout Attacker, const FECSEntity &inout Taker)
{
    return GameModeDamageCoefficient::GetCoefficient(Attacker, Taker);
}
bool FilterPropEnvBreakableDamage(const FECSEntity &inout Target, const FECSEntity &inout FinalDamageSource, const FFPTime &inout Time, const TOptional<FAttackData> &inout AttackData)
{
    Has local_4;
    int local_12 = 0;
    if (!(local_4.opCall()) || !(AttackData.IsSet()))
    {
        return false;
    }
    FDamageUtils::DirectDamagePropEnvBreakable(Target, FinalDamageSource, local_12, Time, GetEnvBreakDamageValue(), FinalDamageSource.GetDestructibleClassLevelFromDamage());
    return true;
}
void DirectDamagePropEnvBreakable(const FECSEntity &inout Target, const FECSEntity &inout FinalDamageSource, const FC_PropEnvBreakableConfig &inout EnvBreakableConfig, const FFPTime &inout Time, const float32 EnvBreakDamage, const EDestructibleClassLevel DestructibleDamageLevel)
{
    Has local_4;
    if (!(local_4.opCall()))
    {
        return;
    }
    float32 local_6 = EnvBreakDamage;
    if (int(DestructibleDamageLevel) < int(EnvBreakableConfig.DestructibleClass))
    {
        local_6 = 0.0f;
    }
    else
    {
        if (int(DestructibleDamageLevel) > int(EnvBreakableConfig.DestructibleClass))
        {
            Get local_14;
            local_6 = local_14.opCall().GetAttributeValue(Attribute::EnvBreakHPMax, Time);
        }
    }
    if (local_6 > 0.0f)
    {
        ModifyOrAdd local_18;
        FC_EnvBreakDamageReceiver& local_20 = local_18.opCall();
        if (local_20)
        {
            FEvnBreakDamageData& local_22 = local_20.AddNewDamage(Time);
            local_22.SetEnvBreakDamage(local_6);
            local_22.SetFinalDamageSource(FinalDamageSource);
        }
    }
    return;
}
int AddDamageCurFrame(const FDamageBeforeCalculationData &inout Data)
{
    int local_8 = 0;
    int local_24 = 0;
    int local_34 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    local_8.DamageDatas.Add(Data);
    int local_9 = local_8.DamageDatas.Num() - 1;
    Has local_16;
    bool local_17 = local_16.opCall();
    if (local_17)
    {
        FDamageToCalculateRecordData local_26;
        local_26.Index = local_9;
        local_26.DamageProcedureType = Data.DamageProcedureType;
        local_24.DamageToCalculateRecord.Add(local_26);
    }
    bool local_17_2 = local_16.opCall();
    if (local_17_2)
    {
        FDamageToCalculateRecordData local_26;
        local_26.Index = local_9;
        local_26.DamageProcedureType = Data.DamageProcedureType;
        local_34.DamageToCalculateRecord.Add(local_26);
    }
    return local_9;
}
int AddDamage(FDamageBeforeCalculationData &inout Data)
{
    int local_20 = 0;
    if (!(Data.DamageTarget.IsValid()))
    {
        return -1;
    }
    if (ECS::GetContextJob().IsAfterJobPhase(EECSJobGroup(8), EJG_LateFixedFrame::PrepareDamageToCalculatCurFrame))
    {
        Data.Time = (FFPTime(ECS::GetECSWorld().GetFixedTime().Time) + FFPTime(0.001));
    }
    FFPTime local_14 = Data.Time;
    if (local_14.opCmp(ECS::GetECSWorld().GetFixedTime().Time) > 0)
    {
        local_20.AddDamageData(Data);
    }
    else
    {
        FDamageUtils::AddDamageCurFrame(Data);
    }
    return -1;
}
void AddHitDamage(const FECSEntity &inout FinalDamageSource, const FECSEntity &inout DirectDamageCauser, const FECSEntity &inout AttackerAttributeProvider, const FECSEntity &inout Target, const FAttackInfo &inout AttackInfo, const FName &inout StrikeKey, const FAttackBaseDamageValue &inout BaseDamage, const FAttackRecoverEnergyValue &inout RecoverEnergyValue, const float32 AttenuationRatio, const FName &inout BodyPart, const bool bForceHitWeakness, const bool bAttenuation, const FVector &inout AttackFromPosition, const FVector &inout Position, const FVector &inout Direction, const int HitEventId, const FFPTime &inout Time, const bool bLatencyCompensation = false)
{
    const FAttackData& local_50;
    TDataObjectPtr<FAttackData> local_24 = TDataObjectPtr<FAttackData>(AttackInfo.AttackData);
    if (FDamageUtils::FilterPropEnvBreakableDamage(Target, FinalDamageSource, Time, TOptional<FAttackData>(local_50)))
    {
        return;
    }
    FDamageBeforeCalculationData local_1064;
    local_1064.Time = Time;
    local_1064.DamageProcedureType = EDamageProcedureType(0);
    local_1064.DamageCalculationType = local_50.DamageCalculationType;
    local_1064.bLatencyCompensation = bLatencyCompensation;
    local_1064.DamageTarget = Target;
    local_1064.FinalDamageSource = FinalDamageSource;
    local_1064.DirectDamageSource = DirectDamageCauser;
    local_1064.AttackerAttributeProvider = AttackerAttributeProvider;
    local_1064.AttackData = TDataObjectPtr<FAttackData>(AttackInfo.AttackData);
    local_1064.HitType = AttackInfo.HitType;
    local_1064.DamageType = local_50.DamageType;
    local_1064.HitBreakLevel = local_50.HitBreakLevel;
    local_1064.AbnormalState = local_50.AbnormalState;
    local_1064.StrikeKey = StrikeKey;
    local_1064.DamageBodyPart = BodyPart;
    local_1064.bIsWeakness = bForceHitWeakness;
    local_1064.bIsAttenuated = bAttenuation;
    local_1064.ExternalCoefficient = AttenuationRatio;
    local_1064.AttackFromPosition = AttackFromPosition;
    local_1064.Position = Position;
    local_1064.Direction = Direction;
    local_1064.BaseDamage = BaseDamage;
    local_1064.RecoverEnergyValue = RecoverEnergyValue;
    FDamageUtils::AddDamage(local_1064);
    return;
}
void AddHitDamageToProjectile(const FECSEntity &inout DamageCaster, const FECSEntity &inout TargetEntity, const FC_HittableConfig &inout HittableConfig, FC_ProjectileHealth &inout ProjectileHealth, const FHitTestCheckResult &inout HitTestCheckResult, const FAttackData &inout AttackData, const FFPTime &inout HitTime, const float32 AttenuationRatio, const FVector &inout HitPoint)
{
    int local_62 = 0;
    if (ProjectileHealth.GetRemainDamageCanTake() == 0.0f || (ProjectileHealth.GetRemainCanBeHitCount() == 0))
    {
        return;
    }
    EFactionRelationSplitSelf local_7 = HitTestCheckResult.Relation;
    FHitResolveOption local_14;
    if (int(HitTestCheckResult.ConditionalResolveIndex) >= 0)
    {
        local_14 = HittableConfig.ConditionalResolveOptions[int(HitTestCheckResult.ConditionalResolveIndex)].ResolveOption;
    }
    else
    {
        local_14 = HittableConfig.DefaultResolveOption;
    }
    float32 local_15 = 0.0f;
    if (local_14.OverrideDamageToHp >= 0.0f)
    {
        local_15 = local_14.OverrideDamageToHp;
    }
    else
    {
        Get local_20;
        const FC_GameAttribute& local_22 = local_20.opCall();
        if (local_22)
        {
            float32 local_1 = local_22.GetAttributeValue(Attribute::DamageAddRatio, HitTime);
            if (local_1 < -1.0f)
            {
                local_1 = -1.0f;
            }
            FAttackBaseDamageValue local_31 = FDamageUtils::CalcAttackBaseDamageValue(DamageCaster, AttackData, HitTime, FDamageUtils::IsDamageToAvatar(TargetEntity), FCapabilityInstanceId());
            local_15 = (local_31.GetHPDamage() * (local_1 + 1.0f)) * AttenuationRatio;
        }
    }
    if (local_15 > 0.0f)
    {
        FC_HittableDataRuntime local_56;
        Assign local_48;
        Has local_44;
        if (ProjectileHealth.GetRemainDamageCanTake() > 0.0f)
        {
            if (local_14.MinHpReserve > 0.0f)
            {
                local_15 = FMath::Min(local_15, (ProjectileHealth.GetRemainDamageCanTake() - local_14.MinHpReserve));
            }
            else
            {
                local_15 = FMath::Min(local_15, ProjectileHealth.GetRemainDamageCanTake());
            }
            if (local_14.MaxDamageToHp >= 0.0f)
            {
                if (!(local_44.opCall()))
                {
                    local_48.opCall(local_56).GetModify_ConditionalHitDatas().SetNum(HittableConfig.ConditionalResolveOptions.Num());
                }
                if (int(HitTestCheckResult.ConditionalResolveIndex) >= 0)
                {
                    float32 local_39_2 = FMath::Min(local_15, local_14.MaxDamageToHp - local_62.GetConditionalHitDatas()[int(HitTestCheckResult.ConditionalResolveIndex)].GetDamageToHp());
                    local_15 = local_39_2;
                    local_39_2.SetDamageToHp(local_62.GetModify_ConditionalHitDatas()[int(HitTestCheckResult.ConditionalResolveIndex)].GetDamageToHp() + local_15);
                }
                else
                {
                    float32 local_2_2 = local_14.MaxDamageToHp - local_62.GetDefaultHitData().GetDamageToHp();
                    local_15 = FMath::Min(local_15, local_2_2);
                    local_2_2.SetDamageToHp((local_62.GetModify_DefaultHitData().GetDamageToHp() + local_15));
                }
            }
            ProjectileHealth.SetRemainDamageCanTake((ProjectileHealth.GetRemainDamageCanTake() - local_15));
            float32 local_23_3 = ProjectileHealth.GetDamageTaken();
            local_23_3 = local_23_3 + local_15;
            ProjectileHealth.SetDamageTaken(local_23_3);
        }
    }
    int local_63_2 = int(local_14.OverrideDamageToHitCount) >= 0 ? int(local_14.OverrideDamageToHitCount) : 1;
    if (local_63_2 > 0)
    {
        FC_HittableDataRuntime local_56;
        Assign local_48;
        Has local_44;
        if (ProjectileHealth.GetRemainCanBeHitCount() > 0)
        {
            if (int(local_14.MinHitCountReserve) > 0)
            {
                local_63_2 = FMath::Min(local_63_2, (ProjectileHealth.GetRemainCanBeHitCount() - int(local_14.MinHitCountReserve)));
            }
            else
            {
                local_63_2 = FMath::Min(local_63_2, ProjectileHealth.GetRemainCanBeHitCount());
            }
            if (int(local_14.MaxDamageToHitCount) >= 0)
            {
                if (!(local_44.opCall()))
                {
                    local_48.opCall(local_56).GetModify_ConditionalHitDatas().SetNum(HittableConfig.ConditionalResolveOptions.Num());
                }
                if (int(HitTestCheckResult.ConditionalResolveIndex) >= 0)
                {
                    int local_5_2 = FMath::Min(local_63_2, (int(local_14.MaxDamageToHitCount) - local_62.GetConditionalHitDatas()[HitTestCheckResult.ConditionalResolveIndex].GetHitCount()));
                    local_63_2 = local_5_2;
                    local_5_2.SetHitCount((local_62.GetModify_ConditionalHitDatas()[HitTestCheckResult.ConditionalResolveIndex].GetHitCount() + local_63_2));
                }
                else
                {
                    int local_4_2 = local_14.MaxDamageToHitCount - local_62.GetDefaultHitData().GetHitCount();
                    local_63_2 = FMath::Min(local_63_2, local_4_2);
                    local_4_2.SetHitCount((local_62.GetModify_DefaultHitData().GetHitCount() + local_63_2));
                }
            }
            ProjectileHealth.SetRemainCanBeHitCount((ProjectileHealth.GetRemainCanBeHitCount() - local_63_2));
        }
    }
    if (FAbilityUtils::CanTriggerAbilityEffectEvent(TargetEntity, EAbilityEffectEvent(5)))
    {
        FAbilityEffectEventData_BeHit local_104;
        local_104.BeHitEntity = TargetEntity;
        local_104.CauserEntity = DamageCaster;
        local_104.HitPoint = HitPoint;
        GetDefaulted local_108;
        FECSEntity local_114 = local_108.opCall().GetOwnerEntity();
    }
    Get local_118;
    const FC_BeHitPresentationConfig& local_120 = local_118.opCall();
    if (local_120)
    {
        if (local_120.bShowDamageNum)
        {
            FCombatUtils::ShowDamageNumber(DamageCaster, TargetEntity, HitTime, HitTime, local_15, NAME_None, false, HitPoint, AttackData.AttackType, AttackData.DamageType, false, false, (AttenuationRatio < 1.0f), AttackData.DamageNumberRandomRatio, AttackData.GetSpecialDamageTextConfig());
        }
    }
    return;
}
void AddDirectDamage(const FECSEntity &inout FinalDamageSource, const FECSEntity &inout AttackerAttributeProvider, const FECSEntity &inout Target, const FAttackInfo &inout AttackInfo, const EDamageType DamageType, const FAttackBaseDamageValue &inout BaseDamage, const float32 ExternalCoefficient, const EAbnormalState AbnormalState, const FFPTime &inout Time)
{
    FAttackData local_28;
    if (!(AttackInfo.AttackData))
    {
        return;
    }
    TDataObjectPtr<FAttackData> local_26 = TDataObjectPtr<FAttackData>(AttackInfo.AttackData);
    if (FDamageUtils::FilterPropEnvBreakableDamage(Target, FinalDamageSource, Time, TOptional<FAttackData>(local_28)))
    {
        return;
    }
    FDamageBeforeCalculationData local_1040;
    local_1040.Time = Time;
    local_1040.DamageProcedureType = EDamageProcedureType(1);
    local_1040.DamageCalculationType = local_28.DamageCalculationType;
    local_1040.DamageTarget = Target;
    local_1040.FinalDamageSource = FinalDamageSource;
    local_1040.DirectDamageSource = FinalDamageSource;
    local_1040.AttackerAttributeProvider = AttackerAttributeProvider;
    local_1040.AttackData = (TDataObjectPtr<FAttackData>(AttackInfo.AttackData));
    local_1040.DamageType = DamageType;
    local_1040.AbnormalState = AbnormalState;
    local_1040.ExternalCoefficient = ExternalCoefficient;
    GetDefaulted local_1070;
    local_1040.Position = local_1070.opCall().GetPosition();
    local_1040.AttackFromPosition = local_1040.Position;
    local_1040.BaseDamage = BaseDamage;
    FDamageUtils::AddDamage(local_1040);
    return;
}
void AddDirectDamageByAttackData(const FECSEntity &inout FinalDamageSource, const FECSEntity &inout AttackerAttributeProvider, const FECSEntity &inout Target, const FAttackData &inout AttackData, const FFPTime &inout Time)
{
    FAttackInfo local_26;
    FDataObjectPtr local_50;
    local_26.AttackData = local_50;
    bool local_52 = FDamageUtils::IsDamageToAvatar(Target);
    FCapabilityInstanceId local_53 = FCapabilityInstanceId();
    return;
}
void AddExecutionDamage(const FECSEntity &inout FinalDamageSource, const FECSEntity &inout AttackerAttributeProvider, const FECSEntity &inout Target, const FAttackData &inout AttackData, const float32 DamageRatio, const FVector &inout HitPosition, const FFPTime &inout Time)
{
    int local_848 = 0;
    int local_854 = 0;
    bool local_841 = FDamageUtils::FilterPropEnvBreakableDamage(Target, FinalDamageSource, Time, TOptional<FAttackData>(AttackData));
    if (local_841)
    {
        return;
    }
    if (!(local_848))
    {
        local_841 = false;
    }
    else
    {
        local_841 = local_854;
    }
    if (local_841)
    {
        FDamageBeforeCalculationData local_1028;
        local_1028.Time = Time;
        local_1028.DamageProcedureType = EDamageProcedureType(2);
        local_1028.DamageCalculationType = EDamageCalculationType(3);
        local_1028.DamageTarget = Target;
        local_1028.FinalDamageSource = FinalDamageSource;
        local_1028.DirectDamageSource = FinalDamageSource;
        local_1028.AttackerAttributeProvider = AttackerAttributeProvider;
        TDataObjectPtr<FAttackData> local_1054;
        local_1028.AttackData = local_1054;
        local_1028.DamageType = AttackData.DamageType;
        local_1028.AttackFromPosition = HitPosition;
        local_1028.Position = HitPosition;
        local_1028.BaseDamage.SetHPDamage_MaxPercent(local_854.GetExecutedDamageHPRatio() * (local_848.GetExecuteEntityArray().Num() / local_848.GetCurrentMaxPlayerNum()));
        local_1028.BaseDamage.SetHPDamage_MaxPercent(local_1028.BaseDamage.GetHPDamage_MaxPercent() * DamageRatio);
        FDamageUtils::AddDamage(local_1028);
        return;
    }
    XError(ELog(42), FString().Append("AddExecutionDamage to no FC_ExecutedConfig entity"));
    return;
}
void AddAbsoluteDamage(const FECSEntity &inout FinalDamageSource, const FECSEntity &inout AttackerAttributeProvider, const FECSEntity &inout Target, const EDamageType DamageType, const FAttackBaseDamageValue &inout BaseDamage, const FFPTime &inout Time)
{
    if (FDamageUtils::FilterPropEnvBreakableDamage(Target, FinalDamageSource, Time, TOptional<FAttackData>()))
    {
        return;
    }
    FDamageBeforeCalculationData local_1014;
    local_1014.Time = Time;
    local_1014.DamageProcedureType = EDamageProcedureType(2);
    local_1014.DamageCalculationType = EDamageCalculationType(4);
    local_1014.DamageTarget = Target;
    local_1014.FinalDamageSource = FinalDamageSource;
    local_1014.DirectDamageSource = FinalDamageSource;
    local_1014.AttackerAttributeProvider = AttackerAttributeProvider;
    local_1014.DamageType = DamageType;
    GetDefaulted local_1020;
    local_1014.AttackFromPosition = local_1020.opCall().GetPosition();
    local_1014.Position = local_1014.AttackFromPosition;
    local_1014.BaseDamage = BaseDamage;
    FDamageUtils::AddDamage(local_1014);
    return;
}
void LifeDrain(const FECSEntity &inout TargetEntity, const bool bValueAsMaxHPRatio, const float32 Value, const FFPTime &inout Time)
{
    int local_8 = 0;
    int local_16 = 0;
    float32 local_2 = -Value;
    if (bValueAsMaxHPRatio)
    {
        if (local_8)
        {
            float32 local_10;
            local_10 = local_8.GetAttributeValue(Attribute::HPMax, Time);
            local_10 = -local_10;
            local_2 = local_10 * Value;
        }
    }
    if (local_2 < 0.0f)
    {
        FHPChangeData local_24;
        local_24.DeltaValue = local_2;
        local_24.ChangeType = EHPChangeType(2);
        local_16.Changes.Add(local_24);
    }
    return;
}
FHitStateInterruptBehaviour GetHitStateInterruptBehaviour(const FECSEntity &inout Entity, const FC_HitReaction &inout HitReactionComp, const EHitReactionState WillHitState, const EAbnormalState WillHitAbnormalState = EAbnormalState::None)
{
    if (Entity.MatchGameplayTag(GameplayTags::CombatState_BlockAllHitReaction))
    {
        return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(0), true);
    }
    if (HitReactionComp)
    {
        int local_7 = int(FAbnormalStateUtils::GetTargetAbnormalWeakness(Entity));
        return FDamageUtils::InternalGetHitStateInterruptBehaviour(Entity, HitReactionComp.GetCurrentHitState());
    }
    return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(2), false);
}
FHitStateInterruptBehaviour InternalGetHitStateInterruptBehaviour(const FECSEntity &inout Entity, const EHitReactionState CurrentHitState, const EHitReactionState WillHitState, const EAbnormalState WillHitAbnormalState, const EAbnormalState WeaknessAbnormal)
{
    FHitStateInterruptBehaviour __return;
    if (FAbnormalStateUtils::CVar_Abnormal_EnableUnfinishedFeature.GetBool())
    {
        FAbnormalStateUtils::EAbnormalHitStatePriority local_4;
        FAbnormalStateUtils::EAbnormalHitStatePriority local_2;
        local_2 = FAbnormalStateUtils::EAbnormalHitStatePriority(0);
        local_4 = FAbnormalStateUtils::EAbnormalHitStatePriority(0);
        if (int(CurrentHitState) == 13)
        {
            local_2 = FAbnormalStateUtils::GetTargetCurrentAbnormalPriority(Entity, EAbnormalState(WeaknessAbnormal));
        }
        if (int(WillHitState) == 13)
        {
            local_4 = FAbnormalStateUtils::GetSpecificAbnormalPriority(Entity, EAbnormalState(WillHitAbnormalState), EAbnormalState(WeaknessAbnormal));
        }
        if (int(CurrentHitState) == 13 && (int(WillHitState) == 13))
        {
            if (int(local_4) >= int(local_2))
            {
                return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(1), false);
            }
            __return = FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(0), false);
        }
        else
        {
            if (int(CurrentHitState) == 13)
            {
                if (int(WillHitState) == 9 || (int(WillHitState) == 10) || (int(WillHitState) == 11))
                {
                    return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(1), false);
                }
                if (int(WillHitState) == 12 || (int(WillHitState) == 8))
                {
                    if (int(local_2) <= 1)
                    {
                        return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(1), false);
                    }
                    __return = FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(2), true);
                }
                else
                {
                    if (int(local_2) <= 0)
                    {
                        return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(1), false);
                    }
                    __return = FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(0), (int(WillHitState) == 7));
                }
            }
            else
            {
                if (int(WillHitState) == 13)
                {
                    if (int(local_4) >= 2)
                    {
                        if (int(CurrentHitState) == 9 || (int(CurrentHitState) == 10) || (int(CurrentHitState) == 11))
                        {
                            return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(0), false);
                        }
                        __return = FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(1), false);
                    }
                    else
                    {
                        if (int(local_4) == 1)
                        {
                            if (int(CurrentHitState) == 9 || (int(CurrentHitState) == 10) || (int(CurrentHitState) == 11) || (int(CurrentHitState) == 12) || (int(CurrentHitState) == 8))
                            {
                                return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(0), false);
                            }
                            __return = FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(1), false);
                        }
                        else
                        {
                            __return = FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(0), false);
                        }
                    }
                }
                else
                {
                }
            }
        }
    }
    if (int(CurrentHitState) == 9 || (int(CurrentHitState) == 10) || (int(CurrentHitState) == 11))
    {
        if (int(WillHitState) == 9)
        {
            return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(0), false);
        }
        if (int(WillHitState) == 10)
        {
            return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(0), false);
        }
        if (int(WillHitState) == 11)
        {
            return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(0), false);
        }
        if (int(WillHitState) == 8)
        {
            return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(2), true);
        }
        if (int(WillHitState) == 7)
        {
            return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(0), true);
        }
        if (int(WillHitState) == 12)
        {
            return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(0), true);
        }
        if (int(WillHitState) == 13)
        {
            return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(0), false);
        }
    }
    else
    {
        if (int(CurrentHitState) == 8)
        {
            if (int(WillHitState) == 9)
            {
                return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(0), false);
            }
            if (int(WillHitState) == 8)
            {
                return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(2), true);
            }
            if (int(WillHitState) == 7)
            {
                return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(0), true);
            }
            if (int(WillHitState) == 12)
            {
                return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(2), true);
            }
            if (int(WillHitState) == 13)
            {
                return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(2), false);
            }
        }
        else
        {
            if (int(CurrentHitState) == 7)
            {
                if (int(WillHitState) == 9)
                {
                    return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(2), false);
                }
                if (int(WillHitState) == 10)
                {
                    return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(2), false);
                }
                if (int(WillHitState) == 11)
                {
                    return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(2), false);
                }
                if (int(WillHitState) == 12)
                {
                    return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(1), true);
                }
            }
            else
            {
                if (int(CurrentHitState) == 12)
                {
                    if (int(WillHitState) == 9)
                    {
                        return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(1), false);
                    }
                    if (int(WillHitState) == 10)
                    {
                        return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(1), false);
                    }
                    if (int(WillHitState) == 11)
                    {
                        return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(1), false);
                    }
                    if (int(WillHitState) == 8)
                    {
                        return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(2), true);
                    }
                    if (int(WillHitState) == 7)
                    {
                        return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(0), true);
                    }
                    if (int(WillHitState) == 12)
                    {
                        return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(0), false);
                    }
                    if (int(WillHitState) == 13)
                    {
                        return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(2), false);
                    }
                }
            }
        }
    }
    return FHitStateInterruptBehaviour(EHitStateInterruptBehaviourType(2), false);
}
bool IsBodyPartDamageState(const FName &inout Name)
{
    return (Name == "HeadDestroy");
}
FHitLevelESMTransitInfo PostProcessESMTransitHitStateName(const FName &inout InHitStateName, const EAttackDataHitState HitLevel, const EHitBreakLevel BreakLevel, const FECSEntity &inout Entity, const FC_HitReactionConfig &inout HitReactionConfig)
{
    int local_26 = 0;
    if (int(HitReactionConfig.HitReactionType) != 0 || (int(HitReactionConfig.PrefabBodyType) == 0))
    {
        return FHitLevelESMTransitInfo(InHitStateName);
    }
    Get local_18;
    const FC_HitReaction& local_20 = local_18.opCall();
    if (local_20)
    {
        if (!(local_20.GetHitBreakResistance().CanBreak()))
        {
            return FHitLevelESMTransitInfo(NAME_None);
        }
    }
    UDamageSettings local_22 = DamageSettings::Get();
    if (local_22.BanESMTransitHitState.Contains(HitLevel) && Entity.MatchGameplayTag(local_22.BanESMTransitHitState[HitLevel]))
    {
        return FHitLevelESMTransitInfo(NAME_None);
    }
    if (Entity.MatchGameplayTag(GameplayTags::ESM_HitState_LieDown))
    {
        return local_22.GetESMTransitHitState(EHitStateESMTransitType(0), HitReactionConfig.PrefabBodyType, EAttackDataHitState(HitLevel));
    }
    if (((local_26.GetbAirborne() || Entity.MatchGameplayTag(GameplayTags::ESM_MotionFlag_Ride)) && (int(local_18.opCall().GetCurrentHitState()) == 0)) && !(Entity.MatchGameplayTag(GameplayTags::ESM_MotionFlag_AirState)))
    {
        return local_22.GetESMTransitHitState(EHitStateESMTransitType(1), HitReactionConfig.PrefabBodyType, EAttackDataHitState(HitLevel));
    }
    if (((local_26.GetbAirborne() || Entity.MatchGameplayTag(GameplayTags::ESM_MotionFlag_Ride)) && (int(local_18.opCall().GetCurrentHitState()) != 0)) && !(Entity.MatchGameplayTag(GameplayTags::ESM_MotionFlag_AirState)))
    {
        return local_22.GetESMTransitHitState(EHitStateESMTransitType(2), HitReactionConfig.PrefabBodyType, EAttackDataHitState(HitLevel));
    }
    if (Entity.MatchGameplayTag(GameplayTags::ESM_MotionFlag_AirState))
    {
        return local_22.GetESMTransitHitState(EHitStateESMTransitType(3), HitReactionConfig.PrefabBodyType, EAttackDataHitState(HitLevel));
    }
    if (!(local_26.GetbAirborne()))
    {
        return local_22.GetESMTransitHitState(EHitStateESMTransitType(4), HitReactionConfig.PrefabBodyType, EAttackDataHitState(HitLevel));
    }
    return FHitLevelESMTransitInfo(NAME_None);
}
bool CanDefense(const EAttackType AttackType)
{
    UDamageSettings local_2 = DamageSettings::Get();
    if (!(local_2.CanDefenseByAttackTypeMap.Contains(AttackType)))
    {
        XError(ELog(42), FString().Append("DamageSettings.CanDefenseByAttackTypeMap not found AttackType ").Append(AttackType));
        return false;
    }
    return local_2.CanDefenseByAttackTypeMap[AttackType];
}
bool BanPresentationWhenDefense(const FAttackData &inout AttackData, const TArray<FDefenseHitData> &inout DefenseHitDatas)
{
    return FDamageUtils::CanDefense(AttackData.AttackType) && DefenseHitDatas[int(AttackData.HitBreakLevel)].GetbBanAttackPresentation();
}
bool IsDamageToAvatar(const FECSEntity &inout TargetEntity)
{
    return (int(GetPrefabType(TargetEntity)) == 1);
}
FECSEntity GetDamageNumPresentationOwner(const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_AttackerHitPresentation& local_6 = local_4.opCall();
    if (local_6)
    {
        if (local_6.GetAttackerHitOwner().IsValid())
        {
            return local_6.GetAttackerHitOwner();
        }
    }
    return BlueprintFunctions_Common::GetEntityOwner(FECSEntityAdapter(Entity));
}
}
