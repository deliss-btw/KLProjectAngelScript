class UBTDecorator_CheckSpecialToken : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    TDataObjectPtr<FAISpecialCombatTokenConfig> SpecialToken;
    UPROPERTY()
    FBlackboardKeySelector StorageTokenSource;
    UPROPERTY()
    TArray<FAISmartValuePackTarget> StorageParams;

    UBTDecorator_CheckSpecialToken()
    {
        this.StorageTokenSource.AddEntityIdFilter(this, n"StorageTokenSource");
        this.StorageTokenSource.SetbNoneIsAllowedValue(true);
        return;
    }
    UFUNCTION()
    FAIDecoratorAbortSignal GetAbortSignal_Implementation() const
    {
        return FAIDecoratorAbortSignal(EAIDecoratorAbortSignal(1), this.SpecialToken.GetUniqueID());
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        Get local_4;
        const FC_AICombatKnowledge& local_6 = local_4.opCall();
        if (local_6)
        {
            return local_6.SpecialToken.HasToken(this.SpecialToken, Context.GetWorldTime());
        }
        return false;
    }
    UFUNCTION()
    void OnNodeActivation_Implementation(const FAIBehaviorTreeSearchContext &inout SearchContext) const
    {
        Modify local_4;
        FC_AICombatKnowledge& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SpecialToken.bIsInUsing = true;
            if (!(this.StorageTokenSource.SelectedKeyName.IsNone()))
            {
                SearchContext.GetBlackboardComponent().SetValueAsEntityId(this.StorageTokenSource.SelectedKeyName, local_6.SpecialTokenSource);
            }
            if (this.StorageParams.Num() > 0)
            {
                for (auto& local_28 : this.StorageParams)
                {
                    FAISpecialCombatTokenConfig local_14;
                    int local_12 = local_14.GetParamIndex(local_28.Name);
                    if (local_12 != INDEX_NONE)
                    {
                        FAISmart_AnyBlackboardValueCopier::WriteValueToDest(SearchContext.opImplConv(), local_6.ParamValues[local_12], SearchContext.opImplConv(), local_28.TargetValue);
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void OnNodeDeactivation_Implementation(const FAIBehaviorTreeSearchContext &inout SearchContext, const EBTNodeResult NodeResult) const
    {
        Modify local_4;
        FC_AICombatKnowledge& local_6 = local_4.opCall();
        if (local_6)
        {
            if (local_6.SpecialToken.IsToken(this.SpecialToken))
            {
                VisualLogger::LogText(this, FString().Append("Consume SpecialToken ").Append(local_6.SpecialToken.TokenUid), FName(""), false);
            }
        }
        return;
    }
    UFUNCTION()
    FString GetStaticDescription_Implementation() const
    {
        return FString().Append(this.GetBaseStaticDescription()).Append(": ").Append(this.SpecialToken);
    }
}

