
namespace FAbnormalStateUtils
{
enum EAbnormalHitStatePriority
{
    None,
    OtherHitState,
    ElectrifiedWeakness,
    FreezeWeakness,
}

    const FConsoleVariable CVar_Abnormal_EnableUnfinishedFeature = FConsoleVariable();

struct FAccumulateAbnormalParams
{
    UPROPERTY()
    EAbnormalState AbnormalState;
    UPROPERTY()
    bool bIsAbnormalEnhanced;
    UPROPERTY()
    float32 AbnormalValue;
    UPROPERTY()
    float32 ExternalAbnormalStateCoefficient = 1.0f;
    UPROPERTY()
    FFPTime Time;
    UPROPERTY()
    FECSEntity SourceEntity;


}

EAbnormalState GetTargetAbnormalWeakness(const FECSEntity &inout Entity)
{
    EAbnormalState local_2 = EAbnormalState(0);
    EAbnormalState local_1 = local_2;
    Get local_6;
    const FC_MonsterInfo& local_8 = local_6.opCall();
    if (local_8)
    {
        if (local_8.GetMonsterConfig())
        {
            local_1 = local_2;
        }
    }
    return local_1;
}
FAbnormalStateUtils::EAbnormalHitStatePriority GetTargetCurrentAbnormalPriority(const FECSEntity &inout Entity, const EAbnormalState WeaknessAbnormal)
{
    FAbnormalStateUtils::EAbnormalHitStatePriority __return;
    FAbnormalStateUtils::EAbnormalHitStatePriority local_1 = FAbnormalStateUtils::EAbnormalHitStatePriority(0);
    Get local_6;
    const FC_AbnormalState& local_8 = local_6.opCall();
    if (local_8)
    {
        for (auto& local_24 : local_8.GetAbnormalStates())
        {
            if (local_24.IsActiving())
            {
                FAbnormalStateUtils::EAbnormalHitStatePriority local_2 = FAbnormalStateUtils::GetSpecificAbnormalPriority(__return, local_24.GetAbnormalStateType());
                if ((int(local_2)) > (int(local_1)))
                {
                    local_1 = local_2;
                }
            }
        }
    }
    return local_1;
}
FAbnormalStateUtils::EAbnormalHitStatePriority GetSpecificAbnormalPriority(const FECSEntity &inout Entity, const EAbnormalState Abnormal, const EAbnormalState WeaknessAbnormal)
{
    int local_6 = 0;
    if (!(local_6))
    {
        return FAbnormalStateUtils::EAbnormalHitStatePriority(0);
    }
    int local_9 = 0;
    if (int(Abnormal) != 0)
    {
        bool local_13;
        bool local_7 = (int(Abnormal) == int(WeaknessAbnormal));
        local_13 = false;
        if (local_7)
        {
            local_13 = local_6.WeaknessAbnormalStateHitState.Contains(Abnormal);
        }
        else
        {
            local_13 = local_6.AbnormalStateHitState.Contains(Abnormal);
        }
        if (local_13)
        {
            if (int(Abnormal) == 6)
            {
                local_9 = 3;
            }
            else
            {
                if (int(Abnormal) == 7)
                {
                    local_9 = 2;
                }
                else
                {
                    local_9 = 1;
                }
            }
        }
    }
    return FAbnormalStateUtils::EAbnormalHitStatePriority(local_9);
}
bool GetAbnormalHitReactionStateName(const FECSEntity &inout Entity, const EAbnormalState AbnormalState, const bool bWeakness, FName &inout OutHitStateName)
{
    Get local_4;
    const FC_HitReactionConfig& local_6 = local_4.opCall();
    if (local_6)
    {
        Get local_12;
        const FC_HitReaction& local_14 = local_12.opCall();
        if (local_14)
        {
            if (FDamageUtils::GetHitStateInterruptBehaviour(Entity, local_14, EHitReactionState(13), EAbnormalState(AbnormalState)).CanInterrupt())
            {
                FName local_22;
                if (bWeakness && FAbnormalStateUtils::CVar_Abnormal_EnableUnfinishedFeature.GetBool())
                {
                    if (local_6.WeaknessAbnormalStateHitState.Find(AbnormalState, local_22))
                    {
                        OutHitStateName = local_22;
                        return true;
                    }
                }
                else
                {
                    if (local_6.AbnormalStateHitState.Find(AbnormalState, local_22))
                    {
                        OutHitStateName = local_22;
                        return true;
                    }
                }
            }
        }
    }
    return false;
}
FBuffConfigRef GetAbnormalBuffByActiveState(const FECSEntity &inout AbnormalEntity, const FAbnormalStateConfig &inout AbnormalStateConfig, const EAbnormalActiveState ActiveState, const bool bWeakness, FBuffConfigRef &inout OutWeaknessBuff)
{
    switch (int(ActiveState))
    {
    case 0:
    {
        return AbnormalStateConfig.AccumulatingBuffConfig;
    }
    case 1:
    {
        if (bWeakness)
        {
            OutWeaknessBuff = AbnormalStateConfig.MonsterWeaknessBuffConfig;
        }
        bool local_4 = FASCommonUtils::IsMonsterPrefab(AbnormalEntity);
        FBuffConfigRef local_28;
        if (local_4)
        {
            local_28 = AbnormalStateConfig.MonsterStateBuffConfig;
        }
        else
        {
            local_28 = AbnormalStateConfig.AbnormalStateBuffConfig;
        }
        return local_28;
    }
    case 2:
    {
        if (bWeakness)
        {
            OutWeaknessBuff = AbnormalStateConfig.MonsterEnhancedConfig.WeaknessBuffConfig;
        }
        return AbnormalStateConfig.MonsterEnhancedConfig.BuffConfig;
    }
    }
    return local_28;
}
void AccumulateAbnormalValue(const FECSEntity &inout Entity, const FAbnormalStateUtils::FAccumulateAbnormalParams &inout Params, const UAbnormalDataAsset AbnormalData, FName &out OutHitStateName)
{
    FName local_2;
    int local_20 = 0;
    EAbnormalState local_454;
    OutHitStateName = local_2;
    Has local_6;
    bool local_7 = local_6.opCall();
    if (local_7)
    {
        local_7 = true;
    }
    else
    {
        Has local_12;
        local_7 = local_12.opCall();
    }
    if (local_7)
    {
        return;
    }
    if (!(local_20))
    {
        local_7 = false;
    }
    else
    {
        Has local_24;
        local_7 = local_24.opCall();
    }
    local_7 = local_7 && !(Entity.MatchGameplayTag(GameplayTags::CombatState_Immune));
    if (local_7)
    {
        float32 local_457;
        float32 local_446;
        float32 local_445;
        bool local_444;
        bool local_443;
        bool local_41;
        if (int(Params.AbnormalState) == 0)
        {
            return;
        }
        FECSEntity local_32 = Params.SourceEntity;
        FECSEntity local_40 = FASCommonUtils::GetUniquePlayerEntity(Entity);
        local_41 = false;
        FAbnormalStateConfig local_442;
        if (AbnormalData.AbnormalStateGlobalConfig.Find(Params.AbnormalState, local_442))
        {
            bool local_7_2 = local_442.AccumulationAttribute.IsValid() && local_442.AccumulationAttributeMax.IsValid() && local_442.StateTag.IsValid();
            local_41 = local_7_2 && (local_20.HasAttribute(local_442.AccumulationAttribute) && local_20.HasAttribute(local_442.AccumulationAttributeMax));
        }
        if (!(local_41))
        {
            return;
        }
        local_443 = Params.bIsAbnormalEnhanced && FASCommonUtils::IsMonsterPrefab(Entity);
        local_445 = 1.0f;
        Get local_450;
        const FC_CheatComponent& local_452 = local_450.opCall();
        if (local_452)
        {
            local_445 = local_452.GetAbnormalStateRatio();
        }
        int local_26 = int(Params.AbnormalState);
        local_444 = (int(FAbnormalStateUtils::GetTargetAbnormalWeakness(Entity)) == local_26);
        if ((local_442.StateTag.IsValid() && Entity.MatchGameplayTag(local_442.StateTag)))
        {
            if ((local_443 && local_442.MonsterEnhancedConfig.StateTag.IsValid() && !(Entity.MatchGameplayTag(local_442.MonsterEnhancedConfig.StateTag))))
            {
                if (AbnormalData.ExclusiveOverrideConfig.Find(Params.AbnormalState, local_454))
                {
                    FAbnormalStateUtils::RemoveSingleAbnormal(local_40, EAbnormalState(local_454), Params.Time, AbnormalData);
                }
                FAbnormalStateUtils::OnTriggerAbnormalState(Entity, local_40, local_442, Params, local_443, local_444);
                FName local_456;
                if (FAbnormalStateUtils::GetAbnormalHitReactionStateName(Entity, Params.AbnormalState, local_444, local_456))
                {
                    OutHitStateName = local_456;
                }
            }
            return;
        }
        bool local_7_5 = local_442.MonsterEnhancedConfig.StateTag.IsValid() && Entity.MatchGameplayTag(local_442.MonsterEnhancedConfig.StateTag);
        if (local_7_5)
        {
            return;
        }
        local_457 = Params.AbnormalValue;
        local_457 = local_457 * local_445;
        local_457 = local_457 * Params.ExternalAbnormalStateCoefficient;
        local_446 = local_20.GetAttributeValue(local_442.AccumulationAttribute, Params.Time);
        float32 local_458 = local_20.GetAttributeValue(local_442.AccumulationAttributeMax, Params.Time);
        if (local_457 > 0.0f)
        {
            FGameAttributeUtils::Consume(Entity, local_442.AccumulationAttribute, Params.Time, local_457);
            local_446 = local_20.GetAttributeValue(local_442.AccumulationAttribute, Params.Time);
        }
        if (local_446 <= 0.0f)
        {
            FCE_AbnormalStateEvent local_496;
            bool local_460;
            local_460 = false;
            Get local_464;
            const FC_MonsterInfo& local_466 = local_464.opCall();
            if (local_466)
            {
                if ((local_466.GetMonsterConfig() && (local_26 > 0)))
                {
                    local_460 = local_7_5;
                }
            }
            if (local_460)
            {
                FBuffConfigRef local_490;
                if (AbnormalData.ResistanceBuffConfig.Find(Params.AbnormalState, local_490))
                {
                    FBuffUtils::AddBuff(Entity, local_490, Params.Time, local_32, false, -1.0f, 1, false);
                }
            }
            local_458 = local_20.GetAttributeValue(local_442.AccumulationAttributeMax, Params.Time);
            FGameAttributeUtils::Recover(Entity, local_442.AccumulationAttribute, Params.Time, local_458, -1.0f);
            if (AbnormalData.ExclusiveOverrideConfig.Find(Params.AbnormalState, local_454))
            {
                FAbnormalStateUtils::RemoveSingleAbnormal(local_40, EAbnormalState(local_454), Params.Time, AbnormalData);
            }
            FAbnormalStateUtils::OnTriggerAbnormalState(Entity, local_40, local_442, Params, local_443, local_444);
            local_496.AbnormalState = EAbnormalState(Params.AbnormalState);
            local_496.Receiver = Entity;
            local_496.Caster = local_32;
            FName local_456;
            if (FAbnormalStateUtils::GetAbnormalHitReactionStateName(Entity, EAbnormalState(Params.AbnormalState), local_444, local_456))
            {
                OutHitStateName = local_456;
            }
        }
        else
        {
            float32 local_459 = local_458 * (1.0f - local_442.AccumulatingBuffThreshold);
            if (local_446 <= local_459)
            {
                FAbnormalStateUtils::OnTriggerAbnormalAccumulating(Entity, local_40, local_442, Params);
            }
        }
    }
    return;
}
void OnTriggerAbnormalState(const FECSEntity &inout AbnormalEntity, const FECSEntity &inout ComponentEntity, const FAbnormalStateConfig &inout AbnormalStateConfig, const FAbnormalStateUtils::FAccumulateAbnormalParams &inout Params, const bool bIsValidEnhancedAbnormalDamage, const bool bWeakness)
{
    int local_2;
    int local_6 = 0;
    if (bIsValidEnhancedAbnormalDamage)
    {
        local_2 = EAbnormalActiveState(2);
    }
    else
    {
        local_2 = EAbnormalActiveState(1);
    }
    int local_11 = 0;
    for (; local_11 < local_6.GetAbnormalStates().Num(); ++local_11)
    {
        const FAbnormalState& local_16 = local_6.GetAbnormalStates()[local_11];
        if (int(local_16.GetAbnormalStateType()) == int(Params.AbnormalState))
        {
            if (int(local_16.GetActiveState()) != local_2)
            {
                TArray<FECSEntity> local_24;
                FASCommonUtils::GetEntityAllPlayerPawnEntities(ComponentEntity, local_24);
                for (auto& local_38 : local_24)
                {
                    local_16.RemoveBuffFromPawn(local_38, Params.Time);
                }
                local_6.GetModify_AbnormalStates().RemoveAt(local_11);
                break;
            }
            return;
        }
    }
    FBuffConfigRef local_86;
    FBuffConfigRef local_62 = FAbnormalStateUtils::GetAbnormalBuffByActiveState(AbnormalEntity, AbnormalStateConfig, EAbnormalActiveState(local_2), bWeakness, local_86);
    bool local_14 = !(local_62.IsValid());
    if (local_14)
    {
        XError(ELog(42), FString().Append("OnTriggerAbnormalState invalid AbnormalStateBuffConfig"));
        return;
    }
    FAbnormalState local_172;
    local_172.SetAbnormalStateType(EAbnormalState(Params.AbnormalState));
    local_172.SetActiveState(EAbnormalActiveState(local_2));
    local_172.SetAttacker(Params.SourceEntity);
    local_172.SetBuffConfig(local_62);
    local_172.SetWeaknessBuffConfig(local_86);
    TDataObjectPtr<FBuffConfig> local_198;
    float32 local_173 = local_198.opArrow().BuffDuration;
    if (local_173 > 0.0f)
    {
        FFPTime local_202 = Params.Time;
        local_172.SetEndTime((local_202 + FFPTime(local_173)));
    }
    local_6.GetModify_AbnormalStates().Add(local_172);
    FAbnormalStateUtils::ShowAbnormalHintMsg(Params.SourceEntity, AbnormalEntity, AbnormalStateConfig, EAbnormalActiveState(local_2));
    TArray<FECSEntity> local_24;
    FASCommonUtils::GetEntityAllPlayerPawnEntities(ComponentEntity, local_24);
    for (auto& local_38 : local_24)
    {
        bool local_14_2 = local_172.AddBuffToPawn(local_38, Params.Time);
        if (local_14_2)
        {
            CommissionStatsUtils::AddAbnormalBuffAdded(Params.SourceEntity, local_62, local_38);
        }
    }
    return;
}
void RemoveSingleAbnormal(const FECSEntity &inout ComponentEntity, const EAbnormalState State, const FFPTime &inout Time, const UAbnormalDataAsset AbnormalData)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
void OnTriggerAbnormalAccumulating(const FECSEntity &inout AbnormalEntity, const FECSEntity &inout ComponentEntity, const FAbnormalStateConfig &inout AbnormalStateConfig, const FAbnormalStateUtils::FAccumulateAbnormalParams &inout Params)
{
    int local_4 = 0;
    int local_1 = EAbnormalActiveState(0);
    int local_9 = 0;
    for (; local_9 < local_4.GetAbnormalStates().Num(); ++local_9)
    {
        if (int(local_4.GetAbnormalStates()[local_9].GetActiveState()) == local_1 && (int(local_4.GetAbnormalStates()[local_9].GetAbnormalStateType()) == int(Params.AbnormalState)))
        {
            return;
        }
    }
    FBuffConfigRef local_40 = AbnormalStateConfig.AccumulatingBuffConfig;
    if (!(local_40.IsValid()))
    {
        XError(ELog(42), FString().Append("OnTriggerAbnormalAccumulating invalid AccumulatingBuffConfig"));
        return;
    }
    FAbnormalState local_102;
    local_102.SetAbnormalStateType(EAbnormalState(Params.AbnormalState));
    local_102.SetActiveState(EAbnormalActiveState(local_1));
    local_102.SetAttacker(Params.SourceEntity);
    local_102.SetBuffConfig(local_40);
    TDataObjectPtr<FBuffConfig> local_128;
    float32 local_103 = local_128.opArrow().BuffDuration;
    if (local_103 > 0.0f)
    {
        FFPTime local_132 = Params.Time;
        local_102.SetEndTime((local_132 + FFPTime(local_103)));
    }
    local_4.GetModify_AbnormalStates().Add(local_102);
    FAbnormalStateUtils::ShowAbnormalHintMsg(Params.SourceEntity, AbnormalEntity, AbnormalStateConfig, EAbnormalActiveState(local_1));
    TArray<FECSEntity> local_142;
    FASCommonUtils::GetEntityAllPlayerPawnEntities(ComponentEntity, local_142);
    for (auto& local_156 : local_142)
    {
        local_102.AddBuffToPawn(local_156, Params.Time);
    }
    return;
}
void PlayAbnormalFX(const FECSEntity &inout Entity, const FAbnormalFXConfig &inout AbnormalFXConfig, const FFPTime &inout Time, FAbnormalFX &inout OutAbnormalFX)
{
    int local_1 = 0;
    while (local_1 < 0)
    {
        FAbnormalFXConfigData local_22;
        if (local_22.bOverrideMaterial)
        {
            FMaterialUtils::LocalOnlyRequestChangeMaterialParam(Entity, local_22.OverrideMaterialRequestName, local_22.OverrideMaterialParam);
            OutAbnormalFX.OverrideMaterialParams.Add(local_22.OverrideMaterialRequestName);
        }
        TSubclassOf<AFXActor> local_42;
        local_42 = local_22.FX;
        if ((!((local_42 == nullptr))))
        {
            FFXConfig local_158;
            local_158.SetAsset(System::GetSoftClassPath(local_22.FX));
            local_158.SetbDetach(!(local_22.bFXAttached));
            FAttachRefName local_170 = local_158.GetAttachRefName();
            local_170.Name = local_22.FXAttachSocket;
            local_158.SetAttachRefName(local_170);
            local_158.SetOverrideParams(local_22.OverrideFXParam);
            if (!(local_22.bFXAttached))
            {
                local_158.SetbUseWorldOriginAsBaseTransformSource(true);
                local_158.SetLocationOffsetSpace(EFXOffsetSpace(2));
                local_158.SetRotationOffsetSpace(EFXOffsetSpace(2));
            }
            if (local_22.bInstanceFX)
            {
                ECSFX::PlayFXInstant(Entity, local_158, Time, 1.0f, false, false);
            }
            else
            {
                OutAbnormalFX.FXEntity.Add(ECSFX::PlayFXDurationalEx(Entity, local_158, Time, 1.0f, false, FECSEntity(), EAttachFXStopMethod(0), false));
            }
        }
        ++local_1;
    }
    return;
}
void StopAbnormalFX(const FECSEntity &inout Entity, const FAbnormalFX &inout AbnormalFX)
{
    for (auto& local_16 : AbnormalFX.FXEntity)
    {
        if (local_16.IsValid())
        {
            ECSFX::StopFX(local_16, false, false, 0.0f);
        }
    }
    for (auto& local_32 : AbnormalFX.OverrideMaterialParams)
    {
        FMaterialUtils::LocalOnlyRemoveChangeMaterialRequest(Entity, local_32, 2.0f, FSoftObjectPath());
    }
    return;
}
void DisposeAbnormalPresentation(const FECSEntity &inout ComponentEntity, const FC_AbnormalState &inout AbnormalStateComponent, const UAbnormalDataAsset AbnormalData, const FFPTime &inout Time)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
FAbnormalFXConfig GetAbnormalFXConfig(const FECSEntity &inout Entity, const TMap<EAbnormalFXPrefabType, FAbnormalFXConfig> &inout AbnormalFXConfig, const TMap<FGameplayTag, FAbnormalFXConfig> &inout SpecialAbnormalFXConfig)
{
    const AActor local_30;
    AGameCharacterActor local_34;
    FAbnormalFXConfig local_4;
    FAbnormalFXConfig __r;
    bool local_5 = false;
    for (auto& local_24 : SpecialAbnormalFXConfig)
    {
        if (Entity.MatchGameplayTag(local_24.GetKey()))
        {
            local_5 = true;
            break;
        }
    }
    if (!(local_5))
    {
        bool local_27;
        EAbnormalFXPrefabType local_25;
        local_25 = EAbnormalFXPrefabType(0);
        local_27 = false;
        local_30 = Entity.GetActor();
        if (local_30 != nullptr)
        {
            local_34 = (Cast<AGameCharacterActor>(local_30));
            if (local_34 != nullptr)
            {
                if (local_34.bOverrideAbnormalFXPrefabType)
                {
                    local_25 = local_34.AbnormalFXPrefabType;
                    local_27 = true;
                }
            }
        }
        if (!(local_27))
        {
            if (FASCommonUtils::IsAvatarPrefab(Entity))
            {
                local_25 = EAbnormalFXPrefabType(0);
            }
            else
            {
                if ((int(FASCommonUtils::GetMonsterRank(Entity))) == 1)
                {
                    local_25 = EAbnormalFXPrefabType(3);
                }
                else
                {
                    if (FASCommonUtils::IsBossPrefab(Entity))
                    {
                        local_25 = EAbnormalFXPrefabType(2);
                    }
                    else
                    {
                        if (FASCommonUtils::IsMonsterPrefab(Entity))
                        {
                            local_25 = EAbnormalFXPrefabType(1);
                        }
                    }
                }
            }
        }
        AbnormalFXConfig.Find(local_25, local_4);
    }
    return __r;
}
void ShowAbnormalHintMsg(const FECSEntity &inout Attacker, const FECSEntity &inout BeHitEntity, const FAbnormalStateConfig &inout AbnormalConfig, const EAbnormalActiveState ActiveState)
{
    float32 local_2 = 0.0f;
    Make local_90;
    if (FASCommonUtils::IsBossPrefab(BeHitEntity))
    {
        TDataObjectPtr<FMessageHintConfig> local_26;
        switch (int(ActiveState))
        {
        case 0:
        {
            local_26 = AbnormalConfig.AbnormalAccumulationMessageHintConfig;
            local_2 = AbnormalConfig.AbnormalAccumulationHintRange;
            break;
        }
        case 1:
        {
            local_26 = AbnormalConfig.AbnormalMessageHintConfig;
            local_2 = AbnormalConfig.AbnormalHintRange;
            break;
        }
        case 2:
        {
            local_26 = AbnormalConfig.MonsterEnhancedConfig.MessageHintConfig;
            local_2 = AbnormalConfig.MonsterEnhancedConfig.HintRange;
            break;
        }
        default:
        {
            local_26 = AbnormalConfig.AbnormalMessageHintConfig;
            local_2 = AbnormalConfig.AbnormalHintRange;
        }
        }
        GetDefaulted local_58;
        TArray<FECSEntity> local_62 = BlueprintFunctions_Common::GetAllPlayerEntitiesInRangeAS(local_58.opCall().GetPosition(), local_2, false);
        for (auto& local_80 : local_62)
        {
            TArray<FTextArgument> local_84;
            if (int(ActiveState) == 0)
            {
                local_84.Add(local_90.opImplConv());
            }
            else
            {
                local_84.Add(local_90.opImplConv());
                local_84.Add(local_90.opImplConv());
            }
            MessageHintUtils::ShowMessageHint(local_80, local_26, local_84);
        }
    }
    return;
}
}
