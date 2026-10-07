
enum EEcosimAIV2HTNCompareType
{
    LessThan,
    LessThanOrEqual,
    GreaterThan,
    GreaterThanOrEqual,
}


class UHTNDecorator_EcosimAIV2_HasTeam : UHTNDecorator_ECSScriptBase
{
    UHTNDecorator_EcosimAIV2_HasTeam()
    {
        return;
    }
    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        Has local_8;
        return local_8.opCall();
    }
}

class UHTNDecorator_EcosimAIV2_PlayerBlockingTheWay : UHTNDecorator_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector OutBlockingTheWayEntityID;
    UPROPERTY()
    float32 CheckBlockingDistance = 200.0f;
    UPROPERTY()
    float32 CheckBlockingAngleOffset = 30.0f;


    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        int local_38 = 0;
        int local_40 = 0;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        TArray<FTargetEntity> local_8;
        if (::FEcosimAIV2Utils::GetEntityEngagingTargetList(local_4, local_8))
        {
            for (auto& local_24 : local_8)
            {
                FECSEntity local_28 = local_24.GetEntity();
                Has local_32;
                bool local_9 = local_32.opCall();
                if (local_9)
                {
                    FECSEntity local_28_2 = local_24.GetEntity();
                    float32 local_75 = float32((FMath::RadiansToDegrees(local_40.GetRotation().AngularDistance((FVector(local_38.GetPosition()) - local_40.GetPosition()).VectorPlaneProject(FVector::UpVector).ToOrientationQuat()))));
                    float local_72 = local_38.GetPosition().DistSquared2D(local_40.GetPosition());
                    if ((local_72 < (this.CheckBlockingDistance * this.CheckBlockingDistance) && (local_75 < this.CheckBlockingAngleOffset)))
                    {
                        local_24.GetEntity().GetId();
                        return true;
                    }
                }
            }
        }
        return false;
    }
}

class UHTNDecorator_EcosimAIV2_EntityRelationWithTarget : UHTNDecorator_ECSScriptBase
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
    EEcosimAIV2RelationType RelationType;
    UPROPERTY()
    EEcosimAIV2EntityRelation Relation;
    UPROPERTY()
    EEcosimAIV2HTNPlanOperator Operator;
    UPROPERTY()
    bool bExcludeSelf = false;


    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        FECSEntity local_12;
        FECSEntity local_4 = FECSEntity(ENTITY_NULL);
        bool local_5 = this.bIsEntityIDVar;
        if (!(this.bIsEntityIDVar))
        {
            local_4 = FECSEntity(HTNNode::GetWorldStateValueAsEntityId(Context, this.EntityID));
            if (!(local_4.IsValid()))
            {
                local_5 = true;
            }
        }
        FECSEntity local_16 = FECSEntity(ENTITY_NULL);
        bool local_17 = this.bIsTargetEntityIDVar;
        if (!(this.bIsTargetEntityIDVar))
        {
            local_16 = FECSEntity(HTNNode::GetWorldStateValueAsEntityId(Context, this.TargetEntityID));
            if (!(local_16.IsValid()))
            {
                local_17 = true;
            }
        }
        if (this.bExcludeSelf)
        {
            local_12 = Context.PawnEntity;
        }
        else
        {
            local_12 = ENTITY_NULL;
        }
        bool local_6 = ::FEcosimAIV2Utils::HasMatchingEntityRelation(local_4, local_5, local_16, local_17, this.Relation, this.RelationType, local_12);
        if (int(this.Operator) == 1)
        {
            return !(local_6);
        }
        return local_6;
    }
}

