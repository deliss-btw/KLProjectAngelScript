

class UHTNTask_EcosimAIV2_Plan_GetTeamMemberEntityContainsAnyGameplayTag : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector TeamMemberEntityID;
    UPROPERTY()
    FGameplayTag Tag;

    UHTNTask_EcosimAIV2_Plan_GetTeamMemberEntityContainsAnyGameplayTag()
    {
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        FECSEntity local_8 = this.GetOwnerEntity();
        TArray<FTargetEntity> local_12;
        if (::FEcosimAIV2Utils::GetOtherTeamMemberEntity(local_8, local_12))
        {
            for (auto& local_28 : local_12)
            {
                if (local_28.GetEntity().MatchGameplayTag(this.Tag))
                {
                    local_28.GetEntity().GetId();
                    this.SubmitPlanStep(1, "");
                }
            }
        }
        return;
    }
}

class UHTNTask_EcosimAIV2_Plan_EntityRelationWithTarget : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    bool bIsEntityIDVar;
    UPROPERTY()
    FBlackboardKeySelector EntityID;
    UPROPERTY()
    bool bIsTargetEntityIDVar;
    UPROPERTY()
    FBlackboardKeySelector TargetEntityID;
    UPROPERTY()
    EEcosimAIV2EntityRelation Relation;
    UPROPERTY()
    bool bGetCount;
    UPROPERTY()
    FBlackboardKeySelector Count;
    UPROPERTY()
    EEcosimAIV2HTNPlanOperator Operator;

    default SetNodeName("Plan_EntityRelationWithTarget");

    UHTNTask_EcosimAIV2_Plan_EntityRelationWithTarget()
    {
        this.bGetCount = false;
        this.Count.AddIntFilter(this, n"Count");
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        FECSEntity local_4 = FECSEntity(ENTITY_NULL);
        bool local_5 = this.bIsEntityIDVar;
        if (!(this.bIsEntityIDVar))
        {
            FECSEntity local_12;
            FBlackboardKeySelector local_7;
            HTNNode::GetWorldStateValueAsEntityId(Context, local_7);
            local_4 = local_12;
            if (!(local_4.IsValid()))
            {
                local_5 = true;
            }
        }
        FECSEntity local_16 = FECSEntity(ENTITY_NULL);
        bool local_17 = this.bIsTargetEntityIDVar;
        if (!(this.bIsTargetEntityIDVar))
        {
            FECSEntity local_12;
            FBlackboardKeySelector local_7;
            HTNNode::GetWorldStateValueAsEntityId(Context, local_7);
            local_16 = local_12;
            if (!(local_16.IsValid()))
            {
                local_17 = true;
            }
        }
        TArray<FEcosimAIV2RelationEntry> local_22;
        ::FEcosimAIV2Utils::QueryEntityRelations(local_4, local_5, local_16, local_17, this.Relation, EEcosimAIV2RelationType(0), local_22);
        if (this.bGetCount)
        {
            int local_26 = local_22.Num();
            if (local_26 > 0)
            {
                HTNNode::SetWorldStateValueAsInt(Context, this.Count, local_26);
                this.SubmitPlanStep(100, "");
            }
        }
        else
        {
            if (int(this.Operator) == 0)
            {
                int local_26_2 = 0;
                for (; local_26_2 < local_22.Num(); )
                {
                    local_22[local_26_2].Source.GetId();
                    local_22[local_26_2].Target.GetId();
                    this.SubmitPlanStep(100, "");
                    ++local_26_2;
                }
            }
            else
            {
                if (int(this.Operator) == 1)
                {
                    if (local_22.Num() == 0)
                    {
                        this.SubmitPlanStep(100, "");
                    }
                }
                else
                {
                    if (int(this.Operator) == 2)
                    {
                        if (local_22.Num() > 0)
                        {
                            local_22[0].Source.GetId();
                            local_22[0].Target.GetId();
                            this.SubmitPlanStep(100, "");
                        }
                    }
                }
            }
        }
        return;
    }
}

