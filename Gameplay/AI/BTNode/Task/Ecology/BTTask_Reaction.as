class UBTTask_ReadReactionParam : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector ReactionNameKey;
    UPROPERTY()
    FBlackboardKeySelector SourceEntityIdKey;

    UBTTask_ReadReactionParam()
    {
        this.ReactionNameKey.SelectedKeyName = n"ReactionName";
        this.ReactionNameKey.AddNameFilter(this, n"ReactionName");
        this.SourceEntityIdKey.SelectedKeyName = n"SourceEntityIdKey";
        this.SourceEntityIdKey.AddEntityIdFilter(this, n"SourceEntityIdKey");
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FECSEntity local_4 = ::FEcologyBehaviorUtils::FindFlockEntity(Context.PawnEntity);
        UBlackboardComponent local_10 = Context.GetBlackboardComponent();
        FInstancedStruct local_16 = FInstancedStruct(::GetEcologyBlob(local_4, FEcologyReactioConst::ReactionRuningContextKnowledgeKey));
        TConstRawPtr<FReactionRuningContextBase> local_22 = FInstancedStruct::GetPtr(local_16).opCall();
        if (local_22)
        {
            const FReactionRuningContextBase& local_28 = local_22.Get();
            local_10.SetValueAsName(this.ReactionNameKey.SelectedKeyName, local_28.BaseReason);
            local_10.SetValueAsEntityId(this.SourceEntityIdKey.SelectedKeyName, local_28.SourceEntity);
            return EBTNodeResult(0);
        }
        return EBTNodeResult(1);
    }
}

