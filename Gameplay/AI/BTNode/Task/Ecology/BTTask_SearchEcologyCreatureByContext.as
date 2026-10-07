

class UBTTask_SearchEcologyCreatureByContext : UBTTask_ECSScriptBase
{
    UPROPERTY()
    float32 Radius;
    UPROPERTY()
    TDataObjectPtr<FEcologyCreatureDefinitionRow> CreatureType;
    UPROPERTY()
    FGameplayTagQuery CreatureTagFilter;
    UPROPERTY()
    ESearchCreatureSpecialFilter SpecialTagFilterType;
    UPROPERTY()
    FBlackboardKeySelector OutBool;
    UPROPERTY()
    FBlackboardKeySelector OutEntityId;
    UPROPERTY()
    FBlackboardKeySelector OutVector;

    default SetNodeName("SearchEcologyCreatureByContext");

    UBTTask_SearchEcologyCreatureByContext()
    {
        this.OutBool.AddBoolFilter(this, n"None");
        this.OutEntityId.AddEntityIdFilter(this, n"None");
        this.OutVector.AddVectorFilter(this, n"None");
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        UBlackboardComponent local_6 = Context.GetBlackboardComponent();
        FCreatureSearchRequest local_54;
        FKLGameplayTagQuery local_80 = local_54.CreatureType = this.CreatureType;
        FKLGameplayTagQuery local_80_2 = this.CreatureTagFilter;
        local_54.MaxCount = 1;
        local_54.Radius = this.Radius;
        if (int(this.SpecialTagFilterType) == 1)
        {
            local_54.SpecialTagFilterType = ESearchCreatureSpecialFilter(1);
            local_54.bIncludeDead = true;
        }
        TArray<FEntitySearchResult> local_90;
        if (::FEcologySceneInfoUtils::RequestCreature(local_4, local_54, local_90, true) > 0)
        {
            if (local_90[0].GetEntity().IsValid())
            {
                local_6.SetValueAsBool(this.OutBool.SelectedKeyName, true);
                local_6.SetValueAsEntityId(this.OutEntityId.SelectedKeyName, local_90[0].EntityId);
                FECSEntity local_94 = local_90[0].GetEntity();
                Get local_98;
                const FC_Transform& local_100 = local_98.opCall();
                if (local_100)
                {
                    local_6.SetValueAsVector(this.OutVector.SelectedKeyName, local_100.GetPosition());
                }
                return EBTNodeResult(0);
            }
        }
        local_6.SetValueAsBool(this.OutBool.SelectedKeyName, false);
        return EBTNodeResult(1);
    }
}

