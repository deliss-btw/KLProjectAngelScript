

// NOTE: class defaults are not authored in this module: UBTDecorator_CheckSpecialToken (default scalar field UBTDecorator.FlowAbortMode has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

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
        // body not fully recovered вЂ” stub [opcode-uncovered]
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