class UHTNDecorator_EcosimAIV2_EntityRelationPath : UHTNDecorator_ECSScriptBase
{
    UPROPERTY()
    bool bIsEntityIDVar;
    UPROPERTY()
    FBlackboardKeySelector EntityID;
    UPROPERTY()
    bool bIsTargetEntityIDVar = true;
    UPROPERTY()
    FBlackboardKeySelector TargetEntityID;
    UPROPERTY()
    EEcosimAIV2RelationType RelationType;
    UPROPERTY()
    TArray<EEcosimAIV2EntityRelation> RelationPath;
    UPROPERTY()
    EEcosimAIV2HTNPlanOperator Operator;
    UPROPERTY()
    bool bPrefixMustExist = false;
    UPROPERTY()
    bool bExcludeSelf = false;


    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        FECSEntity local_12;
        FECSEntity local_4 = FECSEntity(ENTITY_NULL);
        bool local_5 = this.bIsEntityIDVar;
        if (!(this.bIsEntityIDVar))
        {
            local_4 = FECSEntity(HTNNode::GetWorldStateValueAsEntityId(Context, this.EntityID));
            if (!(local_4.IsValid()))
            {
                local_5 = true;
            }
        }
        FECSEntity local_16 = FECSEntity(ENTITY_NULL);
        bool local_17 = this.bIsTargetEntityIDVar;
        if (!(this.bIsTargetEntityIDVar))
        {
            local_16 = FECSEntity(HTNNode::GetWorldStateValueAsEntityId(Context, this.TargetEntityID));
            if (!(local_16.IsValid()))
            {
                local_17 = true;
            }
        }
        if (this.bExcludeSelf)
        {
            local_12 = Context.PawnEntity;
        }
        else
        {
            local_12 = ENTITY_NULL;
        }
        bool local_6 = ::FEcosimAIV2Utils::HasMatchingEntityRelationPath(local_4, local_5, local_16, local_17, this.RelationPath, this.RelationType, local_12);
        if (int(this.Operator) == 1)
        {
            if (this.bPrefixMustExist && (this.RelationPath.Num() >= 2))
            {
                TArray<EEcosimAIV2EntityRelation> local_32 = this.RelationPath;
                local_32.RemoveAt((local_32.Num() - 1));
                bool local_23 = ::FEcosimAIV2Utils::HasMatchingEntityRelationPath(local_4, local_5, ENTITY_NULL, true, local_32, this.RelationType, local_12);
                return (local_23 && !(local_6));
            }
            return !(local_6);
        }
        return local_6;
    }
}

class UHTNDecorator_EcosimAIV2_EntityIsTeamLeader : UHTNDecorator_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector EntityID;

    UHTNDecorator_EcosimAIV2_EntityIsTeamLeader()
    {
        return;
    }
    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        FECSEntityId local_1 = HTNNode::GetWorldStateValueAsEntityId(Context, this.EntityID);
        FECSEntity local_10 = FECSEntity(local_1);
        Get local_14;
        if (local_14.opCall())
        {
            Get local_22;
            const FC_EcosimAIV2Team& local_24 = local_22.opCall();
            if (local_24)
            {
                if ((local_24.LeaderEntity == local_10))
                {
                    return true;
                }
            }
        }
        return false;
    }
}

class UHTNDecorator_EcosimAIV2_CheckEntityTeamInfo : UHTNDecorator_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId EntityID;
    UPROPERTY()
    bool bCheckHasTeam = true;


    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        FECSEntityId local_3 = this.EntityID.GetValue(Context.opImplConv());
        FECSEntity local_12 = FECSEntity(local_3);
        if (this.bCheckHasTeam)
        {
            Has local_18;
            if (!(local_18.opCall()))
            {
                return false;
            }
        }
        return true;
    }
}

