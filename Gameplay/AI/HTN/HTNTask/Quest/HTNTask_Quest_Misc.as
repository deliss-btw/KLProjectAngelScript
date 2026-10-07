

class UHTNTask_Quest_SpawnEntity : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    TSubclassOf<AECSPrefab> Prefab;
    UPROPERTY()
    int Num = 1;
    UPROPERTY()
    FAISmart_EntityId SpawnAtPointEntityID;
    UPROPERTY()
    FBlackboardKeySelector SpawnedEntityID;

    default SetNodeName("Quest_SpawnEntity");


    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        FAISmartValueContext local_6 = Context.opImplConv();
        FECSEntity local_12;
        if (!(this.Prefab.IsValid()) || (local_12 == ENTITY_NULL))
        {
            this.FinishExecuteWithContext(Context, false);
            return;
        }
        Get local_18;
        const FC_Transform& local_20 = local_18.opCall();
        if (local_20)
        {
            ECS::RequestEntityByPrefabDeferred(this.Prefab, local_20.GetPosition(), FRotator::ZeroRotator, EPrefabCollisionAlignment(2), EECSRegType(0), false).GetId();
        }
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

class UHTNTask_Quest_SpawnEcosimAIV2Unit : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FDataObjectPtr Unit;
    UPROPERTY()
    FAISmart_EntityId SpawnAtPointEntityID;
    UPROPERTY()
    FBlackboardKeySelector SpawnedEntityID;

    default SetNodeName("Quest_SpawnEcosimAIV2Unit");

    UHTNTask_Quest_SpawnEcosimAIV2Unit()
    {
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        bool local_65 = false;
        FAISmartValueContext local_6 = Context.opImplConv();
        bool local_39 = !(this.Unit.IsValid());
        if (local_39)
        {
            local_39 = true;
        }
        else
        {
            TDataObjectPtr<FEcosimAIV2UnitData> local_64 = TDataObjectPtr<FEcosimAIV2UnitData>(this.Unit);
            local_65 = !local_65;
            local_39 = local_65;
        }
        FECSEntity local_12;
        local_39 = local_39 || (local_12 == ENTITY_NULL);
        if (local_39)
        {
            this.FinishExecuteWithContext(Context, false);
            return;
        }
        Get local_70;
        const FC_Transform& local_72 = local_70.opCall();
        if (local_72)
        {
            local_12 = ::FEcosimAIV2Utils::CreateEntity(this.Unit.GetDataName(), local_72.GetPosition(), FRotator::ZeroRotator);
            if ((!((local_12 == ENTITY_NULL))))
            {
                local_12.GetId();
            }
            else
            {
                this.FinishExecuteWithContext(Context, false);
                return;
            }
        }
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

class UHTNTask_Quest_EntityDialogueOption : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId EntityID;
    UPROPERTY()
    FString DialogueOption;

    default SetNodeName("EntityDialogueOption");

    UHTNTask_Quest_EntityDialogueOption()
    {
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

class UHTNTask_Quest_EntityMoveTo : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId EntityID;
    UPROPERTY()
    FAISmart_EntityId MoveToTargetPointEntityID;

    default SetNodeName("EntityMoveTo");

    UHTNTask_Quest_EntityMoveTo()
    {
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

