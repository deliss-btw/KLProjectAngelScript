

class UHTNTask_SetGameplayTag : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector BlackboardTag;
    UPROPERTY()
    FGameplayTag TagValue;

    default SetNodeName("SetGameplayTag");

    UHTNTask_SetGameplayTag()
    {
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        HTNNode::SetWorldStateValueAsGameplayTag(Context, this.BlackboardTag, this.TagValue);
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

