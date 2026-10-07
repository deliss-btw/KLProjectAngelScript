
const FConsoleVariable CVar_Damage_Print = FConsoleVariable();
const FConsoleVariable CVar_Damage_Statistic = FConsoleVariable();
const FConsoleVariable CVar_Damage_HitNoBreakProtect = FConsoleVariable();

struct FHitCountReduceRate
{
    UPROPERTY()
    int HitCount = 0;
    UPROPERTY()
    float32 Rate = 1.0f;


}

class UHitProtectDataAsset : UDataAsset
{
    UPROPERTY()
    FFPTime HitDamageReduceRefreshTime = FFPTime(0.5);
    UPROPERTY()
    TArray<FHitCountReduceRate> HitCountReduceRate;

    UHitProtectDataAsset()
    {
        return;
    }
}

class US_DamageSystem : UECSScriptSystem
{
    FName HitNotBreakingState = FName(FDamageUtils::HitNotBreakingStateName);
    FName HitLightlyState = FName(FDamageUtils::HitLightlyStateName);
    FName HitHeavyState = FName(FDamageUtils::HitHeavyStateName);
    FName HitBlowState = FName(FDamageUtils::HitBlowStateName);
    FName LieDownHitStateName = FName(FDamageUtils::LieDownHitStateName);
    FName HitKnockDownHitState = FName(FDamageUtils::KnockDownHitStateName);
    FName HitStaggerState = FName(FDamageUtils::HitStaggerStateName);
    FName HitBreakState = FName(FDamageUtils::HitBreakStateName);
    UPROPERTY()
    UHitProtectDataAsset HitProtectDataAsset;
    UPROPERTY()
    UAbnormalDataAsset AbnormalData;
    UPROPERTY()
    USpecialHitTypeToESMStateAsset SpecialHitTypeToESMState;
    UPROPERTY()
    float32 DelayShowDamageNumberRatio = 0.8f;


