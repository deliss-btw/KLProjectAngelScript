

class UHTNTask_SetReactionBaseInfo : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector ReactionNameKey;
    UPROPERTY()
    FBlackboardKeySelector SourceEntityIdKey;

    UHTNTask_SetReactionBaseInfo()
    {
        this.ReactionNameKey.AddNameFilter(this, n"ReactionName");
        this.SourceEntityIdKey.AddEntityIdFilter(this, n"SourceEntityIdKey");
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        FReactionRuningContextBase local_6;
        local_6.BaseReason = Context.GetWorldStateAsName(this.ReactionNameKey);
        local_6.SourceEntity = Context.GetWorldStateAsEntityId(this.SourceEntityIdKey);
        FName local_14;
        FInstancedStruct::Make(local_14);
        this.FinishExecute(true);
        return;
    }
}

class UHTNTask_ResetReactionBaseInfo : UHTNTask_ECSScriptBase
{
    UHTNTask_ResetReactionBaseInfo()
    {
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        FName local_10;
        FInstancedStruct::Make(local_10);
        this.FinishExecute(true);
        return;
    }
}

