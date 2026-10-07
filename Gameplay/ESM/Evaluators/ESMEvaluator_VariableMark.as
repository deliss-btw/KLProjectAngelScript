

// NOTE: class defaults are not authored in this module: UESMVarCounterEvaluatorBase (default scalar field UESMEvaluator.bConfigEditable has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

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