class UHTNDecorator_EcosimAIV2_CheckDistanceToTarget : UHTNDecorator_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId EntityID;
    UPROPERTY()
    bool bCompareWithEntity;
    UPROPERTY()
    FAISmart_EntityId TargetEntityID;
    UPROPERTY()
    FAISmart_Vector TargetLocation;
    UPROPERTY()
    EEcosimAIV2HTNCompareType CompareType;
    UPROPERTY()
    bool bCompareBy2D = true;
    UPROPERTY()
    FAISmart_Float CompareValue;


    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        bool local_13 = false;
        float local_42;
        float32 local_47 = 0.0f;
        if (FECSEntity(this.EntityID.GetValue(Context.opImplConv())).IsValid())
        {
            GetDefaulted local_24;
            FVector local_20 = local_24.opCall().GetPosition();
            FVector local_30;
            if (this.bCompareWithEntity)
            {
                FECSEntity local_4 = FECSEntity(this.TargetEntityID.GetValue(Context.opImplConv()));
                local_30 = local_24.opCall().GetPosition();
            }
            else
            {
                local_30 = this.TargetLocation.GetValue(Context.opImplConv());
            }
            if (this.bCompareBy2D)
            {
                local_42 = local_20.DistSquared2D(local_30);
            }
            else
            {
                local_42 = local_20.DistSquared(local_30);
            }
            FAISmartValueContext local_6 = Context.opImplConv();
            float local_46 = local_47;
            float local_44 = local_46 * local_46;
            switch (int(this.CompareType))
            {
            case 0:
            {
                return (local_42 < local_44);
            }
            case 1:
            {
                return (local_42 <= local_44);
            }
            case 2:
            {
                return (local_42 > local_44);
            }
            case 3:
            {
                return (local_42 >= local_44);
            }
            }
            return false;
        }
        else
        {
            local_13 = false;
        }
        return local_13;
    }
}

class UHTNDecorator_EcosimAIV2_EntityInteractingWithTarget : UHTNDecorator_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId EntityID;
    UPROPERTY()
    bool bIsTargetEntityIDVar;
    UPROPERTY()
    FAISmart_EntityId TargetEntityID;
    UPROPERTY()
    bool bByIndex;
    UPROPERTY()
    TSoftClassPtr<UInteractionBehaviorBase> InteractBehaviorClass;
    UPROPERTY()
    FAISmart_Int32 InteractPointIndex;
    UPROPERTY()
    FAISmart_Int32 InteractBehaviorIndex;

    UHTNDecorator_EcosimAIV2_EntityInteractingWithTarget()
    {
        return;
    }
    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        int local_17 = 0;
        int local_18 = 0;
        FECSEntity local_12 = FECSEntity(this.EntityID.GetValue(Context.opImplConv()));
        FECSEntity local_4 = FECSEntity(this.TargetEntityID.GetValue(Context.opImplConv()));
        FAISmartValueContext local_6 = Context.opImplConv();
        FAISmartValueContext local_6_2 = Context.opImplConv();
        return ::FEcosimAIV2Utils::IsEntityInteractingWithTarget(local_12, this.bIsTargetEntityIDVar, local_4, this.bByIndex, this.InteractBehaviorClass, local_18, local_17);
    }
}

