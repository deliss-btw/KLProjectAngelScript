

class UESMTransitCompleteCallback_CombatHint : UESMTransitCompleteCallback
{
    UPROPERTY()
    TDataObjectPtr<FKLTextData> HintTextData;
    UPROPERTY()
    float32 ShowHintTime = 3.0f;
    UPROPERTY()
    FGameAttributeRef Attribute;
    UPROPERTY()
    FESMBBVar_Numeric AttributeThreshold = 0.0f;


    UFUNCTION()
    void OnTransitComplete_Implementation(const FESMContext &inout Context, const FESMTransitResult &inout TransitResult) const
    {
        if (this.Attribute.IsValid())
        {
            Get local_6;
            if (local_6.opCall().GetAttributeValue(this.Attribute, Context.GetECSRuntime().Time) > 0.0f)
            {
                return;
            }
        }
        XError(ELog(0), FString().Append("Atampting displaying MessageHintConfig [").Append(this.HintTextData.ToString()).Append("]. TransitCompleteCallbackCombatHint is deprecated, use MessageHint instead"));
        return;
    }
}

class UESMTransitCompleteCallback_MessageHint : UESMTransitCompleteCallback
{
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> MessageHint;
    UPROPERTY()
    FGameAttributeRef Attribute;
    UPROPERTY()
    FESMBBVar_Numeric AttributeThreshold = 0.0f;

    UESMTransitCompleteCallback_MessageHint()
    {
        return;
    }
    UFUNCTION()
    void OnTransitComplete_Implementation(const FESMContext &inout Context, const FESMTransitResult &inout TransitResult) const
    {
        if (this.Attribute.IsValid())
        {
            Get local_6;
            if (local_6.opCall().GetAttributeValue(this.Attribute, Context.GetECSRuntime().Time) > 0.0f)
            {
                return;
            }
        }
        ::MessageHintUtils::ShowMessageHint(Context.GetEntity(), this.MessageHint, TArray<FTextArgument>());
        return;
    }
}

class UESMTransitCompleteCallback_HotSpring : UESMTransitCompleteCallback
{
    UESMTransitCompleteCallback_HotSpring()
    {
        return;
    }
    UFUNCTION()
    void OnTransitComplete_Implementation(const FESMContext &inout Context, const FESMTransitResult &inout TransitResult) const
    {
        if (!(Context.GetECSRuntime().IsServer))
        {
            return;
        }
        FPbPlayerLogDsSocialActionTrigger local_12;
        local_12.SetPoiActionType(1);
        ::ServerDataTrackerHelper::LogProtoMessage3WithPawn(Context.GetEntity(), 105003, local_12.ToWrapper());
        return;
    }
}