class UHTNTask_EcosimAIV2_Plan_GetPointEntityByTag : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_GameplayTag Tag;
    UPROPERTY()
    FBlackboardKeySelector EntityID;
    UPROPERTY()
    bool bGetRandomOne;
    UPROPERTY()
    bool bExcludeTargetPointEntity;
    UPROPERTY()
    FAISmart_EntityId TargetPointEntityID;

    default SetNodeName("Plan_GetPointEntityByTag");

    UHTNTask_EcosimAIV2_Plan_GetPointEntityByTag()
    {
        this.bGetRandomOne = false;
        this.bExcludeTargetPointEntity = false;
        this.EntityID.AddEntityIdFilter(this, n"EntityId");
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        FGameplayTag local_6 = this.Tag.GetValue(Context.opImplConv());
        if (!(local_6.IsValid()))
        {
            return;
        }
        FECSRuntimeView local_30 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_52;
        local_52.opCall();
        if (this.bGetRandomOne)
        {
            TArray<FECSEntity> local_56;
            FECSRuntimeViewIterator local_90 = local_30.Iterator();
            for (; local_90.CanProceed;)
            {
                const FECSEntity& local_126 = local_90.Proceed();
                if (local_126.MatchGameplayTag(local_6) && this.MatchCondition(Context, local_126))
                {
                    local_56.Add(local_126);
                }
            }
            if (local_56.Num() > 0)
            {
                FECSEntity local_134 = FECSEntity(local_56[FMath::RandRange(0, (local_56.Num() - 1))]);
                local_134.GetId();
                this.SubmitPlanStep(1, "");
            }
        }
        else
        {
            FECSRuntimeViewIterator local_124 = local_30.Iterator();
            for (; local_124.CanProceed;)
            {
                const FECSEntity& local_126_2 = local_124.Proceed();
                if (local_126_2.MatchGameplayTag(local_6) && this.MatchCondition(Context, local_126_2))
                {
                    local_126_2.GetId();
                    this.SubmitPlanStep(1, "");
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        this.FinishExecuteWithContext(Context, true);
        return;
    }
    bool MatchCondition(const FHTNContext &inout Context, const FECSEntity &inout Entity) const
    {
        if (this.bExcludeTargetPointEntity)
        {
            FECSEntity local_14 = FECSEntity(this.TargetPointEntityID.GetValue(Context.opImplConv()));
            if (local_14.IsValid())
            {
                if ((Entity == local_14))
                {
                    return false;
                }
            }
        }
        return true;
    }
}

class UHTNTask_EcosimAIV2_Plan_GetEntityTransform : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector EntityID;
    UPROPERTY()
    FBlackboardKeySelector Location;

    default SetNodeName("Plan_GetEntityTransform");

    UHTNTask_EcosimAIV2_Plan_GetEntityTransform()
    {
        this.EntityID.AddEntityIdFilter(this, n"EntityId");
        this.Location.AddVectorFilter(this, n"Location");
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        FECSEntity local_10 = FECSEntity(HTNNode::GetWorldStateValueAsEntityId(Context, this.EntityID));
        Get local_14;
        const FC_Transform& local_16 = local_14.opCall();
        if (local_16)
        {
            HTNNode::SetWorldStateValueAsVector(Context, this.Location, local_16.GetPosition());
            this.SubmitPlanStep(1, "");
        }
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

class UHTNTask_EcosimAIV2_Plan_GetEntityInteractTransform : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    TSoftClassPtr<UInteractionBehaviorBase> InteractBehaviorClass;
    UPROPERTY()
    FAISmart_EntityId EntityID;
    UPROPERTY()
    FBlackboardKeySelector Location;

    default SetNodeName("Plan_GetEntityInteractTransform");

    UHTNTask_EcosimAIV2_Plan_GetEntityInteractTransform()
    {
        this.Location.AddVectorFilter(this, n"Location");
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        FECSEntity local_12 = FECSEntity(this.EntityID.GetValue(Context.opImplConv()));
        Get local_16;
        const FC_Transform& local_18 = local_16.opCall();
        if (local_18)
        {
            HTNNode::SetWorldStateValueAsVector(Context, this.Location, local_18.GetPosition());
            this.SubmitPlanStep(1, "");
        }
        int local_21 = -1;
        if (!(this.InteractBehaviorClass.IsNull()))
        {
            FInteractionPointAndBehaviorIndex local_24;
            bool local_27 = ::FInteractUtils::GetInteractionPointAndBehaviorIndexByBehaviorClass(local_12, this.InteractBehaviorClass.Get(), local_24, true);
            if (local_27)
            {
                local_21 = local_24.GetPointIndex();
            }
        }
        if (local_21 >= 0)
        {
            FVector local_34;
            FQuat local_44;
            if (::FInteractUtils::GetInteractTargetLocationAndRotation(local_12, local_21, ECS::GetContextTime(), local_34, local_44, false))
            {
                HTNNode::SetWorldStateValueAsVector(Context, this.Location, local_34);
            }
        }
        return;
    }
}

class UHTNTask_EcosimAIV2_Plan_GetEntityCurrentAttackTarget : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId EntityID;
    UPROPERTY()
    FBlackboardKeySelector CurrentAttackTargetEntityID;

    default SetNodeName("Plan_GetEntityCurrentAttackTarget");

    UHTNTask_EcosimAIV2_Plan_GetEntityCurrentAttackTarget()
    {
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        FAISmartValueContext local_6 = Context.opImplConv();
        FECSEntity local_4 = ::FAITargetingUtils::GetCurrentAttackTarget(FECSEntity());
        if (local_4.IsValid())
        {
            local_4.GetId();
            this.SubmitPlanStep(1, "");
        }
        return;
    }
}

class UHTNTask_EcosimAIV2_Plan_GetEntityInteractIndex : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId SourceEntityID;
    UPROPERTY()
    FAISmart_EntityId TargetEntityID;
    UPROPERTY()
    TSoftClassPtr<UInteractionBehaviorBase> InteractBehaviorClass;
    UPROPERTY()
    FBlackboardKeySelector InteractPointIndex;
    UPROPERTY()
    FBlackboardKeySelector InteractBehaviorIndex;
    UPROPERTY()
    bool bCheckFreeIncludingPlan;
    UPROPERTY()
    bool bExcludeSourceEntityPlan;

    default SetNodeName("Plan_GetEntityInteractIndex");

    UHTNTask_EcosimAIV2_Plan_GetEntityInteractIndex()
    {
        this.bCheckFreeIncludingPlan = true;
        this.bExcludeSourceEntityPlan = true;
        this.InteractPointIndex.AddIntFilter(this, n"InteractPointIndex");
        this.InteractBehaviorIndex.AddIntFilter(this, n"InteractBehaviorIndex");
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        int local_60 = 0;
        FECSEntity local_12 = FECSEntity(this.TargetEntityID.GetValue(Context.opImplConv()));
        FECSEntity local_4 = FECSEntity(this.SourceEntityID.GetValue(Context.opImplConv()));
        if (!(this.InteractBehaviorClass.IsValid()))
        {
            return;
        }
        TArray<FInteractionPointAndBehaviorIndex> local_22;
        ::FInteractUtils::GetAllInteractionPointAndBehaviorIndexByBehaviorClass(local_12, this.InteractBehaviorClass.Get(), local_22, true);
        for (auto& local_40 : local_22)
        {
            if (this.bCheckFreeIncludingPlan)
            {
                FECSEntity local_16;
                if (this.bExcludeSourceEntityPlan)
                {
                    local_16 = local_4;
                }
                else
                {
                    local_16 = ENTITY_NULL;
                }
                int local_49 = ::FEcosimAIV2Utils::CountInteractSources(local_12, local_40.GetPointIndex(), local_40.GetBehaviorIndex(), EEcosimAIV2RelationType(2), local_16);
                UInteractionBehaviorBase local_54 = ::FInteractUtils::GetInteractionBehaviorFromEntity(local_12, local_40);
                if (local_54 == nullptr)
                {
                    continue;
                }
                if (local_60)
                {
                    if ((::FInteractUtils::GetInteractingEntitiesAtPointWithBehavior(local_12, local_40.GetPointIndex(), local_40.GetBehaviorIndex()).Num() + local_49) >= int(local_54.MaxInteractSourceCount))
                    {
                        continue;
                    }
                }
            }
            HTNNode::SetWorldStateValueAsInt(Context, this.InteractPointIndex, local_40.GetPointIndex());
            HTNNode::SetWorldStateValueAsInt(Context, this.InteractBehaviorIndex, local_40.GetBehaviorIndex());
            this.SubmitPlanStep(1, "");
        }
        return;
    }
}