class UHTNDecorator_EcosimAIV2_EntityCanInteractWithTarget : UHTNDecorator_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId SourceEntityID;
    UPROPERTY()
    FAISmart_EntityId TargetEntityID;
    UPROPERTY()
    bool bByIndex = true;
    UPROPERTY()
    TSoftClassPtr<UInteractionBehaviorBase> InteractBehaviorClass;
    UPROPERTY()
    FAISmart_Int32 InteractPointIndex;
    UPROPERTY()
    FAISmart_Int32 InteractBehaviorIndex;
    UPROPERTY()
    bool bCheckFreeIncludingPlan = true;
    UPROPERTY()
    bool bExcludeSourceEntityPlan = true;
    UPROPERTY()
    bool bCheckBehaviorConditions = true;


    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        int local_18 = 0;
        bool local_20;
        int local_42 = 0;
        FECSEntity local_12 = FECSEntity(this.SourceEntityID.GetValue(Context.opImplConv()));
        FECSEntity local_4 = FECSEntity(this.TargetEntityID.GetValue(Context.opImplConv()));
        int local_17 = -1;
        int local_19 = -1;
        if (this.bByIndex)
        {
            FAISmartValueContext local_6 = Context.opImplConv();
            local_17 = local_18;
            FAISmartValueContext local_6_2 = Context.opImplConv();
            local_19 = local_18;
        }
        else
        {
            if (!(this.InteractBehaviorClass.IsNull()))
            {
                FInteractionPointAndBehaviorIndex local_22;
                bool local_25 = ::FInteractUtils::GetInteractionPointAndBehaviorIndexByBehaviorClass(local_4, this.InteractBehaviorClass.Get(), local_22, true);
                if (local_25)
                {
                    local_17 = local_22.GetPointIndex();
                    local_19 = local_22.GetBehaviorIndex();
                }
            }
        }
        if (local_17 < 0)
        {
            return false;
        }
        FInteractionPointAndBehaviorIndex local_22;
        local_22.SetPointIndex(local_17);
        local_22.SetBehaviorIndex(local_19);
        UInteractionBehaviorBase local_30 = ::FInteractUtils::GetInteractionBehaviorFromEntity(local_4, local_22);
        if (local_30 == nullptr)
        {
            return false;
        }
        FECSEntity local_16;
        if (this.bExcludeSourceEntityPlan)
        {
            local_16 = local_12;
        }
        else
        {
            local_16 = ENTITY_NULL;
        }
        local_18 = ::FEcosimAIV2Utils::CountInteractSources(local_4, local_17, local_19, EEcosimAIV2RelationType(2), local_16);
        if (local_42)
        {
            TArray<FECSEntity> local_50 = ::FInteractUtils::GetInteractingEntitiesAtPointWithBehavior(local_4, local_17, local_19);
            if ((local_50.Num() + local_18) >= int(local_30.MaxInteractSourceCount))
            {
                return false;
            }
        }
        if (this.bCheckBehaviorConditions)
        {
            Get local_56;
            const FC_InteractionInfoForESM& local_58 = local_56.opCall();
            if (local_58)
            {
                if (local_58.GetTargetEntity().IsValid())
                {
                    if (!(local_30.bCanBeInteractedWhenInteracting))
                    {
                        return false;
                    }
                }
            }
            if (local_30.bIsSecondaryInteractTarget)
            {
                const FC_InteractionInfoForESM& local_58_2 = local_56.opCall();
                if (local_58_2)
                {
                    if (!(local_58_2.GetbIsSecondaryInteractSource()))
                    {
                        return false;
                    }
                    if (local_30.SecondaryInteractTargetConfig.bCheckSecondaryInteractType && (int(local_30.SecondaryInteractTargetConfig.SecondaryInteractType) != int(local_58_2.GetInteractType())))
                    {
                        return false;
                    }
                    if (local_30.SecondaryInteractTargetConfig.bCheckSecondaryInteractSubType && (int(local_30.SecondaryInteractTargetConfig.SecondaryInteractSubType) != int(local_58_2.GetSubType())))
                    {
                        return false;
                    }
                }
                else
                {
                    return false;
                }
            }
            if (!(local_30.InteractSourceCondition.Evaluate(local_12)))
            {
                return false;
            }
            Has local_66;
            local_20 = local_66.opCall();
            if (local_20)
            {
                if (!(local_30.InteractTargetCondition.Evaluate(local_4)))
                {
                    return false;
                }
            }
            if (!(local_30.CheckBehaviorConditions(local_12, local_4)))
            {
                return false;
            }
        }
        return true;
    }
}

