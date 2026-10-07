

class UBTTask_ResetEcologyLevelControl : UBTTask_ECSScriptBase
{
    default SetNodeName("ResetEcologyLevelControl");

    UBTTask_ResetEcologyLevelControl()
    {
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        ModifyOrAdd local_8;
        FC_EcologyKnowledge& local_10 = local_8.opCall();
        if (local_10)
        {
            local_10.SetInt(FEcologyKnowledgeKey(FName("InteractBehaviorIndex")), 0);
            local_10.SetInt(FEcologyKnowledgeKey(FName("MoveSpeedType")), 0);
        }
        return EBTNodeResult(0);
    }
}

class UBTTask_RefreshLevelCommandEnd : UBTTask_ECSScriptBase
{
    default SetNodeName("RefreshLevelCommandEnd");

    UBTTask_RefreshLevelCommandEnd()
    {
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        ModifyOrAdd local_8;
        FC_EcologyKnowledge& local_10 = local_8.opCall();
        if (local_10)
        {
            local_10.SetBool(FEcologyKnowledgeKey(FName("bRefreshLevelCommand")), false);
        }
        return EBTNodeResult(0);
    }
}

