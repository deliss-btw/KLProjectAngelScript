

class UBTDecorator_TargetHasBuffInRange : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    FBuffConfigRef BuffConfig;
    UPROPERTY()
    float32 SearchDistance2D;
    UPROPERTY()
    FBlackboardKeySelector ResultEntityKey;
    UPROPERTY()
    bool bForceLockTarget;

    default SetNodeName("жЈЂжџҐиЊѓе›ґе†…з›®ж ‡жЇеђ¦жњ‰Buff");

    UBTDecorator_TargetHasBuffInRange()
    {
        this.SearchDistance2D = 5000.0f;
        this.bForceLockTarget = true;
        this.ResultEntityKey.SelectedKeyName = n"SpecialTargetEntityID";
        this.ResultEntityKey.AddEntityIdFilter(this, n"ResultEntityKey");
        this.ResultEntityKey.SetbNoneIsAllowedValue(true);
        return;
    }
    UFUNCTION()
    FString GetStaticDescription_Implementation() const
    {
        FString local_14 = (FString("жЈЂжµ‹Buff: ") + this.BuffConfig.GetBuffName());
        FString local_4 = (FString("\nжђњзґўиЊѓе›ґ: ") + this.SearchDistance2D);
        FString local_8 = (local_4 + " еЋз±і");
        local_14 += local_8;
        if (!(this.ResultEntityKey.SelectedKeyName.IsNone()))
        {
            FString local_8_2 = (FString("\nиѕ“е‡єBBй”®: ") + this.ResultEntityKey.SelectedKeyName);
            local_14 += local_8_2;
        }
        if (this.bForceLockTarget)
        {
            local_14 += "\n[е­ђж ‘жњџй—ґй”Ѓе®љз›®ж ‡]";
        }
        return local_14;
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        Get local_4;
        const FC_AITargetingV2& local_6 = local_4.opCall();
        if (local_6)
        {
            for (auto& local_26 : local_6.AllTargets)
            {
                FECSEntity local_30 = FECSEntity(local_26.GetEntity());
                if (!(local_30.IsValid()))
                {
                    continue;
                }
                Has local_38;
                bool local_7 = local_38.opCall();
                if (local_7)
                {
                    continue;
                }
                if (::FASCommonUtils::CalculateEntityDistance2D(Context.PawnEntity, local_30, true) > this.SearchDistance2D)
                {
                    continue;
                }
                if (FBuffUtils::HasBuff(local_30, this.BuffConfig))
                {
                    this.WriteResultEntity(Context, local_30.GetId());
                    return true;
                }
            }
        }
        this.WriteResultEntity(Context, ENTITY_ID_NULL);
        return false;
    }
    UFUNCTION()
    void OnNodeActivation_Implementation(const FAIBehaviorTreeSearchContext &inout SearchContext) const
    {
        if (!(this.bForceLockTarget))
        {
            return;
        }
        FECSEntityId local_2 = FECSEntityId(ENTITY_ID_NULL);
        if (!(this.ResultEntityKey.SelectedKeyName.IsNone()))
        {
            UBlackboardComponent local_6 = SearchContext.GetBlackboardComponent();
            if (local_6 != nullptr)
            {
                local_2 = local_6.GetValueAsEntityId(this.ResultEntityKey.SelectedKeyName);
            }
        }
        Modify local_12;
        FC_AITargeting& local_14 = local_12.opCall();
        if (local_14)
        {
            local_14.ForceLockEntity = local_14.BlackboardLockedTargetEntity.GetEntity();
            FECSEntity local_18 = FECSEntity(local_2);
            if (local_18.IsValid())
            {
                local_14.BlackboardLockedTargetEntity = FTargetEntity(local_18);
                ::FAIKnowledgeUtils::UpdateCombatKnowledgeAboutTarget(SearchContext.PawnEntity, local_18);
            }
        }
        return;
    }
    UFUNCTION()
    void OnNodeDeactivation_Implementation(const FAIBehaviorTreeSearchContext &inout SearchContext, const EBTNodeResult NodeResult) const
    {
        if (!(this.bForceLockTarget))
        {
            return;
        }
        Modify local_6;
        FC_AITargeting& local_8 = local_6.opCall();
        if (local_8)
        {
            FECSEntity local_12 = FECSEntity(local_8.ForceLockEntity);
            if (local_12.IsValid())
            {
                local_8.BlackboardLockedTargetEntity = FTargetEntity(local_12);
            }
            else
            {
                local_8.BlackboardLockedTargetEntity = ENTITY_NULL;
            }
            local_8.ForceLockEntity = ENTITY_NULL;
            FECSEntity local_30;
            if (local_8.BlackboardLockedTargetEntity.GetEntity().IsValid())
            {
                local_30 = local_8.BlackboardLockedTargetEntity.GetEntity();
            }
            else
            {
                local_30 = local_8.CurrentAttackTarget.GetEntity();
            }
            if (local_30.IsValid())
            {
                ::FAIKnowledgeUtils::UpdateCombatKnowledgeAboutTarget(SearchContext.PawnEntity, local_30);
            }
        }
        return;
    }
    void WriteResultEntity(const FAIBehaviorTreeContext &inout Context, const FECSEntityId &inout EntityId) const
    {
        if (!(this.ResultEntityKey.SelectedKeyName.IsNone()))
        {
            UBlackboardComponent local_4 = Context.GetBlackboardComponent();
            if (local_4 != nullptr)
            {
                local_4.SetValueAsEntityId(this.ResultEntityKey.SelectedKeyName, EntityId);
            }
        }
        return;
    }
}

