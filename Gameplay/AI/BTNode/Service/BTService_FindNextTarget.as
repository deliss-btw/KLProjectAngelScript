
enum ESelectRule
{
    HigherScore,
    WeightedRandom,
    FindGroupOtherTarget,
    ExcludeTargets,
}


// NOTE: class defaults are not authored in this module: FAICommand_FindNextTarget (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FAICommand_FindNextTargetData
{
    FAICommand_FindNextTargetData()
    {
        return;
    }
}

struct FAICommand_FindNextTarget : FAICommandScript
{
    FAICommandScript _base_FAICommandScript;

    FAICommand_FindNextTarget()
    {
        this.__InitDefaults();
        return;
    }
    const UScriptStruct GetInstanceDataType_Implementation() const
    {
        UScriptStruct local_2 = FAICommand_FindNextTargetData;
        return local_2;
    }
    FAICommand_FindNextTargetData GetInstanceData(const FAICommandParams &inout Params) const
    {
        FAICommand_FindNextTargetData __r;
        return __r;
    }
    void Execute_Implementation(const FAICommandParams &inout Params, const FFPTime &inout WorldTime) const
    {
        ::FLockTargetUtils::UpdateLockTarget(Params.GetPawnProxy(), ::FAITargetingUtils::GetCurrentAttackTarget(Params.GetPawnProxy()), -1, ELockTargetType(2), true, 0.0f);
        return;
    }
    void Finish_Implementation(const FAICommandParams &inout Params, const FFPTime &inout WorldTime) const
    {
        return;
    }
}

class UBTService_FindNextTarget : UBTService_AICommandScript
{
    UPROPERTY()
    FAICommand_FindNextTarget AICommand;
    UPROPERTY()
    float32 SearchDistance;
    UPROPERTY()
    bool UseAITargetingSystem;
    UPROPERTY()
    ESelectRule SelectRule;
    UPROPERTY()
    TArray<FAISmart_EntityId> ExcludeTargetList;
    UPROPERTY()
    float32 IdealDistance;
    UPROPERTY()
    FBlackboardKeySelector FoundNextTarget;