class UHTNDecorator_EcosimAIV2_NPCCheckTraceDistanceToTarget : UHTNDecorator_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId EntityID;
    UPROPERTY()
    FAISmart_Bool EnableTrace;
    UPROPERTY()
    FAISmart_EntityId TargetEntityID;
    UPROPERTY()
    bool bCompareBy2D = true;
    UPROPERTY()
    FAISmart_Float EnterRange;
    UPROPERTY()
    FAISmart_Float ExitRange;


    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        bool local_3 = false;
        float local_42;
        float32 local_59 = 0.0f;
        Modify local_66;
        FAISmartValueContext local_2 = Context.opImplConv();
        local_3 = !local_3;
        if (local_3)
        {
            return true;
        }
        if (FECSEntity(this.EntityID.GetValue(Context.opImplConv())).IsValid())
        {
            bool local_45;
            GetDefaulted local_24;
            FVector local_20 = local_24.opCall().GetPosition();
            FECSEntity local_8 = FECSEntity(this.TargetEntityID.GetValue(Context.opImplConv()));
            FTargetEntity(local_8).GetEntity();
            FVector local_40 = local_24.opCall().GetPosition();
            if (this.bCompareBy2D)
            {
                float local_44 = local_20.DistSquared2D(local_40);
                local_42 = local_44;
            }
            else
            {
                float local_44_2 = local_20.DistSquared(local_40);
                local_42 = local_44_2;
            }
            local_45 = false;
            Get local_50;
            FC_EcologyKnowledge local_52 = local_50.opCall();
            if (local_52)
            {
                local_45 = local_52.GetBool(FEcologyKnowledgeKey(FName("bNPCTraceActive")));
            }
            if (local_45)
            {
                FAISmartValueContext local_2_2 = Context.opImplConv();
                float local_44_3 = local_59;
                float local_58 = local_44_3;
                local_44_3 = local_58 * local_58;
                if (local_42 > local_44_3)
                {
                    FC_EcologyKnowledge local_52_2 = local_66.opCall();
                    if (local_52_2)
                    {
                        local_52_2.SetBool(FEcologyKnowledgeKey(FName("bNPCTraceActive")), false);
                    }
                    return false;
                }
                return true;
            }
            FAISmartValueContext local_2_3 = Context.opImplConv();
            float local_44_4 = local_59;
            float local_62 = local_44_4 * local_44_4;
            if (local_42 < local_62)
            {
                FC_EcologyKnowledge local_52_3 = local_66.opCall();
                if (local_52_3)
                {
                    local_52_3.SetBool(FEcologyKnowledgeKey(FName("bNPCTraceActive")), true);
                }
                return true;
            }
            return false;
        }
        local_3 = true;
        return true;
    }
}

class UHTNDecorator_EcosimAIV2_IsPlayerControlled : UHTNDecorator_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId EntityID;

    UHTNDecorator_EcosimAIV2_IsPlayerControlled()
    {
        return;
    }
    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        if (!(FECSEntity(this.EntityID.GetValue(Context.opImplConv())).IsValid()))
        {
            return false;
        }
        Has local_18;
        return local_18.opCall();
    }
}

class UHTNDecorator_EcosimAIV2_CheckFactionRelation : UHTNDecorator_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId EntityA;
    UPROPERTY()
    FAISmart_EntityId EntityB;
    UPROPERTY()
    uint8 AcceptedRelations = (2 != 0);


    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        FECSEntity local_12 = FECSEntity(this.EntityA.GetValue(Context.opImplConv()));
        FECSEntity local_4 = FECSEntity(this.EntityB.GetValue(Context.opImplConv()));
        if (!(local_12.IsValid()) || !(local_4.IsValid()))
        {
            return false;
        }
        EFactionRelation local_20 = ::FASCommonUtils::GetEntityFactionRelation(local_12, local_4);
        int local_21 = int(local_20);
        int local_25 = this.AcceptedRelations & local_21;
        return (local_25 != 0);
    }
}

class UHTNDecorator_EcosimAIV2_HasGroupCommand : UHTNDecorator_ECSScriptBase
{
    UHTNDecorator_EcosimAIV2_HasGroupCommand()
    {
        return;
    }
    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(local_4.IsValid()))
        {
            return false;
        }
        Get local_10;
        const FC_EcosimAIV2TeamMember& local_12 = local_10.opCall();
        if (local_12)
        {
            if (FECSEntity(local_12.TeamEntity).IsValid())
            {
                Get local_20;
                const FC_AIGroupData& local_22 = local_20.opCall();
                if (local_22)
                {
                    FGroupMemberEntityInfo local_38 = local_22.GetGroupMemberEntityInfo(local_4);
                    if (local_38.MemberEntity.IsValid())
                    {
                        return (int(local_38.GroupCommand) != 0);
                    }
                }
            }
        }
        return false;
    }
}

