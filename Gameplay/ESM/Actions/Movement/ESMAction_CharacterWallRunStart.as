

class UESMAction_CharacterWallRunStart : UESMBPBaseSpanAction
{
    UESMAction_CharacterWallRunStart()
    {
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        0.SetbIsStartingWallRun(true);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        0.SetbIsStartingWallRun(false);
        return;
    }
}