    TDataObjectPtr<FAttackData> GetAttackDataFromDamageEventId(const int DamageEventId) const
    {
        if (DamageEventId < 0)
        {
            return TDataObjectPtr<FAttackData>(nullptr);
        }
        const FCE_DamageEvent& local_52 = FECSWorldPtr::GetEvent(ECS::GetECSWorld()).opCall(DamageEventId);
        if (local_52)
        {
            return local_52.AttackData;
        }
        return TDataObjectPtr<FAttackData>(nullptr);
    }
    UFUNCTION()
    void Job_UpdateDamageWaitingCalculation(const FECSEntity &inout Entity, FC_TakeDamageWaitingCalculation &inout DamageWaitingCalculation, const FCS_FixedTime &inout FixedTime) const
    {
        FFPTime local_2 = FFPTime(DamageWaitingCalculation.GetEarliestDamageTime());
        if (local_2.opCmp(FixedTime.Time) <= 0)
        {
            int local_3 = DamageWaitingCalculation.GetDamageDatas().Num() - 1;
            for (; local_3 >= 0; --local_3)
            {
                const FDamageBeforeCalculationData& local_8 = DamageWaitingCalculation.GetDamageDatas()[local_3];
                FFPTime local_2_2 = local_8.Time;
                if (local_2_2.opCmp(FixedTime.Time) <= 0)
                {
                    ::FDamageUtils::AddDamageCurFrame(local_8);
                    DamageWaitingCalculation.GetModify_DamageDatas().RemoveAtSwap(local_3);
                    continue;
                }
                int local_5 = DamageWaitingCalculation.GetDamageDatas().Num();
                if (local_5 > 0)
                {
                    DamageWaitingCalculation.SetEarliestDamageTime(DamageWaitingCalculation.GetDamageDatas()[(local_5 - 1)].Time);
                }
                else
                {
                    Remove local_14;
                    local_14.opCall();
                }
                break;
            }
        }
        return;
    }
    UFUNCTION()
    void Job_PrepareDamageToCalculatCurFrame(FCS_DamageToCalculateFrame &inout DamageToCalculate) const
    {
        for (auto& local_16 : DamageToCalculate.DamageDatas)
        {
            local_16.AttackTags = FGameplayTagBisSetWrapper::FromEntity(local_16.FinalDamageSource);
            if (local_16.AttackData)
            {
                const FAttackData& local_82;
                local_16.AttackTags.Append(local_82.AttackCalculationTags);
                ::FDamageUtils::AddAttackCategoryTagsToBitSet(int(local_82.AttackCategory), local_16.AttackTags);
            }
            if (local_16.bIsWeakness)
            {
                local_16.AttackTags.AddTag(GameplayTags::Damage_Weakness);
            }
        }
        return;
    }
    bool CheckUseEcologyPosture(const FECSEntity &inout DamageSource, const FECSEntity &inout DamageTarget) const
    {
        if (::FASCommonUtils::IsBossPrefab(DamageSource) && ::FASCommonUtils::IsBossPrefab(DamageTarget))
        {
            Get local_6;
            const FC_GameAttribute& local_8 = local_6.opCall();
            if (local_8)
            {
                if (local_8.HasAttribute(Attribute::EcologyPosture) && local_8.HasAttribute(Attribute::EcologyPostureMax))
                {
                    return true;
                }
            }
        }
        return false;
    }
    UFUNCTION()
    void Job_DamageCalculation(FCS_DamageToCalculateFrame &inout DamageToCalculate) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_MarkUseNewHitStateTransit(const FECSEntity &inout Entity, const FC_HitReactionConfig &inout HitReactionConfig) const
    {
        FC_HitStateFrame local_6;
        local_6.bUseNewHitStateTransit = HitReactionConfig.bUseNewHitStateTransit;
        return;
    }
    UFUNCTION()
    void Job_ApplyDamage(const FECSEntity &inout Entity, FC_DamageToApplyFrame &inout DamageToApply, const FCS_FixedTime &inout FixedTime) const
    {
        Get local_18;
        int local_32 = 0;
        int local_38 = 0;
        float32 local_53;
        float32 local_55;
        float32 local_56;
        bool local_59;
        bool local_60;
        float32 local_61;
        float32 local_64;
        FCE_DamageEvent local_74;
        float32 local_109;
        float32 local_112 = 0.0f;
        float32 local_115 = 0.0f;
        float32 local_116;
        int local_122 = 0;
        int local_128 = 0;
        const FC_GameAttribute& local_150;
        int local_166 = 0;
        int local_182 = 0;
        int local_198 = 0;
        int local_204 = 0;
        int local_212 = 0;
        bool local_229;
        int local_236 = 0;
        int local_306 = 0;
        int local_346 = 0;
        const UUtilitySettings local_392;
        const FC_NearDeathInfo& local_6 = FECSEntity::Get<FC_NearDeathInfo>(Entity).opCall();
        if (local_6)
        {
            if (!(local_6.GetbCanHitOrLockTargetWhenNearDeath()))
            {
                return;
            }
        }
        bool local_8 = FECSWorldPtr::GetDefaulted<FCS_CheatManager>(ECS::GetECSWorld()).opCall().GetbUndamageble();
        if (!(local_8))
        {
            const FC_CheatComponent& local_20 = local_18.opCall();
            if (local_20)
            {
                local_8 = local_20.GetbUndamageble();
            }
        }
        Has local_26;
        bool local_7 = local_26.opCall();
        for (auto& local_52 : DamageToApply.Datas)
        {
            local_53 = 1.0f;
            local_55 = 1.0f;
            local_56 = 1.0f;
            const FC_CheatComponent& local_20_2 = local_18.opCall();
            if (local_20_2)
            {
                local_53 = local_20_2.GetFinalDamageRatio();
                local_55 = local_20_2.GetPostureAttackRatio();
                local_56 = local_20_2.GetBodyPartDamageRatio();
            }
            float32 local_54 = Debug::CVar_Debug_PostureAttackRatio.GetFloat();
            if (local_54 != 1.0f)
            {
                float32 local_57 = Debug::CVar_Debug_PostureAttackRatio.GetFloat();
                local_55 = local_55 * local_57;
            }
            float32 local_57_2 = Debug::CVar_Debug_BodypartDamageRatio.GetFloat();
            if (local_57_2 != 1.0f)
            {
                local_56 = local_56 * Debug::CVar_Debug_BodypartDamageRatio.GetFloat();
            }
            float32 local_58 = 0.0f;
            bool local_21 = !(local_8) && ((local_52.FinalValues.HPDamage != 0.0f));
            if (!(local_21))
            {
                local_59 = false;
            }
            else
            {
                local_59 = local_32;
            }
            if (local_59 && local_32.HasAttribute(Attribute::HP))
            {
                local_54 = local_52.FinalValues.HPDamage;
                local_58 = local_54 * local_53;
            }
            local_61 = local_58;
            float32 local_62 = 0.0f;
            float32 local_63 = 0.0f;
            if (!(local_7))
            {
                local_57_2 = local_52.FinalValues.PostureDamage;
                local_63 = local_57_2 * local_55;
            }
            local_64 = 0.0f;
            if (int(local_52.FinalValues.AbnormalState) == 0)
            {
                local_21 = false;
            }
            else
            {
                local_21 = local_32;
            }
            local_59 = local_21 && !(Entity.MatchGameplayTag(GameplayTags::CombatState_Immune));
            if (local_59)
            {
                local_64 = local_52.FinalValues.AbnormalStateAccumulation;
            }
            if (local_58 > 0.0f)
            {
                Get local_78;
                const FC_ShieldOwner& local_80 = local_78.opCall();
                if (local_80)
                {
                    for (auto& local_98 : local_80.GetNamedInherentShields())
                    {
                        Modify local_106;
                        FC_Shield& local_108 = local_106.opCall();
                        if (local_108)
                        {
                            if (!(local_108.GetbShieldActive()) || local_108.GetbBroken())
                            {
                                continue;
                            }
                            local_57_2 = local_108.GetShieldHP().Evaluate(FixedTime.Time);
                            float32 local_113 = FMath::Clamp(local_108.GetBaseData().GetAbsorbRatio().GetDamageRatio(EDamageType(local_52.DamageType)), 0.0f, 1.0f);
                            local_112 = FMath::Clamp(local_108.GetBaseData().GetDamageRatio().GetDamageRatio(EDamageType(local_52.DamageType)), 0.0f, 1.0f);
                            local_115 = 0.0f;
                            if (local_112 > 0.0f)
                            {
                                float32 local_114 = local_57_2 / local_112;
                                local_54 = local_61 * local_113;
                                local_115 = FMath::Min(local_114, local_54);
                            }
                            else
                            {
                                local_115 = local_61 * local_113;
                            }
                            float32 local_110 = local_115 * local_112;
                            if (local_110 > 0.0f)
                            {
                                local_108.SetLastTakenDamageTime(FixedTime.Time);
                                if (local_110 >= local_57_2)
                                {
                                    local_108.GetModify_ShieldHP().SetUpdated(local_57_2, 0.0f, FixedTime.Time);
                                    local_108.SetbBroken(true);
                                    local_122.Attacker = local_52.FinalDamageSource;
                                    local_122.ShieldName = local_98.GetKey();
                                }
                                else
                                {
                                    local_116 = local_57_2 - local_110;
                                    local_108.GetModify_ShieldHP().SetUpdated(local_57_2, local_116, FixedTime.Time);
                                }
                                local_62 = local_62 + local_110;
                            }
                            local_61 = local_61 - local_115;
                            if (local_61 <= 0.0f)
                            {
                                break;
                            }
                        }
                    }
                }
                FHPChangeData local_136;
                local_136.SourceEntity = local_52.FinalDamageSource;
                float32 local_114_2 = -local_61;
                local_136.DeltaValue = local_114_2;
                local_136.ChangeType = EHPChangeType(0);
                local_136.DamageEventId = int(local_74._base_FECSEvent);
                local_128.Changes.Add(local_136);
            }
            if (local_63 > 0.0f)
            {
                if (!(Entity.MatchGameplayTag(GameplayTags::CombatState_Endure)))
                {
                    FECSEntity local_102 = Entity;
                    Get local_142;
                    const FC_DamageReceiverTransfer& local_144 = local_142.opCall();
                    if (local_144)
                    {
                        if (!(local_144.GetbTransferDamageToPosture()))
                        {
                            local_59 = false;
                        }
                        else
                        {
                            Has local_148;
                            local_59 = local_148.opCall();
                        }
                        if (local_59)
                        {
                            local_102 = local_144.GetDamageValueToEntity();
                        }
                    }
                    if (local_150)
                    {
                        if (Debug::CVar_Debug_MaxPostureAttack.GetInt() > 0)
                        {
                            local_63 = FGameAttributeUtils::GetAttributeValue(local_102, Attribute::PostureMax, FixedTime.Time, true, local_63, false, FGameAttributeModificationValue());
                        }
                        FPostureChangeData local_174;
                        local_174.SourceEntity = local_52.FinalDamageSource;
                        local_109 = local_63;
                        local_109 = -local_109;
                        local_174.DeltaValue = local_109;
                        local_174.bUseEcologyPosture = local_52.FinalValues.bUseEcologyPosture;
                        local_174.HitBreakLevel = EHitBreakLevel(local_52.HitData.HitBreakLevel);
                        local_174.DamageEventId = int(local_74._base_FECSEvent);
                        local_166.Changes.Add(local_174);
                    }
                }
            }
            if (local_64 > 0.0f)
            {
                FDamageAbnormalChangeData local_190;
                local_190.SourceEntity = local_52.FinalDamageSource;
                local_190.AbnormalState = EAbnormalState(local_52.FinalValues.AbnormalState);
                local_54 = local_64;
                local_54 = -local_54;
                local_190.DeltaValue = local_54;
                local_190.DamageEventId = int(local_74._base_FECSEvent);
                local_190.bEnhanced = local_52.FinalValues.bAbnormalEnhanced;
                local_182.Changes.Add(local_190);
            }
            local_21 = !(local_52.FinalValues.DamageBodyPart.IsNone()) && !(Entity.MatchGameplayTag(GameplayTags::CombatState_MuteBodyPartDestory));
            if (local_21)
            {
                FName local_192 = local_52.FinalValues.DamageBodyPart;
                if (!(local_198))
                {
                    local_21 = false;
                }
                else
                {
                    local_21 = local_204;
                }
                if (local_21 && !(local_204.GetFullMutedBodyParts().Contains(local_192)))
                {
                    FCharacterBodyPartConfig& local_206 = local_198.BodyPartData.BodyParts[local_52.FinalValues.DamageBodyPart];
                    if (local_206.bCanDestroy)
                    {
                        float32 local_110_2 = 0.0f;
                        if (local_206.bUseEnvBreakDamage)
                        {
                            local_110_2 = local_52.FinalValues.EnvBreakDamage * local_56;
                        }
                        else
                        {
                            local_110_2 = local_52.FinalValues.HPDamage * local_56;
                        }
                        FDamageBodyPartChangeData local_220;
                        local_220.SourceEntity = local_52.FinalDamageSource;
                        local_220.BodyPartName = local_52.FinalValues.DamageBodyPart;
                        local_220.Damage = local_110_2;
                        local_220.DamageEventId = int(local_74._base_FECSEvent);
                        local_212.Changes.Add(local_220);
                    }
                }
            }
            local_59 = local_38 && (int(local_52.HitData.HitType) == 1);
            if (local_59 && !((local_52.FinalDamageSource == Entity)))
            {
                Get local_36;
                const FC_MutualClashActionInfo& local_228 = local_36.opCall();
                if (local_228)
                {
                    if (local_228.GetbIsPlayer() || local_38.GetbIsPlayer())
                    {
                        local_21 = local_38.GetbIsPlayer() && !(local_228.GetbIsPlayer());
                        if (local_21)
                        {
                            FECSEntity local_226 = local_52.FinalDamageSource;
                        }
                        else
                        {
                            FECSEntity local_226_2 = Entity;
                        }
                        if (local_21)
                        {
                            local_116 = local_38.GetConsumeMutualClashValue();
                        }
                        else
                        {
                            local_109 = local_228.GetConsumeMutualClashValue();
                            local_116 = local_109;
                        }
                        local_59 = !(local_236.GetbHappenClash()) && (local_116 > 0.0f);
                        if (local_59 && local_236.GetbCheckDirection())
                        {
                            local_59 = ::FCombatUtils::IsInFrontHalfSphere(local_52.FinalDamageSource, Entity);
                        }
                        if (local_59)
                        {
                            if (local_150)
                            {
                                FC_MutualClashPreChange local_244;
                                local_244.bConsumeAttacker = local_21;
                                local_244.AttackerEntity = local_52.FinalDamageSource;
                                local_244.DefenderEntity = Entity;
                                local_109 = local_244.DeltaValue;
                                local_115 = local_109 - local_116;
                                local_244.DeltaValue = local_115;
                                local_244.DamageEventId = int(local_74._base_FECSEvent);
                            }
                        }
                    }
                }
                else
                {
                    if (local_38.GetbIsPlayer())
                    {
                        FFPTime local_250 = FFPTime(-1);
                        SendEvent local_248;
                        local_248.opCall(local_250);
                    }
                }
            }
            TDataObjectPtr<FAttackData> local_274;
            local_274 = local_52.AttackData;
            if (!((local_274 == nullptr)))
            {
                const FAttackData& local_300;
                if (local_300.HitApplyBuffToTarget.IsValid())
                {
                    FECSEntity local_102_2 = FBuffUtils::AddBuff(Entity, local_300.HitApplyBuffToTarget, FixedTime.Time, local_52.FinalDamageSource, false, -1.0f, 1, false);
                }
                if (ECS::IsAuthorityOrPrediction(local_52.FinalDamageSource))
                {
                    if (ECS::IsAuthorityOrPrediction(local_52.FinalDamageSource) && local_300.HitApplyBuffToSelf.IsValid())
                    {
                        FECSEntity local_102_3 = FBuffUtils::AddBuff(local_52.FinalDamageSource, local_300.HitApplyBuffToSelf, FixedTime.Time, local_52.FinalDamageSource, false, -1.0f, 1, false);
                    }
                    Get local_30;
                    local_150 = local_30.opCall();
                    if (local_150)
                    {
                        if (int(local_52.HitData.HitType) != 1 || local_306.TryAddRecoverAttributeStrikeKey(local_52.HitData.StrikeKey, FixedTime.Time))
                        {
                            if (local_300.bHitRecoverSkillEnergyEffectByExternalCoefficient)
                            {
                                local_54 = local_52.ExternalCoefficient;
                                local_109 = local_54;
                            }
                            else
                            {
                                local_109 = 1.0f;
                            }
                            for (auto& local_324 : local_52.RecoverAttributeValues)
                            {
                                if (local_150.HasAttribute(local_324.GetKey()))
                                {
                                    if (!(::FCombatUtils::IsHitRecoverAttributeBanned(local_52.FinalDamageSource, local_324.GetKey())))
                                    {
                                        if (local_54 > 0.0f)
                                        {
                                            local_112 = local_115 * local_109;
                                            FGameAttributeUtils::Recover(local_52.FinalDamageSource, local_324.GetKey(), FixedTime.Time, local_112, -1.0f);
                                            continue;
                                        }
                                        if (local_115 < 0.0f)
                                        {
                                            local_112 = -local_112;
                                            FGameAttributeUtils::Consume(local_52.FinalDamageSource, local_324.GetKey(), FixedTime.Time, (local_112 * local_109));
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if (!(!(local_300.HitAddEntityBB.Name.IsNone())))
                    {
                        local_229 = false;
                    }
                    else
                    {
                        FNameHandle_EntityBBVar local_328;
                        local_328;
                        local_229 = local_52.FinalDamageSource.HasEntityBB(local_328);
                    }
                    if (local_229)
                    {
                        FNameHandle_EntityBBVarInt local_334;
                        int local_67;
                        local_334;
                        local_67 = local_52.FinalDamageSource.GetBB_Int(local_334);
                        int local_66 = int(local_300.HitAddEntityBBValue);
                        local_67 = local_67 + local_66;
                        local_66 = int(local_300.HitAddEntityBBValueMinMax.Y);
                        local_67 = FMath::Clamp(local_67, int(local_300.HitAddEntityBBValueMinMax.X), local_66);
                        local_334;
                        local_52.FinalDamageSource.SetBB_Int(local_334, local_300.HitAddEntityBB.Name);
                    }
                }
            }
            local_74.Receiver = Entity;
            local_74.FinalDamageSource = local_52.FinalDamageSource;
            local_74.DirectDamageCauser = local_52.DirectDamageCauser;
            local_74.TotalDamageToHP = local_58;
            local_74.ActualDamageToHP = local_61;
            local_74.DamageToShield = local_62;
            local_74.DamageToPosture = local_63;
            local_74.AbnormalValue = local_64;
            local_74.bCritical = local_52.FinalValues.bCritical;
            local_74.DamageType = EDamageType(local_52.DamageType);
            local_74.DamageProcedureType = EDamageProcedureType(local_52.DamageProcedureType);
            local_74.DamageCalculationType = EDamageCalculationType(local_52.DamageCalculationType);
            local_74.HitData = local_52.HitData;
            local_74.AttackData = local_52.AttackData;
            FDamageNumShowData local_390;
            local_390.Attacker = local_52.FinalDamageSource;
            local_390.DamageTime = FixedTime.Time;
            local_390.bCritical = local_52.FinalValues.bCritical;
            local_390.DamageValue = local_61;
            local_390.DamageType = EDamageType(local_52.DamageType);
            if (int(local_52.DamageProcedureType) == 0)
            {
                local_390.Position = local_52.HitData.Position;
                local_390.StrikeKey = local_52.HitData.StrikeKey;
                local_390.bHitWeakness = local_52.HitData.bHitWeakness;
                local_229 = local_52.HitData.bAttenuated;
                local_390.bAttenuated = local_229;
                if (!(local_390.bAttenuated))
                {
                    GetGameplaySettings<UUtilitySettings> local_394;
                    local_392 = local_394;
                    local_112 = local_52.DefenderMultiplicationValues.BodyPartRatio;
                    local_54 = local_52.DefenderMultiplicationValues.DamageTypeRatio;
                    local_229 = ((local_112 * local_54) < local_392.AttenuationDamageTextDamageTypeThrethold);
                    local_390.bAttenuated = local_229;
                }
            }
            else
            {
                GetDefaulted local_400;
                local_390.Position = local_400.opCall().GetPosition();
            }
            if (int(local_52.HitData.HitType) == 2 || (int(local_52.DamageProcedureType) == 2))
            {
                local_390.bAdjustPresentationHitPos = true;
            }
            local_390.AttackData = local_52.AttackData;
            local_346.Datas.Add(local_390);
            local_60 = ECS::GetRuntimeInfo().IsServer;
            if (local_60)
            {
                FC_CombatState local_406;
                if (!(local_406.bInCombat))
                {
                    ::FCombatStateUtils::EnterCombat(Entity);
                }
                FFPTime local_250_2 = local_406.SelfCombatSession.FirstDamageTime;
                if ((local_250_2 == 0.0))
                {
                    local_406.SelfCombatSession.FirstDamageTime = FixedTime.Time;
                }
                for (auto& local_424 : local_406.BossCombatSessions)
                {
                    local_424;
                    if ((local_250_2 == 0.0))
                    {
                    }
                }
                if (local_52.FinalDamageSource.IsValid())
                {
                    FC_CombatState local_426;
                    if (!(local_426.bInCombat))
                    {
                        ::FCombatStateUtils::EnterCombat(local_52.FinalDamageSource);
                    }
                    local_250_2 = local_426.SelfCombatSession.FirstDamageTime;
                    if ((local_250_2 == 0.0))
                    {
                        local_426.SelfCombatSession.FirstDamageTime = FixedTime.Time;
                    }
                    for (auto& local_424 : local_426.BossCombatSessions)
                    {
                        local_424;
                        if ((local_250_2 == 0.0))
                        {
                        }
                    }
                }
            }
            local_229 = local_61 > 0.0f && local_52.FinalDamageSource.IsValid();
            if (local_229)
            {
                ModifyOrAdd local_430;
                local_430.opCall().AddRecord(FixedTime.Time, local_61, local_52.FinalDamageSource);
            }
            if (!(CVar_Damage_Print.GetBool()))
            {
                local_229 = false;
            }
            else
            {
                local_229 = this.GetECSRuntime().IsServer;
            }
            if (local_229)
            {
                FString local_434 = "----------------------DamageData----------------------";
                local_434 += FString().Append("\n[DamageData] From entity ").Append(local_52.FinalDamageSource.GetEntityName()).Append(", To entity ").Append(Entity.GetEntityName());
                local_434 += FString().Append("\n[DamageData] AttackData: ").Append(local_52.AttackData.GetDataName());
                local_434 += FString().Append("\n[DamageData] DamageType: ").Append(local_52.DamageType);
                local_434 += FString().Append("\n[DamageData] =============== дј¤е®іжњЂз»€еЂј =============== ");
                local_434 += FString().Append("\n[DamageData] TotalDamageToHP(йќўжќїжЂ»HPдј¤е®і): ").Append(local_58);
                local_434 += FString().Append("\n[DamageData] ActualDamageToHP(е®ћй™…HPдј¤е®і): ").Append(local_61);
                local_434 += FString().Append("\n[DamageData] DamageToShield(еЇ№жЉ¤з›ѕдј¤е®і): ").Append(local_62);
                local_434 += FString().Append("\n[DamageData] DamageToPosture(йџ§жЂ§дј¤е®і): ").Append(local_63);
                local_434 += FString().Append("\n[DamageData] AbnormalValue(еј‚еёёзґЇз§ЇеЂј): ").Append(local_64);
                local_434 += FString().Append("\n[DamageData] Critical(жЇеђ¦жљґе‡»): ").Append(local_52.FinalValues.bCritical);
                local_434 += FString().Append("\n[DamageData] DamageBodyPart(дј¤е®ійѓЁдЅЌ): ").Append(local_52.FinalValues.DamageBodyPart.ToString());
                local_434 += FString().Append("\n[DamageData] =============== дј¤е®іеџєзЎЂеЂј =============== ");
                local_434 += FString().Append("\n[DamageData] BaseDamage(дј¤е®іеџєзЎЂеЂј): ").Append(local_52.BaseDamage.GetHPDamage());
                local_434 += FString().Append("\n[DamageData] PercentDamage(дј¤е®іHPз™ѕе€†жЇ”еЂј): ").Append(local_52.BaseDamage.GetHPDamage_MaxPercent());
                local_434 += FString().Append("\n[DamageData] =============== ж”»е‡»ж–№ж•°еЂј =============== ");
                local_434 += FString().Append("\n[DamageData] DamageAddRatio(йЂ ж€ђдј¤е®іеўћеЉ ): ").Append(local_52.AttackerAccumulationValues.DamageAddRatio);
                local_434 += FString().Append("\n[DamageData] DamageTypeAddRatio(йЂ ж€ђе±ћжЂ§дј¤е®іеўћеЉ ): ").Append(local_52.AttackerAccumulationValues.DamageTypeAddRatio);
                local_434 += FString().Append("\n[DamageData] TeamDamageAddRatio(е›ўйџеўћдј¤): ").Append(local_52.AttackerAccumulationValues.TeamDamageAddRatio);
                local_434 += FString().Append("\n[DamageData] FinalDamageRatio(жњЂз»€дј¤е®іеЂЌзЋ‡): ").Append(local_52.AttackerMultiplicationValues.FinalDamageRatio);
                local_434 += FString().Append("\n[DamageData] =============== йІеѕЎж–№ж•°еЂј =============== ");
                local_434 += FString().Append("\n[DamageData] VulnerableRatio(ж“дј¤еўћдј¤): ").Append(local_52.DefenderAccumulationValues.VulnerableRatio);
                local_434 += FString().Append("\n[DamageData] TeamVulnerableRatio(е›ўйџж“дј¤еўћдј¤): ").Append(local_52.DefenderAccumulationValues.TeamVulnerableRatio);
                local_434 += FString().Append("\n[DamageData] DamageRatio(еЏ—е€°дј¤е®іеЂЌзЋ‡): ").Append(local_52.DefenderMultiplicationValues.DamageRatio);
                local_434 += FString().Append("\n[DamageData] DamageTypeRatio(еЏ—е€°е±ћжЂ§дј¤е®іеЂЌзЋ‡): ").Append(local_52.DefenderMultiplicationValues.DamageTypeRatio);
                local_434 += FString().Append("\n[DamageData] InnateDamageReduceRatio(е…€е¤©е‡Џдј¤еЂЌзЋ‡): ").Append(local_52.DefenderMultiplicationValues.InnateDamageReduceRatio);
                local_434 += FString().Append("\n[DamageData] IndependentDamageRatio(з‹¬з«‹е‡Џдј¤еЂЌзЋ‡): ").Append(local_52.DefenderMultiplicationValues.IndependentDamageRatio);
                local_434 += FString().Append("\n[DamageData] DefenseValueRatio(йІеѕЎеЉ›дї®ж­ЈеЂЌзЋ‡): ").Append(local_52.DefenderMultiplicationValues.DefenseValueRatio);
                local_434 += FString().Append("\n[DamageData] DefenseStateRatio(йІеѕЎзЉ¶жЂЃеЂЌзЋ‡): ").Append(local_52.DefenderMultiplicationValues.DefenseStateRatio);
                local_434 += FString().Append("\n[DamageData] BodyPartName(йѓЁдЅЌеђЌ): ").Append(local_52.FinalValues.DamageBodyPart);
                local_434 += FString().Append("\n[DamageData] BodyPartRatio(йѓЁдЅЌеЂЌзЋ‡): ").Append(local_52.DefenderMultiplicationValues.BodyPartRatio);
                local_434 += FString().Append("\n[DamageData] =============== е…¶д»–дї®ж­Ј =============== ");
                local_434 += FString().Append("\n[DamageData] ComboDamageReductionRatio(иїћз»­е‘Ѕдё­дј¤е®іиЎ°е‡Џ): ").Append(local_52.ComboDamageReductionRatio);
                local_434 += FString().Append("\n[DamageData] ContinuouslyHitProtectRatio(иїћз»­е‘Ѕдё­дїќжЉ¤дј¤е®іиЎ°е‡Џ): ").Append(local_52.ContinuouslyHitProtectRatio);
                local_434 += FString().Append("\n[DamageData] GameModeCoefficient(жёёж€ЏжЁЎејЏзі»ж•°): ").Append(local_52.GameModeCoefficient);
                local_434 += FString().Append("\n[DamageData] ExternalCoefficient(е¤–йѓЁзі»ж•°): ").Append(local_52.ExternalCoefficient);
                local_434 += FString().Append("\n[DamageData] DefenseSuccess(жЇеђ¦йІеѕЎж€ђеЉџ): ").Append(local_52.bDefenseSuccess);
                local_434 += FString().Append("\n------------------------------------------------------");
                Print(local_434, 5.0f, FLinearColor::LucBlue);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateDenfenseState(const FECSEntity &inout Entity, const FC_DefenseHit &inout DefenseHit, const FC_DamageToApplyFrame &inout DamageToApply, const FC_GameAttribute &inout Attribute, const FCS_FixedTime &inout FixedTime) const
    {
        FC_HitStateTypeFrame local_10;
        int local_16 = 0;
        float32 local_2 = Attribute.GetAttributeValue(Attribute::Stamina, FixedTime.Time);
        float32 local_3 = 0.0f;
        for (auto& local_32 : DamageToApply.Datas)
        {
            const FDefenseHitData& local_38 = DefenseHit.GetDefenseHitDatas()[int(local_32.HitData.HitBreakLevel)];
            if (local_32.bDefenseSuccess)
            {
                FCE_DefenseHitEvent local_44;
                local_3 = local_3 + local_38.GetDefenseSuccessConsumeStamina();
                if (local_38.GetbTransitDefenseSuccess() && !(local_38.GetDefenseSuccessTransitStateName().IsNone()))
                {
                    if (local_38.GetbIsParry())
                    {
                        ::CommissionStatsUtils::AddParryCount(Entity);
                    }
                    else
                    {
                        ::CommissionStatsUtils::AddBlockCount(Entity);
                    }
                    local_10.HitStateType = EHitStateType(1);
                    local_16.TrySetHitState(Entity, local_38.GetDefenseSuccessTransitStateName(), local_32.AttackData, true, 0);
                }
                local_44.Attacker = local_32.FinalDamageSource;
                local_44.bIsParry = local_38.GetbIsParry();
                local_44.AttackData = local_32.AttackData;
            }
            else
            {
                local_3 = local_3 + local_38.GetDefenseFailedConsumeStamina();
                if (local_38.GetbTransitDefenseFailed() && !(local_38.GetDefenseFailedTransitStateName().IsNone()))
                {
                    local_16.TrySetHitState(Entity, local_38.GetDefenseFailedTransitStateName(), local_32.AttackData, true, 0);
                    local_10.HitStateType = EHitStateType(1);
                }
            }
            if (local_38.GetbBreakWhenStaminaClear() && (local_3 >= local_2))
            {
                local_16.TrySetHitState(Entity, local_38.GetBreakStateWhenStaminaClear(), local_32.AttackData, true, 0);
                break;
            }
        }
        FGameAttributeUtils::Consume(Entity, Attribute::Stamina, FixedTime.Time, local_3);
        return;
    }
    UFUNCTION()
    void Job_UpdatePostureBreakHitState(const FECSEntity &inout Entity, FC_PosturePreChange &inout PosturePreChange, const FC_HitReaction &inout HitReactionComp, const FC_HitReactionConfig &inout HitReactionConfig, const FCS_FixedTime &inout FixedTime) const
    {
        bool local_4;
        FC_HitStateTypeFrame local_10;
        int local_38 = 0;
        if (int(HitReactionConfig.HitReactionType) != 1)
        {
            return;
        }
        if (local_10 && (int(local_10.HitStateType) >= 8))
        {
            local_4 = true;
        }
        else
        {
            bool local_17;
            local_17 = ::FDamageUtils::GetHitStateInterruptBehaviour(Entity, HitReactionComp, EHitReactionState(9), EAbnormalState(0)).bLock;
            local_4 = local_17;
        }
        if (local_4)
        {
            PosturePreChange.bLockBreak = true;
        }
        local_4 = PosturePreChange.bLockBreak;
        if (local_4)
        {
            return;
        }
        if (PosturePreChange.Changes.IsEmpty())
        {
            return;
        }
        FECSEntity local_22 = Entity;
        Get local_26;
        const FC_DamageReceiverTransfer& local_28 = local_26.opCall();
        if (local_28)
        {
            bool local_17;
            if (!(local_28.GetbTransferDamageToPosture()))
            {
                local_17 = false;
            }
            else
            {
                Has local_32;
                local_17 = local_32.opCall();
            }
            if (local_17)
            {
                local_22 = local_28.GetDamageValueToEntity();
            }
            else
            {
                return;
            }
        }
        if (!(ECS::IsAuthorityOrPrediction(local_22)))
        {
            return;
        }
        if (!(local_38.HasAttribute(Attribute::Posture)))
        {
            return;
        }
        float32 local_39 = 0.0f;
        float32 local_40 = local_38.GetAttributeValue(Attribute::Posture, FixedTime.Time);
        float32 local_41 = local_38.GetAttributeValue(Attribute::TempPosture, FixedTime.Time);
        for (auto& local_56 : PosturePreChange.Changes)
        {
            if (!(local_56.bUseEcologyPosture))
            {
                local_39 = local_39 + local_56.DeltaValue;
                if (((local_40 + local_41) + local_39) <= 0.0f)
                {
                    ModifyOrAdd local_62;
                    local_62.opCall().HitStateType = EHitStateType(8);
                    return;
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateMutualClashHitState(const FECSEntity &inout Entity, FC_MutualClashPreChange &inout MutualClashPreChange, const FC_HitReaction &inout HitReactionComp, const FC_MutualClashActionInfo &inout ComsumeMutualClash, const FC_GameAttribute &inout Attribute, const FCS_FixedTime &inout FixedTime) const
    {
        FC_HitStateTypeFrame local_6;
        bool local_10;
        if ((local_6 && (int(local_6.HitStateType) >= 5)))
        {
            local_10 = true;
        }
        else
        {
            local_10 = ::FDamageUtils::GetHitStateInterruptBehaviour(Entity, HitReactionComp, EHitReactionState(12), EAbnormalState(0)).bLock;
        }
        if (local_10)
        {
            MutualClashPreChange.bLock = true;
            return;
        }
        local_10 = MutualClashPreChange.bLock;
        if (local_10)
        {
            return;
        }
        if (int(ComsumeMutualClash.GetMutualClashDamageType()) == 1)
        {
            return;
        }
        if (!(Attribute.HasAttribute(Attribute::MutualClash)))
        {
            return;
        }
        if ((int(ComsumeMutualClash.GetMutualClashDamageType())) == 2)
        {
            ModifyOrAdd local_22;
            local_22.opCall().HitStateType = EHitStateType(5);
            return;
        }
        if (MutualClashPreChange.DeltaValue < 0.0f)
        {
            ModifyOrAdd local_22;
            if ((Attribute.GetAttributeValue(Attribute::MutualClash, FixedTime.Time) + MutualClashPreChange.DeltaValue) <= 0.0f)
            {
                local_22.opCall().HitStateType = EHitStateType(5);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateBodyPartDestroyHitState(const FECSEntity &inout Entity, FC_BodyPartPreChange &inout BodyPartPreChange, const FC_HitReaction &inout HitReactionComp, const FC_BodyPartsConfig &inout BodyPartsConfig, const FC_BodyParts &inout BodyParts, const FCS_FixedTime &inout FixedTime) const
    {
        FC_HitStateTypeFrame local_6;
        bool local_10;
        int local_68 = 0;
        if ((local_6 && (int(local_6.HitStateType) >= 4)))
        {
            local_10 = true;
        }
        else
        {
            local_10 = ::FDamageUtils::GetHitStateInterruptBehaviour(Entity, HitReactionComp, EHitReactionState(8), EAbnormalState(0)).bLock;
        }
        if (local_10)
        {
            BodyPartPreChange.bLock = true;
            return;
        }
        TMap<FName, float32> local_38;
        for (auto& local_52 : BodyPartPreChange.Changes)
        {
            FCharacterBodyPartConfig& local_54 = BodyPartsConfig.BodyPartData.BodyParts[local_52.BodyPartName];
            local_10 = local_54.bCanDestroy;
            if (local_10 && !(BodyParts.GetLockOneMutedBodyParts().Contains(local_52.BodyPartName)))
            {
                float32 local_69;
                float32 local_61;
                if (!(BodyParts.GetBodyPartDatas()[local_52.BodyPartName].GetbCanDestroy()))
                {
                    continue;
                }
                float32 local_58 = local_38.FindOrAdd(local_52.BodyPartName);
                float32 local_60 = local_52.Damage;
                float32 local_59 = local_58 + local_60;
                local_61 = 0.0f;
                if (local_54.bUseEnvBreakDamage)
                {
                    local_61 = local_54.EnvBreakBodyPartHP;
                }
                else
                {
                    if (local_68)
                    {
                        local_60 = local_54.DestroyHpRatio;
                        local_61 = local_60 * local_68.GetAttributeValue(Attribute::HP, FixedTime.Time);
                    }
                }
                local_69 = BodyParts.GetBodyPartDatas()[local_52.BodyPartName].GetAccumulatedDamage();
                local_60 = local_59;
                local_59 = local_69 + local_60;
                if (local_59 >= local_61)
                {
                    ModifyOrAdd local_74;
                    local_74.opCall().HitStateType = EHitStateType(4);
                    return;
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdatePostureStaggerHitState(const FECSEntity &inout Entity, FC_PosturePreChange &inout PosturePreChange, const FC_HitReaction &inout HitReactionComp, const FC_HitReactionConfig &inout HitReactionConfig, const FCS_FixedTime &inout FixedTime) const
    {
        FC_HitStateTypeFrame local_6;
        bool local_17;
        int local_38 = 0;
        ModifyOrAdd local_78;
        if ((local_6 && (int(local_6.HitStateType) >= 2)) || ::FDamageUtils::GetHitStateInterruptBehaviour(Entity, HitReactionComp, EHitReactionState(7), EAbnormalState(0)).bLock)
        {
            if (!(local_6) || (local_6 && (int(local_6.HitStateType) != 8)))
            {
                PosturePreChange.bLockStagger = true;
            }
            return;
        }
        local_17 = PosturePreChange.bLockStagger;
        if (local_17)
        {
            return;
        }
        if ((int(HitReactionConfig.HitReactionType) != 1 || Entity.MatchGameplayTag(GameplayTags::CombatState_Special_MutePosture)) || Entity.MatchGameplayTag(GameplayTags::CombatState_Special_MuteHitStagger))
        {
            return;
        }
        FECSEntity local_22 = Entity;
        Get local_26;
        const FC_DamageReceiverTransfer& local_28 = local_26.opCall();
        if (local_28)
        {
            if (!(local_28.GetbTransferDamageToPosture()))
            {
                local_17 = false;
            }
            else
            {
                Has local_32;
                local_17 = local_32.opCall();
            }
            if (local_17)
            {
                local_22 = local_28.GetDamageValueToEntity();
            }
            else
            {
                return;
            }
        }
        if (!(ECS::IsAuthorityOrPrediction(local_22)))
        {
            return;
        }
        if (!(local_38.HasAttribute(Attribute::Posture)))
        {
            return;
        }
        float32 local_40 = local_38.GetAttributeValue(Attribute::Posture, FixedTime.Time);
        float32 local_39 = local_38.GetAttributeValue(Attribute::PostureMax, FixedTime.Time);
        float32 local_42 = -1.0f;
        float32 local_43 = 0.0f;
        float32 local_44 = 0.0f;
        for (auto& local_58 : PosturePreChange.Changes)
        {
            if (!(local_58.bUseEcologyPosture))
            {
                float32 local_41 = local_58.DeltaValue;
                local_43 = local_43 + local_41;
                auto local_64 = HitReactionConfig.PosturePhaseList.Iterator();
                for (; local_64.CanProceed;)
                {
                    local_41 = local_64.Proceed();
                    float32 local_74 = 1.0f - local_41;
                    local_41 = local_39 * local_74;
                    if (local_40 > local_41 && ((local_40 + local_43) <= local_41))
                    {
                        local_78.opCall().HitStateType = EHitStateType(2);
                        break;
                    }
                }
                continue;
            }
            local_44 = local_44 + local_58.DeltaValue;
            if (local_44 < 0.0f)
            {
                if (local_42 < 0.0f)
                {
                    local_42 = local_38.GetAttributeValue(Attribute::EcologyPosture, FixedTime.Time);
                }
                if ((local_42 + local_44) <= 0.0f)
                {
                    local_78.opCall().HitStateType = EHitStateType(2);
                    break;
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HPChange(const FECSEntity &inout Entity, const FC_HPPreChange &inout HPPreChange, const FCS_FixedTime &inout FixedTime) const
    {
        bool local_17;
        int local_24 = 0;
        bool local_46;
        Get local_54;
        int local_60 = 0;
        float32 local_61;
        int local_88 = 0;
        int local_94 = 0;
        int local_190 = 0;
        if (HPPreChange.Changes.IsEmpty())
        {
            return;
        }
        FECSEntity local_6 = Entity;
        Get local_10;
        const FC_DamageReceiverTransfer& local_12 = local_10.opCall();
        if (local_12)
        {
            if (!(local_12.GetbTransferDamageToHp()))
            {
                local_17 = false;
            }
            else
            {
                Has local_16;
                local_17 = local_16.opCall();
            }
            if (local_17)
            {
                local_6 = local_12.GetDamageValueToEntity();
            }
        }
        if (!(local_24.HasAttribute(Attribute::HP)))
        {
            return;
        }
        float32 local_26 = local_24.GetAttributeValue(Attribute::HPMax, FixedTime.Time);
        for (auto& local_40 : HPPreChange.Changes)
        {
            if (int(local_40.ChangeType) == 0 || (int(local_40.ChangeType) == 2))
            {
                bool local_1;
                float32 local_25 = -local_40.DeltaValue;
                float32 local_44 = local_24.GetAttributeValue(Attribute::HP, FixedTime.Time);
                Has local_50;
                local_1 = local_50.opCall();
                if (local_1)
                {
                    local_44 = local_54.opCall().GetNearDeathHP();
                }
                if (local_25 > local_44)
                {
                    local_25 = local_44;
                }
                if (!(local_1) && (local_25 > 0.0f))
                {
                    if (local_60 && (local_60.GetLockHPInfos().Num() > 0))
                    {
                        local_61 = 0.0f;
                        FName local_63(NAME_None);
                        for (auto& local_78 : local_60.GetLockHPInfos())
                        {
                            if (local_78.GetbLockByHpAmount())
                            {
                                local_61 = FMath::Max(local_61, local_78.GetLockHpAmount());
                            }
                            else
                            {
                                float32 local_80 = local_78.GetLockHpRatio() * local_26;
                                local_61 = FMath::Max(local_61, local_80);
                            }
                            if (local_61 > local_61)
                            {
                                local_63 = local_78.GetKeyName();
                            }
                        }
                        float32 local_79 = 0.0f;
                        if (local_61 < local_44)
                        {
                            local_79 = local_44 - local_61;
                        }
                        if (local_25 >= local_79)
                        {
                            local_25 = local_79;
                            if (local_79 > 0.0f)
                            {
                                local_88.DamageCauser = local_40.SourceEntity;
                                local_88.KeyName = local_63;
                            }
                        }
                    }
                }
                if (local_1)
                {
                    local_46 = local_54.opCall().GetbCanHitOrLockTargetWhenNearDeath();
                    if (local_46)
                    {
                        float32 local_80_2 = local_94.GetNearDeathHP() - local_25;
                        local_94.SetNearDeathHP(local_80_2);
                        if (local_94.GetNearDeathHP() <= 0.0f)
                        {
                            local_94.SetbNearDeathHPZeroByDamage(true);
                        }
                    }
                    else
                    {
                        local_25 = 0.0f;
                    }
                }
                else
                {
                    FGameAttributeUtils::Consume(local_6, Attribute::HP, FixedTime.Time, local_25);
                    if (local_25 >= local_44)
                    {
                        TDataObjectPtr<FAttackData> local_118 = this.GetAttackDataFromDamageEventId(int(local_40.DamageEventId));
                        XLog(ELog(56), FString().Append("Entity ").Append(local_6.ToString()).Append(" is killed by ").Append(local_40.SourceEntity.ToString()).Append(", AttackData: ").Append(local_118.GetDataName()).Append(", DamageTime: ").Append(FixedTime.Time.ToString()).Append(", Frame: ").Append(local_118).Append("."));
                        Get local_164;
                        const FC_DeathResistance& local_166 = local_164.opCall();
                        if (local_166)
                        {
                            if (local_166.GetResistanceCount() > 0)
                            {
                                FCE_DeathResistanceHPChangeEvent local_172;
                                local_172.HP = local_24.GetAttributeValue(Attribute::HP, FixedTime.Time);
                                local_172.Delta = local_25;
                                local_172.DamageCauser = local_40.SourceEntity;
                            }
                        }
                        local_17 = ::FNearDeathUtils::CheckCanNearDeath(local_6);
                        if (local_17)
                        {
                            ::FLifeCycleUtils::EntityNearDeath(local_6, local_40.SourceEntity.GetId(), FixedTime.Time);
                        }
                        else
                        {
                            Has local_180;
                            local_46 = local_180.opCall();
                            ::FLifeCycleUtils::EntityDeath(local_6, local_40.SourceEntity.GetId(), FixedTime.Time, true, true, false, true, EDeathReason(0));
                            if (!(local_46))
                            {
                                ::FLifeCycleUtils::ServerDataTrackPlayerDeath(local_6, EServerDataTrackDeathReason(0), local_40.SourceEntity.GetId());
                            }
                            if (local_118)
                            {
                                local_190.SetbDestroyImmediately((0 == 1));
                            }
                        }
                        if (int(local_40.DamageEventId) >= 0)
                        {
                            FCE_DamageEvent local_200;
                            int local_43 = int(local_40.DamageEventId);
                            FECSWorldPtr local_194 = ECS::GetECSWorld();
                            FECSWorldPtr::PatchEvent(local_194);
                            local_200.bKillTarget = !(local_17);
                            local_200.bMakeTargetNearDeath = local_17;
                        }
                        break;
                    }
                }
                if (int(local_40.ChangeType) == 0)
                {
                    Get local_204;
                    const FC_BeHitRecoverAttributeConfig& local_206 = local_204.opCall();
                    if (local_206)
                    {
                        local_61 = local_25 / local_26;
                        for (auto& local_220 : local_206.BeHitRecoverAttributeConfig)
                        {
                            float32 local_80_3 = local_220.RecoverValue * local_61;
                            FGameAttributeUtils::Recover(Entity, local_220.GameAttribute, FixedTime.Time, local_80_3, -1.0f);
                        }
                    }
                }
                continue;
            }
        }
        return;
    }
    UFUNCTION()
    void Job_ClearHPPreChange(const FECSEntity &inout Entity) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void Job_PostureChange(const FECSEntity &inout Entity, const FC_PosturePreChange &inout PosturePreChange, const FC_HitReactionConfig &inout HitReactionConfig, FC_HitReaction &inout HitReactionComp, const FCS_FixedTime &inout FixedTime) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_ClearPosturePreChange(const FECSEntity &inout Entity) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void Job_BodyPartDestroy(const FECSEntity &inout Entity, const FC_BodyPartPreChange &inout BodyPartPreChange, const FC_BodyPartsConfig &inout BodyPartsConfig, FC_BodyParts &inout BodyParts, const FCS_FixedTime &inout FixedTime) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_ClearBodyPartPreChange(const FECSEntity &inout Entity) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void Job_AbnormalStateChange(const FECSEntity &inout Entity, const FC_AbnormalValuePreChange &inout AbnormalValuePreChange, const FCS_FixedTime &inout FixedTime) const
    {
        if (AbnormalValuePreChange.Changes.IsEmpty())
        {
            return;
        }
        int local_3 = int(::FAbnormalStateUtils::GetTargetAbnormalWeakness(Entity));
        for (auto& local_18 : AbnormalValuePreChange.Changes)
        {
            FAbnormalStateUtils::FAccumulateAbnormalParams local_28;
            local_28.AbnormalState = local_18.AbnormalState;
            local_28.bIsAbnormalEnhanced = local_18.bEnhanced;
            float32 local_29 = -local_18.DeltaValue;
            local_28.AbnormalValue = local_29;
            local_29 = 1.0f;
            local_28.ExternalAbnormalStateCoefficient = 1.0f;
            local_28.Time = FixedTime.Time;
            local_28.SourceEntity = local_18.SourceEntity;
            FName local_31;
            ::FAbnormalStateUtils::AccumulateAbnormalValue(Entity, local_28, this.AbnormalData, local_31);
            if (!(local_31.IsNone()))
            {
                TDataObjectPtr<FAttackData> local_56 = this.GetAttackDataFromDamageEventId(int(local_18.DamageEventId));
                ModifyOrAdd local_84;
                local_84.opCall().TrySetHitState(Entity, local_31, local_56, true, 0);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_ClearAbnormalValuePreChange(const FECSEntity &inout Entity) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void Job_MutualClashChange(const FECSEntity &inout Entity, const FC_MutualClashPreChange &inout MutualClashPreChange, const FC_GameAttribute &inout Attribute, FC_MutualClashActionInfo &inout MutualClashActionInfo, const FCS_FixedTime &inout FixedTime) const
    {
        int local_74 = 0;
        int local_84 = 0;
        int local_98 = 0;
        UGameAttributeScaleConfig local_112;
        if (MutualClashPreChange.DeltaValue == 0.0f)
        {
            return;
        }
        if (!(Attribute.HasAttribute(Attribute::MutualClash)))
        {
            return;
        }
        bool local_4 = false;
        float32 local_1 = Attribute.GetAttributeValue(Attribute::MutualClash, FixedTime.Time);
        float32 local_2 = -MutualClashPreChange.DeltaValue;
        if (int(MutualClashActionInfo.GetMutualClashDamageType()) == 2 || (((local_1 + MutualClashPreChange.DeltaValue) <= 0.0f)))
        {
            if (MutualClashPreChange.bLock || (int(MutualClashActionInfo.GetMutualClashDamageType()) == 1))
            {
                local_2 = local_1 - 1.0f;
            }
            else
            {
                local_4 = true;
            }
        }
        if (local_2 > 0.0f)
        {
            FGameAttributeUtils::Consume(Entity, Attribute::MutualClash, FixedTime.Time, local_2);
        }
        FECSEntity local_16;
        if (MutualClashPreChange.bConsumeAttacker)
        {
            local_16 = MutualClashPreChange.DefenderEntity;
        }
        else
        {
            local_16 = MutualClashPreChange.AttackerEntity;
        }
        MutualClashActionInfo.SetEventEntity(local_16);
        FFPTime local_22 = FFPTime(-1);
        FCE_MutualClashAttributeConsumeEvent local_24;
        local_24.bPlayerBeHit = MutualClashActionInfo.GetbIsPlayer();
        local_24.BeMutualClashEntity = Entity;
        MutualClashActionInfo.SetbHappenClash(true);
        if (local_4)
        {
            TDataObjectPtr<FAttackData> local_48 = this.GetAttackDataFromDamageEventId(int(MutualClashPreChange.DamageEventId));
            if (!(MutualClashActionInfo.GetbTrigger()))
            {
                ModifyOrAdd local_88;
                FFPTime local_22_2 = FFPTime(-1);
                local_84.BeMutualClashEntity = Entity;
                local_88.opCall().TrySetHitState(Entity, MutualClashActionInfo.GetHitState(), local_48, true, 0);
                local_74.SetTotalClashCount((local_74.GetTotalClashCount() + 1));
                MutualClashActionInfo.SetbTrigger(true);
                ::CommissionStatsUtils::AddMutualClashCount(MutualClashActionInfo.GetEventEntity());
                local_88.opCall().TrySetHitState(Entity, MutualClashActionInfo.GetHitState(), local_48, true, 0);
            }
            FECSWorldPtr local_92 = this.GetECSWorld();
            int local_9 = local_74.GetTotalClashCount();
            TSoftObjectPtr<UGameAttributeScaleConfig> local_110 = local_98.GetAttributeScaleConfig();
            float32 local_6 = local_112.MutualClashScaleData.GetScale(local_9);
            float32 local_5 = Attribute.GetAttributeValue(Attribute::MutualClashMax, FixedTime.Time);
            if (local_74.GetTotalClashCount() > 0)
            {
                local_9 = local_74.GetTotalClashCount();
                local_9 = local_9 - 1;
                TSoftObjectPtr<UGameAttributeScaleConfig> local_110_2 = local_98.GetAttributeScaleConfig();
                local_5 = local_5 / local_112.MutualClashScaleData.GetScale(local_9);
            }
            FGameAttributeUtils::ChangeConsumeValue(Entity, Attribute::MutualClashMax, FixedTime.Time, local_5 * local_6, -1.0f);
            FGameAttributeUtils::ChangeConsumeValue(Entity, Attribute::MutualClash, FixedTime.Time, local_5 * local_6, -1.0f);
        }
        return;
    }
    UFUNCTION()
    void Job_ClearMutualClashPreChange(const FECSEntity &inout Entity) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void Job_DisposeSpecialHitTypeBeforeDamageCaculation(FCE_DamageEvent &inout Event) const
    {
        FECSEntity local_4 = Event.Receiver;
        if (!(::FASCommonUtils::IsMonsterPrefab(local_4)))
        {
            return;
        }
        if ((Event.AttackData == nullptr))
        {
            return;
        }
        FAttackData local_56;
        FGameplayTag local_58 = FGameplayTag(local_56.SpecialHitType);
        if (!(local_58.IsValid()))
        {
            return;
        }
        if (this.SpecialHitTypeToESMState.SpecialHitTypeToESMStateConfigs.Contains(local_58))
        {
            bool local_66;
            FSpecialHitTypeToESMState& local_60 = this.SpecialHitTypeToESMState.SpecialHitTypeToESMStateConfigs[local_58];
            if (!(local_60.bApplyToAllType) && (int(::FASCommonUtils::GetMonsterRank(local_4)) != int(local_60.MonsterRank)))
            {
                return;
            }
            local_66 = true;
            for (auto& local_80 : local_60.TagsCheck)
            {
                if (int(local_60.Condition) == 0)
                {
                    local_66 = false;
                    if (local_4.MatchGameplayTag(local_80))
                    {
                        local_66 = true;
                        break;
                    }
                    continue;
                }
                if (int(local_60.Condition) == 1)
                {
                    if (!(local_4.MatchGameplayTag(local_80)))
                    {
                        local_66 = false;
                        break;
                    }
                }
            }
            for (auto& local_80 : local_60.ForbidTagsCheck)
            {
                if (local_4.MatchGameplayTag(local_80))
                {
                    local_66 = false;
                    break;
                }
            }
            bool local_65 = local_66 && !(local_60.ESMState.IsNone());
            if (local_65)
            {
                if (int(local_60.HitStatePriority) != 0)
                {
                    FC_HitStateTypeFrame local_88;
                    if (local_88 && (int(local_88.HitStateType) >= int(local_60.HitStatePriority)))
                    {
                        return;
                    }
                }
                ModifyOrAdd local_94;
                local_94.opCall().TrySetHitState(local_4, local_60.ESMState, TDataObjectPtr<FAttackData>(local_56), true, 0);
                ::CommissionStatsUtils::AddSpecialStateTransitCount(Event.FinalDamageSource, local_60.ESMState, local_4);
                if (int(::FASCommonUtils::GetMonsterRank(local_4)) != 2)
                {
                    local_65 = false;
                }
                else
                {
                    local_65 = ECS::GetRuntimeInfo().IsServer;
                }
                if (local_65)
                {
                    if (local_60.CDBuff.IsValid())
                    {
                        FBuffUtils::AddBuff(local_4, local_60.CDBuff, Event.Time, local_4, false, local_60.BossCDDuration, 1, false);
                    }
                    if (local_60.HitBossMessageHintConfig)
                    {
                        TArray<FTextArgument> local_104;
                        Make local_110;
                        local_104.Add(local_110.opImplConv());
                        float32 local_95_2 = local_60.HitBossMessageHintRange;
                        Get local_120;
                        TArray<FECSEntity> local_124 = ::BlueprintFunctions_Common::GetAllPlayerEntitiesInRangeAS(local_120.opCall().GetPosition(), local_95_2, false);
                        for (auto& local_142 : local_124)
                        {
                            ::MessageHintUtils::ShowMessageHint(local_142, local_60.HitBossMessageHintConfig, local_104);
                        }
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HitLevelStateTransit(const FCE_DamageEvent &inout Event) const
    {
        FC_HitReactionConfig local_16;
        int local_22 = 0;
        FC_HitStateFrame local_40;
        bool local_68;
        if (int(Event.DamageProcedureType) != 0 || !(Event.AttackData))
        {
            return;
        }
        FECSEntity local_10 = Event.Receiver;
        if (!(local_22) || !(local_16))
        {
            return;
        }
        if (local_10.MatchGameplayTag(GameplayTags::CombatState_BlockAllHitReaction))
        {
            return;
        }
        if (!(local_22.GetbToBreakCurFrame()) || (int(local_16.HitReactionType) != 0))
        {
            return;
        }
        Get local_28;
        const FC_HitStateTypeFrame& local_30 = local_28.opCall();
        if (local_30)
        {
            if (int(local_30.HitStateType) != 0)
            {
                return;
            }
        }
        if (!(local_40.bUseNewHitStateTransit))
        {
            const FAttackData& local_34;
            int local_41 = int(local_34.HitLevel);
            this.Legacy_HitState_Transition(local_10, local_40, TDataObjectPtr<FAttackData>(), local_22, local_16, EAttackDataHitState(local_41));
        }
        bool local_67 = false;
        local_68 = false;
        if (!(local_40.State.GetName().IsNone()))
        {
            if (local_40.State.GetbCustomState())
            {
                local_67 = true;
            }
            else
            {
                if (local_40.bUseNewHitStateTransit)
                {
                    local_68 = local_40.bUseNewHitStateTransit;
                }
            }
        }
        else
        {
            local_68 = local_40.bUseNewHitStateTransit;
        }
        if (local_67)
        {
            return;
        }
        if (local_68)
        {
            const FAttackData& local_34;
            if (!(local_10.MatchGameplayTag(GameplayTags::ESM_HitState_Executed)))
            {
                local_40.SetHitStateByHitLevelESMTransitInfo(::FDamageUtils::PostProcessESMTransitHitStateName(local_40.GetToStateName(), EAttackDataHitState(local_34.HitLevel), EHitBreakLevel(local_34.HitBreakLevel), local_10, local_16));
            }
            else
            {
                if (int(local_34.HitLevel) == 6)
                {
                    local_40.SetHitStateByHitLevelESMTransitInfo(::FDamageUtils::PostProcessESMTransitHitStateName(local_40.GetToStateName(), EAttackDataHitState(local_34.HitLevel), EHitBreakLevel(local_34.HitBreakLevel), local_10, local_16));
                }
            }
            local_22.SetbIsBlowHeavy(false);
            if (int(local_34.HitLevel) == 6)
            {
                local_22.SetbIsBlowHeavy(true);
            }
        }
        return;
    }
    void Legacy_HitState_Transition(const FECSEntity &inout Entity, FC_HitStateFrame &inout HitStateFrame, const TDataObjectPtr<FAttackData> &inout AttackData, FC_HitReaction &inout HitReaction, const FC_HitReactionConfig &inout HitReactionConfig, const EAttackDataHitState HitLevel) const
    {
        if (!(Entity.MatchGameplayTag(GameplayTags::ESM_HitState_Executed)))
        {
            if (int(HitLevel) == 1)
            {
                HitStateFrame.TrySetHitState(Entity, this.HitNotBreakingState, AttackData, false, 0);
            }
            else
            {
                if (int(HitLevel) == 2)
                {
                    HitStateFrame.TrySetHitState(Entity, this.HitLightlyState, AttackData, false, 0);
                }
                else
                {
                    if (int(HitLevel) == 3)
                    {
                        HitStateFrame.TrySetHitState(Entity, this.HitHeavyState, AttackData, false, 0);
                    }
                    else
                    {
                        if (int(HitLevel) == 5 || (int(HitLevel) == 6))
                        {
                            if (HitReactionConfig.CanBlowUp)
                            {
                                HitStateFrame.TrySetHitState(Entity, this.HitBlowState, AttackData, false, 0);
                            }
                            else
                            {
                                HitStateFrame.TrySetHitState(Entity, this.HitHeavyState, AttackData, false, 0);
                            }
                        }
                    }
                }
            }
            if (int(HitLevel) == 2 && (int(HitReaction.GetCurrentHitState()) == 3))
            {
                HitStateFrame.TrySetHitState(Entity, this.HitLightlyState, AttackData, false, 0);
            }
            if (int(HitLevel) == 7)
            {
                HitStateFrame.TrySetHitState(Entity, this.HitKnockDownHitState, AttackData, false, 0);
            }
            if (Entity.MatchGameplayTag(GameplayTags::ESM_HitState_LieDown))
            {
                if (!((HitStateFrame.GetToStateName() == this.HitBlowState)))
                {
                    HitStateFrame.TrySetHitState(Entity, this.LieDownHitStateName, AttackData, false, 0);
                }
            }
        }
        HitReaction.SetbIsBlowHeavy(false);
        if (int(HitLevel) == 6)
        {
            HitReaction.SetbIsBlowHeavy(true);
        }
        return;
    }
    UFUNCTION()
    void Job_HitDamageStateTransit(const FECSEntity &inout Entity, FC_HitStateFrame &inout HitState, FC_HitReaction &inout HitReaction, const FCS_FixedTime &inout FixedTime) const
    {
        bool local_5;
        Has local_18;
        int local_28 = 0;
        FName local_4 = HitState.GetToStateName();
        if (!(local_4.IsNone()))
        {
            FESMExternalTransitHandle local_14 = Entity.ESMExternalTransitMainSM(local_4, NAME_None);
            if (ECS::GetRuntimeInfo().IsClient)
            {
                local_5 = local_18.opCall();
                if (local_5)
                {
                    local_28.SetEnterFrame(int(FixedTime.Frame));
                }
                return;
            }
            Get local_34;
            const FC_NetPredict& local_36 = local_34.opCall();
            if (local_36)
            {
                if (!(!(local_36.GetMask().IsEmpty())))
                {
                    local_5 = false;
                }
                else
                {
                    local_5 = local_18.opCall();
                }
                if (local_5)
                {
                    local_28.SetEnterFrame(int(FixedTime.Frame));
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HitDamagePassiveMovement(const FCE_DamageEvent &inout Event) const
    {
        bool local_4;
        int local_64 = 0;
        const FAttackData& local_66;
        int local_84 = 0;
        float32 local_111;
        int local_128 = 0;
        int local_152 = 0;
        if (int(Event.DamageProcedureType) != 0 || (Event.AttackData == nullptr))
        {
            return;
        }
        Has local_58;
        if (!(local_58.opCall()))
        {
            return;
        }
        if (!(local_64))
        {
            return;
        }
        FVector local_76(FVector::ZeroVector);
        if (int(local_66.HitDirection) == 0)
        {
            local_76 = (FVector(local_64.GetPosition()) - local_84.GetPosition());
        }
        else
        {
            if (int(local_66.HitDirection) == 1)
            {
                local_76 = (FVector(local_64.GetPosition()) - Event.HitData.AttackFromPosition);
            }
            else
            {
                if (int(local_66.HitDirection) == 2)
                {
                    local_76 = local_84.GetRotation().GetForwardVector();
                }
                else
                {
                    if (int(local_66.HitDirection) == 3)
                    {
                        local_76 = Event.HitData.Direction;
                    }
                }
            }
        }
        local_76.Z = 0.0;
        local_76.Normalize(9.99999993922529e-9);
        Modify local_102;
        FC_HitReaction& local_104 = local_102.opCall();
        if (local_104)
        {
            local_104.SetDamageStartTime(Event.Time);
            if (int(local_66.HitStunDurationConfigType) == 0)
            {
                local_111 = ::DamageSettings::Get().GetHitStunDuration(EAttackDataHitState(local_66.HitLevel));
            }
            else
            {
                local_111 = local_66.CustomHitStunDuration;
            }
            local_104.SetAttackerPrefabType(::GetPrefabType(Event.FinalDamageSource));
            local_104.SetHitStunDuration(local_111);
            local_104.SetHitImpulseFromAngle(float32((FMath::RadiansToDegrees(FMath::Acos(FMath::Clamp(local_64.GetRotation().GetForwardVector().DotProduct(local_76.opNeg()), -1.0, 1.0))))));
            if (local_64.GetRotation().GetRightVector().DotProduct(local_76.opNeg()) < 0.0)
            {
                float32 local_110 = -local_104.GetHitImpulseFromAngle();
                local_104.SetHitImpulseFromAngle(local_110);
            }
            local_104.SetHitImpulseX(local_66.GetHitImpulseX());
            local_104.SetHitImpulseZ(local_66.GetHitImpulseZ());
        }
        bool local_121 = false;
        if (local_66.GetHitImpulseX() != 0.0f || (local_66.GetHitImpulseZ() != 0.0f))
        {
            local_121 = true;
        }
        else
        {
            Get local_132;
            const FC_CharacterPassiveMovement& local_134 = local_132.opCall();
            if (local_134)
            {
                if (!(local_134.GetbProcessed()))
                {
                    local_121 = true;
                }
            }
            else
            {
                Has local_138;
                local_4 = local_138.opCall();
                if (!(local_4))
                {
                    local_4 = false;
                }
                else
                {
                    Get local_142;
                    local_4 = local_142.opCall().bUseNewHitStateTransit;
                }
                if (local_4)
                {
                    local_121 = true;
                }
            }
        }
        if (local_121)
        {
            this.ApplyHitPassiveMovement(Event.Receiver, EAttackDataHitState(local_66.HitLevel), local_128, local_76, local_66.GetHitImpulseX(), local_66.GetHitImpulseZ(), Event.Time);
        }
        Has local_146;
        bool local_53 = local_146.opCall();
        if (local_53)
        {
            Get local_132;
            local_152.SetBeHitTime(Event.Time);
            local_152.SetBeHitPushVector(local_76.opNeg());
            local_152.SetBeHitPushVectorRelative(local_64.GetRotation().UnrotateVector(local_76));
            const FC_CharacterPassiveMovement& local_134_2 = local_132.opCall();
            if (local_134_2)
            {
                float local_116 = local_134_2.GetStrikePushBack().Y;
                FVector local_158 = FVector(local_134_2.GetStrikePushBack().X, local_116, local_134_2.GetStrikeBlowUpHeight());
                local_152.SetBeHitPushPitchRelative(float32(local_64.GetRotation().UnrotateVector(local_158).Rotation().Pitch));
            }
        }
        return;
    }
    void ApplyHitPassiveMovement(const FECSEntity &inout Entity, const EAttackDataHitState HitLevel, const FC_HitStateFrame &inout HitState, const FVector &inout ImpactDir, const float32 AttackData_ImpulseX, const float32 AttackData_ImpulseZ, const FFPTime &inout BeHitStartTime) const
    {
        int local_16 = 0;
        bool local_1 = false;
        float32 local_3 = 0.0f;
        UDamageSettings local_6 = ::DamageSettings::Get();
        if (local_6.CanCausePassiveMovementImpulseX(EAttackDataHitState(HitLevel)) || (HitState && (HitState.State.GetName() == this.HitKnockDownHitState)))
        {
            local_1 = true;
            local_3 = AttackData_ImpulseX;
        }
        float32 local_13 = 0.0f;
        if (local_6.CanCausePassiveMovementImpulseZ(EAttackDataHitState(HitLevel)))
        {
            local_1 = true;
            local_13 = AttackData_ImpulseZ;
        }
        if (local_1)
        {
            local_16.SetStrikeImpactDir(ImpactDir);
            bool local_11 = HitState && HitState.HasOverrideStrike();
            if ((local_3 > 0.0f || (local_13 > 0.0f)) || local_11)
            {
                if (local_11)
                {
                    if (local_16.GetbProcessed() || (local_16.GetStrikeCounter() == 0))
                    {
                        local_16.SetStrikeCounter(1);
                    }
                    else
                    {
                        local_16.SetStrikeCounter((local_16.GetStrikeCounter() + 1));
                    }
                    FVector local_36 = HitState.HitLevelESMTransitInfo.DisposeStrikePushBack(ImpactDir, local_16.GetStrikePushBack(), local_16.GetStrikeBlowUpHeight());
                    local_16.SetStrikePushBack(FVector(local_36.X, local_36.Y, 0.0));
                    local_16.SetStrikeBlowUpHeight(float32(local_36.Z));
                }
                else
                {
                    float local_38 = local_3;
                    FVector local_48 = ((ImpactDir * local_38) + (FVector(FVector::UpVector) * local_13));
                    if (local_16.GetbProcessed() || (local_16.GetStrikeCounter() == 0))
                    {
                        local_16.SetStrikeCounter(1);
                        local_16.SetStrikePushBack(FVector(local_48.X, local_48.Y, 0.0));
                        local_16.SetStrikeBlowUpHeight(float32(local_48.Z));
                        local_16.SetbRootMotionDisable(true);
                    }
                    else
                    {
                        local_16.SetStrikeCounter((local_16.GetStrikeCounter() + 1));
                        float local_58 = (FMath::Sign(local_48.X) * FMath::Square(local_48.X)) + (FMath::Sign(local_16.GetStrikePushBack().X) * FMath::Square(local_16.GetStrikePushBack().X));
                        local_38 = FMath::Sign(local_58) * FMath::Sqrt(FMath::Abs(local_58));
                        float local_40 = FMath::Square(local_16.GetStrikePushBack().Y);
                        local_40 = (FMath::Sign(local_48.Y) * FMath::Square(local_48.Y)) + (FMath::Sign(local_16.GetStrikePushBack().Y) * local_40);
                        local_16.SetStrikePushBack(FVector(local_38, (FMath::Sign(local_40) * FMath::Sqrt(FMath::Abs(local_40))), 0.0));
                        float local_56_2 = (FMath::Sign(local_48.Z) * FMath::Square(local_48.Z)) + (FMath::Sign(local_16.GetStrikeBlowUpHeight()) * FMath::Square(local_16.GetStrikeBlowUpHeight()));
                        local_16.SetStrikeBlowUpHeight(float32((FMath::Sign(local_56_2) * FMath::Sqrt(FMath::Abs(local_56_2)))));
                    }
                }
                local_16.SetBeHitStartTime(BeHitStartTime);
                return;
            }
            if (local_16.GetbProcessed() || (local_16.GetStrikeCounter() == 0))
            {
                local_16.SetStrikeCounter(1);
                local_16.SetStrikePushBack(FVector::ZeroVector);
                local_16.SetStrikeBlowUpHeight(0.0f);
                if (local_16.GetbRootMotionDisable())
                {
                    local_16.SetbRootMotionDisable(false);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_SimulateHit(const FECSEntity &inout Entity, const FC_SimulateHit &inout SimulateHit, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime) const
    {
        bool local_1;
        FC_HitStateFrame local_8;
        int local_14 = 0;
        int local_78 = 0;
        int local_178 = 0;
        int local_190 = 0;
        Has local_210;
        int local_220 = 0;
        if (!(Entity) || !(Entity.IsValid()))
        {
            return;
        }
        int local_17 = SimulateHit.EHitDirection;
        FVector local_24 = Transform.GetPosition();
        FQuat local_32 = Transform.GetRotation();
        FVector local_38(FVector::ZeroVector);
        if (local_17 == 3)
        {
            float32 local_41 = FMath::DegreesToRadians(SimulateHit.HitAngle);
            float32 local_40 = FMath::Sin(local_41);
            local_38 = local_32.RotateVector(FVector(FMath::Cos(local_41), local_40, 0.0));
            local_38 = local_38.opNeg();
        }
        else
        {
            if (local_17 == 0)
            {
                float32 local_40_2 = FMath::DegreesToRadians(SimulateHit.HitFromAngle);
                float32 local_41_2 = FMath::Sin(local_40_2);
                FVector local_48 = FVector(FMath::Cos(local_40_2), local_41_2, 0.0);
                local_38 = local_32.RotateVector(local_48);
                local_38 = local_38.opNeg();
            }
            else
            {
                if (local_17 == 1)
                {
                    local_38 = (local_24 - SimulateHit.CenterPos);
                }
                else
                {
                    if (local_17 == 2)
                    {
                        local_38 = SimulateHit.CasterForward;
                    }
                }
            }
        }
        local_38.Z = 0.0;
        local_38.Normalize(9.99999993922529e-9);
        local_14.SetHitFromAngle(SimulateHit.HitFromAngle);
        local_14.SetHitAngle(SimulateHit.HitAngle);
        local_14.SetHitStunDuration(SimulateHit.HitStunDuration);
        float32 local_41_3 = float32((FMath::RadiansToDegrees(FMath::Acos(FMath::Clamp(Transform.GetRotation().GetForwardVector().DotProduct(local_38.opNeg()), -1.0, 1.0)))));
        local_14.SetHitImpulseFromAngle(local_41_3);
        if (Transform.GetRotation().GetRightVector().DotProduct(local_38.opNeg()) < 0.0)
        {
            local_14.SetHitImpulseFromAngle(-local_14.GetHitImpulseFromAngle());
        }
        local_14.SetHitImpulseX(SimulateHit.HitImpulseX);
        local_14.SetHitImpulseZ(SimulateHit.HitImpulseZ);
        if ((true || !(local_8.bUseNewHitStateTransit)))
        {
            TDataObjectPtr<FAttackData> local_126 = TDataObjectPtr<FAttackData>(nullptr);
            this.Legacy_HitState_Transition(Entity, local_8, local_126, local_14, local_78, EAttackDataHitState(SimulateHit.HitLevel));
        }
        int local_39 = SimulateHit.HitBreakLevel;
        int local_151 = SimulateHit.HitLevel;
        FName local_163 = local_8.GetToStateName();
        FHitLevelESMTransitInfo local_172;
        local_8.SetHitStateByHitLevelESMTransitInfo(local_172);
        FFPTime local_180 = FFPTime(-1);
        float32 local_49_2 = SimulateHit.HitImpulseX;
        int local_151_2 = SimulateHit.HitLevel;
        this.ApplyHitPassiveMovement(Entity, EAttackDataHitState(local_151_2), local_8, local_38, local_49_2, SimulateHit.HitImpulseZ, local_180);
        Has local_184;
        bool local_2 = local_184.opCall();
        if (local_2)
        {
            local_190.SetBeHitPushVector(local_38.opNeg());
            local_190.SetBeHitPushVectorRelative(local_32.UnrotateVector(local_38));
            local_41_3 = local_178.GetStrikeBlowUpHeight();
            float local_58_2 = local_178.GetStrikePushBack().Y;
            FVector local_48_2 = FVector(local_178.GetStrikePushBack().X, local_58_2, local_41_3);
            local_41_3 = float32(local_32.UnrotateVector(local_48_2).Rotation().Pitch);
            local_190.SetBeHitPushPitchRelative(local_41_3);
        }
        FName local_163_2 = local_8.GetToStateName();
        if (!(local_163_2.IsNone()))
        {
            FESMExternalTransitHandle local_206 = Entity.ESMExternalTransitMainSM(local_163_2, NAME_None);
            bool local_2_2 = ECS::GetRuntimeInfo().IsClient;
            if (local_2_2)
            {
                local_1 = local_210.opCall();
                if (local_1)
                {
                    local_220.SetEnterFrame(int(FixedTime.Frame));
                }
            }
            else
            {
                Get local_224;
                const FC_NetPredict& local_226 = local_224.opCall();
                if (local_226)
                {
                    local_1 = !(local_226.GetMask().IsEmpty());
                    if (!(local_1))
                    {
                        local_1 = false;
                    }
                    else
                    {
                        local_1 = local_210.opCall();
                    }
                    if (local_1)
                    {
                        local_220.SetEnterFrame(int(FixedTime.Frame));
                    }
                }
            }
        }
        Remove local_232;
        local_232.opCall();
        return;
    }
    UFUNCTION()
    void Job_WeakDamageTypeInfo(const FCE_DamageEvent &inout Event) const
    {
        if (::FCombatUtils::IsTargetWeakDamageType(Event.Receiver, Event.DamageType))
        {
            Modify local_6;
            FC_WeakDamageTypeInfo& local_8 = local_6.opCall();
            if (local_8)
            {
                int local_10 = int(Event.DamageType);
                local_8.SetKnownWeakDamageType(uint8(local_10));
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_ShowDamageNum(const FECSEntity &inout Entity, const FC_DamageNumFrame &inout DamageNumFrame, const FCS_FixedTime &inout FixedTime) const
    {
        bool local_13;
        bool local_17;
        bool local_35;
        for (auto& local_16 : DamageNumFrame.Datas)
        {
            local_17 = true;
            Get local_22;
            const FC_BeHitPresentationConfig& local_24 = local_22.opCall();
            if (local_24)
            {
                local_17 = local_24.bShowDamageNum;
            }
            if (local_17)
            {
                FC_AttackerHitPresentationConfig local_34;
                FECSEntity local_28 = local_16.Attacker;
                if (!(local_34))
                {
                    local_35 = false;
                }
                else
                {
                    local_35 = local_34.bShowDamageNumToOwner;
                }
                if (local_35)
                {
                    local_28 = ::FDamageUtils::GetDamageNumPresentationOwner(local_16.Attacker);
                }
                TDataObjectPtr<FAttackData> local_64;
                local_64 = local_16.AttackData;
                if (!((local_64 == nullptr)))
                {
                    const FAttackData& local_90;
                    if (local_90.bForceShowDamageNumber || (int(::FASCommonUtils::GetMonsterRank(Entity)) == 2 && (int(::FASCommonUtils::GetMonsterRank(local_28)) == 2)))
                    {
                        Get local_98;
                        TArray<FECSEntity> local_104 = ::FASCommonUtils::GetAllPlayerPawnEntitiesInRange(local_98.opCall().GetPosition(), 10000.0f, false);
                        for (auto local_122 : local_104)
                        {
                            local_35 = local_16.bCritical;
                            local_13 = local_16.bHitWeakness;
                            int local_134 = int(local_16.DamageType);
                            int local_135 = int(local_90.AttackType);
                            bool local_136 = local_16.bAdjustPresentationHitPos;
                            float32 local_137 = local_16.DamageValue;
                            FFPTime local_130 = FFPTime(FixedTime.Time);
                            ::FCombatUtils::ShowDamageNumber(local_122, Entity, FixedTime.Time, (local_130 + FFPTime((local_90.FreezeFrameTime * this.DelayShowDamageNumberRatio))), local_137, local_16.StrikeKey, local_136, local_16.Position, EAttackType(local_135), EDamageType(local_134), local_13, local_16.bAttenuated, local_35, local_90.DamageNumberRandomRatio, local_90.GetSpecialDamageTextConfig());
                        }
                    }
                    else
                    {
                        float32 local_137_2 = local_90.DamageNumberRandomRatio;
                        local_35 = local_16.bCritical;
                        int local_134_2 = int(local_16.DamageType);
                        int local_135_2 = int(local_90.AttackType);
                        bool local_136_2 = local_16.bAdjustPresentationHitPos;
                        float32 local_138 = local_16.DamageValue;
                        FFPTime local_130_2 = FFPTime(FixedTime.Time);
                        float32 local_123_2 = local_90.FreezeFrameTime;
                        ::FCombatUtils::ShowDamageNumber(local_28, Entity, local_16.DamageTime, (local_130_2 + FFPTime((local_123_2 * this.DelayShowDamageNumberRatio))), local_138, local_16.StrikeKey, local_136_2, local_16.Position, EAttackType(local_135_2), EDamageType(local_134_2), local_16.bHitWeakness, local_16.bAttenuated, local_35, local_137_2, local_90.GetSpecialDamageTextConfig());
                        if (int(local_90.DamageCalculationType) == 3)
                        {
                            Modify local_144;
                            FC_ExecutedInfo& local_146 = local_144.opCall();
                            if (local_146)
                            {
                                int local_148;
                                if (local_146.GetAddBuffEntityArray().IsEmpty())
                                {
                                }
                                else
                                {
                                }
                                for (auto local_122 : local_148)
                                {
                                    if ((!((local_122 == local_16.Attacker))))
                                    {
                                        local_123_2 = local_90.DamageNumberRandomRatio;
                                        local_35 = local_16.bAttenuated;
                                        ::FCombatUtils::ShowDamageNumber(local_122, Entity, FixedTime.Time, FixedTime.Time, local_16.DamageValue, local_16.StrikeKey, local_16.bAdjustPresentationHitPos, local_16.Position, EAttackType(local_90.AttackType), EDamageType(local_16.DamageType), local_16.bHitWeakness, local_35, local_16.bCritical, local_123_2, local_90.GetSpecialDamageTextConfig());
                                    }
                                }
                            }
                        }
                    }
                }
                else
                {
                    local_35 = local_16.bAttenuated;
                    ::FCombatUtils::ShowDamageNumber(local_28, Entity, FixedTime.Time, FixedTime.Time, local_16.DamageValue, local_16.StrikeKey, local_16.bAdjustPresentationHitPos, local_16.Position, EAttackType(0), EDamageType(local_16.DamageType), local_16.bHitWeakness, local_35, local_16.bCritical, 1.0f, TDataObjectPtr<FSpecialDamageTextConfig>(nullptr));
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HitDamageEnergyBall(const FECSEntity &inout Entity, const FC_HitReaction &inout HitReaction, const FC_DropEnergyBallSource &inout DropEnergyBallSource, const FCS_FixedTime &inout FixedTime) const
    {
        FC_DropEnergyBallSourceOverride local_10;
        bool local_3 = HitReaction.GetStaggerCount() == 0 && !(HitReaction.GetbToBreakCurFrame());
        if (local_3)
        {
            return;
        }
        if (!(local_10))
        {
            local_3 = false;
        }
        else
        {
            local_3 = local_10.bOverrideDetectRadius;
        }
        if (local_3)
        {
            float32 local_11;
            local_11 = local_10.DetectRadius;
        }
        else
        {
            float32 local_11;
            local_11 = DropEnergyBallSource.DetectRadius;
        }
        if (HitReaction.GetStaggerCount() > 0)
        {
            bool local_14;
            float32 local_11;
            TArray<FDropEnergyBallData> local_18;
            if (!(local_10))
            {
                local_14 = false;
            }
            else
            {
                local_14 = local_10.bOverrideHitStaggerEnergyBallDrops;
            }
            if (local_14)
            {
                local_18 = local_10.HitStaggerEnergyBallDrops;
            }
            else
            {
                local_18 = DropEnergyBallSource.HitStaggerEnergyBallDrops;
            }
            for (auto& local_34 : local_18)
            {
                ::EnergyBallUtils::SpawnEnergyBallInSphere(Entity, local_34.Prefab, FixedTime.Time, local_11, (int(local_34.Number) * HitReaction.GetStaggerCount()), EEnergyBallSpawnDirection(0));
            }
        }
        if (HitReaction.GetbToBreakCurFrame())
        {
            bool local_14;
            float32 local_11;
            TArray<FDropEnergyBallData> local_18;
            if (!(local_10))
            {
                local_14 = false;
            }
            else
            {
                local_14 = local_10.bOverrideHitBreakEnergyBallDrops;
            }
            if (local_14)
            {
                local_18 = local_10.HitBreakEnergyBallDrops;
            }
            else
            {
                local_18 = DropEnergyBallSource.HitBreakEnergyBallDrops;
            }
            for (auto& local_34 : local_18)
            {
                ::EnergyBallUtils::SpawnEnergyBallInSphere(Entity, local_34.Prefab, FixedTime.Time, local_11, int(local_34.Number), EEnergyBallSpawnDirection(0));
            }
        }
        return;
    }
    UFUNCTION()
    void Job_TickAbnormalAccumulating(const FECSEntity &inout Entity, FC_AbnormalState &inout AbnormalStateComponent, const FCS_FixedTime &inout Time) const
    {
        FECSEntity local_18;
        int local_20 = 0;
        FAbnormalStateConfig local_438;
        Has local_8;
        bool local_9 = local_8.opCall();
        if (local_9)
        {
            local_18 = ::FASCommonUtils::GetUniqueAvatarPawnEntity(Entity);
        }
        else
        {
            local_18 = Entity;
        }
        TArray<int> local_28;
        TArray<FECSEntity> local_32;
        ::FASCommonUtils::GetEntityAllPlayerPawnEntities(Entity, local_32);
        int local_33 = 0;
        for (; local_33 < AbnormalStateComponent.GetAbnormalStates().Num(); ++local_33)
        {
            const FAbnormalState& local_38 = AbnormalStateComponent.GetAbnormalStates()[local_33];
            this.AbnormalData.AbnormalStateGlobalConfig.Find(local_38.GetAbnormalStateType(), local_438);
            if (local_38.IsActiving())
            {
                if (FFPTime(local_38.GetEndTime()).opCmp(Time.Time) <= 0)
                {
                    for (auto& local_456 : local_32)
                    {
                        local_38.RemoveBuffFromPawn(local_456, Time.Time);
                    }
                    local_28.Add(local_33);
                }
                else
                {
                    for (auto& local_456 : local_32)
                    {
                        local_38.AddBuffToPawn(local_456, Time.Time);
                    }
                }
                continue;
            }
            float32 local_458 = local_20.GetAttributeValue(local_438.AccumulationAttributeMax, Time.Time);
            float32 local_457 = local_20.GetAttributeValue(local_438.AccumulationAttribute, Time.Time);
            float32 local_460 = 1.0f - local_438.AccumulatingBuffThreshold;
            if (local_457 > (local_458 * (FMath::Min(local_460 + 0.1f, 1.0f))))
            {
                local_28.Add(local_33);
                for (auto& local_456 : local_32)
                {
                    local_38.RemoveBuffFromPawn(local_456, Time.Time);
                }
                continue;
            }
            for (auto& local_456 : local_32)
            {
                local_38.AddBuffToPawn(local_456, Time.Time);
            }
        }
        int local_463 = local_28.Num() - 1;
        for (; local_463 >= 0; )
        {
            AbnormalStateComponent.GetModify_AbnormalStates().RemoveAt(local_463);
            --local_463;
        }
        return;
    }
    UFUNCTION()
    void Job_OnRemovedAbnormalState(const FECSEntity &inout Entity, FC_BeRemovedAbnormalStates &inout BeRemovedAbnormalStates, const FCS_FixedTime &inout Time) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_OnClearAbnormalState(const FECSEntity &inout Entity, const FCS_FixedTime &inout Time) const
    {
        TArray<FECSEntity> local_4;
        ::FASCommonUtils::GetEntityAllPlayerPawnEntities(Entity, local_4);
        FGameAttributeRef local_38;
        FGameAttributeRef local_52;
        for (auto& local_24 : this.AbnormalData.AbnormalStateGlobalConfig)
        {
            local_24;
            if (!(local_38.IsValid()) || !(local_52.IsValid()))
            {
                continue;
            }
            for (auto& local_68 : local_4)
            {
                Get local_72;
                const FC_GameAttribute& local_74 = local_72.opCall();
                if (local_74)
                {
                    if (local_74.HasAttribute(local_38) && local_74.HasAttribute(local_52))
                    {
                        FGameAttributeUtils::ChangeConsumeValue(local_68, local_38, Time.Time, local_74.GetAttributeMaxValue(local_52, Time.Time), -1.0f);
                    }
                }
            }
        }
        Modify local_82;
        FC_AbnormalState& local_78 = local_82.opCall();
        if (local_78)
        {
            int local_83 = 0;
            for (; local_83 < local_78.GetAbnormalStates().Num(); ++local_83)
            {
                for (auto& local_68 : local_4)
                {
                    local_78.GetAbnormalStates()[local_83].RemoveBuffFromPawn(local_68, Time.Time);
                }
            }
            local_78.GetModify_AbnormalStates().Empty(0);
        }
        Remove local_90;
        local_90.opCall();
        return;
    }
    UFUNCTION()
    void ClientJob_TickAbnormalPresentation(const FECSEntity &inout ComponentEntity, const FC_AbnormalState &inout AbnormalStateComponent, const FCS_LocalTime &inout LocalTime) const
    {
        ::FAbnormalStateUtils::DisposeAbnormalPresentation(ComponentEntity, AbnormalStateComponent, this.AbnormalData, LocalTime.Time);
        return;
    }
    UFUNCTION()
    void Job_DamageConfirmAIKnowledge(const FCE_DamageEvent &inout Event) const
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            ::FAIKnowledgeUtils::UpdateAIKnowledgeByDamage(Event.FinalDamageSource, Event.Receiver);
        }
        return;
    }
    UFUNCTION()
    void Job_DamageAIHostility(const FCE_DamageEvent &inout Event, const FCS_FixedTime &inout FixedTime) const
    {
        FFPTime local_2 = FFPTime(Event.Time);
        if (local_2.opCmp(FixedTime.Time) < 0)
        {
            local_2 = FixedTime.Time;
        }
        if (Event.FinalDamageSource.IsValid())
        {
            FCE_HitAIHostility local_10;
            local_10.Receiver = Event.Receiver;
            local_10.Damage = Event.TotalDamageToHP;
            local_10.AttackData = Event.AttackData;
        }
        return;
    }
    UFUNCTION()
    void Job_HitDamageAudio(const FCE_DamageEvent &inout Event, const FCS_FixedTime &inout FixedTime) const
    {
        int local_56;
        FECSEntity local_4 = Event.Receiver;
        if (!(Event.AttackData))
        {
            return;
        }
        FAttackData local_8;
        EAttackDataHitState local_9 = local_8.HitLevel;
        if ((int(local_9) == 2 || (int(local_9) == 3) || (int(local_9) == 5) || (int(local_9) == 6)))
        {
            GetDefaulted local_60;
            Get local_52;
            Has local_18;
            bool local_13 = local_18.opCall();
            if (local_13)
            {
                FECSEntity local_22 = FECSEntity(ENTITY_NULL);
                TArray<FECSEntity> local_26;
                TArray<FECSEntity> local_34 = ::FTeamUtils::GetTeammates(local_4);
                for (auto& local_48 : local_34)
                {
                    const FC_PlayerController& local_54 = local_52.opCall();
                    if (local_54)
                    {
                        if (!((local_4 == local_54.GetPlayerPawnEntity())))
                        {
                            local_26.Add(local_48);
                        }
                    }
                }
                if (local_26.Num() > 0)
                {
                    local_56 = FMath::RandRange(0, (local_26.Num() - 1));
                    local_22 = local_60.opCall().GetPlayerPawnEntity();
                }
                Get local_64;
                const FC_GameAttribute& local_66 = local_64.opCall();
                if (local_66)
                {
                    if (Event.ActualDamageToHP >= ((local_66.GetAttributeValue(Attribute::HPMax, Event.Time)) * 0.2f))
                    {
                        FCE_TriggerBeHitAudioVo local_78;
                        FFPTime local_76 = FFPTime(-1);
                        local_78.Attacker = Event.FinalDamageSource;
                        local_78.Receiver = local_4;
                        local_78.Comforter = local_22;
                        local_78.HitLevel = EAttackDataHitState(local_9);
                    }
                }
            }
        }
        local_56 = int(local_8.AttackCategory);
        if (::BlueprintFunctions_Ability::MatchAttackCategory(local_56, EAttackCategory(3)))
        {
            GetDefaulted local_60;
            Get local_52;
            if (::FASCommonUtils::IsMonsterPrefab(local_4) && (int(::FASCommonUtils::GetMonsterRank(local_4)) == 2))
            {
                FECSEntity local_22_2 = FECSEntity(ENTITY_NULL);
                TArray<FECSEntity> local_26;
                TArray<FECSEntity> local_30 = ::FTeamUtils::GetTeammates(Event.FinalDamageSource);
                for (auto& local_48 : local_30)
                {
                    const FC_PlayerController& local_54_2 = local_52.opCall();
                    if (local_54_2)
                    {
                        if (!((Event.FinalDamageSource == local_54_2.GetPlayerPawnEntity())))
                        {
                            local_26.Add(local_48);
                        }
                    }
                }
                if (local_26.Num() > 0)
                {
                    FCS_EntityAudioVoLogicManager local_88;
                    int local_12_2 = FMath::RandRange(0, local_26.Num() - 1);
                    FECSEntity local_22_3 = local_60.opCall().GetPlayerPawnEntity();
                    FECSWorldPtr local_90 = ECS::GetECSWorld();
                    FFPTime& local_96 = local_88.LastUltraSkillHitTime.FindOrAdd(Event.FinalDamageSource);
                    if (((FFPTime(FixedTime.Time) - local_96).opCmp(local_88.UltraSkillVoCd)) > 0)
                    {
                        FCE_SkillHitAudioVo local_106;
                        FFPTime local_76_2 = FFPTime(-1);
                        local_106.Attacker = Event.FinalDamageSource;
                        local_106.Receiver = local_4;
                        local_106.Encourager = local_22_3;
                        local_106.AttackCategory = local_56;
                        FFPTime& local_96_2 = FixedTime.Time;
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdatePotentialDamage(const FECSEntity &inout Entity, FC_PotentialDamage &inout PotentialDamage, const FCS_FixedTime &inout FixedTime) const
    {
        if (FFPTime(PotentialDamage.GetCheckTime()).opCmp(FixedTime.Time) <= 0)
        {
            TArray<int> local_8;
            for (auto& local_26 : PotentialDamage.GetDataByIndex())
            {
                if (FFPTime(GetExpireTime()).opCmp(FixedTime.Time) <= 0)
                {
                    local_8.Add(local_26.GetKey());
                }
            }
            auto local_32 = local_8.Iterator();
            for (; local_32.CanProceed;)
            {
                int local_3 = local_32.Proceed();
            }
            if (PotentialDamage.GetDataByIndex().IsEmpty())
            {
                PotentialDamage.SetCheckTime(FFPTime(-1));
                Remove local_44;
                local_44.opCall();
            }
            else
            {
                for (auto& local_26_2 : PotentialDamage.GetDataByIndex())
                {
                    if (FFPTime(GetExpireTime()).opCmp(PotentialDamage.GetCheckTime()) > 0)
                    {
                        PotentialDamage.SetCheckTime(GetExpireTime());
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_RemoveEcologyPostureProtect(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, const FC_EcologyPostureProtect &inout EcologyPostureProtect) const
    {
        if (FFPTime(FixedTime.Time).opCmp(EcologyPostureProtect.GetRemoveTime()) >= 0)
        {
            Remove local_8;
            local_8.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_CleanupExpiredComboHitRecords(const FECSEntity &inout Entity, FC_ComboHitReductionRecord &inout ComboRecord, const FCS_FixedTime &inout FixedTime) const
    {
        TArray<FComboHitReductionKey> local_4;
        float32 local_29 = 0.0f;
        for (auto& local_24 : ComboRecord.GetHitRecord())
        {
            if ((local_24.GetKey().GetComboHitConfig() && ((((FFPTime(GetLastHitTime()) + FFPTime(local_29))).opCmp(FixedTime.Time) < 0))))
            {
                local_4.Add(local_24.GetKey());
            }
        }
        for (auto& local_50 : local_4)
        {
            local_50;
        }
        if (ComboRecord.GetHitRecord().IsEmpty())
        {
            Remove local_54;
            local_54.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_ClearDealDamageFrame(const FECSEntity &inout Entity) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void Job_ClearTakeDamageToCalculateFrame(const FECSEntity &inout Entity) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void Job_ClearDamageToCalculateFrame(const FCS_DamageToCalculateFrame &inout DamageToCalculateFrame) const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Remove local_6;
        local_6.opCall();
        return;
    }
    UFUNCTION()
    void Job_ClearDamageToApplyFrame(const FECSEntity &inout Entity) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void Job_ClearHitStateTypeFrame(const FECSEntity &inout Entity) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void Job_ClearHitReactionCount(FC_HitReaction &inout HitReaction) const
    {
        HitReaction.SetStaggerCount(0);
        HitReaction.SetbToBreakCurFrame(false);
        return;
    }
    UFUNCTION()
    void Job_ClearHitStateFrame(const FECSEntity &inout Entity) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void Job_ClearDamageNumFrame(const FECSEntity &inout Entity) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void Job_DamageStatistic(const FCE_DamageEvent &inout Event) const
    {
        Get local_42;
        int local_121 = 0;
        int local_176 = 0;
        FECSEntity local_4 = Event.Receiver;
        TMap<FECSEntityId, FName> local_28;
        FECSEntityId local_29 = FECSEntityId(ENTITY_ID_NULL);
        Get local_34;
        const FC_ControlledByPlayer& local_36 = local_34.opCall();
        if (local_36)
        {
            local_29 = local_36.GetPlayerEntity().GetId();
            const FC_ControlledByPlayer& local_44 = local_42.opCall();
            if (local_44)
            {
                FName local_50 = FName(FECSEntity::GetDefaulted<FC_DSPlayerInfo>(local_44.GetPlayerEntity()).opCall().GetNickName());
                local_28.Add(local_44.GetPlayerEntity().GetId(), local_50);
            }
        }
        FDamageStatisticData local_67;
        local_67.SetTime(float32(Event.Time.ToSeconds()));
        local_67.SetAttackDataName(Event.AttackData.GetDataName());
        local_67.SetDamageToHp(Event.ActualDamageToHP);
        local_67.SetDamageToPosture(Event.DamageToPosture);
        local_67.SetbReceiverKilled(Event.bKillTarget);
        local_67.SetDamageType(Event.DamageType);
        if ((!((Event.AttackData == nullptr))))
        {
            local_67.SetAttackCategory(local_121);
        }
        local_67.SetAttackerEntityId(Event.FinalDamageSource.GetId());
        local_67.SetReceiverEntityId(local_4.GetId());
        local_67.SetReceiverPlayerEntityId(local_29);
        const FC_ControlledByPlayer& local_44_2 = local_42.opCall();
        if (local_44_2)
        {
            FString local_54;
            local_67.SetAttackerPlayerEntityId(local_44_2.GetPlayerEntity().GetId());
            local_54 = FECSEntity::GetDefaulted<FC_DSPlayerInfo>(local_44_2.GetPlayerEntity()).opCall().GetNickName();
            FName local_50_2 = FName(local_54);
            local_28.Add(local_44_2.GetPlayerEntity().GetId(), local_50_2);
        }
        if (::GetAvatarConfig(Event.FinalDamageSource))
        {
            FString local_54;
            FName local_50_3 = FName(local_54);
            local_28.Add(Event.FinalDamageSource.GetId(), local_50_3);
        }
        else
        {
            local_28.Add(Event.FinalDamageSource.GetId(), Event.FinalDamageSource.GetEntityName());
        }
        if (::GetAvatarConfig(local_4))
        {
            FString local_54;
            FName local_50_4 = FName(local_54);
            local_28.Add(local_4.GetId(), local_50_4);
        }
        else
        {
            local_28.Add(local_4.GetId(), local_4.GetEntityName());
        }
        local_176.DamageStats.Add(local_67);
        for (auto& local_194 : local_176.EntityIdToName)
        {
            local_176.EntityIdToName.Add(local_194.GetKey());
        }
        return;
    }
    UFUNCTION()
    void Job_SendDamageStatisticToClient(const FECSEntity &inout Entity, const FC_DamageStatisticFrame &inout DamageStatisticFrame) const
    {
        int local_10 = 0;
        FFPTime local_6 = FFPTime(-1);
        local_10.damages = DamageStatisticFrame.DamageStats;
        local_10.EntityIdToName = DamageStatisticFrame.EntityIdToName;
        Remove local_14;
        local_14.opCall();
        return;
    }
    UFUNCTION()
    void ClientJob_HandleServerToClientDamageStatistic(const FCE_ServerToClientDamageEvent &inout Event) const
    {
        int local_14 = 0;
        if (Event.Sender.IsValid() == false)
        {
            return;
        }
        FECSEntity local_6 = FECSEntity(Event.Sender);
        FECSWorldPtr local_8 = this.GetECSWorld();
        for (auto& local_28 : Event.damages)
        {
            local_14.AddData(local_28);
        }
        for (auto& local_46 : Event.EntityIdToName)
        {
            local_14.AddEntityName(local_46.GetKey());
        }
        return;
    }
    UFUNCTION()
    void ClientJob_ClearNewDamageResolvedTag() const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        FECSWorldPtr::Clear(local_2).opCall(EECSRegType(0));
        return;
    }
    void Monitor___JobTimer_Pre___Job_UpdateDamageWaitingCalculation(const FC_TakeDamageWaitingCalculation &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetEarliestDamageTime());
        FName local_8 = FName("S_DamageSystem::Job_UpdateDamageWaitingCalculation");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_UpdateDamageWaitingCalculation(const FC_TakeDamageWaitingCalculation &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetEarliestDamageTime());
        FName local_8 = FName("S_DamageSystem::Job_UpdateDamageWaitingCalculation");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    void Monitor___JobTimer_OnSync___Job_UpdateDamageWaitingCalculation(const FC_TakeDamageWaitingCalculation &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetEarliestDamageTime());
        FName local_8 = FName("S_DamageSystem::Job_UpdateDamageWaitingCalculation");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_UpdateDamageWaitingCalculation() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorTakeDamageWaitingCalculationOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_UpdateDamageWaitingCalculation(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorTakeDamageWaitingCalculationOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_UpdateDamageWaitingCalculation(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_UpdateDamageWaitingCalculation() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorTakeDamageWaitingCalculationOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_UpdateDamageWaitingCalculation(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorTakeDamageWaitingCalculationOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_UpdateDamageWaitingCalculation(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_OnSync___Job_UpdateDamageWaitingCalculation() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorTakeDamageWaitingCalculationOnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_OnSync___Job_UpdateDamageWaitingCalculation(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorTakeDamageWaitingCalculationOnActiveView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_OnSync___Job_UpdateDamageWaitingCalculation(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateDamageWaitingCalculation() const
    {
        int local_6 = 0;
        bool local_34;
        int local_42 = 0;
        int local_68 = 0;
        int local_70 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        Has local_52;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            local_34 = false;
            bool local_35 = !(false);
            if (!(local_32.IsActive()) == local_35)
            {
                continue;
            }
            if (!(local_42))
            {
                continue;
            }
            FFPTime local_44 = FFPTime(local_42.GetEarliestDamageTime());
            if (local_44.opCmp(0.0) < 0 || (FFPTime(local_42.GetEarliestDamageTime()) == FPTIME_MAX))
            {
                continue;
            }
            if (!(local_52.opCall()) == !(false))
            {
                FString local_56 = "Timer job error: 'FC_LocalTag' included by job but not exist on ";
                FString local_60 = local_32.ToString();
                local_34 = true;
            }
            if (local_34)
            {
                continue;
            }
            this.Job_UpdateDamageWaitingCalculation(local_68, local_70, local_6);
            MarkModifiedIfDirty local_78;
            local_78.opCall(local_70);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_Job_PrepareDamageToCalculatCurFrame() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        this.Job_PrepareDamageToCalculatCurFrame(local_12);
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_20;
        local_20.opCall(local_12);
        return;
    }
    UFUNCTION()
    void Run_Job_DamageCalculation() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        this.Job_DamageCalculation(local_12);
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_20;
        local_20.opCall(local_12);
        return;
    }
    UFUNCTION()
    void Run_Job_MarkUseNewHitStateTransit() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_170 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_MarkUseNewHitStateTransit(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_80.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_MarkUseNewHitStateTransit(local_170, local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ApplyDamage() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_178 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_ApplyDamage(local_40, local_42, local_6);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_88).opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_106 = 0;
        FECSRuntimeViewIterator local_140 = local_88.Iterator();
        for (; local_140.CanProceed;)
        {
            local_40 = local_140.Proceed();
            ++local_106;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_ApplyDamage(local_178, local_42, local_6);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_106);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateDenfenseState() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_194 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_UpdateDenfenseState(local_40, local_42, local_48, local_54, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Exclude(local_96).opCall();
        Exclude(local_96).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_122 = 0;
        FECSRuntimeViewIterator local_156 = local_96.Iterator();
        for (; local_156.CanProceed;)
        {
            local_40 = local_156.Proceed();
            ++local_122;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateDenfenseState(local_194, local_42, local_48, local_54, local_6);
        }
        local_4.UpdateCachedEntityCount(local_122);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdatePostureBreakHitState() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        int local_194 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_UpdatePostureBreakHitState(local_40, local_42, local_48, local_54, local_6);
                local_62.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_100 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Exclude(local_100).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_122 = 0;
        FECSRuntimeViewIterator local_156 = local_100.Iterator();
        for (; local_156.CanProceed;)
        {
            local_40 = local_156.Proceed();
            ++local_122;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdatePostureBreakHitState(local_194, local_42, local_48, local_54, local_6);
            local_62.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_122);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateMutualClashHitState() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        int local_204 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_UpdateMutualClashHitState(local_40, local_42, local_48, local_54, local_60, local_6);
                local_68.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_106 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Include local_126;
        local_126.opCall();
        Exclude(local_106).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_132 = 0;
        FECSRuntimeViewIterator local_166 = local_106.Iterator();
        for (; local_166.CanProceed;)
        {
            local_40 = local_166.Proceed();
            ++local_132;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateMutualClashHitState(local_204, local_42, local_48, local_54, local_60, local_6);
            local_68.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_132);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateBodyPartDestroyHitState() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        int local_204 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_UpdateBodyPartDestroyHitState(local_40, local_42, local_48, local_54, local_60, local_6);
                local_68.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_106 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Include local_126;
        local_126.opCall();
        Exclude(local_106).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_132 = 0;
        FECSRuntimeViewIterator local_166 = local_106.Iterator();
        for (; local_166.CanProceed;)
        {
            local_40 = local_166.Proceed();
            ++local_132;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateBodyPartDestroyHitState(local_204, local_42, local_48, local_54, local_60, local_6);
            local_68.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_132);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdatePostureStaggerHitState() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        int local_194 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_UpdatePostureStaggerHitState(local_40, local_42, local_48, local_54, local_6);
                local_62.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_100 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Exclude(local_100).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_122 = 0;
        FECSRuntimeViewIterator local_156 = local_100.Iterator();
        for (; local_156.CanProceed;)
        {
            local_40 = local_156.Proceed();
            ++local_122;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdatePostureStaggerHitState(local_194, local_42, local_48, local_54, local_6);
            local_62.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_122);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HPChange() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_170 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_HPChange(local_40, local_42, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_40 = local_132.Proceed();
            ++local_98;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_HPChange(local_170, local_42, local_6);
        }
        local_4.UpdateCachedEntityCount(local_98);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearHPPreChange() const
    {
        const FECSEntity& local_36;
        int local_156 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_ClearHPPreChange(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Exclude(local_74).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_84 = 0;
        FECSRuntimeViewIterator local_118 = local_74.Iterator();
        for (; local_118.CanProceed;)
        {
            local_36 = local_118.Proceed();
            ++local_84;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_ClearHPPreChange(local_156);
        }
        local_2.UpdateCachedEntityCount(local_84);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_PostureChange() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        int local_194 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_PostureChange(local_40, local_42, local_48, local_54, local_6);
                local_62.opCall(local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_100 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Exclude(local_100).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_122 = 0;
        FECSRuntimeViewIterator local_156 = local_100.Iterator();
        for (; local_156.CanProceed;)
        {
            local_40 = local_156.Proceed();
            ++local_122;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_PostureChange(local_194, local_42, local_48, local_54, local_6);
            local_62.opCall(local_54);
        }
        local_4.UpdateCachedEntityCount(local_122);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearPosturePreChange() const
    {
        const FECSEntity& local_36;
        int local_156 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_ClearPosturePreChange(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Exclude(local_74).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_84 = 0;
        FECSRuntimeViewIterator local_118 = local_74.Iterator();
        for (; local_118.CanProceed;)
        {
            local_36 = local_118.Proceed();
            ++local_84;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_ClearPosturePreChange(local_156);
        }
        local_2.UpdateCachedEntityCount(local_84);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_BodyPartDestroy() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        int local_194 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_BodyPartDestroy(local_40, local_42, local_48, local_54, local_6);
                local_62.opCall(local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_100 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Exclude(local_100).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_122 = 0;
        FECSRuntimeViewIterator local_156 = local_100.Iterator();
        for (; local_156.CanProceed;)
        {
            local_40 = local_156.Proceed();
            ++local_122;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_BodyPartDestroy(local_194, local_42, local_48, local_54, local_6);
            local_62.opCall(local_54);
        }
        local_4.UpdateCachedEntityCount(local_122);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearBodyPartPreChange() const
    {
        const FECSEntity& local_36;
        int local_156 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_ClearBodyPartPreChange(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Exclude(local_74).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_84 = 0;
        FECSRuntimeViewIterator local_118 = local_74.Iterator();
        for (; local_118.CanProceed;)
        {
            local_36 = local_118.Proceed();
            ++local_84;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_ClearBodyPartPreChange(local_156);
        }
        local_2.UpdateCachedEntityCount(local_84);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_AbnormalStateChange() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_170 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_AbnormalStateChange(local_40, local_42, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_40 = local_132.Proceed();
            ++local_98;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_AbnormalStateChange(local_170, local_42, local_6);
        }
        local_4.UpdateCachedEntityCount(local_98);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearAbnormalValuePreChange() const
    {
        const FECSEntity& local_36;
        int local_156 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_ClearAbnormalValuePreChange(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Exclude(local_74).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_84 = 0;
        FECSRuntimeViewIterator local_118 = local_74.Iterator();
        for (; local_118.CanProceed;)
        {
            local_36 = local_118.Proceed();
            ++local_84;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_ClearAbnormalValuePreChange(local_156);
        }
        local_2.UpdateCachedEntityCount(local_84);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_MutualClashChange() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        int local_194 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_MutualClashChange(local_40, local_42, local_48, local_54, local_6);
                local_62.opCall(local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_100 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Exclude(local_100).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_122 = 0;
        FECSRuntimeViewIterator local_156 = local_100.Iterator();
        for (; local_156.CanProceed;)
        {
            local_40 = local_156.Proceed();
            ++local_122;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_MutualClashChange(local_194, local_42, local_48, local_54, local_6);
            local_62.opCall(local_54);
        }
        local_4.UpdateCachedEntityCount(local_122);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearMutualClashPreChange() const
    {
        const FECSEntity& local_36;
        int local_156 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_ClearMutualClashPreChange(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Exclude(local_74).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_84 = 0;
        FECSRuntimeViewIterator local_118 = local_74.Iterator();
        for (; local_118.CanProceed;)
        {
            local_36 = local_118.Proceed();
            ++local_84;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_ClearMutualClashPreChange(local_156);
        }
        local_2.UpdateCachedEntityCount(local_84);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DisposeSpecialHitTypeBeforeDamageCaculation() const
    {
        ECS::GetContextJob();
        TECSEventIterator<FCE_DamageEvent> local_36 = FECSWorldPtr::PatchEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            FCE_DamageEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DisposeSpecialHitTypeBeforeDamageCaculation(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HitLevelStateTransit() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DamageEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DamageEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HitLevelStateTransit(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HitDamageStateTransit() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        MarkModifiedIfDirty local_60;
        int local_192 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_HitDamageStateTransit(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_HitStateFrame> local_56;
                local_56.opCall(local_42);
                local_60.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_120 = 0;
        FECSRuntimeViewIterator local_154 = local_98.Iterator();
        for (; local_154.CanProceed;)
        {
            local_40 = local_154.Proceed();
            ++local_120;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_HitDamageStateTransit(local_192, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_HitStateFrame>(local_40).opCall(local_42);
            local_60.opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_120);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HitDamagePassiveMovement() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DamageEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DamageEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HitDamagePassiveMovement(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_SimulateHit() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_180 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_SimulateHit(local_40, local_42, local_48, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Exclude(local_90).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_90.Iterator();
        for (; local_142.CanProceed;)
        {
            local_40 = local_142.Proceed();
            ++local_108;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_SimulateHit(local_180, local_42, local_48, local_6);
        }
        local_4.UpdateCachedEntityCount(local_108);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_WeakDamageTypeInfo() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DamageEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DamageEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_WeakDamageTypeInfo(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_ShowDamageNum() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_170 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.ServerJob_ShowDamageNum(local_40, local_42, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_40 = local_132.Proceed();
            ++local_98;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_ShowDamageNum(local_170, local_42, local_6);
        }
        local_4.UpdateCachedEntityCount(local_98);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HitDamageEnergyBall() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_184 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_HitDamageEnergyBall(local_40, local_42, local_48, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Exclude(local_90).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_90.Iterator();
        for (; local_146.CanProceed;)
        {
            local_40 = local_146.Proceed();
            ++local_112;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_HitDamageEnergyBall(local_184, local_42, local_48, local_6);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickAbnormalAccumulating() const
    {
        int local_12 = 0;
        const FECSEntity& local_44;
        int local_46 = 0;
        MarkModifiedIfDirty local_54;
        int local_178 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(0.5))))
        {
            return;
        }
        int local_14 = 0;
        int local_13 = local_14;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_4.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                this.Job_TickAbnormalAccumulating(local_44, local_46, local_12);
                local_54.opCall(local_46);
            }
            local_4.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Exclude(local_92).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_22 = local_4.GetViewCacheEpoch();
        int local_106 = 0;
        FECSRuntimeViewIterator local_140 = local_92.Iterator();
        for (; local_140.CanProceed;)
        {
            local_44 = local_140.Proceed();
            ++local_106;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_44.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_44);
            this.Job_TickAbnormalAccumulating(local_178, local_46, local_12);
            local_54.opCall(local_46);
        }
        local_4.UpdateCachedEntityCount(local_106);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_22);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_OnRemovedAbnormalState() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_170 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_OnRemovedAbnormalState(local_40, local_42, local_6);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_88.Iterator();
        for (; local_132.CanProceed;)
        {
            local_40 = local_132.Proceed();
            ++local_98;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_OnRemovedAbnormalState(local_170, local_42, local_6);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_98);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_OnClearAbnormalState() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_160 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_OnClearAbnormalState(local_40, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_78 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_82;
        local_82.opCall();
        Exclude(local_78).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_88 = 0;
        FECSRuntimeViewIterator local_122 = local_78.Iterator();
        for (; local_122.CanProceed;)
        {
            local_40 = local_122.Proceed();
            ++local_88;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_OnClearAbnormalState(local_160, local_6);
        }
        local_4.UpdateCachedEntityCount(local_88);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TickAbnormalPresentation() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_168 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        int local_18 = 0;
        int local_17 = local_18;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_4_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_22 = local_2.GetViewCacheEntities();
            int local_23 = 0;
            for (auto& local_38 : local_22)
            {
                local_38;
                FECSEntity local_42;
                if (!(local_42.IsValid()))
                {
                    continue;
                }
                ++local_23;
                FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42);
                this.ClientJob_TickAbnormalPresentation(local_46, local_48, local_12);
            }
            local_2.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        bool local_9 = local_2.BeginViewCacheBuild();
        int local_24 = local_2.GetViewCacheEpoch();
        int local_96 = 0;
        FECSRuntimeViewIterator local_130 = local_90.Iterator();
        for (; local_130.CanProceed;)
        {
            local_46 = local_130.Proceed();
            ++local_96;
            if (local_9)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.ClientJob_TickAbnormalPresentation(local_168, local_48, local_12);
        }
        local_2.UpdateCachedEntityCount(local_96);
        if (local_9)
        {
            local_2.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DamageConfirmAIKnowledge() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DamageEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DamageEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DamageConfirmAIKnowledge(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DamageAIHostility() const
    {
        int local_6 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DamageEvent> local_40 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_40.CanProceed;)
        {
            const FCE_DamageEvent& local_64 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_65 = FECSEntityScopeCycleCounter(local_64.Sender);
            ECSInternal::PushContextTime(local_64.GetHandleTime());
            this.Job_DamageAIHostility(local_64, local_6);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HitDamageAudio() const
    {
        int local_6 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DamageEvent> local_40 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_40.CanProceed;)
        {
            const FCE_DamageEvent& local_64 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_65 = FECSEntityScopeCycleCounter(local_64.Sender);
            ECSInternal::PushContextTime(local_64.GetHandleTime());
            this.Job_HitDamageAudio(local_64, local_6);
            ECSInternal::PopContextTime();
        }
        return;
    }
    void Monitor___JobTimer_Pre___Job_UpdatePotentialDamage(const FC_PotentialDamage &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetCheckTime());
        FName local_8 = FName("S_DamageSystem::Job_UpdatePotentialDamage");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_UpdatePotentialDamage(const FC_PotentialDamage &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetCheckTime());
        FName local_8 = FName("S_DamageSystem::Job_UpdatePotentialDamage");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    void Monitor___JobTimer_OnSync___Job_UpdatePotentialDamage(const FC_PotentialDamage &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetCheckTime());
        FName local_8 = FName("S_DamageSystem::Job_UpdatePotentialDamage");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_UpdatePotentialDamage() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorPotentialDamageOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_UpdatePotentialDamage(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorPotentialDamageOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_UpdatePotentialDamage(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_UpdatePotentialDamage() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorPotentialDamageOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_UpdatePotentialDamage(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorPotentialDamageOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_UpdatePotentialDamage(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_OnSync___Job_UpdatePotentialDamage() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorPotentialDamageOnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_OnSync___Job_UpdatePotentialDamage(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorPotentialDamageOnActiveView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_OnSync___Job_UpdatePotentialDamage(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdatePotentialDamage() const
    {
        int local_6 = 0;
        bool local_34;
        int local_42 = 0;
        int local_68 = 0;
        int local_70 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        Has local_52;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            local_34 = false;
            bool local_35 = !(false);
            if (!(local_32.IsActive()) == local_35)
            {
                continue;
            }
            if (!(local_42))
            {
                continue;
            }
            FFPTime local_44 = FFPTime(local_42.GetCheckTime());
            if (local_44.opCmp(0.0) < 0 || (FFPTime(local_42.GetCheckTime()) == FPTIME_MAX))
            {
                continue;
            }
            if (!(local_52.opCall()) == !(false))
            {
                FString local_56 = "Timer job error: 'FC_LocalTag' included by job but not exist on ";
                FString local_60 = local_32.ToString();
                local_34 = true;
            }
            if (local_34)
            {
                continue;
            }
            this.Job_UpdatePotentialDamage(local_68, local_70, local_6);
            MarkModifiedIfDirty local_78;
            local_78.opCall(local_70);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    void Monitor___JobTimer_Pre___Job_RemoveEcologyPostureProtect(const FC_EcologyPostureProtect &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetRemoveTime());
        FName local_8 = FName("S_DamageSystem::Job_RemoveEcologyPostureProtect");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_RemoveEcologyPostureProtect(const FC_EcologyPostureProtect &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetRemoveTime());
        FName local_8 = FName("S_DamageSystem::Job_RemoveEcologyPostureProtect");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    void Monitor___JobTimer_OnSync___Job_RemoveEcologyPostureProtect(const FC_EcologyPostureProtect &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetRemoveTime());
        FName local_8 = FName("S_DamageSystem::Job_RemoveEcologyPostureProtect");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_RemoveEcologyPostureProtect() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyPostureProtectOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_RemoveEcologyPostureProtect(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorEcologyPostureProtectOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_RemoveEcologyPostureProtect(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_RemoveEcologyPostureProtect() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyPostureProtectOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_RemoveEcologyPostureProtect(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorEcologyPostureProtectOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_RemoveEcologyPostureProtect(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_OnSync___Job_RemoveEcologyPostureProtect() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyPostureProtectOnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_OnSync___Job_RemoveEcologyPostureProtect(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorEcologyPostureProtectOnActiveView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_OnSync___Job_RemoveEcologyPostureProtect(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_RemoveEcologyPostureProtect() const
    {
        int local_6 = 0;
        bool local_34;
        int local_42 = 0;
        int local_68 = 0;
        int local_70 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        Has local_52;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            local_34 = false;
            bool local_35 = !(false);
            if (!(local_32.IsActive()) == local_35)
            {
                continue;
            }
            if (!(local_42))
            {
                continue;
            }
            FFPTime local_44 = FFPTime(local_42.GetRemoveTime());
            if (local_44.opCmp(0.0) < 0 || (FFPTime(local_42.GetRemoveTime()) == FPTIME_MAX))
            {
                continue;
            }
            if (!(local_52.opCall()) == !(false))
            {
                FString local_56 = "Timer job error: 'FC_LocalTag' included by job but not exist on ";
                FString local_60 = local_32.ToString();
                local_34 = true;
            }
            if (local_34)
            {
                continue;
            }
            this.Job_RemoveEcologyPostureProtect(local_68, local_6, local_70);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_Job_CleanupExpiredComboHitRecords() const
    {
        int local_12 = 0;
        const FECSEntity& local_44;
        int local_46 = 0;
        MarkModifiedIfDirty local_54;
        int local_178 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(2.0))))
        {
            return;
        }
        int local_14 = 0;
        int local_13 = local_14;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_4.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                this.Job_CleanupExpiredComboHitRecords(local_44, local_46, local_12);
                local_54.opCall(local_46);
            }
            local_4.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Exclude(local_92).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_22 = local_4.GetViewCacheEpoch();
        int local_106 = 0;
        FECSRuntimeViewIterator local_140 = local_92.Iterator();
        for (; local_140.CanProceed;)
        {
            local_44 = local_140.Proceed();
            ++local_106;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_44.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_44);
            this.Job_CleanupExpiredComboHitRecords(local_178, local_46, local_12);
            local_54.opCall(local_46);
        }
        local_4.UpdateCachedEntityCount(local_106);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_22);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearDealDamageFrame() const
    {
        const FECSEntity& local_36;
        int local_156 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_ClearDealDamageFrame(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Exclude(local_74).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_84 = 0;
        FECSRuntimeViewIterator local_118 = local_74.Iterator();
        for (; local_118.CanProceed;)
        {
            local_36 = local_118.Proceed();
            ++local_84;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_ClearDealDamageFrame(local_156);
        }
        local_2.UpdateCachedEntityCount(local_84);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearTakeDamageToCalculateFrame() const
    {
        const FECSEntity& local_36;
        int local_156 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_ClearTakeDamageToCalculateFrame(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Exclude(local_74).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_84 = 0;
        FECSRuntimeViewIterator local_118 = local_74.Iterator();
        for (; local_118.CanProceed;)
        {
            local_36 = local_118.Proceed();
            ++local_84;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_ClearTakeDamageToCalculateFrame(local_156);
        }
        local_2.UpdateCachedEntityCount(local_84);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearDamageToCalculateFrame() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        this.Job_ClearDamageToCalculateFrame(local_12);
        return;
    }
    UFUNCTION()
    void Run_Job_ClearDamageToApplyFrame() const
    {
        const FECSEntity& local_36;
        int local_156 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_ClearDamageToApplyFrame(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Exclude(local_74).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_84 = 0;
        FECSRuntimeViewIterator local_118 = local_74.Iterator();
        for (; local_118.CanProceed;)
        {
            local_36 = local_118.Proceed();
            ++local_84;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_ClearDamageToApplyFrame(local_156);
        }
        local_2.UpdateCachedEntityCount(local_84);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearHitStateTypeFrame() const
    {
        const FECSEntity& local_36;
        int local_156 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_ClearHitStateTypeFrame(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Exclude(local_74).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_84 = 0;
        FECSRuntimeViewIterator local_118 = local_74.Iterator();
        for (; local_118.CanProceed;)
        {
            local_36 = local_118.Proceed();
            ++local_84;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_ClearHitStateTypeFrame(local_156);
        }
        local_2.UpdateCachedEntityCount(local_84);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearHitReactionCount() const
    {
        int local_36 = 0;
        MarkModifiedIfDirty local_44;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_ClearHitReactionCount(local_36);
                local_44.opCall(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_82 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_86;
        local_86.opCall();
        Include local_90;
        local_90.opCall();
        Exclude(local_82).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_96 = 0;
        FECSRuntimeViewIterator local_130 = local_82.Iterator();
        for (; local_130.CanProceed;)
        {
            const FECSEntity& local_166 = local_130.Proceed();
            ++local_96;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_166.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_166);
            this.Job_ClearHitReactionCount(local_36);
            local_44.opCall(local_36);
        }
        local_2.UpdateCachedEntityCount(local_96);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearHitStateFrame() const
    {
        const FECSEntity& local_36;
        int local_156 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_ClearHitStateFrame(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Exclude(local_74).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_84 = 0;
        FECSRuntimeViewIterator local_118 = local_74.Iterator();
        for (; local_118.CanProceed;)
        {
            local_36 = local_118.Proceed();
            ++local_84;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_ClearHitStateFrame(local_156);
        }
        local_2.UpdateCachedEntityCount(local_84);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearDamageNumFrame() const
    {
        const FECSEntity& local_36;
        int local_156 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_ClearDamageNumFrame(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Exclude(local_74).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_84 = 0;
        FECSRuntimeViewIterator local_118 = local_74.Iterator();
        for (; local_118.CanProceed;)
        {
            local_36 = local_118.Proceed();
            ++local_84;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_ClearDamageNumFrame(local_156);
        }
        local_2.UpdateCachedEntityCount(local_84);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DamageStatistic() const
    {
        ECS::GetContextJob();
        if (CVar_Damage_Statistic.GetBool() == false)
        {
            return;
        }
        TECSEventConstIterator<FCE_DamageEvent> local_38 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_38.CanProceed;)
        {
            const FCE_DamageEvent& local_60 = local_38.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DamageStatistic(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_SendDamageStatisticToClient() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_162 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        if (!(CVar_Damage_Statistic.GetBool()) == !(false))
        {
            return;
        }
        int local_6 = 0;
        int local_5 = local_6;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_SendDamageStatisticToClient(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Exclude(local_80).opCall();
        bool local_3 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_90 = 0;
        FECSRuntimeViewIterator local_124 = local_80.Iterator();
        for (; local_124.CanProceed;)
        {
            local_36 = local_124.Proceed();
            ++local_90;
            if (local_3)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_SendDamageStatisticToClient(local_162, local_38);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_3)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleServerToClientDamageStatistic() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ServerToClientDamageEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ServerToClientDamageEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleServerToClientDamageStatistic(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ClearNewDamageResolvedTag() const
    {
        ECS::GetContextJob();
        this.ClientJob_ClearNewDamageResolvedTag();
        return;
    }
}

