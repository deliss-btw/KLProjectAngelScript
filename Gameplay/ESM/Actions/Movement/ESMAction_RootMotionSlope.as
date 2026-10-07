

class UESMAction_RootMotionSlope : UESMBPBaseSpanAction
{
    UESMAction_RootMotionSlope()
    {
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        FC_CharacterMovementTweakRootMotionBySlope::Add(Context.GetEntity());
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        FC_CharacterMovementTweakRootMotionBySlope::Remove(Context.GetEntity());
        return;
    }
}

