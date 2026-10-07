

class UESMTransitFailedCallback_CombatHint : UESMTransitFailedCallback
{
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> MessageHint;
    UPROPERTY()
    FGameAttributeRef Attribute;
    UPROPERTY()
    FESMBBVar_Numeric AttributeThreshold = 0.0f;

    UESMTransitFailedCallback_CombatHint()
    {
        return;
    }
    UFUNCTION()
    void OnTransitFailed_Implementation(const FESMContext &inout Context)
    {
        if (this.Attribute.IsValid())
        {
            Get local_6;
            if (local_6.opCall().GetAttributeValue(this.Attribute, Context.GetECSRuntime().Time) > 0.0f)
            {
                return;
            }
        }
        TArray<FTextArgument> local_12;
        Make local_18;
        local_12.Add(local_18.opImplConv());
        ::MessageHintUtils::ShowMessageHint(Context.GetEntity(), this.MessageHint, TArray<FTextArgument>());
        return;
    }
}

