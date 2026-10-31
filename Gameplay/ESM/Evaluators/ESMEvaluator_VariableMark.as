UCLASS(Abstract)
class UESMVarCounterEvaluatorBase : UESMVarCounterEvaluator
{
    UESMVarCounterEvaluatorBase()
    {
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Mark;
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        return FSystemUtils::GetClassDisplayName(this.GetClass());
    }
}

class UESMEvaluator_MarkAllowAirborne : UESMVarCounterEvaluatorBase
{
    UESMEvaluator_MarkAllowAirborne()
    {
        super();
        return;
    }
}

class UESMEvaluator_MarkPassThroughCharacter : UESMVarCounterEvaluatorBase
{
    UESMEvaluator_MarkPassThroughCharacter()
    {
        super();
        return;
    }
}

class UESMEvaluator_MarkUpdateSlopeInAir : UESMVarCounterEvaluatorBase
{
    UESMEvaluator_MarkUpdateSlopeInAir()
    {
        super();
        return;
    }
}