    UBTService_FindNextTarget()
    {
        this.SearchDistance = 5000.0f;
        this.UseAITargetingSystem = false;
        this.IdealDistance = 2000.0f;
        this.FoundNextTarget.SelectedKeyName = n"bFoundNextTarget";
        this.FoundNextTarget.AddBoolFilter(this, n"bFoundNextTarget");
        return;
    }
    UFUNCTION()
    void OnBecomeRelevant_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        int local_10 = 0;
        bool local_11;
        float local_218;
        FTargetEntity local_220;
        bool local_228;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        FECSEntity::Get<FC_Transform> local_8 = FECSEntity::Get<FC_Transform>(local_4);
        local_4.AddGameplayTag(GameplayTags::AI_LockTarget, NAME_None);
        FECSRuntimeQuery local_60 = FECSRuntimeQueryHelper::RuntimeQueryInSphere(Context.GetControllerEntity(), local_10.GetPosition(), this.SearchDistance, EECSQueryRegsitryType(3), false);
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Exclude(local_60).opCall();
        local_60.SortByDistance(local_10.GetPosition(), 99);
        TArray<FTargetSelectingStruct> local_118;
        TArray<FECSEntity> local_122;
        TArray<FECSEntity> local_126;
        FECSEntity local_130;
        FECSEntity local_134;
        Modify local_138;
        FC_AITargeting& local_140 = local_138.opCall();
        if (local_140)
        {
            UBlackboardComponent local_142 = Context.GetBlackboardComponent();
            if (this.UseAITargetingSystem)
            {
                TArray<FTargetSelectingStruct> local_148 = local_140.OrderedTargetList;
                if (!(local_148.IsEmpty()))
                {
                    local_134 = local_148[0].AITargetEntity.GetEntity();
                }
            }
            Has local_152;
            local_11 = local_152.opCall();
            if (local_11)
            {
                Get local_160;
                local_130 = ::FASCommonUtils::GetControlledPawnEntity(local_160.opCall().GetFromEntity());
            }
            else
            {
                if (this.UseAITargetingSystem)
                {
                    TArray<FTargetSelectingStruct> local_148 = local_140.OrderedTargetList;
                    if (local_148.Num() == 1)
                    {
                        local_130 = local_148[0].AITargetEntity.GetEntity();
                    }
                    else
                    {
                        FECSEntity local_170;
                        if (local_148.IsEmpty())
                        {
                            local_170 = FECSEntity();
                        }
                        else
                        {
                            local_170 = local_148[0].AITargetEntity.GetEntity();
                        }
                        TArray<FECSEntity> local_174;
                        int local_176 = local_148.Num() - 1;
                        for (; local_176 >= 0; --local_176)
                        {
                            FECSEntity local_180 = FECSEntity(local_148[local_176].AITargetEntity.GetEntity());
                            local_8 = FECSEntity::Get<FC_Transform>(local_180);
                            if (local_10.GetPosition().DistXY(local_8.opCall().GetPosition()) > this.SearchDistance)
                            {
                                local_148.RemoveAt(local_176);
                                continue;
                            }
                            Has local_188;
                            local_11 = local_188.opCall();
                            if (local_11)
                            {
                                local_174.Add(local_180);
                            }
                        }
                        int local_175 = local_148.Num();
                        if (local_175 == 0)
                        {
                            XWarning(ELog(0), FString().Append("No available member in distance now. Select the only target."));
                            local_130 = local_170;
                        }
                        else
                        {
                            if (local_174.Num() == 1)
                            {
                                local_130 = local_174[0];
                            }
                            else
                            {
                                if (!(local_174.IsEmpty()))
                                {
                                    int local_175_2 = local_148.Num();
                                    int local_161 = local_175_2 - 1;
                                    for (; local_161 >= 0; --local_161)
                                    {
                                        FECSEntity local_180_2 = FECSEntity(local_148[local_161].AITargetEntity.GetEntity());
                                        if (!(local_174.Contains(local_180_2)))
                                        {
                                            local_148.RemoveAt(local_161);
                                        }
                                    }
                                }
                                local_118 = local_148;
                                int local_113 = local_118.Num() - 1;
                                for (; local_113 >= 0; --local_113)
                                {
                                    FECSEntity local_180_3 = FECSEntity(local_118[local_113].AITargetEntity.GetEntity());
                                    if (local_140.SelectedMark.Contains(local_180_3.GetIdValue()))
                                    {
                                        local_118.RemoveAt(local_113);
                                    }
                                }
                                if (local_118.Num() == 0)
                                {
                                    local_140.SelectedMark.Empty(0);
                                    local_118 = local_148;
                                }
                                if (int(this.SelectRule) == 1)
                                {
                                    float local_184 = 0.0;
                                    for (auto& local_210 : local_118)
                                    {
                                        local_184 = local_184 + local_210.Score;
                                    }
                                    if (local_184 <= 0.0)
                                    {
                                        int local_175_3 = local_118.Num();
                                        local_176 = local_175_3 - 1;
                                        int local_175_4 = FMath::RandRange(0, local_176);
                                        local_130 = local_118[local_175_4].AITargetEntity.GetEntity();
                                    }
                                    else
                                    {
                                        float local_214 = FMath::RandRange(0.0, local_184);
                                        float local_216 = 0.0;
                                        int local_175_5 = 0;
                                        for (; local_175_5 < local_118.Num(); ++local_175_5)
                                        {
                                            if (local_118[local_175_5].Score > 0.0)
                                            {
                                                local_218 = local_118[local_175_5].Score;
                                            }
                                            else
                                            {
                                                local_218 = 0.0;
                                            }
                                            local_216 = local_216 + local_218;
                                            if (local_214 <= local_216)
                                            {
                                                local_130 = local_118[local_175_5].AITargetEntity.GetEntity();
                                                break;
                                            }
                                        }
                                    }
                                }
                                else
                                {
                                    if (int(this.SelectRule) == 0)
                                    {
                                        local_130 = local_118[0].AITargetEntity.GetEntity();
                                    }
                                    else
                                    {
                                        if (int(this.SelectRule) == 2)
                                        {
                                            Get local_224;
                                            const FC_AITargeting& local_226 = local_224.opCall();
                                            if (local_226)
                                            {
                                                local_220 = local_226.CurrentAttackTarget;
                                            }
                                            local_130 = local_220.GetEntity();
                                            float32 local_227 = 3.4028235e38f;
                                            local_228 = false;
                                            int local_175_6 = 0;
                                            for (; local_175_6 < local_118.Num(); ++local_175_6)
                                            {
                                                FECSEntity local_180_4 = FECSEntity(local_118[local_175_6].AITargetEntity.GetEntity());
                                                if ((FTargetEntity(local_118[local_175_6].AITargetEntity) == local_220))
                                                {
                                                    continue;
                                                }
                                                const FC_Transform& local_232 = local_8.opCall();
                                                if (local_232)
                                                {
                                                    float32 local_235 = FMath::Abs((float32(local_10.GetPosition().DistXY(local_232.GetPosition())) - this.IdealDistance));
                                                    if (local_235 < local_227)
                                                    {
                                                        local_227 = local_235;
                                                        local_130 = local_180_4;
                                                    }
                                                }
                                            }
                                        }
                                        else
                                        {
                                            if (int(this.SelectRule) == 3)
                                            {
                                                TArray<FECSEntity> local_240;
                                                for (auto& local_254 : this.ExcludeTargetList)
                                                {
                                                    FECSEntity local_18 = FECSEntity(local_254.GetValue(Context.opImplConv()));
                                                    if (!((local_18 == ENTITY_NULL)) && local_18.IsValid())
                                                    {
                                                        local_240.Add(local_18);
                                                    }
                                                }
                                                TArray<FTargetSelectingStruct> local_262;
                                                for (auto& local_210 : local_118)
                                                {
                                                    local_228 = false;
                                                    auto local_268 = local_240.Iterator();
                                                    for (; local_268.CanProceed;)
                                                    {
                                                        FECSEntity local_276 = local_268.Proceed();
                                                        if ((local_210.AITargetEntity.GetEntity() == local_276))
                                                        {
                                                            local_228 = true;
                                                            break;
                                                        }
                                                    }
                                                    if (!(local_228))
                                                    {
                                                        local_262.Add(local_210);
                                                    }
                                                }
                                                if (!(local_262.IsEmpty()))
                                                {
                                                    local_130 = local_262[0].AITargetEntity.GetEntity();
                                                }
                                                else
                                                {
                                                    if (!(local_118.IsEmpty()))
                                                    {
                                                        local_130 = local_118[0].AITargetEntity.GetEntity();
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                else
                {
                    FECSRuntimeQueryIterator local_298 = local_60.Iterator();
                    for (; local_298.CanProceed;)
                    {
                        FECSEntity local_276_2 = local_298.Proceed();
                        if (!((local_276_2 == local_4)))
                        {
                            local_126.Add(local_276_2);
                            if (!(local_140.SelectedMark.Contains(local_276_2.GetIdValue())))
                            {
                                local_122.Add(local_276_2);
                            }
                        }
                    }
                    if (local_122.Num() == 0)
                    {
                        local_140.SelectedMark.Empty(0);
                        local_122 = local_126;
                    }
                    local_130 = local_122[FMath::RandRange(0, (local_122.Num() - 1))];
                }
            }
            if (local_130.IsValid())
            {
                local_140.SelectedMark.Add(local_130.GetIdValue());
                local_220 = local_140.CurrentAttackTarget;
                local_140.CurrentAttackTarget = FTargetEntity(local_130);
                ::FAITargetingUtils::SendAIAttackTargetChangedEvent(local_4, local_220, local_140.CurrentAttackTarget);
                bool local_258 = this.UseAITargetingSystem && local_134.IsValid() && !((local_130 == local_134));
                if (this.UseAITargetingSystem && (int(this.SelectRule) == 3))
                {
                    bool local_321;
                    local_321 = false;
                    for (auto& local_254 : this.ExcludeTargetList)
                    {
                        FECSEntity local_156 = FECSEntity(local_254.GetValue(Context.opImplConv()));
                        if (!((local_156 == ENTITY_NULL)) && local_156.IsValid() && (local_130 == local_156))
                        {
                            local_321 = true;
                            break;
                        }
                    }
                    if (local_321)
                    {
                        local_258 = false;
                    }
                }
                local_142.SetValueAsBool(this.FoundNextTarget.SelectedKeyName, local_258);
            }
            else
            {
                local_142.SetValueAsBool(this.FoundNextTarget.SelectedKeyName, false);
            }
        }
        return;
    }
    UFUNCTION()
    void OnCeaseRelevant_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        Context.PawnEntity.RemoveGameplayTag(GameplayTags::AI_LockTarget, NAME_None);
        return;
    }
}