class UHTNTask_EcosimAIV2_Plan_EntityInteractingWithTarget : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId SourceEntityID;
    UPROPERTY()
    FAISmart_EntityId TargetEntityID;
    UPROPERTY()
    TSoftClassPtr<UInteractionBehaviorBase> InteractBehaviorClass;
    UPROPERTY()
    bool bAppendPromptToBB;
    UPROPERTY()
    FBlackboardKeySelector AppendToPrompt;

    default SetNodeName("Plan_EntityInteractingWithTarget");

    UHTNTask_EcosimAIV2_Plan_EntityInteractingWithTarget()
    {
        this.bAppendPromptToBB = false;
        this.AppendToPrompt.AddNameFilter(this, n"AppendToPrompt");
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        FECSEntity local_4 = FECSEntity(this.SourceEntityID.GetValue(Context.opImplConv()));
        FECSEntity local_16 = FECSEntity(this.TargetEntityID.GetValue(Context.opImplConv()));
        Get local_20;
        const FC_InteractionInfoForESM& local_22 = local_20.opCall();
        if (local_22)
        {
            if (this.InteractBehaviorClass.IsValid() && ((FECSEntity(local_22.GetTargetEntity()) == local_16)))
            {
                TArray<FInteractionPointAndBehaviorIndex> local_28;
                ::FInteractUtils::GetAllInteractionPointAndBehaviorIndexByBehaviorClass(local_22.GetTargetEntity(), this.InteractBehaviorClass.Get(), local_28, false);
                for (auto& local_44 : local_28)
                {
                    if (local_44.GetPointIndex() == local_22.GetTargetPointAndBehaviorIndex().GetPointIndex() && (local_44.GetBehaviorIndex() == local_22.GetTargetPointAndBehaviorIndex().GetBehaviorIndex()))
                    {
                        this.SubmitPlanStep(100, "");
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        FECSEntity local_4 = FECSEntity(this.SourceEntityID.GetValue(Context.opImplConv()));
        FECSEntity local_12 = FECSEntity(this.TargetEntityID.GetValue(Context.opImplConv()));
        FString local_24 = ::FEcosimAIV2Utils::GetEntityShowName(local_4);
        FString local_20 = ::FEcosimAIV2Utils::GetEntityShowName(local_12);
        FString local_32 = FString().Append(local_24).Append(" еќђењЁ ").Append(local_20).Append(" дёЉ\n");
        ::FEcosimAIV2Utils::AppendContentToBB(Context, local_32, this.AppendToPrompt);
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

class UHTNTask_EcosimAIV2_Plan_GetEntityInteractingTarget : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId SourceEntityID;
    UPROPERTY()
    TSoftClassPtr<UInteractionBehaviorBase> InteractBehaviorClass;
    UPROPERTY()
    FBlackboardKeySelector InteractingTargetEntityID;

    default SetNodeName("Plan_GetEntityInteractingTarget");

    UHTNTask_EcosimAIV2_Plan_GetEntityInteractingTarget()
    {
        this.InteractingTargetEntityID.AddEntityIdFilter(this, n"InteractingTargetEntityID");
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        FAISmartValueContext local_6 = Context.opImplConv();
        FECSEntity local_12;
        FECSEntity local_4 = local_12;
        Get local_16;
        const FC_InteractionInfoForESM& local_18 = local_16.opCall();
        if (local_18)
        {
            FECSEntity local_24 = FECSEntity(local_18.GetTargetEntity());
            if (this.InteractBehaviorClass.IsValid() && local_24.IsValid())
            {
                TArray<FInteractionPointAndBehaviorIndex> local_30;
                ::FInteractUtils::GetAllInteractionPointAndBehaviorIndexByBehaviorClass(local_24, this.InteractBehaviorClass.Get(), local_30, false);
                for (auto& local_46 : local_30)
                {
                    if (local_46.GetPointIndex() == local_18.GetTargetPointAndBehaviorIndex().GetPointIndex() && (local_46.GetBehaviorIndex() == local_18.GetTargetPointAndBehaviorIndex().GetBehaviorIndex()))
                    {
                        local_24.GetId();
                        this.SubmitPlanStep(1, "");
                    }
                }
            }
        }
        return;
    }
}

